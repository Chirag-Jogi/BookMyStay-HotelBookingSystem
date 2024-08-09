package user.mgmt.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.mgmt.dao.UserDao;
import user.mgmt.dao.UserDaoImpl;
import user.mgmt.entities.UserInfo;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Getting data from the front end
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao userDao = new UserDaoImpl();
        try {
			UserInfo userInfo = userDao.getUserByUsernameAndPassword(username, password);

			if (userInfo != null) {
			    // Credentials are correct
			    HttpSession session = request.getSession();
			    session.setAttribute("user", userInfo);
			    // Add this line to set the loggedInUser attribute
			    session.setAttribute("loggedInUser", true);
			    response.sendRedirect("homepage.jsp");
			} else {
			    // Credentials are incorrect
			    response.sendRedirect("index.jsp?message=<script> alert('Invalid username or password'); </script>");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
