
	package user.mgmt.dao;

	import java.sql.SQLException;
	import java.util.List;

import user.mgmt.entities.BookingInfo;

	public interface BookingDao {
		
		 void createTable() throws ClassNotFoundException, SQLException;
	    int insertBooking(BookingInfo BookingInfo) throws SQLException, ClassNotFoundException;
	    
	    int updateBooking(BookingInfo BookingInfo) throws SQLException, ClassNotFoundException;
	    int deleteBookingRow(int BookingId) throws SQLException, ClassNotFoundException;
	    BookingInfo getBookingInfo(int BookingId) throws SQLException, ClassNotFoundException;
	    List<BookingInfo> getAllBookingInfo() throws ClassNotFoundException, SQLException;
	    
	}



