<%--
  Created by IntelliJ IDEA.
  User: ZEXUN
  Date: 4/5/16
  Time: 12:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                            <a id="account_info_button" class="waves-effect waves-light btn cyan lighten-2"><i
                                    class="material-icons right">account_circle</i>Account</a>

                            <!-- Subscription button-->
                            <a id="subscription_button" class="waves-effect waves-light btn cyan lighten-2"><i
                                    class="material-icons right">library_books</i>Subscriptions</a>

                            <!-- Notification button-->
                            <c:set var="val" value="${fn:length(current_user.unreadNotifications)}"/>
                            <a id="notification_button" class="waves-effect waves-light btn cyan lighten-2"><i
                                    class="material-icons right">notifications</i>Notifications</a>
                            <c:if test="${val > 0}">
                                <span id="numOfNoti" class="badge1 cyan lighten-3 " data-badge="${val}"></span>
                            </c:if>
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

                    <script>
                        function decrement_badge(){
                            var notif_number = $('#numOfNoti').attr('data-badge');
                            $('#numOfNoti').attr('data-badge', parseInt(notif_number) - 1);
                            console.log(notif_number);
                        }
                        function read_notification(element){
//                            console.log("read" + $(element).find("p").text());
                            $.ajax({
                                url: "/userprofile",
                                type: "post",
                                data: { notification: $(element).find("p").html()},
                                success: function () {
                                    $(element).removeClass("unread_notification");
                                    decrement_badge();
                                },
                                error: function () {
                                    alert("uh-oh something happened");
                                }
                            });
                        }

                        function delete_notification(event, element){
                            event.stopPropagation();

                            $.ajax({
                                url: "/userprofile",
                                type: "post",
                                data: {
                                    notification_delete: $(element).find("p").html(),
                                },
                                success: function () {
                                    $(element).remove();
                                },
                                error: function () {
                                    alert("uh-oh something happened");
                                }
                            });
                        }
                    </script>
                    <div id="notification" style="display: none">  
                        <div class="container-1">
                            <h4>Unread Notifications</h4>
                            <ul class="collapsible" data-collapsible="accordion">
                                <c:set var="prev" value=""/>
                                <c:forEach items="${current_user.unreadNotifications}" var="entry">
                                    <c:set var="notification" value="${fn:split(entry, '||')}"/>
                                    <c:if test="${notification[0] != prev}">
                                        <li>
                                        <div class="collapsible-header">${notification[0]}</div>
                                            <c:set var="prev" value="${notification[0]}"/>
                                    </c:if>

                                    <div class="collapsible-body unread_notification notification" onclick="read_notification(this)">
                                        <span>
                                            <i class="fa fa-minus-circle delete_notification" aria-hidden="true" onclick="delete_notification(event, this.parentElement.parentElement)"></i>
                                            ${notification[2]}
                                        </span>
                                        <span class="right">${notification[3]}</span>
                                        <p class="entry">${entry}</p>
                                    </div>

                                    <c:if test="${notification[0] != prev}">
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>

                            <div class="divider"></div>
                            <h4>Read Notifications</h4>
                            <ul class="collapsible" data-collapsible="accordion">
                                <c:set var="prev" value=""/>
                                <c:forEach items="${current_user.readNotifications}" var="entry">
                                    <c:set var="notification" value="${fn:split(entry, '||')}"/>
                                    <c:if test="${notification[0] != prev}">
                                        <li>
                                        <div class="collapsible-header">${notification[0]}</div>
                                        <c:set var="prev" value="${notification[0]}"/>
                                    </c:if>

                                    <div class="collapsible-body notification">
                                        <span>
                                            <i class="fa fa-minus-circle delete_notification" aria-hidden="true" onclick="delete_notification(event, this.parentElement.parentElement)"></i>
                                            ${notification[2]}
                                        </span>
                                        <span class="right">${notification[3]}</span>
                                        <p class="entry">${entry}</p>
                                    </div>

                                    <c:if test="${notification[0] != prev}">
                                        </li>
                                    </c:if>
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

        <!--Start test.jsp" />
        <!--End of chat -->
    <%--<jsp:include page="chat_box_test.jsp" />--%>
    </main>

    <jsp:include page="footer.jsp"/>

</div>
</body>

</html>