package presentation;

import business.Cart;
import business.Cupcake;
import business.CupcakeFacade;
import business.Customer;
import business.CustomerFacade;
import business.DuplicateCupcakeException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Order extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String formName = request.getParameter("formName");
        HttpSession session = request.getSession();
        switch (formName) {
            case "AddCupcake":
                try {
                    String topping = request.getParameter("topping");
                    String bottom = request.getParameter("bottom");
                    String quantity = request.getParameter("quantity");
                    Cupcake cupcake = CupcakeFacade.getCupcake(topping, bottom);
                    Cart cart = (Cart) session.getAttribute("currentUserCart");
                    for (HashMap.Entry<Integer, Cupcake> c : cart.getCart().entrySet()) {
                        if (c.getValue().getId().equals(cupcake.getId())) {
                            throw new DuplicateCupcakeException();
                        }
                    }
                    cupcake.setQuantity(Integer.parseInt(quantity));
                    cupcake.setPrice(cupcake.getQuantity() * cupcake.getPrice());
                    session.setAttribute("cupcake", cupcake);
                    cart.addCupcake(cupcake);
                    session.setAttribute("currentUserCart", cart);
                    request.getRequestDispatcher("shopping.jsp").forward(request, response);
                } catch (SQLException | NullPointerException e) {
                    request.setAttribute("errorMessageNotLoggedIn", "Error");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                    request.setAttribute("errorMessageWrongQuantity", "Error");
                    request.getRequestDispatcher("shopping.jsp").forward(request, response);
                } catch (DuplicateCupcakeException e) {
                    request.setAttribute("errorMessageDuplicateCupcake", "Error");
                    request.getRequestDispatcher("shopping.jsp").forward(request, response);
                }
                break;
            case "ClearRow":
                try {
                    Cart cart = (Cart) session.getAttribute("currentUserCart");
                    for (HashMap.Entry<Integer, Cupcake> c : cart.getCart().entrySet()) {
                        int i = 0;
                        if (c.getKey() == Integer.parseInt(request.getParameterValues("row")[i])) {
                            cart.getCart().remove(c.getKey());
                            session.setAttribute("cupcake", null);
                            session.setAttribute("currentUserCart", cart);
                            break;
                        }
                        i++;
                    }
                    request.getRequestDispatcher("shopping.jsp").forward(request, response);
                } catch (IOException | NumberFormatException | ServletException e) {
                    System.out.println(e.getMessage());
                }
                break;
            case "FinalizePurchase":
                try {
                    Customer customer = (Customer) session.getAttribute("currentUser");
                    double total = (Double) session.getAttribute("total");
                    if (total <= customer.getBalance() && total > 0) {
                        request.setAttribute("messageOrderFinalized", "Success");
                        CustomerFacade.purchase(customer, (total));
                        Cart cart = new Cart();
                        session.setAttribute("currentUserCart", cart);
                        customer.setBalance(customer.getBalance() - total);
                        session.setAttribute("currentUser", customer);
                        request.getRequestDispatcher("order_confirmation.jsp").forward(request, response);
                    } else {
                        request.setAttribute("errorMessageNotEnoughBalance", "Error");
                        request.getRequestDispatcher("shopping.jsp").forward(request, response);
                    }
                } catch (SQLException | NullPointerException e) {
                    request.setAttribute("errorMessageNotLoggedIn", "Error");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
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
