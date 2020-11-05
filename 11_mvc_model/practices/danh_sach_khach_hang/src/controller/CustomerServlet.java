package controller;

import model.Customer;
import service.CustomerServiceImpl;
import sun.security.krb5.KrbApRep;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/home")
public class CustomerServlet extends HttpServlet {
    CustomerServiceImpl customerService = new CustomerServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createNewCustomer(request,response);
                break;
            case "edit":
                saveCustomer(request,response);
                break;
            default:
                getAllCustomer(request, response);
                break;

        }
    }

    private void saveCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Customer customer = new Customer(id,name,phone,address);
        customerService.save(customer);
        try {
            response.sendRedirect("/home");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            case "edit":
                editCustomer(request,response);
                break;
            case "delete":
                deleteCustomer(request,response);
                break;
            default:
                getAllCustomer(request, response);
                break;

        }
    }

    private void createNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = (int)(Math.random() * 10000);
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Customer customer = new Customer(id,name,phone,address);
        customerService.save(customer);
        getAllCustomer(request,response);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        request.setAttribute("customer",customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.deleteCustomer(id);
        try {
            response.sendRedirect("/home");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getAllCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customers = customerService.getAllCustomer();
        request.setAttribute("cutomerList", customers);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
