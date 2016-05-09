<%--
  Created by IntelliJ IDEA.
  User: ZEXUN
  Date: 4/5/16
  Time: 12:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>--%>

<!DOCTYPE html>
<html>

<head>
    <jsp:include page="head.jsp"/>

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
        <!--Body content-->
        <div class="pad-top"></div>
        <div class="row">

            <!-- Main home page content-->

            <!-- Slider -->
            <div class="col s8">
                <div class="slider z-depth-1">
                    <ul class="slides">
                        <c:forEach var="newestComic" items="${newest_comics}">
                            <li>
                                <form action="/comic" method="GET">
                                    <input type="hidden" name="series_title" value="${newestComic.seriesTitle}">
                                    <input type="hidden" name="issue_title" value="${newestComic.issueTitle}">
                                    <input type="hidden" name="volume" value="${newestComic.volume}">
                                    <input type="hidden" name="issue" value="${newestComic.issue}">

                                    <img src="${newestComic.randomPage}" onclick="$(this).parent().submit();">
                                    <!-- random image -->
                                    <div class="caption left-align">
                                        <h2>${newestComic.seriesTitle}</h2>
                                        <h4 class="light grey-text text-lighten-3">${newestComic.issueTitle}</h4>
                                    </div>
                                </form>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>


            <!-- Slide bar-->
            <!-- Ranking -->
            <div class="col s4">
                <div class="card cyan lighten-2">
                    <div class="card-content white-text">
                        <span class="card-title">Popular Comics</span>

                        <!-- Padding -->
                        <div class="pad-top"></div>
                        <div class="divider"></div>
                        <div class="pad-top-10"></div>

                        <c:forEach var="popularComic" items="${popular_comics}">
                            <div class="pad-top"></div>
                            <p><a href="/comic?series_title=${popularComic.seriesTitle}&issue_title=${popularComic.issueTitle}&volume=${popularComic.volume}&issue=${popularComic.issue}" class="white-text hoverable" hoverable>${popularComic.seriesTitle} ${popularComic.issueTitle}</a></p>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>


        <!--Recommend comics-->

        <!-- First Row Set-->
        <div>
            <!-- Fourth set-->
            <c:forEach var="genre" items="${genres}">
                <div>

                    <c:if test="${genre == 'Action'}"><c:set var="comics" value="${Action}"/></c:if>
                    <c:if test="${genre == 'Comedy'}"><c:set var="comics" value="${Comedy}"/></c:if>
                    <c:if test="${genre == 'Drama'}"><c:set var="comics" value="${Drama}"/></c:if>
                    <c:if test="${genre == 'Fantasy'}"><c:set var="comics" value="${Fantasy}"/></c:if>
                    <c:if test="${genre == 'Horror'}"><c:set var="comics" value="${Horror}"/></c:if>
                    <c:if test="${genre == 'Romance'}"><c:set var="comics" value="${Romance}"/></c:if>
                    <c:if test="${genre == 'Sports'}"><c:set var="comics" value="${Sports}"/></c:if>

                    <c:if test="${not empty comics}">
                        <div class="card cyan lighten-2 ">
                            <div class="card-content white-text ">
                                <span class="card-title ">${genre}</span>
                            </div>
                        </div>

                    <div class="row">
                        </c:if>
                        <c:forEach var="comic" items="${comics}">
                            <div class="col s4">
                                <form action="/comic" method="GET">
                                    <input type="hidden" name="series_title" value="${comic.seriesTitle}">
                                    <input type="hidden" name="issue_title" value="${comic.issueTitle}">
                                    <input type="hidden" name="volume" value="${comic.volume}">
                                    <input type="hidden" name="issue" value="${comic.issue}">
                                    <div class="card hoverable" onclick="$(this).parent().submit();">
                                        <div class="card-image">
                                            <img src="${comic.coverPage}"  style="max-height: 270px; min-height:270px">
                                        </div>
                                        <div class="card-content">
                                            <p class="flow-text">${comic.seriesTitle}</p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                    <c:if test="${not empty comics}">
                </div>
                <div class="divider-grey-3"></div>
                </c:if>
            </c:forEach>
        </div>



    </main>


    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>