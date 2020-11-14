package service.employee;

import models.customer_employee.Employee;
import repository.employee.EmployeeRepo;
import repository.employee.IEmployeeRepo;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepo employeeRepo = new EmployeeRepo();
    @Override
    public List getAllEmployee() {
        return employeeRepo.getALlEmployee();
    }

    @Override
    public void saveEmployee(Employee employee) {
        employeeRepo.saveEmployee(employee);
    }

    @Override
    public Employee getEmployee(int id) {
        return employeeRepo.getEmployee(id);
    }

    @Override
    public void saveEdit(Employee employee) {
        employeeRepo.saveEdit(employee);
    }

    @Override
    public void deleteEmployee(int id) {
        employeeRepo.deleteEmployee(id);
    }
}
