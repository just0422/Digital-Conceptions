<%--
  Created by IntelliJ IDEA.
  User: ZEXUN
  Date: 4/5/16
  Time: 12:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.css" media="screen,projection"/>

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0 /">

    <!--Import Jquery-->
    <script type="text/javascript" src="js/jquery-2.2.2.js"></script>

    <!--Import materialize.js-->
    <script type="text/javascript" src="js/materialize.min.js"></script>

    <!--Impot custom css-->
    <link type="text/css" rel="stylesheet" href="css/custom.css">

    <!--Import custom js-->
    <script type="text/javascript" src="js/customJS.js"></script>

    <title>User Profile - Digital Conceptions</title>
</head>

<body class="background">

<!-- Outer most container -->
<div class="container">

    <jsp:include page="header_logged.jsp"/>

    <!-- Main boy content -->
    <main class="main body">
        <!-- Body  -->
        <div class="row">

            <!-- Account info and Subscription -->
            <div class="col s8">
                <div class="card min-height">

                    <div class="card-content white-text">

                        <!-- Account button -->
                        <a class="waves-effect waves-light btn cyan lighten-2"><i class="material-icons right">account_circle</i>Account</a>

                        <!-- Subscription button-->
                        <a class="waves-effect waves-light btn right cyan lighten-2"><i class="material-icons right">library_books</i>Subscription</a>

                    </div>
                    <!-- Divider -->
                    <div class="divider-grey-3"></div>

                </div>
            </div>

            <!-- Side bar -->
            <!-- Notification or message -->
            <div class="col s4">
                <div class="card min-height">
                    <div class="card-content">
                    </div>
                </div>

            </div>

        </div>
    </main>

    <jsp:include page="footer.jsp"/>

</div>
</body>

</html>