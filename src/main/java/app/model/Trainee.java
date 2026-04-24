package app.model;

import app.framework.*;

import java.io.Serializable;

@PageMenuItem(label = "Registered Trainees", url = "./trainee_lists")
@DbTable(name = "trainees")
@Cohort12Form(label = "Trainee Register",
        actionUrl = "./register_trainee")
@Cohort12Table(label = "Trainees",
        tableUrl = "./trainee_lists",
        registerUrl = "./register_trainee")
public class Trainee implements Serializable {

    @DbColumn(name = "id", type = "INT", primaryKey = true, autoIncrement = true)
    private int id;

    @DbColumn(name = "name", type = "VARCHAR(255)")
    @Cohort12FormField(label = "Trainee Name",
            placeholder = "Please enter Trainee Name")
    @Cohort12TableCol(label = "Trainee Name")
    private String name;

    @DbColumn(name = "national_id", type = "VARCHAR(100)")
    @Cohort12FormField(label = "National ID",
            placeholder = "Please enter ID")
    @Cohort12TableCol(label = "National ID")
    private String nationalId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String address;

    private int age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNationalId() {
        return nationalId;
    }

    public void setNationalId(String nationalId) {
        this.nationalId = nationalId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

}
