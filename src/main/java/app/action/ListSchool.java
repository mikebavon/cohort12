package app.action;

import app.dao.SchoolDao;
import app.dao.GenericDao;
import app.model.School;
import jakarta.inject.Inject;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/school_lists")
public class ListSchool extends BaseListAction<School> {

    @Inject
    private SchoolDao schoolDao;

    @Override
    public GenericDao<School,Integer> getGenericDao(){
        return schoolDao;
    }
}
