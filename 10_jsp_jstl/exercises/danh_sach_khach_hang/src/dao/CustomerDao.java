package dao;

import models.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerDao {
    static List<Customer> listCustomer;
    static {
        listCustomer = new ArrayList<>();
        listCustomer.add(new Customer("Tin1","18-01-1997","Quang Ngai","/img/download.jpg"));
        listCustomer.add(new Customer("Tin2","18-01-1997","Quang Ngai","/img/download.jpg"));
        listCustomer.add(new Customer("Tin3","18-01-1997","Quang Ngai","/img/download.jpg"));
        listCustomer.add(new Customer("Tin4","18-01-1997","Quang Ngai","/img/download.jpg"));
        listCustomer.add(new Customer("Tin5","18-01-1997","Quang Ngai","/img/download.jpg"));
    }
    public static List<Customer> add(){
        return listCustomer;
    }
}
