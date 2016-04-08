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

    <title>Comic Cover - Digital Conceptions</title>
</head>

<body class="background">

<!-- Outer most container -->
<div class="container">

    <jsp:include page="header.jsp"/>

    <!-- Main home page content-->
    <main class="main body body-background-color">

        <!-- Comic cover and control buttons-->

        <div class="card-1 cyan lighten-5">
            <div class="card-content-1">

                <div class="row">

                    <div class="col s4">
                        <div class="card cyan lighten-3" onclick="">
                            <div class="card-image">
                                <img src="image/5.jpg">
                            </div>
                        </div>
                    </div>

                    <div class="col s5">

                        <!-- Comic Name-->
                        <div class="pad-top-10"></div>
                        <div class="pad-top-10"></div>
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Comic Name:<span class="right">Hello World</span>
                            <div class="divider"></div>
                        </div>

                        <!-- Author Name-->
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Author:<span class="right">ABC</span>
                            <div class="divider"></div>
                        </div>

                        <!-- Release Date-->
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Release Date:<span class="right">03/03/2016</span>
                            <div class="divider"></div>
                        </div>

                        <!-- Latest Chapter-->
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Latest Chapter:<span class="right">Bye</span>
                            <div class="divider"></div>
                        </div>

                    </div>

                    <div class="col s3">
                        <div class="container-1 flow-text center cyan-text">
                            <div class="pad-top-10"></div>
                            <div class="pad-top-10"></div>
                            <div class="pad-top-10"></div>
                            <div class="pad-top-10"></div>
                            Rating
                        </div>
                    </div>

                </div>
            </div>



        </div>
    </main>


    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>