package models.customer_employee;

import models.customer_employee.Employee_Customer;

public class Customer extends Employee_Customer {
    private int idCustomerType;
    private String gender;

    public Customer() {
    }

    public Customer(String name, String birthday, String id_card, String phone, String email, String address, int idCustomerType, String gender) {
        super(name, birthday, id_card, phone, email, address);
        this.idCustomerType = idCustomerType;
        this.gender = gender;
    }

    public Customer(int id, String name, String birthday, String id_card, String phone, String email, String address, int idCustomerType, String gender) {
        super(id, name, birthday, id_card, phone, email, address);
        this.idCustomerType = idCustomerType;
        this.gender = gender;
    }

    public int getIdCustomerType() {
        return idCustomerType;
    }

    public void setIdCustomerType(int idCustomerType) {
        this.idCustomerType = idCustomerType;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
