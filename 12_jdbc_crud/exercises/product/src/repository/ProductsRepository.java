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
    private static final String DELETE_PRODUCT = "delete from products where id = ?";
    private static final String SELECT_PRODUCT_BY_ID = "select * from products where id = ?";
    private static final String UPDATE_PRODUCT = "update products set name = ?, cost = ?, nsx = ? where id = ?";
    private static final String CREATE_PRODUCT = "INSERT INTO products(name, cost, nsx) VALUES(?, ?, ?)";
    private static final String SELECT_PRODUCTS_BY_NAME ="select * from products where name = ?";
    private static final String SORT_BY_ID = "select * from products order by id";
    private static final String SORT_BY_NAME = "select * from products order by name";
    private static final String SORT_BY_COST = "select * from products order by cost";

    public ProductsRepository(){
    }

    private Connection getAllConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
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
        PreparedStatement preparedStatement = null;
        Connection connection = null;
        try {
            connection = getAllConnection();
            preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);
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
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public void saveProduct(Products products) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = getAllConnection();
            preparedStatement = connection.prepareStatement(UPDATE_PRODUCT);
            preparedStatement.setString(1,products.getName());
            preparedStatement.setString(2,products.getCost());
            preparedStatement.setString(3,products.getNsx());
            preparedStatement.setInt(4,products.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateProduct(Products products) {

    }

    @Override
    public List<Products> findByName(String name) {
        List<Products> list = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        Connection connection = null;
        try{
            connection = getAllConnection();
            preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_BY_NAME);
            preparedStatement.setString(1,name);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String nameProduct = rs.getString("name");
                String costProduct = rs.getString("cost");
                String nsxProduct = rs.getString("nsx");
                list.add(new Products(id,nameProduct,costProduct,nsxProduct));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public void deletePRoduct(int id) {
        Connection connection = getAllConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(DELETE_PRODUCT);
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public Products getProduct(int id) {
        Products products = null;
        PreparedStatement preparedStatement = null;
        Connection connection = null;
        try {
            connection = getAllConnection();
            preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int idProduct = rs.getInt("id");
                String nameProduct = rs.getString("name");
                String costProduct = rs.getString("cost");
                String nsxProduct = rs.getString("nsx");
                products = new Products(idProduct,nameProduct,costProduct,nsxProduct);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return products;
    }

    @Override
    public void createProduct(Products products) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try{
            connection = getAllConnection();
            preparedStatement = connection.prepareStatement(CREATE_PRODUCT);
            preparedStatement.setString(1,products.getName());
            preparedStatement.setString(2,products.getCost());
            preparedStatement.setString(3,products.getNsx());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<Products> sort(String name) {
        List<Products> list = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try{
            connection = getAllConnection();
            if(name.equals("id")){
                preparedStatement = connection.prepareStatement(SORT_BY_ID);
            }else if(name.equals("name")){
                preparedStatement = connection.prepareStatement(SORT_BY_NAME);
            }else if(name.equals("cost")){
                preparedStatement = connection.prepareStatement(SORT_BY_COST);
            }
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String nameProduct = rs.getString("name");
                String costProduct = rs.getString("cost");
                String nsxProduct = rs.getString("nsx");
                list.add(new Products(id,nameProduct,costProduct,nsxProduct));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

}
