package user.mgmt.controllers;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.mgmt.dao.BookingDao;
import user.mgmt.dao.BookingDaoImpl;
import user.mgmt.entities.BookingInfo;

@WebServlet("/BookingServlet")
public class BookingAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Get the session without creating a new one if it doesn't exist

        if (session != null && session.getAttribute("loggedInUser") != null) {
            // Retrieve booking details from the request
            String check_in_date = request.getParameter("check_in_date");
            String check_out_date = request.getParameter("check_out_date");
            String room_type = request.getParameter("room_type");
            String number_of_guests = request.getParameter("number_of_guests");
            String full_name = request.getParameter("full_name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String userId = request.getParameter("userId");
            
          
            // Set attributes to forward to payment.jsp
            request.setAttribute("check_in_date", check_in_date);
            request.setAttribute("check_out_date", check_out_date);
            request.setAttribute("room_type", room_type);
            request.setAttribute("number_of_guests", number_of_guests);
            request.setAttribute("full_name", full_name);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("userId", userId);
            
            // Forward to payment.jsp
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp?message=Please log in to proceed with booking");
        }
    }

    }

