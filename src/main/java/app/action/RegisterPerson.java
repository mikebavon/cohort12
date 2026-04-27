package app.action;

import app.model.Person;
import app.utility.validation.Validate;
import app.utility.validation.ValidatorQualifier;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "Register Person",
    urlPatterns = { "/register_person" },
    initParams = {
        @WebInitParam(name = "pageName", value = "Register - Training Academy"),
        @WebInitParam(name = "pageHeader", value = "Training Registration - IT")
    })
public class RegisterPerson extends BaseAction<Person> {

    @Inject
    @ValidatorQualifier(ValidatorQualifier.ValidationChoice.PERSON)
    public Validate validate;

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Person person = super.serializeForm(req.getParameterMap());
        if (validate.name(person.getName()))
            super.doPost(req, resp);
        else
            resp.sendRedirect("./person_lists");
    }
}
