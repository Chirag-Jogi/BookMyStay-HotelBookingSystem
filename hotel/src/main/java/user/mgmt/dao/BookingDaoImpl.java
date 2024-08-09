package user.mgmt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import user.mgmt.entities.BookingInfo;
import user.mgmt.entities.UserInfo;
import user.mgmt.utils.BookingDButils;
import user.mgmt.utils.DbUtils;

public class BookingDaoImpl implements BookingDao {

	private int BookingId;

	Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName(BookingDButils.DRIVER);
		return DriverManager.getConnection(BookingDButils.DB_URL, BookingDButils.USERNAME, BookingDButils.PASSWORD);
	}

	
	

	@Override
	public int insertBooking(BookingInfo bookingInfo) throws  ClassNotFoundException ,SQLException  {
		Connection con=getConnection();
		PreparedStatement pStmt=con.prepareStatement(BookingDButils.INSERT_BOOKING);
		
		//checkinDate, checkoutDate, room_type, no_of_guests, full_name, e_mail, phone_no)\r\n"
		//+ "VALUES (?, ?, ?, ?, ?, ?, ?
		pStmt.setDate(1, bookingInfo.getChekinDate());
		pStmt.setDate(2, bookingInfo.getChekoutDate());
		pStmt.setString(3, bookingInfo.getRoom_type());
		pStmt.setInt(4, bookingInfo.getNo_of_guests());
		pStmt.setString(5, bookingInfo.getFull_name());
		pStmt.setString(6, bookingInfo.getE_mail());
		pStmt.setString(7, bookingInfo.getPhone_no());
		 pStmt.setInt(8, bookingInfo.getUserId()); // foreign key reference to user
		return pStmt.executeUpdate();
		
	}

	@Override
	public int updateBooking(BookingInfo BookingInfo) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBookingRow(int BookingId) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return 0;
	}


    public BookingInfo getBookingInfo(int bookingId) throws SQLException, ClassNotFoundException {
        try (Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement(BookingDButils.GET_BOOKING)) { // Assuming the query is in DbUtils.GET_BOOKING
            pStmt.setInt(1, bookingId);
            ResultSet rSet = pStmt.executeQuery();
            BookingInfo bookingInfo = new BookingInfo();
            if (rSet.next()) {
                bookingInfo.setBookingId(rSet.getInt("bookingId"));
                bookingInfo.setChekinDate(rSet.getDate("chekinDate"));
                bookingInfo.setChekoutDate(rSet.getDate("chekoutDate"));
                bookingInfo.setRoom_type(rSet.getString("room_type"));
                bookingInfo.setNo_of_guests(rSet.getInt("no_of_guests"));
                bookingInfo.setFull_name(rSet.getString("full_name"));
                bookingInfo.setE_mail(rSet.getString("e_mail"));
                bookingInfo.setPhone_no(rSet.getString("phone_no"));
            }
            return bookingInfo;
        }
    }

   

	@Override
	public List<BookingInfo> getAllBookingInfo() throws ClassNotFoundException, SQLException {
		 try (Connection con = getConnection();
	             Statement stmt = con.createStatement();
	             ResultSet rSet = stmt.executeQuery(BookingDButils.GET_ALL_BOOKING)) {
	          List<BookingInfo> bookings=new ArrayList<>();
	            while (rSet.next()) {
	            	 BookingInfo bookingInfo = new BookingInfo();
	                 bookingInfo.setBookingId(rSet.getInt("bookingId"));
	                 bookingInfo.setChekinDate(rSet.getDate("chekinDate"));
	                 bookingInfo.setChekoutDate(rSet.getDate("chekoutDate"));
	                 bookingInfo.setRoom_type(rSet.getString("room_type"));
	                 bookingInfo.setNo_of_guests(rSet.getInt("no_of_guests"));
	                 bookingInfo.setFull_name(rSet.getString("full_name"));
	                 bookingInfo.setE_mail(rSet.getString("e_mail"));
	                 bookingInfo.setPhone_no(rSet.getString("phone_no"));
	                 bookingInfo.setUserId(rSet.getInt("userId"));
	                 bookings.add(bookingInfo);
	             }
	            return bookings;
	         }
	    
	}




	@Override
	public void createTable() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		
	}



	
}