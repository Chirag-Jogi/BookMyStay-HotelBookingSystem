package user.mgmt.controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import user.mgmt.dao.UserDao;
import user.mgmt.dao.UserDaoImpl;
import user.mgmt.entities.UserInfo;


@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String userId=request.getParameter("userId");
		
		String password=request.getParameter("password");
		String 	fullname=request.getParameter("fullname");	
		String  email=request.getParameter("email");
		
		
		System.out.println(userId);
		
		System.out.println(password);
		System.out.println(email);
		
		int idInt=Integer.parseInt(userId);
		
		
		UserInfo userInfo= new UserInfo(idInt, null, password, fullname, email);
		try {
			UserDao userDao=new UserDaoImpl();

			int result = userDao.updateEmployee(userInfo);

			if (result > 0) {
				//System.out.println("\n Successs");
				response.sendRedirect("admin/user_list.jsp?message=User Updated Successfully");
			    }
			else {
				response.sendRedirect("admin/updateUser.jsp?message=User can't be updated.Try again");
				//System.out.println("\n failure");
			}
		}
		catch (ClassNotFoundException | SQLException e) {
			response.sendRedirect("admin/updateUser.jsp?message=User can't be updated.Try again");
			//System.out.println("\n Data updation failed");
			e.printStackTrace();
		}
		
		
	}

}
