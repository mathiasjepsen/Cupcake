<%-- 
    Document   : login2
    Created on : Mar 1, 2017, 2:25:40 PM
    Author     : mathiasjepsen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Signup - Cavernous Cupcakes</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/business-casual.css" rel="stylesheet">

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
        <div class="container">
            <div class="row">
                <div class="box">
                    <hr>
                    <h2 class="intro-text text-center">Sign up form
                    </h2>
                    <hr>
                    <div class="col-xs-offset-3 col-xs-6">
                        <%  if ("Success".equals(request.getAttribute("errorMessageWrongInput"))) { %>
                        <div class="alert alert-danger alert-dismissable">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Warning!</strong> You must enter a valid username and password.
                        </div>
                        <% }%>
                        <form class="form-horizontal" name ="Signup" action="Login" method="POST">
                            <input type="hidden" name="formName" value="Signup" />
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
                            <div class="form-group">
                                <label class="col-md-2" for="Name">Name</label>
                                <div class="col-md-10">
                                    <input class="form-control" type="text" id="Name" name="name" placeholder="Name" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2" for="Email">E-mail</label>
                                <div class="col-md-10">
                                    <input class="form-control" type="text" id="Email" name="email" placeholder="E-mail" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2" for="Phone">Phone</label>
                                <div class="col-md-10">
                                    <input class="form-control" type="text" id="Phone" name="phone" placeholder="Phone number" />
                                </div>
                            </div>
                    </div>
                    <div class="row">
                        <section class="col-xs-offset-5 col-xs-2">
                            <input class="form-control btn btn-success" type="submit" value="Submit" name="" />
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
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#Username').on('keypress', function (e) {
                if (e.which == 32)
                    return false;
            });
            $('#Password').on('keypress', function (e) {
                if (e.which == 32)
                    return false;
            });
        });
    </script>
</body>

</html>

