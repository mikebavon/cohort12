package app.action;

import app.pages.ContactUs;
import app.utility.validation.Validate;
import app.utility.validation.ValidatorQualifier;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@WebServlet("/contact_us")
public class RegisterContactUs extends HttpServlet {

    // In-memory storage for contact us messages (for demo purposes)
    private static final Map<String, ContactUs> contactMessages = new ConcurrentHashMap<>();
    private static int idCounter = 1;

    @Inject
    @ValidatorQualifier(ValidatorQualifier.ValidationChoice.CONTACT_US)
    public Validate validate;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String subject = req.getParameter("subject");
        String message = req.getParameter("message");

        // Validate the name using our custom validator
        if (!validate.name(name)) {
            resp.sendRedirect("./contact_us.jsp?error=invalid");
            return;
        }

        // Create ContactUs object
        ContactUs contactUs = new ContactUs();
        contactUs.setName(name);
        contactUs.setEmail(email);
        contactUs.setSubject(subject);
        contactUs.setMessage(message);

        // Store in memory (in real app, this would go to database)
        String id = "MSG-" + (idCounter++);
        contactMessages.put(id, contactUs);

        // Set attribute for display page
        req.setAttribute("contactUs", contactUs);
        req.setAttribute("messageId", id);

        // Forward to display page
        req.getRequestDispatcher("contact_us_display.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("contact_us.jsp");
    }

    // For testing purposes
    public static Map<String, ContactUs> getContactMessages() {
        return contactMessages;
    }
}