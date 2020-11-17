package repositorys;

import bo.IBookBo;
import dbconnection.DBConnection;
import models.Books;
import models.BooksType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class BookRepo  implements IBookRepo {
    private static String GET_ALL_BOOKS = "select * from books";
    private static String GET_ALL_BOOKTYPE = "select * from bookstype";
    private static String CREATE_NEW_BOOK = " insert into books(title,content,idBookType) values(?,?,?)";
    private static String DELETE_BOOK = "delete from books where id = ?";
    private static String GET_BOOK_BY_ID = "select * from books where id = ?";
    private static String SAVE_EDIT = "update books set title = ?,content = ?,idBookType = ? where id = ?";
    @Override
    public List getAllBook() {
        List list = new ArrayList();
        List<Books> listBook = new ArrayList<>();
        List<BooksType> listBookType = new ArrayList<>();
        Books books = null;
        BooksType booksType = null;
        Connection connection = null;
        PreparedStatement preparedStatement =  null;
        try{
            connection = DBConnection.getConnection(connection);
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(GET_ALL_BOOKS);
            ResultSet rs = preparedStatement.executeQuery();
            preparedStatement = connection.prepareStatement(GET_ALL_BOOKTYPE);
            ResultSet rs1 = preparedStatement.executeQuery();
            connection.commit();
            connection.setAutoCommit(true);
            while (rs.next()){
                books = new Books();
                books.setId(rs.getInt("id"));
                books.setTitle(rs.getString("title"));
                books.setContent(rs.getString("content"));
                books.setIdBookType(rs.getInt("idBookType"));
                listBook.add(books);
            }

            while (rs1.next()){
                booksType = new BooksType();
                booksType.setId(rs1.getInt("id"));
                booksType.setName(rs1.getString("name"));
                booksType.setDescripton(rs1.getString("description"));
                listBookType.add(booksType);
            }
            list.add(listBook);
            list.add(listBookType);
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
                e.printStackTrace();
        }finally {
            DBConnection.closeConnection(connection);
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public List<BooksType> getAllBookType() {
        List<BooksType> listBookType = new ArrayList<>();
        Connection connection =  null;
        PreparedStatement preparedStatement = null;
        BooksType booksType = null;
        try{
            connection = DBConnection.getConnection(connection);
            preparedStatement = connection.prepareStatement(GET_ALL_BOOKTYPE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                booksType = new BooksType();
                booksType.setId(rs.getInt("id"));
                booksType.setName(rs.getString("name"));
                booksType.setDescripton(rs.getString("description"));
                listBookType.add(booksType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listBookType;
    }

    @Override
    public void createBook(Books books) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try{
            connection = DBConnection.getConnection(connection);
            preparedStatement = connection.prepareStatement(CREATE_NEW_BOOK);
            preparedStatement.setString(1,books.getTitle());
            preparedStatement.setString(2,books.getContent());
            preparedStatement.setInt(3,books.getIdBookType());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnection.closeConnection(connection);
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try{
            connection = DBConnection.getConnection(connection);
            preparedStatement = connection.prepareStatement(DELETE_BOOK);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBConnection.closeConnection(connection);
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public Books getBook(int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Books books = null;
        try{
            connection = DBConnection.getConnection(connection);
            preparedStatement = connection.prepareStatement(GET_BOOK_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                books = new Books();
                books.setId(rs.getInt("id"));
                books.setTitle(rs.getString("title"));
                books.setContent(rs.getString("content"));
                books.setIdBookType(rs.getInt("idBookType"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    @Override
    public void saveEdit(Books books) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try{
            connection = DBConnection.getConnection(connection);
            preparedStatement = connection.prepareStatement(SAVE_EDIT);
            preparedStatement.setString(1,books.getTitle());
            preparedStatement.setString(2,books.getContent());
            preparedStatement.setInt(3,books.getIdBookType());
            preparedStatement.setInt(4,books.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
