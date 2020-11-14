package repository.employee;

import models.customer_employee.*;
import repository.customer.CustomerRepo;
import repository.customer.ICustomerRepo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepo implements IEmployeeRepo{

    private String jdbcURL = "jdbc:mysql://localhost:3306/case_study_web";
    private String jdbcUserName = "root";
    private String jdbcPassword = "codegym";
//    private static final String GET_ALL_EMPLOYEE = "{CALL findAllEmployee()}";
    private static final String GET_ALL_POSITION = "select * from position_employee";
    private static final String GET_ALL_EDUCATION_DEGREE = "SELECT * FROM case_study_web.education_degree";
    private static final String GET_ALL_DIVISION = "select * from division";
    private static final String GET_ALL_USER = "select* from user";
    private static final String SAVE_EMPLOYEE = "insert into employee(employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,position_id,education_degree_id,division_id,username) values(?,?,?,?,?,?,?,?,?,?,?)";
    private static final String GET_ALL_EMPLOYEE = "select * from employee";
    private static final String GET_EMPLOYEE_BY_ID = "select * from employee where employee_id = ?";
    private static final String EDIT_EMPLOYEE = "update employee set employee_name = ?, employee_birthday = ?, employee_id_card = ?,employee_salary = ?,employee_phone = ?,employee_email = ?,employee_address = ?,position_id = ?,education_degree_id = ?, division_id= ?,username = ? where employee_id = ?";
    private static final String DELETE_EMPLOYEE = "delete from employee where employee_id = ?";

    private Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,jdbcUserName,jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List getALlEmployee(){
        List list = new ArrayList();
        List<Employee> listEmployee = new ArrayList<>();
        List<Users> listUsers = new ArrayList<>();
        Users users = null;
        List<PositionEmployee> listPosition = new ArrayList<>();
        List<EducationDegree> listEducation = new ArrayList<>();
        List<Division> listDivision = new ArrayList<>();
        Employee employee = null;
        PositionEmployee positionEmployee = null;
        EducationDegree educationDegree = null;
        Division division = null;
        Connection connection = null;
        CallableStatement callableStatement = null;
        try{
            connection = getConnection();
            connection.setAutoCommit(false);
            callableStatement = connection.prepareCall(GET_ALL_EMPLOYEE);
            ResultSet rs = callableStatement.executeQuery();
            callableStatement = connection.prepareCall(GET_ALL_POSITION);
            ResultSet rs2 = callableStatement.executeQuery();
            callableStatement = connection.prepareCall(GET_ALL_EDUCATION_DEGREE);
            ResultSet rs3 = callableStatement.executeQuery();
            callableStatement = connection.prepareCall(GET_ALL_DIVISION);
            ResultSet rs4 = callableStatement.executeQuery();
            callableStatement = connection.prepareCall(GET_ALL_USER);
            ResultSet rs5 = callableStatement.executeQuery();
            connection.commit();
            connection.setAutoCommit(true);
            while (rs.next()){
                employee = new Employee();
                employee.setId(rs.getInt("employee_id"));
                employee.setName(rs.getString("employee_name"));
                employee.setId_card(rs.getString("employee_id_card"));
                employee.setSalary(rs.getDouble("employee_salary"));
                employee.setPhone(rs.getString("employee_phone"));
                employee.setEmail(rs.getString("employee_email"));
                employee.setAddress(rs.getString("employee_address"));
                employee.setIdPosition(rs.getInt("position_id"));
                employee.setIdEducation_degree(rs.getInt("education_degree_id"));
                employee.setIdDivision(rs.getInt("division_id"));
                employee.setUserName(rs.getString("username"));
                employee.setBirthday(rs.getString("employee_birthday"));
                employee.setUserName(rs.getString("username"));
                listEmployee.add(employee);
            }
            while (rs2.next()){
                positionEmployee = new PositionEmployee();
                positionEmployee.setIdPosition(rs2.getInt("position_id"));
                positionEmployee.setNamePosition(rs2.getString("position_name"));
                listPosition.add(positionEmployee);
            }
            while (rs3.next()){
                educationDegree = new EducationDegree();
                educationDegree.setIdEducatonDegree(rs3.getInt("education_degree_id"));
                educationDegree.setNameEducationDegree(rs3.getString("education_degree_name"));
                listEducation.add(educationDegree);
            }
            while (rs4.next()){
              division = new Division();
              division.setIdDivision(rs4.getInt("division_id"));
              division.setNameDivision(rs4.getString("division_name"));
              listDivision.add(division);
            }
            while (rs5.next()){
                users = new Users();
                users.setUserName(rs5.getString("username"));
                users.setPassword(rs5.getString("password"));
                listUsers.add(users);
            }
            list.add(listEmployee);
            list.add(listPosition);
            list.add(listEducation);
            list.add(listDivision);
            list.add(listUsers);
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        }finally {
            try {
                callableStatement.close();
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
    public void saveEmployee(Employee employee) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try{
            connection = getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(SAVE_EMPLOYEE);
            preparedStatement.setString(1,employee.getName());
            preparedStatement.setString(2,employee.getBirthday());
            preparedStatement.setString(3,employee.getId_card());
            preparedStatement.setDouble(4,employee.getSalary());
            preparedStatement.setString(5,employee.getPhone());
            preparedStatement.setString(6,employee.getEmail());
            preparedStatement.setString(7,employee.getAddress());
            preparedStatement.setInt(8,employee.getIdDivision());
            preparedStatement.setInt(9,employee.getIdEducation_degree());
            preparedStatement.setInt(10,employee.getIdDivision());
            preparedStatement.setString(11,employee.getUserName());
            preparedStatement.executeUpdate();
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
    }

    @Override
    public Employee getEmployee(int id) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Employee employee = null;
        try{
            connection = getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(GET_EMPLOYEE_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            connection.commit();
            connection.setAutoCommit(true);
            while (rs.next()){
                employee = new Employee();
                employee.setId(rs.getInt("employee_id"));
                employee.setName(rs.getString("employee_name"));
                employee.setId_card(rs.getString("employee_id_card"));
                employee.setSalary(rs.getDouble("employee_salary"));
                employee.setPhone(rs.getString("employee_phone"));
                employee.setEmail(rs.getString("employee_email"));
                employee.setAddress(rs.getString("employee_address"));
                employee.setIdPosition(rs.getInt("position_id"));
                employee.setIdEducation_degree(rs.getInt("education_degree_id"));
                employee.setIdDivision(rs.getInt("division_id"));
                employee.setUserName(rs.getString("username"));
                employee.setBirthday(rs.getString("employee_birthday"));
                employee.setUserName(rs.getString("username"));
            }
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
        return employee;
    }
//    employee_name = ?, employee_birthday = ?, employee_id_card = ?,employee_salary = ?,employee_phone = ?,employee_email = ?,employee_address = ?,
//    position_id = ?,education_degree_id = ?, division_id= ?,username = ?
    @Override
    public void saveEdit(Employee employee) {
        Connection connection =  null;
        PreparedStatement preparedStatement  = null;
        try{
            connection = getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(EDIT_EMPLOYEE);
            preparedStatement.setString(1,employee.getName());
            preparedStatement.setString(2,employee.getBirthday());
            preparedStatement.setString(3,employee.getId_card());
            preparedStatement.setDouble(4,employee.getSalary());
            preparedStatement.setString(5,employee.getPhone());
            preparedStatement.setString(6,employee.getEmail());
            preparedStatement.setString(7,employee.getAddress());
            preparedStatement.setInt(8,employee.getIdPosition());
            preparedStatement.setInt(9,employee.getIdEducation_degree());
            preparedStatement.setInt(10,employee.getIdDivision());
            preparedStatement.setString(11,employee.getUserName());
            preparedStatement.setInt(12,employee.getId());
            preparedStatement.executeUpdate();
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
    }

    @Override
    public void deleteEmployee(int id) {
        Connection connection = null;
        PreparedStatement preparedStatement =  null;
        try{
            connection = getConnection();
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE);
            preparedStatement.setInt(1,id);
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

}
