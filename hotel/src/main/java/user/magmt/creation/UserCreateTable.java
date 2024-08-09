package user.magmt.creation;

import java.sql.SQLException;

import user.mgmt.dao.UserDao;
import user.mgmt.dao.UserDaoImpl;

public class UserCreateTable {

	public static void main(String[] args) {
	
		UserDao userDao=new UserDaoImpl();
		
		try {
			userDao.createTable();
			System.out.println("\n table created successfully");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("\n table creation failed");
			e.printStackTrace();
		}

	}

}
