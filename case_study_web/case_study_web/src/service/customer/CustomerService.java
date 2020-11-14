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
    public String[] createCustomer(Customer customer) {
        String[] str = new String[3];
        boolean flag = true;
        if (ValidateCustomer.phoneCustomer(customer.getPhone())) {
            str[0] = "0";
            if (ValidateCustomer.cmndCustomer(customer.getId_card())) {
                str[1] = "0";
            } else {
                str[1] = "1";
                flag = false;
            }
        } else {
            str[0] = "1";
            flag = false;
        }
        if (flag){
            customerRepo.createCustomer(customer);
        }
        return str;
    }
}
