package service;

import model.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> getAllCustomer();

    void save(Customer customer);

    Customer findById(int id);

    void deleteCustomer(int id);
}
