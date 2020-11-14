package repository.employee;

import models.customer_employee.Employee;

import java.util.List;

public interface IEmployeeRepo {
    List getALlEmployee();
    void saveEmployee(Employee employee);
    Employee getEmployee(int id);
    void saveEdit(Employee employee);
    void deleteEmployee(int id);
}
