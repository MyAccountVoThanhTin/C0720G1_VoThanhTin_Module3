package models.customer_employee;

import models.customer_employee.Employee_Customer;

public class Employee extends Employee_Customer {
    private double salary;
    private int idPosition;
    private int idEducation_degree;
    private int idDivision;
    private String userName;

    public Employee() {
    }


    public Employee(double salary, int idPosition, int idEducation_degree, int idDivision, String userName) {
        this.salary = salary;
        this.idPosition = idPosition;
        this.idEducation_degree = idEducation_degree;
        this.idDivision = idDivision;
        this.userName = userName;
    }

    public Employee(String name, String birthday, String id_card, String phone, String email, String address, double salary, int idPosition, int idEducation_degree, int idDivision, String userName) {
        super(name, birthday, id_card, phone, email, address);
        this.salary = salary;
        this.idPosition = idPosition;
        this.idEducation_degree = idEducation_degree;
        this.idDivision = idDivision;
        this.userName = userName;
    }

    public Employee(int id, String name, String birthday, String id_card, String phone, String email, String address, double salary, int idPosition, int idEducation_degree, int idDivision, String userName) {
        super(id, name, birthday, id_card, phone, email, address);
        this.salary = salary;
        this.idPosition = idPosition;
        this.idEducation_degree = idEducation_degree;
        this.idDivision = idDivision;
        this.userName = userName;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public int getIdPosition() {
        return idPosition;
    }

    public void setIdPosition(int idPosition) {
        this.idPosition = idPosition;
    }

    public int getIdEducation_degree() {
        return idEducation_degree;
    }

    public void setIdEducation_degree(int idEducation_degree) {
        this.idEducation_degree = idEducation_degree;
    }

    public int getIdDivision() {
        return idDivision;
    }

    public void setIdDivision(int idDivision) {
        this.idDivision = idDivision;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
