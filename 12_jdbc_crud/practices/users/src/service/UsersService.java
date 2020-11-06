package service;

import model.Users;
import repository.UsersRepository;

import java.util.List;

public class UsersService implements IUsersService{
    private UsersRepository usersRepository = new UsersRepository();
    @Override
    public List<Users> getAllUsers() {
        return usersRepository.getAllUsers();
    }

    @Override
    public void saveUser(Users users) {
        usersRepository.saveUser(users);
    }

    @Override
    public void deleteUser(int id) {
        usersRepository.deleteUser(id);
    }

    @Override
    public void editUser(int id, Users users) {
        usersRepository.editUser(id,users);
    }

    @Override
    public Users findById(int id) {
         return usersRepository.findById(id);
    }

    @Override
    public List<Users> findName(String name) {
        return usersRepository.findName(name);
    }

    @Override
    public List<Users> sortByName() {
        return usersRepository.sortByName();
    }

}
