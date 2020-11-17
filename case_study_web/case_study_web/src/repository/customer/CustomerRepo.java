package repository.customer;

import models.customer_employee.Customer;
import models.customer_employee.CustomerType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepo implements ICustomerRepo {
    private String jdbcURL = "jdbc:mysql://localhost:3306/case_study_web";
    private String jdbcUserName = "root";
    private String jdbcPassword = "codegym";
    private static final String GET_ALL_CUSTOMER = "select * from customer";
    private static final String GET_ALL_CUSTOMER_TYPE = "select * from customer_type";
    private static final String CREATE_CUSTOMER = "insert into customer(customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address) values(?,?,?,?,?,?,?,?)";
    private static final String GET_CUSTOMER_BY_ID = "select * from customer where customer_id = ?";

    private Connection getConnection(){
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
    public List getAllCustomer() {
        Connection connection = null;
        PreparedStatement preparedStatement =  null;
        Customer customer = null;
        CustomerType customerType = null;
        List list = new ArrayList();
        List<Customer> listCustomer = new ArrayList<>();
        List<CustomerType> listCustomerType = new ArrayList<>();
        try{
            connection = getConnection();
            connection.setAutoCommit(false);
            preparedStatement =  connection.prepareStatement(GET_ALL_CUSTOMER);
            ResultSet rs = preparedStatement.executeQuery();
            preparedStatement = connection.prepareStatement(GET_ALL_CUSTOMER_TYPE);
            ResultSet rs1 = preparedStatement.executeQuery();
            connection.commit();
            connection.setAutoCommit(true);
            while (rs.next()){
//                int id, String name, String birthday, String id_card, String phone, String email, String address, String customerType, String gender)
                customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setName(rs.getString("customer_name"));
                customer.setBirthday(rs.getString("customer_birthday"));
                customer.setId_card(rs.getString("customer_id_card"));
                customer.setPhone(rs.getString("customer_phone"));
                customer.setEmail(rs.getString("customer_email"));
                customer.setAddress(rs.getString("customer_address"));
                customer.setIdCustomerType(rs.getInt("customer_type_id"));
                customer.setGender(rs.getString("customer_gender"));
                listCustomer.add(customer);
            }
            while (rs1.next()){
                customerType = new CustomerType(rs1.getInt("customer_type_id"),rs1.getString("customer_type_name"));
                listCustomerType.add(customerType);
            }
            list.add(listCustomer);
            list.add(listCustomerType);
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
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
            ;        }
        return list;
    }

    @Override
    public void createCustomer(Customer customer) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
//        customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address
        try{
            connection = getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(CREATE_CUSTOMER);
            preparedStatement.setInt(1,customer.getIdCustomerType());
            preparedStatement.setString(2,customer.getName());
            preparedStatement.setString(3,customer.getBirthday());
            preparedStatement.setString(4,customer.getGender());
            preparedStatement.setString(5,customer.getId_card());
            preparedStatement.setString(6,customer.getPhone());
            preparedStatement.setString(7,customer.getEmail());
            preparedStatement.setString(8,customer.getAddress());
            preparedStatement.executeUpdate();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
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
    public Customer getCustomer(int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Customer customer = null;
        try{
            connection = getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(GET_CUSTOMER_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                customer = new Customer();
                customer.setId(rs.getInt("customer_id"));
                customer.setIdCustomerType(rs.getInt("customer_type_id"));
                customer.setName(rs.getString("customer_name"));
                customer.setBirthday(rs.getString("customer_birthday"));
                customer.setGender(rs.getString("customer_gender"));
                customer.setId_card(rs.getString("customer_id_card"));
                customer.setPhone(rs.getString("customer_phone"));
                customer.setEmail(rs.getString("customer_email"));
                customer.setAddress(rs.getString("customer_address"));
            }
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
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
        return customer;
    }
}
