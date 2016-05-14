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

    <title>Search - Digital Conceptions</title>
</head>

<body class="background">

<!-- Outer most container -->
<div class="container">

    <jsp:include page="header.jsp"/>

    <!-- Search Page -->
    <!-- Main boy content -->
    <main class="main body body-background-color">

        <!--Search results-->
        <div class="card white lighten-2 min-height">
            <div class="card-content cyan-text">

                <!-- Result counts and notice to user -->
                <div>
                    <span class="card-title">${param['series_title']}</span>
                        <div class="row">
                            <c:forEach var="comic" items="${series}">
                                <div class="col s4">
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
                                                <p class="flow-text">${comic.issueTitle} #${comic.issue}</p>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </c:forEach>
                        </div>
                </div>

            </div>
        </div>
    </main>


    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>