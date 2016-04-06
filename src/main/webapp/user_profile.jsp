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
                        <a id="accoutn_info_button" class="waves-effect waves-light btn cyan lighten-2"><i
                                class="material-icons right">account_circle</i>Account</a>

                        <!-- Subscription button-->
                        <a id="subscirption_button" class="waves-effect waves-light btn right cyan lighten-2"><i
                                class="material-icons right">library_books</i>Subscription</a>

                    </div>
                    <!-- Divider -->
                    <div class="divider-grey-3"></div>

                    <div id="account_info">

                        <div class="flow-text pad-left">
                            <h5>Display Name: </h5>

                        </div>

                    </div>
                    <div id="subscription" class="flow-text" style="display: none">

                        <div class="row">
                            <div class="col s6">
                                <div class="card hoverable cyan lighten-3" onclick="">
                                    <div class="card-image">
                                        <img src="image/5.jpg">
                                    </div>
                                    <div class="card-content white-text">
                                        <p class="flow-text">Hero</p>
                                    </div>
                                </div>

                                <div class="card hoverable cyan lighten-3" onclick="">
                                    <div class="card-image">
                                        <img src="image/5.jpg">
                                    </div>
                                    <div class="card-content white-text">
                                        <p class="flow-text">Hero</p>
                                    </div>
                                </div>


                            </div>

                            <div class="col s6">


                                <div class="card hoverable cyan lighten-3" onclick="">
                                    <div class="card-image">
                                        <img src="image/5.jpg">
                                    </div>
                                    <div class="card-content white-text">
                                        <p class="flow-text">Hero</p>
                                    </div>
                                </div>

                                <div class="card hoverable cyan lighten-3" onclick="">
                                    <div class="card-image">
                                        <img src="image/5.jpg">
                                    </div>
                                    <div class="card-content white-text">
                                        <p class="flow-text">Hero</p>
                                    </div>
                                </div>
                            </div>



                        </div>

                        <ul class="pagination center">
                            <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
                            <li class="active"><a href="#!">1</a></li>
                            <li class="waves-effect"><a href="#!">2</a></li>
                            <li class="waves-effect"><a href="#!">3</a></li>
                            <li class="waves-effect"><a href="#!">4</a></li>
                            <li class="waves-effect"><a href="#!">5</a></li>
                            <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
                        </ul>

                    </div>
                </div>
            </div>

            <!-- Side bar -->
            <!-- Notification or message -->
            <div class="col s4">
                <div class="card min-height">
                    <div class="card-content ">
                        <div class="flow-text">
                            <h5>Recently Reviewed</h5>

                        </div>

                        <!-- Divider -->
                        <div class="pad-top-10"></div>
                        <div class="divider-grey-3"></div>
                        <div class="pad-top-10"></div>
                        <div class="pad-top-10"></div>

                        <div class="card hoverable cyan lighten-3" onclick="">
                            <div class="card-image">
                                <img src="image/5.jpg">
                            </div>
                        </div>

                        <div class="pad-top-10"></div>

                        <div class="card hoverable cyan lighten-3" onclick="">
                            <div class="card-image">
                                <img src="image/5.jpg">
                            </div>
                        </div>

                        <div class="pad-top-10"></div>

                        <div class="card hoverable cyan lighten-3" onclick="">
                            <div class="card-image">
                                <img src="image/5.jpg">
                            </div>
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