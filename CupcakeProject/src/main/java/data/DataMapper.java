package data;

import business.Bottom;
import business.Cupcake;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import business.Customer;
import business.InvalidUsernameOrPasswordException;
import business.Topping;

public class DataMapper {

    private final Connection con;

    public DataMapper() {
        con = new DBConnector().getConnection();
    }

    public void customerSignup(String name, String email, String phone, String username, String password) throws SQLException, NullPointerException {
        if (username.equals("") || password.equals("")) {
            NullPointerException ex = new NullPointerException();
            throw ex;
        }
        PreparedStatement createCustomer = null;
        String createCustomerString = "INSERT INTO Customer(name, email, phone, username, password) VALUES (?,?,?,?,?);";
        createCustomer = con.prepareStatement(createCustomerString);
        con.setAutoCommit(false);
        createCustomer.setString(1, name);
        createCustomer.setString(2, email);
        createCustomer.setString(3, phone);
        createCustomer.setString(4, username);
        createCustomer.setString(5, password);
        int rowAffected = createCustomer.executeUpdate();
        if (rowAffected == 1) {
            con.commit();
        } else {
            con.rollback();
        }
    }

    public Customer customerLogin(String username, String password) throws SQLException, NullPointerException, InvalidUsernameOrPasswordException {
        ResultSet rs = null;
        Customer customer = null;
        PreparedStatement getCustomer = null;
        String getBorrowerString = "SELECT * FROM Customer WHERE username = ? AND password = ? ;";
        getCustomer = con.prepareStatement(getBorrowerString);
        getCustomer.setString(1, username);
        getCustomer.setString(2, password);
        rs = getCustomer.executeQuery();
        if (rs.next()) {
            customer = new Customer(rs.getString(1),
                                    rs.getString(2),
                                    rs.getString(3),
                                    rs.getDouble(4),
                                    rs.getString(5),
                                    rs.getString(6));
        }
        System.out.println(customer.getUsername());
        System.out.println(customer.getPassword());
        return customer;
    }
    
    public Cupcake getCupcake(String topping, String bottom) throws SQLException, NullPointerException {
        ResultSet rs = null;
        Cupcake cupcake = null;
        PreparedStatement getCupcake = null;
        String getCupcakeString = "SELECT id_topping, Topping.name, Topping.price, id_bottom, Bottom.name, Bottom.price FROM Topping INNER JOIN Bottom WHERE Topping.name = ? AND Bottom.name = ?;";
        getCupcake = con.prepareStatement(getCupcakeString);
        getCupcake.setString(1, topping);
        getCupcake.setString(2, bottom);
        rs = getCupcake.executeQuery();
        if (rs.next()) {
            Topping selectedTopping = new Topping(rs.getInt(1),
                                                  rs.getString(2),
                                                  rs.getDouble(3));
            Bottom selectedBottom   = new Bottom( rs.getInt(4),
                                                  rs.getString(5),
                                                  rs.getDouble(6));
            cupcake = new Cupcake(selectedTopping, selectedBottom);
        }
        return cupcake;
    }
    
    public void purchase(Customer customer, double total) throws SQLException, NullPointerException {
        PreparedStatement purchase = null;
        String purchaseString = "UPDATE Customer SET balance = ? WHERE username = ?;";
        double newBalance = customer.getBalance() - total;
        purchase = con.prepareStatement(purchaseString);
        con.setAutoCommit(false);
        purchase.setDouble(1, newBalance);
        purchase.setString(2, customer.getUsername());
        int rowAffected = purchase.executeUpdate();
        if (rowAffected == 1) {
            con.commit();
            
        } else {
            con.rollback();
        }
    }
}
