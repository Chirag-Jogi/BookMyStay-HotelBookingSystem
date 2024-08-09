package user.mgmt.controllers;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.mgmt.dao.BookingDao;
import user.mgmt.dao.BookingDaoImpl;
import user.mgmt.entities.BookingInfo;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Retrieve booking details from the request
		String check_in_date = request.getParameter("check_in_date");
		String check_out_date = request.getParameter("check_out_date");
		String room_type = request.getParameter("room_type");
		String number_of_guests = request.getParameter("number_of_guests");
		String full_name = request.getParameter("full_name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String userId = request.getParameter("userId");

		System.out.println(check_in_date);
		System.out.println(check_out_date);
		System.out.println(room_type);
		System.out.println(number_of_guests);
		System.out.println(full_name);
		System.out.println(email);
		System.out.println(phone);
		System.out.println(userId);
		

		// Check if any required parameters are null or empty
		if (check_in_date == null || check_out_date == null || room_type == null || 
		    number_of_guests == null || full_name == null || email == null || 
		    phone == null || userId == null || check_in_date.isEmpty() || 
		    check_out_date.isEmpty() || room_type.isEmpty() || number_of_guests.isEmpty() || 
		    full_name.isEmpty() || email.isEmpty() || phone.isEmpty() || userId.isEmpty()) {
			response.sendRedirect("payment.jsp?message=Missing required fields");
			return;
		}


		// Converting data
		Date checkIn = Date.valueOf(check_in_date);
		Date checkOut = Date.valueOf(check_out_date);
		int noOfGuest = Integer.parseInt(number_of_guests);
		int UserId = Integer.parseInt(userId);

		BookingInfo bookingInfo = new BookingInfo(checkIn, checkOut, room_type, noOfGuest, full_name, email, phone,UserId);

		BookingDao bookingDao = new BookingDaoImpl();

		try {
			int result = bookingDao.insertBooking(bookingInfo);

			if (result > 0) {
				response.sendRedirect("pay_success.jsp");
			} else {
				response.sendRedirect("payment.jsp?message=Failed to process payment");
			}
		} catch (Exception e) {
			response.sendRedirect("payment.jsp?message=Error processing payment");
			e.printStackTrace();
		}

	}

}
