package app.action;

import app.dao.TraineeDao;
import app.dao.GenericDao;
import app.model.Trainee;
import jakarta.inject.Inject;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/trainee_lists")
public class ListTrainee extends BaseListAction<Trainee> {

    @Inject
    private TraineeDao traineeDao;

    @Override
    public GenericDao<Trainee,Integer> getGenericDao(){
        return traineeDao;
    }

}
