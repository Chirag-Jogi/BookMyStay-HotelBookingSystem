package user.magmt.creation;

import user.mgmt.dao.UserDao;
import user.mgmt.dao.UserDaoImpl;

public class UserCreateSchema {

	public static void main(String[] args) {
		
		UserDao userDao=new UserDaoImpl();
		
		try {
			userDao.createSchema("hotel_booking");
			System.out.println("\n Schema created successfully");
			} catch (Exception e) {
				System.out.println("\n Schema creation failed");
			e.printStackTrace();
		}

	}

}
