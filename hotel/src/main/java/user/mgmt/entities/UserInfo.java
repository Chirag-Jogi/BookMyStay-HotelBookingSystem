package user.mgmt.entities;

public class UserInfo {

	private int userId;
	private String username;
	private String password;
	private String full_Name;
	private String email;
	
	

	public UserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserInfo(String username, String password, String full_Name, String email) {
		super();
		this.username = username;
		this.password = password;
		
		this.full_Name = full_Name;
		this.email = email;
		
	}

	public UserInfo(int userId, String username, String password, String full_Name, String email) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		
		this.full_Name = full_Name;
		this.email = email;

	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFull_Name() {
		return full_Name;
	}

	public void setFull_Name(String full_Name) {
		this.full_Name = full_Name;
	}

	

	@Override
	public String toString() {
		return " \n UserInfo [unique_id=" + userId + ", username=" + username + ", password=" + password + ", email="
				+ email + ", full_Name=" + full_Name +  "]";
	}

}
