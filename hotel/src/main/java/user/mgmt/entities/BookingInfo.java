package user.mgmt.entities;

import java.sql.Date;

public class BookingInfo {

    private int bookingId;
    private Date checkinDate;
    private Date checkoutDate;
    private String room_type;
    private int no_of_guests;
    private String full_name;
    private String e_mail;
    private String phone_no;
    private int userId; // Add userId field

    public BookingInfo() {
        super();
    }

    public BookingInfo(Date checkinDate, Date checkoutDate, String room_type, int no_of_guests,
                       String full_name, String e_mail, String phone_no, int userId) {
        super();
        this.checkinDate = checkinDate;
        this.checkoutDate = checkoutDate;
        this.room_type = room_type;
        this.no_of_guests = no_of_guests;
        this.full_name = full_name;
        this.e_mail = e_mail;
        this.phone_no = phone_no;
        this.userId = userId; // Initialize userId
    }

    public BookingInfo(int bookingId, Date checkinDate, Date checkoutDate, String room_type, int no_of_guests,
                       String full_name, String e_mail, String phone_no, int userId) {
        super();
        this.bookingId = bookingId;
        this.checkinDate = checkinDate;
        this.checkoutDate = checkoutDate;
        this.room_type = room_type;
        this.no_of_guests = no_of_guests;
        this.full_name = full_name;
        this.e_mail = e_mail;
        this.phone_no = phone_no;
        this.userId = userId; // Initialize userId
    }

    // Getters and setters

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public Date getChekinDate() {
        return checkinDate;
    }

    public void setChekinDate(Date checkinDate) {
        this.checkinDate = checkinDate;
    }

    public Date getChekoutDate() {
        return checkoutDate;
    }

    public void setChekoutDate(Date checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public String getRoom_type() {
        return room_type;
    }

    public void setRoom_type(String room_type) {
        this.room_type = room_type;
    }

    public int getNo_of_guests() {
        return no_of_guests;
    }

    public void setNo_of_guests(int no_of_guests) {
        this.no_of_guests = no_of_guests;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getE_mail() {
        return e_mail;
    }

    public void setE_mail(String e_mail) {
        this.e_mail = e_mail;
    }

    public String getPhone_no() {
        return phone_no;
    }

    public void setPhone_no(String phone_no) {
        this.phone_no = phone_no;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "BookingInfo [bookingId=" + bookingId + ", checkinDate=" + checkinDate + ", checkoutDate=" + checkoutDate
                + ", room_type=" + room_type + ", no_of_guests=" + no_of_guests + ", full_name=" + full_name
                + ", e_mail=" + e_mail + ", phone_no=" + phone_no + ", userId=" + userId + "]";
    }
}
