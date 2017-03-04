<%@page import="java.util.HashMap"%>
<%@page import="business.Cart"%>
<%@page import="business.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="business.Cupcake"%>
<%@page import="business.CupcakeFacade"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Shop - Cavernous Cupcakes</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/business-casual.css" rel="stylesheet">
        <link href="style.css" rel="stylesheet">
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
    </head>
    <body>

        <div class="brand">Cavernous Cupcakes</div>
        <div class="address-bar">Kongevejen 438 | 2840 Holte | 123.456.7890</div>

        <!-- Navigation -->
        <nav class="navbar navbar-default" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                    <a class="navbar-brand" href="index.html">Cavernous Cupcakes</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="index.jsp">Home</a>
                        </li>
                        <li>
                            <a href="login.jsp">Login</a>
                        </li>
                        <li>
                            <a href="shopping.jsp">Shop</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
        <%
            String[] toppings = CupcakeFacade.getToppings();
            String[] bottoms = CupcakeFacade.getBottoms();
            Cart cart = (Cart) request.getSession().getAttribute("currentUserCart");
            double total = 0.00;
            Customer customer = (Customer) request.getSession().getAttribute("currentUser");
        %>
        <div class="container">
            <div class="box">
                <% if (customer != null) {%>
                <h4 >Current balance: <%=customer.getBalance()%></h4>
                <% } %>
                <%  if ("Error".equals(request.getAttribute("errorMessageWrongQuantity"))) { %>
                <div class="alert alert-danger alert-dismissable">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Warning!</strong> You may only enter a number as quantity.
                </div>
                <% } %>
                <%  if ("Error".equals(request.getAttribute("errorMessageNotEnoughBalance"))) { %>
                <div class="alert alert-warning alert-dismissable">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Error!</strong> You do not have a high enough balance to finalize the purchase.
                </div>
                <% } %>
                <%  if ("Error".equals(request.getAttribute("errorMessageDuplicateCupcake"))) { %>
                <div class="alert alert-warning alert-dismissable">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Error!</strong> You've already added a cupcake with the chosen topping and bottom to the cart.
                </div>
                <% } %>
                <div class="row">
                    <div class="col-md-4">
                        <form name="AddCupcake" action="Order" method="POST">
                            <input type="hidden" name="formName" value="AddCupcake" />
                            <div class="form-group">
                                <label>Topping</label>
                                <select class="form-control" name="topping">
                                    <%
                                        for (String t : toppings) {%>
                                    <option><%=t%></option>
                                    <% } %>
                                </select>
                            </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Bottom</label>
                            <select class="form-control" name="bottom">
                                <%
                                    for (String b : bottoms) {%>
                                <option><%=b%></option>
                                <% }%>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label>Quantity</label>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <button type="button" class="quantity-left-minus btn btn-danger btn-number"  data-type="minus" data-field="">
                                        <span class="glyphicon glyphicon-minus"></span>
                                    </button>
                                </span>
                                <input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="100">
                                <span class="input-group-btn">
                                    <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus" data-field="">
                                        <span class="glyphicon glyphicon-plus"></span>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label>Cart</label>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <input class="btn btn-success" type="submit" value="Add to cart"/>
                                </span>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
                <hr id="line">
                <div class="row" id="orderTable">
                    <div class="col-xs-12">
                        <form name="ClearRow" action="Order" method="POST">
                            <input type="hidden" name="formName" value="ClearRow" />
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Cupcake</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (request.getSession().getAttribute("currentUserCart") != null) {
                                        for (HashMap.Entry<Integer, Cupcake> c : cart.getCart().entrySet()) {%>
                                    <tr>
                                        <th scope="row"><%=c.getValue().getTopping().getName() + "/" + c.getValue().getBottom().getName()%></th>
                                        <td><%=c.getValue().getQuantity()%></td>
                                        <td><%=c.getValue().getPrice()%></td>
                                        <td><span class="input-group-btn">
                                                <button type="submit" class="btn btn-default" name="row" value="<%=c.getKey()%>">
                                                    <span class="glyphicon glyphicon-remove"></span>
                                                </button>
                                            </span></td>
                                    </tr>
                                    <% }
                                        for (HashMap.Entry<Integer, Cupcake> c : cart.getCart().entrySet()) {
                                            total += c.getValue().getPrice();
                                        }
                                    %>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><p>Total</p><%=total%></td>
                                <% } %>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="col-xs-offset-5 col-xs-4">
                        <form name="FinalizePurchase" action="Order" method="POST">
                            <input type="hidden" name="formName" value="FinalizePurchase" />
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <% request.getSession().setAttribute("total", total);%>
                                    <input class="btn btn-success" type="submit" value="Finalize purchase"/>
                                </span>
                            </div>
                        </form>
                    </div>

                </div>

            </div>
            <!-- row -->
            <!-- content container -->
        </div>
        <!-- /.container -->

        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <p>Copyright &copy; Cavernous Cupcakes 2017</p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/javascript.js"></script>
    </body>

</html>
