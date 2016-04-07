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

    <title>Home - Digital Conceptions</title>
</head>

<body class="background">

<!-- Outer most container -->
<div class="container">

    <c:choose>
        <c:when test="${user != null}">
            <jsp:include page="index_active_header_logged.jsp"/>
        </c:when>
        <c:otherwise>
            <jsp:include page="index_active_header.jsp"/>
        </c:otherwise>
    </c:choose>

    <!-- Home Page -->
    <!-- Main body-->
    <main class="main body body-background-color">
        <!--Body content-->
        <div class="pad-top"></div>
        <div class="row">

            <!-- Main home page content-->

            <!-- Slider -->
            <div class="col s9">
                <div class="slider z-depth-1">
                    <ul class="slides">
                        <!-- 1st Slide -->
                        <li>
                            <img src="/image/3.jpg">
                            <!-- random image -->
                            <div class="caption left-align">
                                <h3>Bleach</h3>
                                <h5 class="light grey-text text-lighten-3">Chapter 367: God Of Thunder</h5>
                            </div>
                        </li>
                        <!-- 2nd Slide -->
                        <li>
                            <img src="/image/2.jpg">
                            <!-- random image -->
                            <div class="caption left-align">
                                <h3>One Piece</h3>
                                <h5 class="light grey-text text-lighten-3">Chapter 821: Understood</h5>
                            </div>
                        </li>
                        <!-- 3rd Slide-->
                        <li>
                            <img src="/image/1.jpg">
                            <!-- random image -->
                            <div class="caption left-align">
                                <h3>Fairy Tail</h3>
                                <h5 class="light grey-text text-lighten-3">Chapter 3: Infiltrate the Everlue
                                    Mansion</h5>
                            </div>
                        </li>
                        <!-- 4th slide -->
                        <li>
                            <img src="/image/4.jpg">
                            <!-- random image -->
                            <div class="caption left-align">
                                <h3>Naruto</h3>
                                <h5 class="light grey-text text-lighten-3">Last Chapter</h5>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>


            <!-- Slide bar-->
            <!-- Ranking -->
            <div class="col s3">
                <div class="card cyan lighten-2">
                    <div class="card-content white-text">
                        <span class="card-title">Ranking</span>
                        <br><span class="card-content">by hits</span>

                        <!-- Padding -->
                        <div class="pad-top"></div>
                        <div class="divider"></div>
                        <div class="pad-top-10"></div>

                        <!-- 1 -->
                        <div class="pad-top"></div>
                        <p><a href="#" class="white-text hoverable" hoverable>One Punch Man</a></p>

                        <!-- 2 -->
                        <div class="pad-top"></div>
                        <p><a href="#" class="white-text hoverable" hoverable>Attack on Titan</a></p>

                        <!-- 3 -->
                        <div class="pad-top"></div>
                        <p><a href="#" class="white-text hoverable" hoverable>Parasyte</a></p>

                        <!-- 4 -->
                        <div class="pad-top"></div>
                        <p><a href="#" class="white-text hoverable" hoverable>Tokyo Ghoul:re</a></p>

                        <!-- 5 -->
                        <div class="pad-top"></div>
                        <p><a href="#" class="white-text hoverable" hoverable>Fairy Tail</a></p>

                        <!-- 6 -->
                        <div class="pad-top"></div>
                        <p><a href="#" class="white-text hoverable" hoverable>Parasyte</a></p>

                        <!-- 7 -->
                        <div class="pad-top"></div>
                        <p><a href="#" class="white-text hoverable" hoverable>Strobe Edge</a></p>

                        <!-- 8 -->
                        <div class="pad-top"></div>
                        <p><a href="#" class="white-text hoverable" hoverable>Hozuki no Reitetsu</a></p>

                        <!-- 9 -->
                        <div class="pad-top"></div>
                        <p><a href="#" class="white-text hoverable" hoverable>Magi</a></p>

                        <!-- 10 -->
                        <div class="pad-top"></div>
                        <p><a href="#" class="white-text hoverable" hoverable>One Piece</a></p>

                        <c:if test="${empty formData.CountryOfRes}">
                            <option selected="selected" value="">Select one</option>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>


        <!--Recommend comics-->

        <!-- First Row Set-->
        <div>

            <!-- Genre Name -->
            <div class="card cyan lighten-2 ">
                <div class="card-content white-text ">
                    <span class="card-title ">Fantasy</span>
                </div>
            </div>

            <!-- First Row -->
            <div class="row">

                <!-- 1st comic -->
                <div class="col s4">
                    <div class="card hoverable" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                        <div class="card-content">
                            <p class="flow-text">Hero</p>
                        </div>
                    </div>
                </div>

                <!-- 2nd comic -->
                <div class="col s4">
                    <div class="card hoverable" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                        <div class="card-content">
                            <p class="flow-text">Hero</p>
                        </div>
                    </div>
                </div>

                <!-- 3rd comic -->
                <div class="col s4">
                    <div class="card hoverable" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                        <div class="card-content">
                            <p class="flow-text">Hero</p>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <!-- Divider -->
        <div class="divider-grey-3"></div>


        <!-- Second row set-->
        <div>
            <div class="card cyan lighten-2 ">
                <div class="card-content white-text ">
                    <span class="card-title ">Romance</span>
                </div>
            </div>
            <!-- First Row -->
            <div class="row">

                <!-- 1st comic -->
                <div class="col s4">
                    <div class="card hoverable" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                        <div class="card-content">
                            <p class="flow-text">Hero</p>
                        </div>
                    </div>
                </div>

                <!-- 2nd comic -->
                <div class="col s4">
                    <div class="card hoverable" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                        <div class="card-content">
                            <p class="flow-text">Hero</p>
                        </div>
                    </div>
                </div>

                <!-- 3rd comic -->
                <div class="col s4">
                    <div class="card hoverable" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                        <div class="card-content">
                            <p class="flow-text">Hero</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- Divider -->
        <div class="divider-grey-3"></div>

        <!-- Third set-->
        <div>
            <div class="card cyan lighten-2 ">
                <div class="card-content white-text ">
                    <span class="card-title ">Horror</span>
                </div>
            </div>
            <!-- First Row -->
            <div class="row">

                <!-- 1st comic -->
                <div class="col s4">
                    <div class="card hoverable" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                        <div class="card-content">
                            <p class="flow-text">Hero</p>
                        </div>
                    </div>
                </div>

                <!-- 2nd comic -->
                <div class="col s4">
                    <div class="card hoverable" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                        <div class="card-content">
                            <p class="flow-text">Hero</p>
                        </div>
                    </div>
                </div>

                <!-- 3rd comic -->
                <div class="col s4">
                    <div class="card hoverable" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                        <div class="card-content">
                            <p class="flow-text">Hero</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <!-- Divider -->
        <div class="divider-grey-3"></div>


        <!-- Fourth set-->
        <div>
            <div class="card cyan lighten-2 ">
                <div class="card-content white-text ">
                    <span class="card-title ">Action</span>
                </div>
            </div>
            <div class="row">

                <!-- 1st comic -->
                <div class="col s4">
                    <div class="card hoverable" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                        <div class="card-content">
                            <p class="flow-text">Hero</p>
                        </div>
                    </div>
                </div>

                <!-- 2nd comic -->
                <div class="col s4">
                    <div class="card hoverable" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                        <div class="card-content">
                            <p class="flow-text">Hero</p>
                        </div>
                    </div>
                </div>

                <!-- 3rd comic -->
                <div class="col s4">
                    <div class="card hoverable" onclick="">
                        <div class="card-image">
                            <img src="image/5.jpg">
                        </div>
                        <div class="card-content">
                            <p class="flow-text">Hero</p>
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