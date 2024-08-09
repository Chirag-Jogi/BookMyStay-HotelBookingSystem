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


@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		//getting data from front end
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String full_name=request.getParameter("full_name");
		
		
		// validating data
		
		System.out.println(username);
		System.out.println(password);
		System.out.println(email);
		System.out.println(full_name);
		
		
		
		
	
		
		//creating entity
		
		UserInfo userInfo=new UserInfo(username, password, full_name, email);
		
		
		
		UserDao userDao=new UserDaoImpl();
		
	
		
		try {
			int result=userDao.insertEmployee(userInfo);

			
			System.out.println("Result :"+result);
			if(result > 0) {
				//System.out.println("Successfuly");
			    response.sendRedirect("index.jsp?message=<script> alert('Registration successful!'); </script>");
			}
			else {
				//System.out.println("failure");
			  response.sendRedirect("register.jsp?message=User Registration  can't be added.Try again");
			}
		}catch(Exception e)
		{
			//System.out.println("Data insertion failed");
			response.sendRedirect("register.jsp?message=User Registration  can't be added.Try again");
			e.printStackTrace();
		}
		
	}

}
