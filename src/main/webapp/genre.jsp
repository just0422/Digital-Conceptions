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
    <jsp:include page="head.jsp"/>

    <script type="text/javascript" src="js/pagination.js"></script>

    <title>Genre - Digital Conceptions</title>
</head>

<body class="background">

<!-- Outer most container -->
<div class="container">

    <jsp:include page="header.jsp"/>

    <!-- Main home page content-->
    <main class="main body body-background-color">

        <div class="container-1">
            <div class="pad-top-10"></div>
            <div class="row">
                <div class="col s12">
                    <nav>
                        <div class="nav-wrapper cyan lighten-3 center">
                            <ul id="genres" class="center">
                                <li id="action" class="z-depth-1"><a>Action</a></li>
                                <li id="drama"><a>Drama</a></li>
                                <li id="romance"><a>Romance</a></li>
                                <li id="comedy"><a>Comedy</a></li>
                                <li id="horror"><a>Horror</a></li>
                                <li id="fantasy"><a>Fantasy</a></li>
                                <li id="sport"><a>Sport</a></li>
                            </ul>
                        </div>
                    </nav>

                </div>
            </div>

            <div id="genre_content">
                <div class="row">
                    <%-- How to show next page of comics? --%>
                    <div id="action_comics">
                        <c:forEach var="comic" items="${requestScope.action_comics}">
                            <div class="col s3">
                                <form action="/comic" method="GET">
                                    <input type="hidden" name="series_title" value="${comic.seriesTitle}">
                                    <input type="hidden" name="issue_title" value="${comic.issueTitle}">
                                    <input type="hidden" name="volume" value="${comic.volume}">
                                    <input type="hidden" name="issue" value="${comic.issue}">
                                    <div class="card hoverable cyan lighten-3" onclick="$(this).parent().submit();">
                                        <div class="card-image">
                                            <img src="${comic.coverPage}">
                                        </div>
                                        <div class="card-content white-text">
                                            <p class="flow-text">${comic.seriesTitle}</p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>
                    </div>

                    <div id="drama_comics" style="display:none;">
                        <c:forEach var="comic" items="${requestScope.drama_comics}">
                            <div class="col s3">
                                <form action="/comic" method="GET">
                                    <input type="hidden" name="series_title" value="${comic.seriesTitle}">
                                    <input type="hidden" name="issue_title" value="${comic.issueTitle}">
                                    <input type="hidden" name="volume" value="${comic.volume}">
                                    <input type="hidden" name="issue" value="${comic.issue}">
                                    <div class="card hoverable cyan lighten-3" onclick="$(this).parent().submit();">
                                        <div class="card-image">
                                            <img src="${comic.coverPage}">
                                        </div>
                                        <div class="card-content white-text">
                                            <p class="flow-text">${comic.seriesTitle}</p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>
                    </div>

                    <div id="romance_comics" style="display:none;">
                        <c:forEach var="comic" items="${requestScope.romance_comics}">
                            <div class="col s3">
                                <form action="/comic" method="GET">
                                    <input type="hidden" name="series_title" value="${comic.seriesTitle}">
                                    <input type="hidden" name="issue_title" value="${comic.issueTitle}">
                                    <input type="hidden" name="volume" value="${comic.volume}">
                                    <input type="hidden" name="issue" value="${comic.issue}">
                                    <div class="card hoverable cyan lighten-3" onclick="$(this).parent().submit();">
                                        <div class="card-image">
                                            <img src="${comic.coverPage}">
                                        </div>
                                        <div class="card-content white-text">
                                            <p class="flow-text">${comic.seriesTitle}</p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>
                    </div>

                    <div id="comedy_comics" style="display:none;">
                        <c:forEach var="comic" items="${requestScope.comedy_comics}">
                            <div class="col s3">
                                <form action="/comic" method="GET">
                                    <input type="hidden" name="series_title" value="${comic.seriesTitle}">
                                    <input type="hidden" name="issue_title" value="${comic.issueTitle}">
                                    <input type="hidden" name="volume" value="${comic.volume}">
                                    <input type="hidden" name="issue" value="${comic.issue}">
                                    <div class="card hoverable cyan lighten-3" onclick="$(this).parent().submit();">
                                        <div class="card-image">
                                            <img src="${comic.coverPage}">
                                        </div>
                                        <div class="card-content white-text">
                                            <p class="flow-text">${comic.seriesTitle}</p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>
                    </div>

                    <div id="horror_comics" style="display:none;">
                        <c:forEach var="comic" items="${requestScope.horror_comics}">
                            <div class="col s3">
                                <form action="/comic" method="GET">
                                    <input type="hidden" name="series_title" value="${comic.seriesTitle}">
                                    <input type="hidden" name="issue_title" value="${comic.issueTitle}">
                                    <input type="hidden" name="volume" value="${comic.volume}">
                                    <input type="hidden" name="issue" value="${comic.issue}">
                                    <div class="card hoverable cyan lighten-3" onclick="$(this).parent().submit();">
                                        <div class="card-image">
                                            <img src="${comic.coverPage}">
                                        </div>
                                        <div class="card-content white-text">
                                            <p class="flow-text">${comic.seriesTitle}</p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>
                    </div>

                    <div id="fantasy_comics" style="display:none;">
                        <c:forEach var="comic" items="${requestScope.fantasy_comics}">
                            <div class="col s3">
                                <form action="/comic" method="GET">
                                    <input type="hidden" name="series_title" value="${comic.seriesTitle}">
                                    <input type="hidden" name="issue_title" value="${comic.issueTitle}">
                                    <input type="hidden" name="volume" value="${comic.volume}">
                                    <input type="hidden" name="issue" value="${comic.issue}">
                                    <div class="card hoverable cyan lighten-3" onclick="$(this).parent().submit();">
                                        <div class="card-image">
                                            <img src="${comic.coverPage}">
                                        </div>
                                        <div class="card-content white-text">
                                            <p class="flow-text">${comic.seriesTitle}</p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>
                    </div>

                    <div id="sport_comics" style="display:none;">
                        <c:forEach var="comic" items="${requestScope.sport_comics}">
                            <div class="col s3">
                                <form action="/comic" method="GET">
                                    <input type="hidden" name="series_title" value="${comic.seriesTitle}">
                                    <input type="hidden" name="issue_title" value="${comic.issueTitle}">
                                    <input type="hidden" name="volume" value="${comic.volume}">
                                    <input type="hidden" name="issue" value="${comic.issue}">
                                    <div class="card hoverable cyan lighten-3" onclick="$(this).parent().submit();">
                                        <div class="card-image">
                                            <img src="${comic.coverPage}">
                                        </div>
                                        <div class="card-content white-text">
                                            <p class="flow-text">${comic.seriesTitle}</p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>
                    </div>

                    <%--<div class="col s3">--%>
                        <%--<div class="card hoverable cyan lighten-3" onclick="">--%>
                            <%--<div class="card-image">--%>
                                <%--<img src="image/5.jpg">--%>
                            <%--</div>--%>
                            <%--<div class="card-content white-text">--%>
                                <%--<p class="flow-text">Hero</p>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                </div>


                <div class="pad-top-10"></div>

            </div>

        </div>
    </main>


    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>