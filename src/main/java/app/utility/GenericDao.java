package app.utility;

import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.Field;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GenericDao<T> {

    private Class<T> clazz;

    public GenericDao(Class<T> clazz) {
        this.clazz = clazz;
    }

    public void save(T entity) {
        String sql = SqlGenerator.getInsertSql(clazz);
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            Field[] fields = clazz.getDeclaredFields();
            int paramIndex = 1;
            for (Field field : fields) {
                if (field.getName().equals("id")) continue;

                field.setAccessible(true);
                Object value = field.get(entity);
                stmt.setObject(paramIndex++, value);
            }

            stmt.executeUpdate();

            // Get generated ID
            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    Field idField = clazz.getDeclaredField("id");
                    idField.setAccessible(true);
                    idField.set(entity, rs.getLong(1));
                }
            }

        } catch (Exception e) {
            throw new RuntimeException("Error saving entity", e);
        }
    }

    public List<T> findAll() {
        String sql = SqlGenerator.getSelectAllSql(clazz);
        List<T> results = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                T entity = clazz.newInstance();
                Field[] fields = clazz.getDeclaredFields();

                for (Field field : fields) {
                    field.setAccessible(true);
                    Object value = rs.getObject(field.getName());
                    if (value != null) {
                        field.set(entity, value);
                    }
                }

                results.add(entity);
            }

        } catch (Exception e) {
            throw new RuntimeException("Error finding all entities", e);
        }

        return results;
    }
}