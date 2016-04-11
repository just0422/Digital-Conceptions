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

    <title>Genre - Digital Conceptions</title>
</head>

<body class="background">

<!-- Outer most container -->
<div class="container">

    <jsp:include page="header.jsp"/>

    <!-- Main home page content-->
    <main class="main body body-background-color">

        <div class="container-1">
            <div class="row">

                <div class="col s12">
                    <nav>
                        <div class="nav-wrapper cyan lighten-3 ">
                            <ul id="nav-mobile" class="center genre-pad-left">

                                <li><a>Action</a></li>
                                <li><a>Drama</a></li>
                                <li><a>Romance</a></li>
                                <li><a>Comedy</a></li>
                                <li><a>Thriller</a></li>
                                <li><a>Slice of Life</a></li>
                                <li><a>Sport</a></li>
                                <li><a>Sci-Fi</a></li>

                            </ul>

                        </div>
                    </nav>

                </div>
            </div>

            <div id="genre_content">
                <div class="row">
                    <div class="col s3">

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

                        <div class="card hoverable cyan lighten-3" onclick="">
                            <div class="card-image">
                                <img src="image/5.jpg">
                            </div>
                            <div class="card-content white-text">
                                <p class="flow-text">Hero</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
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
                        <div class="card hoverable cyan lighten-3" onclick="">
                            <div class="card-image">
                                <img src="image/5.jpg">
                            </div>
                            <div class="card-content white-text">
                                <p class="flow-text">Hero</p>
                            </div>
                        </div>
                    </div>
                    <div class="col s3">
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
                        <div class="card hoverable cyan lighten-3" onclick="">
                            <div class="card-image">
                                <img src="image/5.jpg">
                            </div>
                            <div class="card-content white-text">
                                <p class="flow-text">Hero</p>
                            </div>
                        </div>


                    </div>
                    <div class="col s3">
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


                <!-- Pagination -->

                <ul class="pagination center">
                    <li id="previous" class="disabled ">
                        <a href="#!"><i class="material-icons">chevron_left</i></a>
                    </li>
                    <div id="pages" style="display:inline;">
                        <li class="active"><a href="#!">1</a></li>
                        <li class="waves-effect "><a href="#!">2</a></li>
                    </div>
                    <li id="next" class="waves-effect ">
                        <a href="#!"><i class="material-icons">chevron_right</i></a>
                    </li>
                </ul>
                <div class="pad-top-10"></div>

            </div>

        </div>
    </main>


    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>