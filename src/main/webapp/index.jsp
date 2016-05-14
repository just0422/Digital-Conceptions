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

    <script type="text/javascript" src="/_ah/channel/jsapi"></script>
    <script type="text/javascript" src="js/ChatBox_JS.js"></script>
    <link rel="stylesheet" href="css/chat_box.css">
</head>

<body class="background">

<!-- Outer most container -->
<div class="container">

    <jsp:include page="header.jsp"/>

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
                        <%--<c:forEach var="newestComic" items="${requestScope.newestComics}" begin="0" end="3">--%>
                            <%--<li>--%>
                                <%--<form action="/comicservlet" method="GET">--%>
                                    <%--<input type="hidden" name="series_title" value="${newestComic.seriesTitle}">--%>
                                    <%--<input type="hidden" name="comic_title" value="${newestComic.comicTitle}">--%>
                                    <%--<input type="hidden" name="volume" value="${newestComic.volume}">--%>
                                    <%--<input type="hidden" name="issue" value="${newestComic.issue}">--%>
                                    <%----%>
                                    <%--<img src="/image/3.jpg" onclick="$(this).parent().submit();">--%>
                                    <%--<!-- random image -->--%>
                                    <%--<div class="caption left-align">--%>
                                        <%--<h3>${newestComic.seriesTitle}</h3>--%>
                                        <%--<h5 class="light grey-text text-lighten-3">${newestComic.comicTitle}</h5>--%>
                                    <%--</div>--%>
                                <%--</form>--%>
                            <%--</li>--%>
                        <%--</c:forEach>--%>

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

                        <%--<c:forEach var="popularComic" items="${requestScope.popularComics}"--%>
                        <%--begin="0" end="${requestScope.popularComics.size()}">--%>
                            <%--<div class="pad-top"></div>--%>
                            <%--<p><a href="#" class="white-text hoverable" hoverable>${popularComics.SeriesTitle}</a></p>--%>
                        <%--</c:forEach>--%>

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

                    </div>
                </div>
            </div>
        </div>


        <!--Recommend comics-->

        <!-- First Row Set-->
        <div>
            <!-- Fourth set-->
            <div>
                <div class="card cyan lighten-2 ">
                    <div class="card-content white-text ">
                        <span class="card-title ">Action</span>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="actionComic" items="${action_comics}" begin="0" end="2">
                        <div class="col s4">
                            <form action="/comic" method="GET">
                                <input type="hidden" name="series_title" value="${actionComic.seriesTitle}">
                                <input type="hidden" name="issue_title" value="${actionComic.issueTitle}">
                                <input type="hidden" name="volume" value="${actionComic.volume}">
                                <input type="hidden" name="issue" value="${actionComic.issue}">
                                <div class="card hoverable" onclick="$(this).parent().submit();">
                                    <div class="card-image">
                                        <img src="${actionComic.coverPage}"  style="max-height: 270px; min-height:270px">
                                    </div>
                                    <div class="card-content">
                                        <p class="flow-text">${actionComic.seriesTitle}</p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:forEach>

                    <%--<!-- 1st comic -->--%>
                    <%--<div class="col s4">--%>
                        <%--<div class="card hoverable" onclick="">--%>
                            <%--<div class="card-image">--%>
                                <%--<img src="image/5.jpg">--%>
                            <%--</div>--%>
                            <%--<div class="card-content">--%>
                                <%--<p class="flow-text">Hero</p>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <%--<!-- 2nd comic -->--%>
                    <%--<div class="col s4">--%>
                        <%--<div class="card hoverable" onclick="">--%>
                            <%--<div class="card-image">--%>
                                <%--<img src="image/5.jpg">--%>
                            <%--</div>--%>
                            <%--<div class="card-content">--%>
                                <%--<p class="flow-text">Hero</p>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <%--<!-- 3rd comic -->--%>
                    <%--<div class="col s4">--%>
                        <%--<div class="card hoverable" onclick="">--%>
                            <%--<div class="card-image">--%>
                                <%--<img src="image/5.jpg">--%>
                            <%--</div>--%>
                            <%--<div class="card-content">--%>
                                <%--<p class="flow-text">Hero</p>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                </div>
            </div>

            <div class="divider-grey-3"></div>


            <!-- Genre Name -->
            <div class="card cyan lighten-2 ">
                <div class="card-content white-text ">
                    <span class="card-title ">Fantasy</span>
                </div>
            </div>



            <!-- First Row -->
            <div class="row">
                <%--<c:forEach var="fantasyComic" items="${requestScope.fantasyComics}" begin="0" end="2">--%>
                    <%--<div class="col s4">--%>
                        <%--<form action="/comicservlet" method="GET">--%>
                            <%--<input type="hidden" name="series_title" value="${fantasyComic.seriesTitle}">--%>
                            <%--<input type="hidden" name="comic_title" value="${fantasyComic.comicTitle}">--%>
                            <%--<input type="hidden" name="volume" value="${fantasyComic.volume}">--%>
                            <%--<input type="hidden" name="issue" value="${fantasyComic.issue}">--%>
                            <%--<div class="card hoverable" onclick="$(this).parent().submit();">--%>
                                <%--<div class="card-image">--%>
                                    <%--<img src="image/5.jpg">--%>
                                <%--</div>--%>
                                <%--<div class="card-content">--%>
                                    <%--<p class="flow-text">${fantasyComic.seriesTitle}</p>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</form>--%>
                    <%--</div>--%>
                <%--</c:forEach>--%>

                <!-- 1st comic -->
                <div class="col s4">
                    <form id="fantasy1" action="/comic" method="GET">
                        <input type="hidden" name="series_title" value="${requestScope.test_comic.seriesTitle}">
                        <input type="hidden" name="comic_title" value="${requestScope.test_comic.issueTitle}">
                        <input type="hidden" name="volume" value="${requestScope.test_comic.volume}">
                        <input type="hidden" name="issue" value="${requestScope.test_comic.issue}">

                        <div class="card hoverable" onclick="$(this).parent().submit();">
                            <div class="card-image">
                                <img src="image/5.jpg">
                            </div>
                            <div class="card-content">
                                <p class="flow-text">Hero</p>
                            </div>

                        </div>

                    </form>
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
                <%--<c:forEach var="romanceComic" items="${requestScope.romanceComics}" begin="0" end="2">--%>
                    <%--<div class="col s4">--%>
                        <%--<form action="/comicservlet" method="GET">--%>
                            <%--<input type="hidden" name="series_title" value="${romanceComic.seriesTitle}">--%>
                            <%--<input type="hidden" name="comic_title" value="${romanceComic.comicTitle}">--%>
                            <%--<input type="hidden" name="volume" value="${romanceComic.volume}">--%>
                            <%--<input type="hidden" name="issue" value="${romanceComic.issue}">--%>
                            <%--<div class="card hoverable" onclick="$(this).parent().submit();">--%>
                                <%--<div class="card-image">--%>
                                    <%--<img src="image/5.jpg">--%>
                                <%--</div>--%>
                                <%--<div class="card-content">--%>
                                    <%--<p class="flow-text">${romanceComic.seriesTitle}</p>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</form>--%>
                    <%--</div>--%>
                <%--</c:forEach>--%>

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
                <%--<c:forEach var="horrorComic" items="${requestScope.horrorComics}" begin="0" end="2">--%>
                    <%--<div class="col s4">--%>
                        <%--<form action="/comicservlet" method="GET">--%>
                            <%--<input type="hidden" name="series_title" value="${horrorComic.seriesTitle}">--%>
                            <%--<input type="hidden" name="comic_title" value="${horrorComic.comicTitle}">--%>
                            <%--<input type="hidden" name="volume" value="${horrorComic.volume}">--%>
                            <%--<input type="hidden" name="issue" value="${horrorComic.issue}">--%>
                            <%--<div class="card hoverable" onclick="$(this).parent().submit();">--%>
                                <%--<div class="card-image">--%>
                                    <%--<img src="image/5.jpg">--%>
                                <%--</div>--%>
                                <%--<div class="card-content">--%>
                                    <%--<p class="flow-text">${horrorComic.seriesTitle}</p>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</form>--%>
                    <%--</div>--%>
                <%--</c:forEach>--%>

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

        <!-- Start of chat box -->

        <!-- End of chat box -->

    </main>


    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>