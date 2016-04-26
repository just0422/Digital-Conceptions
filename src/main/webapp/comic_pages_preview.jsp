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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Import Jquery-->
    <script type="text/javascript" src="js/jquery-2.2.2.js"></script>

    <!--Import materialize.js-->
    <script type="text/javascript" src="js/materialize.min.js"></script>

    <!--Impot custom css-->
    <link type="text/css" rel="stylesheet" href="css/custom.css">

    <!--Import custom js-->
    <script type="text/javascript" src="js/customJS.js"></script>

    <title>Home - Digital Conceptions</title>
    <link rel="icon" href="http://rocketdock.com/images/screenshots/CBR.png">
</head>

<body class="background">

<!-- Outer most container -->
<div class="container">

    <jsp:include page="header.jsp"/>

    <!-- Home Page -->
    <!-- Main body-->
    <main class="main body body-background-color">

        <div class="container-1 min-height">
            <div class="row" style="padding-top:5vh;">
                <div class="col s12 center flow-text">
                    Pages Preview
                    <div class="pad-top-10"></div>
                    <div class="divider"></div>
                    <div class="pad-top-10"></div>
                </div>



                <div class="col s3">

                    <div class="card hoverable cyan lighten-3" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                    </div>

                    <div class="card hoverable cyan lighten-3" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                    </div>

                    <div class="card hoverable cyan lighten-3" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                    </div>

                </div>


                <div class="col s3">

                    <div class="card hoverable cyan lighten-3" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                    </div>

                    <div class="card hoverable cyan lighten-3" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                    </div>

                    <div class="card hoverable cyan lighten-3" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                    </div>

                </div>


                <div class="col s3">

                    <div class="card hoverable cyan lighten-3" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                    </div>

                    <div class="card hoverable cyan lighten-3" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                    </div>

                    <div class="card hoverable cyan lighten-3" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                    </div>
                </div>


                <div class="col s3">

                    <div class="card hoverable cyan lighten-3" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                    </div>

                    <div class="card hoverable cyan lighten-3" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                    </div>

                    <div class="card hoverable cyan lighten-3" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                    </div>

                </div>



            </div>
        </div>

        <!-- Divider -->
    </main>


    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>