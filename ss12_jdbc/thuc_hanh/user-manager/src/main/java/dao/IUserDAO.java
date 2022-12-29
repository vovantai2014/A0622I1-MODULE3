package dao;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    public void insertUser(User user) throws SQLException;

    public  User selectUser (int id);

    public List<User> selectAllUsers();

    List<User> search (String countrySearch) throws ClassNotFoundException, SQLException;

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
}
