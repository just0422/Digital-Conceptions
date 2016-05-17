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
    <title>User Profile - Digital Conceptions</title>
</head>

<body class="background">

<!-- Outer most container -->
<div class="container">

    <jsp:include page="header.jsp"/>

    <!-- Main boy content -->
    <main class="main body body-background-color">
        <!-- Body  -->
        <div class="row">

            <!-- Account info and Subscription -->
            <div class="col s8">
                <div class="pad-top-10"></div>
                <div class="card-1 min-height">

                    <div class="card-content-1 white-text">

                        <div class="center">

                            <!-- Account button -->
                            <a id="account_info_button" class="waves-effect waves-light btn cyan lighten-2">
                                <i class="material-icons right">account_circle</i>Account</a>

                            <!-- Subscription button-->
                            <a id="subscription_button" class="waves-effect waves-light btn cyan lighten-2">
                                <i class="material-icons right">library_books</i>Subscriptions</a>

                            <!-- Notification button-->
                            <a id="notification_button" class="waves-effect waves-light btn cyan lighten-2"><i
                                    class="material-icons right">notifications</i>Notifications</a>
                            <span id="numOfNoti" class="badge1 cyan lighten-3 "></span>

                            <script>

                                if (${current_user.unreadNotificationSize} > 0)
                                    $("#numOfNoti").attr("data-badge", ${current_user.unreadNotificationSize});

                            </script>
                            <div class="pad-top-10"></div>
                        </div>

                    </div>
                    <!-- Divider -->
                    <div class="divider-grey-3"></div>

                    <div id="account_info">
                        <div class="pad-top-20"></div>
                        <div class="container">
                            <div class="flow-text pad-left">
                                User Name: <span id="user_name">${current_user.username}</span>
                                <div class="pad-top-2"></div>
                                <div class="divider"></div>

                                <div class="pad-top-20"></div>
                                Email Address: <span id="email_address">${user.email}</span>
                                <div class="pad-top-2"></div>
                                <div class="divider"></div>

                                <div class="pad-top-20"></div>
                                Date Joined: <span id="date_jointed">${current_user.dateFormat}</span>
                                <div class="pad-top-2"></div>
                                <div class="divider"></div>
                            </div>
                        </div>

                    </div>
                    <div id="subscription" class="flow-text" style="display: none">
                        <div class="pad-top-10"></div>
                        <div class="pad-top-10"></div>
                        <div class="pad-top-10"></div>

                        <div class="container-1">
                            <div class="row">
                                <c:forEach var="comic" items="${series_comics}">
                                    <div class="col s4">
                                        <form action="/comic" method="GET">
                                            <input type="hidden" name="series_title" value="${comic.seriesTitle}">
                                                <%--<input type="hidden" name="issue_title" value="${comic.issueTitle}">--%>
                                                <%--<input type="hidden" name="volume" value="${comic.volume}">--%>
                                                <%--<input type="hidden" name="issue" value="${comic.issue}">--%>
                                            <div class="card hoverable cyan lighten-3"
                                                 onclick="$(this).parent().submit();">
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
                                <%--<div class="col s6">--%>
                                <%--<div class="card hoverable cyan lighten-3" onclick="">--%>
                                <%--<div class="card-image">--%>
                                <%--<img src="image/5.jpg">--%>
                                <%--</div>--%>
                                <%--<div class="card-content white-text">--%>
                                <%--<p class="flow-text">Hero</p>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <%--&lt;%&ndash;<div class="pad-top-10"></div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<div class="pad-top-10"></div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<div class="pad-top-10"></div>&ndash;%&gt;--%>
                                <%--<div class="col s6">--%>
                                <%--<div class="card hoverable cyan lighten-3" onclick="">--%>
                                <%--<div class="card-image">--%>
                                <%--<img src="image/5.jpg">--%>
                                <%--</div>--%>
                                <%--<div class="card-content white-text">--%>
                                <%--<p class="flow-text">Hero</p>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <%--<div class="col s6">--%>
                                <%--<div class="card hoverable cyan lighten-3" onclick="">--%>
                                <%--<div class="card-image">--%>
                                <%--<img src="image/5.jpg">--%>
                                <%--</div>--%>
                                <%--<div class="card-content white-text">--%>
                                <%--<p class="flow-text">Hero</p>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <%--&lt;%&ndash;<div class="pad-top-10"></div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<div class="pad-top-10"></div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<div class="pad-top-10"></div>&ndash;%&gt;--%>
                                <%--<div class="col s6">--%>
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

                            <!-- Pagination -->
                            <ul class="pagination center">
                                <li id="previous" class="disabled">
                                    <a href="#!"><i class="material-icons">chevron_left</i></a>
                                </li>
                                <div id="pages" style="display:inline;">
                                    <li class="active"><a href="#!">1</a></li>
                                    <li class="waves-effect"><a href="#!">2</a></li>
                                </div>
                                <li id="next" class="waves-effect">
                                    <a href="#!"><i class="material-icons">chevron_right</i></a>
                                </li>
                            </ul>
                            <div class="pad-top-10"></div>
                        </div>
                    </div>


                    <div id="notification" style="display: none">  
                        <div class="container-1">
                            <ul class="collapsible" data-collapsible="accordion">
                                <c:forEach items="${current_user.unreadNotifications}" var="entry">
                                    <li>
                                        <div class="collapsible-header">${entry}</div>
                                            <%--<div class="collapsible-body"><i class="material-icons right pointer" onclick="rem()">close</i> <p>Message Body</p></div>--%>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                         
                    </div>
                </div>
            </div>

            <!-- Side bar -->
            <!-- Recently Viewed -->
            <div class="col s4">
                <div class="card-1 min-height">
                    <div class="card-content-1 ">
                        <div class="flow-text medium cyan-text center">
                            <h5>Recently Viewed</h5>

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