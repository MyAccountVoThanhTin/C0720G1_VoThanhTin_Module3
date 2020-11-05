package controller;

import model.Product;
import service.ProductService;
import service.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Currency;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "")
public class ProductServlet extends HttpServlet {
    ProductServiceImpl productService = new ProductServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                saveProduct(request, response);
                break;
            case "delete":
                break;
            case "create":
                createProduct(request, response);
                break;
            case "findName":
                showProduct(request,response);
                break;
            default:
                getAllProduct(request, response);
        }

    }

    private void showProduct(HttpServletRequest request, HttpServletResponse response) {
    }

    private void saveProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String cost = request.getParameter("cost");
        String nsx = request.getParameter("nsx");
        Product product = new Product(id, name, cost, nsx);
        productService.saveProduct(product);
        getAllProduct(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                editProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "create":
                break;
            case "findName":
                findProductByName(request,response);
                break;
            default:
                getAllProduct(request, response);
        }
    }

    private void findProductByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("search");
        Product product = productService.findByName(name);
        request.setAttribute("product2",product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("action.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("product1", product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("action.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = (int) (Math.random() * 1000);
        String name = request.getParameter("name");
        String cost = request.getParameter("cost");
        String nsx = request.getParameter("nsx");
        Product product = new Product(id, name, cost, nsx);
        productService.saveProduct(product);
        getAllProduct(request, response);
//        int id = (int)(Math.random() * 10000);
//        String name = request.getParameter("name");
//        String cost = request.getParameter("cost");
//        String nsx = request.getParameter("nsx");
//        Product product = new Product(id,name,cost,nsx);
//        productService.saveProduct(product);
//        getAllProduct(request,response);
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
//        try {
//            requestDispatcher.forward(request, response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.deleteProduct(id);
        getAllProduct(request, response);
    }

    private void getAllProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> list = productService.showAllProduct();
        request.setAttribute("listProduct", list);
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
