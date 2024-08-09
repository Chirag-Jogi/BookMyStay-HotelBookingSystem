package user.mgmt.utils;

public class BookingDButils {
    public final static String DRIVER = "com.mysql.cj.jdbc.Driver";
    public final static String DB_URL = "jdbc:mysql://localhost:3306/hotel_booking";
    public final static String DB_BASE = "jdbc:mysql://localhost:3306";
    public final static String USERNAME = "root";
    public final static String PASSWORD = "Chirag@27";

    public final static String CREATE_SCHEMA = "CREATE SCHEMA hotel_booking";
    public final static String CREATE_TABLE = "CREATE TABLE bookings ("
            + "bookingId INT PRIMARY KEY AUTO_INCREMENT, "
            + "chekinDate DATE, "
            + "chekoutDate DATE, "
            + "room_type VARCHAR(50), "
            + "no_of_guests INT, "
            + "full_name VARCHAR(100), "
            + "e_mail VARCHAR(100), "
            + "phone_no VARCHAR(20)"
            + ");";

    public static final String INSERT_BOOKING = "INSERT INTO  bookings(ChekinDate, ChekoutDate, room_type, no_of_guests, full_name, e_mail, phone_no, UserId) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

           

    public final static String UPDATE_BOOKING = "UPDATE bookings\r\n"
    		+ "SET checkinDate = ?, checkoutDate = ?, room_type = ?, no_of_guests = ?, full_name = ?, e_mail = ?, phone_no = ?\r\n"
    		+ "WHERE bookingId = ?;\r\n"
    		+ "";

    public final static String DELETE_BOOKING = "DELETE FROM bookings\r\n"
    		+ "WHERE bookingId = ?;\r\n"
    		+ "";

    public final static String GET_BOOKING = "SELECT * FROM users WHERE bookingId = ?;";

    public final static String GET_ALL_BOOKING = "SELECT * FROM bookings;";
}