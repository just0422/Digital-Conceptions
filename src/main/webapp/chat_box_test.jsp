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


<div id="start_chat" class="fixed-action-btn" style="bottom: 250px; left: 24px;">
    <a class="btn-floating btn-large grey darken-3">
        <i class="large material-icons">chat</i>
    </a>
</div>

<section class="module" id="chat_box" style="display: none;">

    <header class="top-bar">

        <div class="left">
            <span class="icon typicons-message"></span>
            <h1>SimpleChat</h1>
        </div>

        <div class="right">
            <span class="icon typicons-minus"></span>
            <span class="icon typicons-times"></span>
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


    <header id="type_message" class="bot-bar" style="display: none;">
        <div class="divider-3"></div>

                <span>
                    <input placeholder="Type a message" id="message_body" type="text">
                </span>

        <button  id="submit_message" class="btn waves-effect waves-light btn-medium">Submit
        </button>
    </header>

</section>


<script>
    $("#start_chat").click(function () {
        $("#chat_box").show();
    });

</script>

<%--

</body>
</html>
--%>
