package repository;

import model.Users;

import java.util.List;

public interface IUsersRepository {
    List<Users> getAllUsers();
    void saveUser(Users users);
    void deleteUser(int id);
    void editUser(int id, Users users);
    Users findById(int id);
    List<Users> findName(String name);
    List<Users> sortByName();
}
