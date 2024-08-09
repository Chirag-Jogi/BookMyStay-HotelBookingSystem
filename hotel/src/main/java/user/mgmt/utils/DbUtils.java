package user.mgmt.utils;

public class DbUtils {
	public final static String DRIVER = "com.mysql.cj.jdbc.Driver";
	public final static String DB_URL = "jdbc:mysql://localhost:3306/hotel_booking";
	public final static String DB_BASE = "jdbc:mysql://localhost:3306";
	public final static String USERNAME = "root";
	public final static String PASSWORD = "Chirag@27";
	
	public final static String CREATE_SCHEMA = "create schema hotel_booking";
	public final static String CREATE_TABLE="CREATE TABLE users (\r\n"
			+ "    userId INT AUTO_INCREMENT PRIMARY KEY,\r\n"
			+ "    username VARCHAR(50) NOT NULL UNIQUE,\r\n"
			+ "    password VARCHAR(255) NOT NULL,\r\n"
			+ "    full_name VARCHAR(100) NOT NULL,\r\n"
			+ "    email VARCHAR(100) NOT NULL UNIQUE\r\n"
			+ ")";
	
	public final static String INSERT_EMPLOYEE="INSERT INTO users(username, password, full_name, email)\r\n"
			+ "VALUES(?,?,?,?)";
	
	public final static String UPDATE_EMPLOYEE="UPDATE users\r\n"
			+ " password = ?, full_name = ?, email = ?\r\n"
			+ "WHERE userId = ?;\r\n"
			+ "";
	
	public final static String DELETE_EMPLOYEE ="DELETE FROM users WHERE userId  = ?";
	
	public final static String GET_EMPLOYEE ="SELECT * FROM users WHERE userId  = ?";
	
	public final static String GET_ALL_EMPLOYEE ="SELECT * FROM users;";
}
