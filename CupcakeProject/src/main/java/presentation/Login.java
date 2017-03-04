package presentation;

import business.Cart;
import business.Cupcake;
import business.Customer;
import business.CustomerFacade;
import business.InvalidUsernameOrPasswordException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String formName = request.getParameter("formName");
        switch (formName) {
            case "Login":
                try {   
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    Customer customer = CustomerFacade.customerLogin(username, password);
                    session.setAttribute("currentUser", customer);
                    Cart cart = new Cart();
                    session.setAttribute("currentUserCart", cart);
                    request.getRequestDispatcher("shopping.jsp").forward(request, response);
                } catch (SQLException | NullPointerException | InvalidUsernameOrPasswordException e) {
                    System.out.println(e.getMessage());
                    request.setAttribute("errorMessageWrongInput", "Error");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                break;
            case "Signup":
                try {   
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    CustomerFacade.customerSignup(name, email, phone, username, password);
                    request.setAttribute("messageUserSignedUp", "Success");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } catch (SQLException | NullPointerException e) {
                    System.out.println(e.getMessage());
                    request.setAttribute("errorMessageWrongInput", "Error");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                }
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>    
    
}
