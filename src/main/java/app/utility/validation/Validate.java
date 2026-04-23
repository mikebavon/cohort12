package app.utility.validation;

import app.model.Person;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.context.RequestScoped;

import java.util.ArrayList;
import java.util.List;

@ApplicationScoped
public class Validate {

    private int validationCounter = 0;


    public boolean traineeName(String name){
        System.out.println("Validation Number: " + validationCounter++);
        return name != null && !name.toLowerCase().contains("john")
            && !name.toLowerCase().contains("nancy");
    }


    public boolean trainerName(String name){
        System.out.println("Validation Number: " + validationCounter++);
        return name != null &&
            !name.toLowerCase().contains("pamela")
            &&  !name.toLowerCase().contains("gideon")
            &&  !name.toLowerCase().contains("mathew")
            &&  !name.toLowerCase().contains("fian");
    }

    public boolean age(int age){
        System.out.println("Validation Number: " + validationCounter++);
        return age > 20;
    }
}
