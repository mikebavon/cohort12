package app.model;

import app.framework.Cohort12Form;
import app.framework.Cohort12FormField;
import app.framework.Cohort12Table;
import app.framework.Cohort12TableCol;

import java.io.Serializable;

@Cohort12Form(label = "Person Register",
        actionUrl = "./register_person")
@Cohort12Table(label = "Persons",
        tableUrl = "./person_lists",
        registerUrl = "./register_person")
public class Person implements Serializable {

    private Long id;

    @Cohort12FormField(label = "Person Name",
        placeholder = "Please enter Person Name")
    @Cohort12TableCol(label = "Person Name")
    private String name;

    @Cohort12FormField(label = "National ID",
            placeholder = "Please enter ID")
    @Cohort12TableCol(label = "National ID")
    private String nationalId;

    private String address;

    private int age;

    public Person(String name,  String nationalId){
        this.name = name.toUpperCase();
        this.nationalId = nationalId.toUpperCase();
    }

    public Person(){}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

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
