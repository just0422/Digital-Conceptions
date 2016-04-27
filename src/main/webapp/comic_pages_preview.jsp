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
    <script type="text/javascript" src="js/jquery-ui.js"></script>
    <%--<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>--%>

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
            <div class="pad-top-10"></div>
            <a id="my_comic_button" class="waves-effect waves-light btn cyan lighten-2 left" href="/upload"><i
                    class="material-icons right">dashboard</i>My Comic</a>
            <div class="row" style="padding-top:5vh;">
                <div class="col s12 center flow-text">
                    Pages Preview
                    <div class="pad-top-10"></div>
                    <div class="divider"></div>
                    <div class="pad-top-10"></div>
                </div>
                <c:set var="column" value="${0}"/>

                <ul id="sortable">
                <c:forEach var="imgLink" items="${current_comic.urls}" varStatus="loop">
                    <li class="card hoverable cyan lighten-3 col s4 pad-top-10 page-image" >
                        <div class="card-image">
                            <img id="img${column}" src="${imgLink}" onclick="select(this)">
                        </div>
                    </li>
                    <c:set var="column" value="${column + 1}"/>
                </c:forEach>
                </ul>

                <script>
                    function select(element) {
                        $(element).toggleClass("selected-page");
                    }

                    function trash(){
                        var elements = document.getElementsByClassName("page-image");
                        for (i = 0; i < elements.length; i++){
                            if ($($(elements[i]).find('img')[0]).hasClass("selected-page")){
                                $(elements[i]).remove();
                            }
                        }
                    }

                    $(document).ready(function(){
                        $("#sortable").sortable();
                    })

                    $(document).keydown(function(e) {
                        if (e.which == 8)
                            e.preventDefault();

                        if (e.which == 8 || e.which == 48)
                            trash();

                        console.log(e.which);
                    });
                </script>
            </div>
        </div>

        <!-- Divider -->
    </main>


    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>