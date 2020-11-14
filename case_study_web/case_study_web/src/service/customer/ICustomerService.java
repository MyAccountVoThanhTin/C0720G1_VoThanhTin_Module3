package service.customer;

import models.customer_employee.Customer;

import java.util.List;

public interface ICustomerService {
    List getAllCustomer();
    String[] createCustomer(Customer customer);
}
