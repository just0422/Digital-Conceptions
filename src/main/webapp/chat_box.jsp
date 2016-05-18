<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZEXUN
  Date: 4/25/16
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat</title>
    <script src="js/jquery-2.2.2.js"></script>
    <script type="text/javascript" src="/_ah/channel/jsapi"></script>
    <script type="text/javascript" src="js/ChatBox_JS.js"></script>
    <link rel="stylesheet" href="css/chat_box.css">

</head>
<body>--%>
<%--
<h1>Testing</h1>


<input type="text" id="user_name" value=""><br><br>


<span>Reciption</span>
<input type="text" id="reciption" name="message_body" value="">

<br>

<span>Message</span>
<input type="text" id="message_body" name="message_body" value="">

<br>
<input type="button" id="submit_message" value="Submit">
<br><br><br>


--%>

<%--<div id="start_chat" class="fixed-action-btn" style="bot: 10px; left: 23px;">
    <a class="btn-floating btn-large grey darken-3">
        <i class="large material-icons">chat</i>
    </a>
</div>--%>


<%--<section class="module" id="chat_box" style="display: none;">

    <header class="top-bar">

        <div class="left">
            <span class="icon typicons-message"></span>
            <h1>SimpleChat</h1>
        </div>

        <div class="right hoverable-1">
            <span class="icon typicons-times hoverable-1" onclick="$(this).closest('section').remove()"></span>
        </div>
    </header>


    <ol class="discussion" id="discussion_content">
        <div id="this_chat_info" class="container">
            <div style="margin-top: 20%" class="center">
                <h4 class="flow-text center-align">Send To</h4>
                <input id="receiver_name" type="text" value=""/>
                <input id="self_name" value="${current_user.username}"/>
                <button id="confirm_receiver" class="btn waves-effect waves-light brown darken-2"
                >Submit
                </button>
            </div>
        </div>
    </ol>


    <div id="type_message" class="bot-bar center" style="display: none;">
        <input placeholder="Type a message" id="message_body" type="text">
        <button id="submit_message" class="btn waves-effect waves-light btn-medium">
            Submit
        </button>
    </div>

</section>--%>


<div id="forChatBox">
    <c:if test="${chatBoxList != null}">
        <c:forEach var="each" items="${chatBoxList}">
            ${each}
        </c:forEach>
    </c:if>
    <c:choose>
        <c:when test="${onOff == null}">
            <input type="hidden" id="onOff" name="onOff" value="off">
        </c:when>
        <c:otherwise>
            <input type="hidden" id="onOff" name="onOff" value="${onOff}">
        </c:otherwise>
    </c:choose>
</div>
