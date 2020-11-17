package controller.customer;

import models.customer_employee.Customer;
import service.customer.CustomerService;
import service.customer.ICustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    ICustomerService customerService = new CustomerService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action ==  null){
            action = "";
        }
        switch (action){
            case "create":
                createCustomer(request,response);
                break;
            default:
                getAllCustomer(request,response);
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int idCustomer = Integer.parseInt(request.getParameter("idCustomerType"));
        Customer customer = new Customer(name,birthday,idCard,phone,email,address,idCustomer,gender);
        customerService.createCustomer(customer);
        getAllCustomer(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action ==  null){
            action = "";
        }
        switch (action){
            case "getCustomer":
                getCustomer(request,response);
                break;
            default:
                getAllCustomer(request,response);
        }
    }

    private void getCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.getCustomer(id);
        request.setAttribute("customer",customer);
        String messageEdit = "1";
        request.setAttribute("messageEdit",messageEdit);
        List list = customerService.getAllCustomer();
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getAllCustomer(HttpServletRequest request, HttpServletResponse response) {
        List list = customerService.getAllCustomer();
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
