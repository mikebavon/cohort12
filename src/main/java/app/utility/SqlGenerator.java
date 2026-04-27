package app.utility;

import app.framework.Cohort12TableCol;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

public class SqlGenerator {

    public static String getCreateTableSql(Class<?> clazz) {
        String tableName = clazz.getSimpleName().toLowerCase();
        StringBuilder sql = new StringBuilder("CREATE TABLE IF NOT EXISTS " + tableName + " (");
        sql.append("id BIGINT AUTO_INCREMENT PRIMARY KEY, ");

        Field[] fields = clazz.getDeclaredFields();
        List<String> columns = new ArrayList<>();

        for (Field field : fields) {
            if (field.getName().equals("id")) continue; // Skip id as it's already added

            String columnName = field.getName();
            String sqlType = getSqlType(field.getType());
            columns.add(columnName + " " + sqlType);
        }

        sql.append(String.join(", ", columns));
        sql.append(")");
        return sql.toString();
    }

    public static String getInsertSql(Class<?> clazz) {
        String tableName = clazz.getSimpleName().toLowerCase();
        StringBuilder sql = new StringBuilder("INSERT INTO " + tableName + " (");

        Field[] fields = clazz.getDeclaredFields();
        List<String> columnNames = new ArrayList<>();
        List<String> placeholders = new ArrayList<>();

        for (Field field : fields) {
            if (field.getName().equals("id")) continue;

            columnNames.add(field.getName());
            placeholders.add("?");
        }

        sql.append(String.join(", ", columnNames));
        sql.append(") VALUES (");
        sql.append(String.join(", ", placeholders));
        sql.append(")");
        return sql.toString();
    }

    public static String getSelectAllSql(Class<?> clazz) {
        String tableName = clazz.getSimpleName().toLowerCase();
        return "SELECT * FROM " + tableName;
    }

    private static String getSqlType(Class<?> javaType) {
        if (javaType == String.class) {
            return "VARCHAR(255)";
        } else if (javaType == int.class || javaType == Integer.class) {
            return "INT";
        } else if (javaType == long.class || javaType == Long.class) {
            return "BIGINT";
        } else if (javaType == double.class || javaType == Double.class) {
            return "DOUBLE";
        } else if (javaType == boolean.class || javaType == Boolean.class) {
            return "BOOLEAN";
        } else if (javaType == java.util.Date.class || javaType == java.sql.Date.class) {
            return "DATE";
        } else if (javaType == java.math.BigDecimal.class) {
            return "DECIMAL(10,2)";
        } else {
            return "VARCHAR(255)"; // Default
        }
    }
}