package app.utility.validation;

import jakarta.enterprise.context.ApplicationScoped;

@ValidatorQualifier(ValidatorQualifier.ValidationChoice.CONTACT_US)
@ApplicationScoped
public class ValidateContactUs implements Validate {
    private int validationCounter = 0;

    @Override
    public boolean name(String name) {
        System.out.println("Validating Contact Us - Validation Number: " + validationCounter++);
        return name != null && !name.isEmpty() && name.length() >= 3;
    }
}