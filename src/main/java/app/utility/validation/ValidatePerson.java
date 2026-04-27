package app.utility.validation;

import jakarta.enterprise.context.ApplicationScoped;

@ValidatorQualifier(ValidatorQualifier.ValidationChoice.PERSON)
@ApplicationScoped
public class ValidatePerson implements Validate {
    private int validationCounter = 0;

    @Override
    public boolean name(String name) {
        System.out.println("Validating Person - Validation Number: " + validationCounter++);
        return name != null && !name.isEmpty() && name.length() >= 2;
    }
}