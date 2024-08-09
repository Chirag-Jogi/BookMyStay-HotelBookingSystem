package user.mgmt.dao;

import java.sql.SQLException;
import java.util.List;
import user.mgmt.entities.UserInfo;

public interface UserDao {
    void createSchema(String schemaName) throws ClassNotFoundException, SQLException;
    void createTable() throws ClassNotFoundException, SQLException;
    int insertEmployee(UserInfo userInfo) throws ClassNotFoundException, SQLException;
    int updateEmployee(UserInfo userInfo) throws SQLException, ClassNotFoundException;
    int deleteEmployee(int userId) throws SQLException, ClassNotFoundException;
    UserInfo getUserInfo(int userId) throws SQLException, ClassNotFoundException;
    List<UserInfo> getAllUserInfo() throws ClassNotFoundException, SQLException;
    UserInfo getUserByUsernameAndPassword(String username, String password) throws SQLException, ClassNotFoundException;
}
