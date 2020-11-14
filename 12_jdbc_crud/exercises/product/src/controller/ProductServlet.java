package controller;

import model.Products;
import service.ProductsServices;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns ={""})
public class ProductServlet extends HttpServlet {
    ProductsServices productsServices = new ProductsServices();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "findByName":
                findByName(request,response);
                break;
            case "create":
                createProduct(request,response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "edit":
                saveProduct(request,response);;
                break;
            default:
                getAllProducts(request, response);
        }
    }

    private void sort(HttpServletRequest request, HttpServletResponse response,String name) {
        List<Products> list = productsServices.sort(name);
        request.setAttribute("listProducts",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void findByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("search");
        List<Products> list = productsServices.finByName(name);
        request.setAttribute("productFindByName",list);
        String message = "1";
        request.setAttribute("mesageFindByName",message);
        getAllProducts(request,response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String cost = request.getParameter("cost");
        String nsx = request.getParameter("nsx");
        productsServices.createProduct(new Products(name,cost,nsx));
        getAllProducts(request,response);
    }

    private void saveProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String cost = request.getParameter("cost");
        String nsx = request.getParameter("nsx");
        productsServices.saveProduct(new Products(id,name,cost,nsx));
        getAllProducts(request,response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productsServices.deleteProduct(id);
        getAllProducts(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                getProduct(request, response);
                break;
            case "sortById":
                String id = "id";
                sort(request,response,id);
                break;
            case "sortByName":
                String name = "name";
                sort(request,response,name);
                break;
            case "sortByCost":
                String cost = "cost";
                sort(request,response,cost);
                break;
            default:
                getAllProducts(request, response);
        }
    }

    private void getProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Products products = productsServices.getProduct(id);
        String message = "1";
        List<Products> list = productsServices.getAllProducts();
        request.setAttribute("listProducts", list);
        request.setAttribute("productEdit", products);
        request.setAttribute("message", message);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    private void getAllProducts(HttpServletRequest request, HttpServletResponse response) {
        List<Products> list = productsServices.getAllProducts();
        request.setAttribute("listProducts", list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
