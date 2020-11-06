package controller;

import model.Users;
import service.UsersService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.List;

@WebServlet(name = "UsersServlet", urlPatterns = "")
public class UsersServlet extends HttpServlet {
    UsersService usersService = new UsersService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                createNewUser(request,response);
                break;
            case "edit":
                editUser(request,response);
                break;
            case "findName":
                findName(request,response);
                break;
            default:
                getAllUsers(request,response);
        }
    }

    private void sortByName(HttpServletRequest request, HttpServletResponse response) {
        List<Users> list = usersService.sortByName();
        request.setAttribute("listUser",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void findName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("search");
        List<Users> list = usersService.findName(name);
        request.setAttribute("user1",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("findName.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        usersService.saveUser(new Users(name,email,country));
        getAllUsers(request,response);
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        usersService.editUser(id,new Users(id,name,email,country));
        getAllUsers(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "delete":
                deleteUser(request,response);
                break;
            case "edit":
                getUser(request,response);
                break;
            case "sortByName":
                sortByName(request,response);
            default:
                getAllUsers(request,response);
        }
    }

    private void getUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Users users = usersService.findById(id);
        request.setAttribute("users",users);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("edit.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        usersService.deleteUser(id);
        getAllUsers(request,response);
    }

    private void getAllUsers(HttpServletRequest request, HttpServletResponse response) {
        List<Users> listUser =  usersService.getAllUsers();
        request.setAttribute("listUser",listUser);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
