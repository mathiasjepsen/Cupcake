<%-- 
    Document   : login2
    Created on : Mar 1, 2017, 2:25:40 PM
    Author     : mathiasjepsen
--%>

<%@page import="business.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login - Cavernous Cupcakes</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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

    <div class="container">
        <div class="row">
            <div class="box">
               <div class="col-xs-offset-3 col-xs-6">
                   <%  if (request.getAttribute("errorMessageWrongInput") != null) { %>
                        <div class="alert alert-danger alert-dismissable">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Warning!</strong> Incorrect username and/or password.
                        </div>
                        <% } %>
                        <%  if (request.getAttribute("errorMessageNotLoggedIn") != null) { %>
                        <div class="alert alert-danger alert-dismissable">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Warning!</strong> You must be logged in to use the shop.
                        </div>
                        <% } %>
                        <%  if (request.getAttribute("messageUserSignedUp") != null) { %>
                        <div class="alert alert-success alert-dismissable">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Congratulations!</strong> Your account have been created, sign in below.
                        </div>
                        <% } %>
                    <form class="form-horizontal" name="Login" action="Login" method="POST">
                        <input type="hidden" name="formName" value="Login" />
                        <div class="form-group">
                            <label class="col-md-2" for="Username">Username</label>
                            <div class="col-md-10">
                                <input class="form-control" type="text" id="Username" name="username" placeholder="Username" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2" for="Password">Password</label>
                            <div class="col-md-10">
                                <input class="form-control" type="password" id="Password" name="password" placeholder="Password" />
                            </div>
                        </div>
                        </div>
                <div class="row">
                    <div class="col-xs-offset-5 col-xs-2">
                        <div class="form-group">
                            <input class="form-control btn btn-success" type="submit" value="Submit" name="Submit" />
                        </div>
                        </form>
                        <%  if (null != request.getAttribute("errorMessageUserNotFound")) {
                                out.println(request.getAttribute("errorMessageUserNotFound"));
                            }
                            if (null != request.getAttribute("messageUserCreated")) {
                                out.println(request.getAttribute("messageUserCreated"));
                            }%>
                        <form name="signup" action="signup.jsp" method="POST">
                            <input class="form-control btn btn-primary" type="submit" value="Sign up" name="" />
                        </form>
                    </div>
                        </div>
                </div>
            </div>
        </div>

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

</body>

</html>

