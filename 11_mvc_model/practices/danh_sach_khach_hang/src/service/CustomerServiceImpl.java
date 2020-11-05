package service;

import model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {
    private static Map<Integer, Customer> customers;
    static {
        customers = new HashMap<>();
        customers.put(1, new Customer(1, "John", "123456789", "Hanoi"));
        customers.put(2, new Customer(2, "Bill", "123456789", "Danang"));
        customers.put(3, new Customer(3, "Alex", "123456789", "Saigon"));
        customers.put(4, new Customer(4, "Adam", "123456789", "Beijin"));
        customers.put(5, new Customer(5, "Sophia", "123456789", "Miami"));
        customers.put(6, new Customer(6, "Rose", "123456789", "Newyork"));
    }

    @Override
    public List<Customer> getAllCustomer() {
        return new ArrayList<>(customers.values());
    }

    @Override
    public void save(Customer customer) {
        customers.put(customer.getId(), customer);
    }

    @Override
    public Customer findById(int id) {
        return customers.get(id);
    }

    @Override
    public void deleteCustomer(int id) {
        customers.remove(id);
    }

}
