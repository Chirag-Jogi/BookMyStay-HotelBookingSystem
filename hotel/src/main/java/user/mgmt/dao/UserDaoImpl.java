package user.mgmt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import user.mgmt.entities.UserInfo;
import user.mgmt.utils.DbUtils;

public class UserDaoImpl implements UserDao {
    
    Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName(DbUtils.DRIVER);
        return DriverManager.getConnection(DbUtils.DB_URL, DbUtils.USERNAME, DbUtils.PASSWORD);
    }
    
    @Override
    public void createSchema(String schemaName) throws ClassNotFoundException, SQLException {
        Class.forName(DbUtils.DRIVER);
        try (Connection con = DriverManager.getConnection(DbUtils.DB_BASE, DbUtils.USERNAME, DbUtils.PASSWORD);
             Statement stmt = con.createStatement()) {
            int result = stmt.executeUpdate(DbUtils.CREATE_SCHEMA);
            System.out.println("\n Result =" + result);
        }
    }

    @Override
    public void createTable() throws ClassNotFoundException, SQLException {
        try (Connection con = getConnection();
             Statement stmt = con.createStatement()) {
            int result = stmt.executeUpdate(DbUtils.CREATE_TABLE);
            System.out.println("\n Result =" + result);
        }
    }

    @Override
    public int insertEmployee(UserInfo userInfo) throws ClassNotFoundException, SQLException {
        try (Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement(DbUtils.INSERT_EMPLOYEE)) {
            pStmt.setString(1, userInfo.getUsername());
            pStmt.setString(2, userInfo.getPassword());
            pStmt.setString(3, userInfo.getFull_Name());
            pStmt.setString(4, userInfo.getEmail());
            return pStmt.executeUpdate();
        }
    }

    @Override
    public int updateEmployee(UserInfo userInfo) throws SQLException, ClassNotFoundException {
        Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement(DbUtils.UPDATE_EMPLOYEE);
        	
        	
    		//+ " password = ?, full_name = ?, email = ?\r\n"
        	//	+ "WHERE userId = ?;\r\n"
        	
            pStmt.setString(1, userInfo.getPassword());
            pStmt.setString(2, userInfo.getFull_Name());
            pStmt.setString(3, userInfo.getEmail());
            pStmt.setInt(4, userInfo.getUserId());
            return pStmt.executeUpdate();
        
    }

    @Override
    public int deleteEmployee(int userId) throws SQLException, ClassNotFoundException {
        try (Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement(DbUtils.DELETE_EMPLOYEE)) {
            pStmt.setInt(1, userId);
            return pStmt.executeUpdate();
        }
    }

    @Override
    public UserInfo getUserInfo(int userId) throws SQLException, ClassNotFoundException {
        try (Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement(DbUtils.GET_EMPLOYEE)) {
            pStmt.setInt(1, userId);
            ResultSet rSet = pStmt.executeQuery();
            UserInfo userInfo = new UserInfo();
            if (rSet.next()) {
                userInfo.setUserId(rSet.getInt("userId"));
                userInfo.setUsername(rSet.getString("username"));
                userInfo.setPassword(rSet.getString("password"));
                userInfo.setFull_Name(rSet.getString("full_name"));
                userInfo.setEmail(rSet.getString("email"));
            }
            return userInfo;
        }
    }

    @Override
    public List<UserInfo> getAllUserInfo() throws ClassNotFoundException, SQLException {
        try (Connection con = getConnection();
             Statement stmt = con.createStatement();
             ResultSet rSet = stmt.executeQuery(DbUtils.GET_ALL_EMPLOYEE)) {
            List<UserInfo> users = new ArrayList<>();
            while (rSet.next()) {
                UserInfo userInfo = new UserInfo();
                userInfo.setUserId(rSet.getInt("userId"));
                userInfo.setUsername(rSet.getString("username"));
                userInfo.setPassword(rSet.getString("password"));
                userInfo.setFull_Name(rSet.getString("full_name"));
                userInfo.setEmail(rSet.getString("email"));
                users.add(userInfo);
            }
            return users;
        }
    }

    @Override
    public UserInfo getUserByUsernameAndPassword(String username, String password) throws SQLException, ClassNotFoundException {
        try (Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?")) {
            pStmt.setString(1, username);
            pStmt.setString(2, password);
            ResultSet rSet = pStmt.executeQuery();
            UserInfo userInfo = null;
            if (rSet.next()) {
                userInfo = new UserInfo();
                userInfo.setUserId(rSet.getInt("userId"));
                userInfo.setUsername(rSet.getString("username"));
                userInfo.setPassword(rSet.getString("password"));
                userInfo.setFull_Name(rSet.getString("full_name"));
                userInfo.setEmail(rSet.getString("email"));
            }
            return userInfo;
        }
    }
}
