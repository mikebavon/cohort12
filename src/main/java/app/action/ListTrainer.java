package app.action;

import app.dao.TrainerDao;
import app.dao.GenericDao;
import app.model.Trainer;
import jakarta.inject.Inject;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/trainer_lists")
public class ListTrainer extends BaseListAction<Trainer> {

    @Inject
    private TrainerDao trainerDao;

    @Override
    public GenericDao<Trainer,Integer> getGenericDao(){
        return trainerDao;
    }
}

