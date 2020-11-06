package service;

import model.Users;

import java.util.List;

public interface IUsersService {
    List<Users> getAllUsers();
    void saveUser(Users users);
    void deleteUser(int id);
    void editUser(int id,Users users);
    Users findById(int id);
    List<Users> findName(String name);
    List<Users> sortByName();
}
