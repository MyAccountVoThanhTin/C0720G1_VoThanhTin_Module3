package service.customer;

import models.customer_employee.Customer;
import repository.customer.CustomerRepo;
import repository.customer.ICustomerRepo;
import validate.ValidateCustomer;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepo customerRepo = new CustomerRepo();

    @Override
    public List getAllCustomer() {
        return customerRepo.getAllCustomer();
    }

    @Override
    public void createCustomer(Customer customer) {
        customerRepo.createCustomer(customer);
    }

    @Override
    public Customer getCustomer(int id) {
        return customerRepo.getCustomer(id);
    }
}
