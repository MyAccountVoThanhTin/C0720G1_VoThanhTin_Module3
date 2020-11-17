package controllers;

import bo.BookBo;
import bo.IBookBo;
import models.Books;
import models.BooksType;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BookServlet",urlPatterns = "/book")
public class BookServlet extends HttpServlet {
    IBookBo bookBo = new BookBo();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "saveEdit":
                saveEdit(request,response);
                break;
            case "createNew":
                createNew(request,response);
                break;
            case "delete":
                deleteBook(request,response);
                break;
        }
    }

    private void saveEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int idBookType = Integer.parseInt(request.getParameter("idBook"));
        Books books = new Books(id,title,content,idBookType);
        bookBo.saveEdit(books);
        getAllBooks(request,response);
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelette"));
        bookBo.delete(id);
        getAllBooks(request,response);
    }

    private void createNew(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int idBookType = Integer.parseInt(request.getParameter("idBook"));
        Books books = new Books(title,content,idBookType);
        List<BooksType> listBookType = bookBo.getAllBookType();
        List<String> listValidate = bookBo.createBooks(books);
        if (listValidate.get(0) == "0"){
            request.setAttribute("books",books);
            request.setAttribute("listBookType",listBookType);
            request.setAttribute("listValidate",listValidate);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("createBook.jsp");
            try {
                requestDispatcher.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            getAllBooks(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "getBookType":
                getBookType(request,response);
                break;
            case "getBook":
                getBook(request,response);
            default:
                getAllBooks(request,response);
                break;
        }
    }

    private void getBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idEdit"));
        Books books = bookBo.getBook(id);
        request.setAttribute("book",books);
        List<BooksType> listBooksType = bookBo.getAllBookType();
        request.setAttribute("listBooksType",listBooksType);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("editBook.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getBookType(HttpServletRequest request, HttpServletResponse response) {
        List<BooksType> listBookType = bookBo.getAllBookType();
        request.setAttribute("listBookType",listBookType);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("createBook.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getAllBooks(HttpServletRequest request, HttpServletResponse response) {
        List list = bookBo.getAllBook();
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("book.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
