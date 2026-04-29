package app.action;

import app.dao.CourseDao;
import app.dao.GenericDao;
import app.model.Course;
import jakarta.inject.Inject;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/course_lists")
public class ListCourse extends BaseListAction<Course> {

    @Inject
    private CourseDao courseDao;

    @Override
    public GenericDao<Course,Integer> getGenericDao(){
        return courseDao;
    }

}
