package controller.employee;

import models.customer_employee.Employee;
import service.employee.EmployeeService;
import service.employee.IEmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeServlet",urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action ==  null){
            action = "";
        }
        switch (action){
            case "deleteEmployee":
                deleteEmployee(request,response);
                break;
            case "createEmployee":
                createNewEmployee(request,response);
                break;
            case "saveEdit":
                saveEdit(request,response);
                break;
            default:
                getAllEmployee(request,response);
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("delete"));
        employeeService.deleteEmployee(id);
        getAllEmployee(request,response);
    }

    private void saveEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String biethday = request.getParameter("birthday");
        String id_card = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int idPosition = Integer.parseInt(request.getParameter("idPosition"));
        int idEducation = Integer.parseInt(request.getParameter("idEducation"));
        int idDivision = Integer.parseInt(request.getParameter("idDivision"));
        String userName = request.getParameter("username");
        Employee employee = new Employee(id,name,biethday,id_card,phone,email,address,salary,idPosition,idEducation,idDivision,userName);
        employeeService.saveEdit(employee);
        getAllEmployee(request,response);
    }

    private void createNewEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String biethday = request.getParameter("birthday");
        String id_card = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int idPosition = Integer.parseInt(request.getParameter("idPosition"));
        int idEducation = Integer.parseInt(request.getParameter("idEducation"));
        int idDivision = Integer.parseInt(request.getParameter("idDivision"));
        String userName = request.getParameter("userName");
        Employee employee = new Employee(name,biethday,id_card,phone,email,address,salary,idPosition,idEducation,idDivision,userName);
        employeeService.saveEmployee(employee);
        getAllEmployee(request,response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action ==  null){
            action = "";
        }
        switch (action){
            case "comeBack":
                response.sendRedirect("index.jsp");
                break;
            case "getEmployee":
                getEmployee(request,response);
                break;
            default:
                getAllEmployee(request,response);
        }
    }

    private void getEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.getEmployee(id);
        request.setAttribute("employee",employee);
        String message = "1";
        request.setAttribute("message",message);
        List list = employeeService.getAllEmployee();
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("employee.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getAllEmployee(HttpServletRequest request, HttpServletResponse response) {
        List list = employeeService.getAllEmployee();
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("employee.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
