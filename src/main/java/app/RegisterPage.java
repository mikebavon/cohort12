package app;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

public class RegisterPage extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException{

        ServletConfig config = getServletConfig();

        String username = req.getParameter("username");
        if (username == null)
            username = "";
        String password = req.getParameter("password");
        if  (password == null)
            password = "";

        System.out.println("submitted: " + username + " && " + password);

        String usernameConfig = config.getInitParameter("username");
        String passwordConfig = config.getInitParameter("password");
        System.out.println("configs: username - " + usernameConfig);
        System.out.println("configs: password - " + passwordConfig);

        if(!(username.equalsIgnoreCase(usernameConfig)
                && password.equalsIgnoreCase(passwordConfig))){
            RequestDispatcher dispatcher = req.getRequestDispatcher("/");
            dispatcher.forward(req, resp);
        }

        PrintWriter writer = resp.getWriter();
        writer.println("<!DOCTYPE html>");
        writer.println("<html>");
        writer.println("<head>");
        writer.println("<title>");
        writer.println(config.getInitParameter("pageName"));
        writer.println("</title>");
        writer.println("<style>");
        writer.println("body { font-family: Arial; margin: 40px; background-color: #f4f6f8; }");
        writer.println("header { background-color: #2c3e50; color: white; padding: 15px; }");
        writer.println("section { margin-top: 20px; padding: 20px; background: white; border-radius: 5px; max-width: 400px; }");
        writer.println("input { width: 100%; padding: 8px; margin: 10px 0; }");
        writer.println("button { padding: 10px; background-color: #3498db; color: white; border: none; width: 100%; }");
        writer.println("a { display: inline-block; margin-top: 10px; color: #3498db; }");
        writer.println("</style>");
        writer.println("</head>");

        writer.println("<body>");

// Header
        writer.println("<header>");
        writer.println("<h1>");
        writer.println(config.getInitParameter("pageHeader"));
        writer.println("</h1>");
        writer.println("</header>");

// Form
        writer.println("<section>");
        writer.println("<h2>Register for a Course</h2>");

        writer.println("<form method='post' action='./register'>");

// Name
        writer.println("<label>Full Name:</label>");
        writer.println("<input type='text' name='name' placeholder='Enter your full name' required />");

// National ID
        writer.println("<label>National ID:</label>");
        writer.println("<input type='text' name='nationalId' placeholder='Enter your ID number' required />");

// Submit button
        writer.println("<button type='submit'>Register</button>");

        writer.println("</form>");
        writer.println("</section>");

        RequestDispatcher dispatcher = req.getRequestDispatcher("footer");
        dispatcher.include(req, resp);

        writer.println("</body>");
        writer.println("</html>");

    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter writer = resp.getWriter();

        writer.println("<!DOCTYPE html>");
        writer.println("<html>");
        writer.println("<head>");
        writer.println("<title>About Us - Training Academy</title>");
        writer.println("<style>");
        writer.println("body { font-family: Arial; margin: 40px; background-color: #f4f6f8; }");
        writer.println("header { background-color: #2c3e50; color: white; padding: 15px; }");
        writer.println("section { margin-top: 20px; padding: 15px; background: white; border-radius: 5px; }");
        writer.println("a { color: #3498db; text-decoration: none; font-weight: bold; }");
        writer.println("</style>");
        writer.println("</head>");

        writer.println("<body>");

// Header
        writer.println("<header>");
        writer.println("<h1>About COHORT 12 Training PORTA</h1>");
        writer.println("</header>");

// Who we are
        writer.println("<section>");
        writer.println("<h2>Student Registered</h2>");
        writer.println("<p>");

        Enumeration<String> paramNames = req.getParameterNames();

        boolean studentIsMike = false;
        while(paramNames.hasMoreElements()){
            String paramName = paramNames.nextElement();
            String paramValue = req.getParameterValues(paramName)[0];

            writer.println("<h1>" + paramName + "</h1>: ");
            writer.println(paramValue);
            writer.println("<br/>");

            if (!studentIsMike)
                studentIsMike = paramValue.contains("mike");
        }

        System.out.println("studentIsMike: " + studentIsMike);
        if (studentIsMike) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/");
            dispatcher.forward(req, resp);
        } else {
            RequestDispatcher dispatcher = req.getRequestDispatcher("footer");
            dispatcher.include(req, resp);
        }

        writer.println("</p>");
        writer.println("</section>");

// Navigation
        writer.println("<section>");
        writer.println("<a href=\"./register\">&larr; Register Another Student OR </a>");
        writer.println("</section>");

        writer.println("</body>");
        writer.println("</html>");

    }
}
