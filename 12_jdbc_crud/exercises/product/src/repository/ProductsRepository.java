package repository;

import model.Products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductsRepository implements IProductRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/products";
    private String jdbcUserName = "root";
    private String jdbcPassword = "codegym";
    private static final String SELECT_ALL_PRODUCTS = "select * from products";

    public ProductsRepository() {
    }

    private Connection getAllConnection(){
        Connection connection = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,jdbcUserName,jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<Products> getAllProducts() {
       List<Products> list = new ArrayList<>();
       try(Connection connection = getAllConnection();
       PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS)){
           ResultSet rs = preparedStatement.executeQuery();
           while (rs.next()){
               int id = rs.getInt("id");
               String name = rs.getString("name");
               String cost = rs.getString("cost");
               String nsx = rs.getString("nsx");
               list.add(new Products(id,name,cost,nsx));
           }
        } catch (SQLException e) {
           e.printStackTrace();
       }
        return list;
    }

    @Override
    public void saveProduct(Products products) {

    }

    @Override
    public void updateProduct(Products products) {

    }

    @Override
    public Products findByName(String name) {
        return null;
    }
}
