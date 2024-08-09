package user.mgmt.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Getting data from the front end
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Hardcoded admin credentials
        String admin1Username = "kaushal";
        String admin1Password = "1234";
        String admin2Username = "chirag";
        String admin2Password = "4321";

        // Check if the credentials are for admin
        if ((username.equals(admin1Username) && password.equals(admin1Password)) || 
            (username.equals(admin2Username) && password.equals(admin2Password))) {
            // Credentials are correct
            HttpSession session = request.getSession();
            session.setAttribute("admin", username); // Set admin session attribute
            response.sendRedirect("admin/admin.jsp"); // Replace with the correct dashboard page
        } else {
            // Credentials are incorrect
            response.sendRedirect("admin/adminlogin.jsp?message=<script> alert('Invalid username or password'); </script>"); // Replace with the correct error page
        }
    }
}
