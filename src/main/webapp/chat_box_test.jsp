<%--
  Created by IntelliJ IDEA.
  User: ZEXUN
  Date: 4/25/16
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat</title>
    <script src="js/jquery-2.2.2.js"></script>
    <script type="text/javascript" src="/_ah/channel/jsapi"></script>
    <script type="text/javascript" src="js/ChatBox_JS.js"></script>
    <link rel="stylesheet" href="css/chat_box.css">


    <script>
        //this function can remove a array element.
        Array.remove = function(array, from, to) {
            var rest = array.slice((to || from) + 1 || array.length);
            array.length = from < 0 ? array.length + from : from;
            return array.push.apply(array, rest);
        };

        //this variable represents the total number of popups can be displayed according to the viewport width
        var total_popups = 0;

        //arrays of popups ids
        var popups = [];

        //this is used to close a popup
        function close_popup(id)
        {
            for(var iii = 0; iii < popups.length; iii++)
            {
                if(id == popups[iii])
                {
                    Array.remove(popups, iii);

                    document.getElementById(id).style.display = "none";

                    calculate_popups();

                    return;
                }
            }
        }

        //displays the popups. Displays based on the maximum number of popups that can be displayed on the current viewport width
        function display_popups()
        {
            var right = 220;

            var iii = 0;
            for(iii; iii < total_popups; iii++)
            {
                if(popups[iii] != undefined)
                {
                    var element = document.getElementById(popups[iii]);
                    element.style.right = right + "px";
                    right = right + 320;
                    element.style.display = "block";
                }
            }

            for(var jjj = iii; jjj < popups.length; jjj++)
            {
                var element = document.getElementById(popups[jjj]);
                element.style.display = "none";
            }
        }

        //creates markup for a new popup. Adds the id to popups array.
        function register_popup(id, name)
        {

            for(var iii = 0; iii < popups.length; iii++)
            {
                //already registered. Bring it to front.
                if(id == popups[iii])
                {
                    Array.remove(popups, iii);

                    popups.unshift(id);

                    calculate_popups();


                    return;
                }
            }

            var element = '<div class="popup-box chat-popup" id="'+ id +'">';
            element = element + '<div class="popup-head">';
            element = element + '<div class="popup-head-left">'+ name +'</div>';
            element = element + '<div class="popup-head-right"><a href="javascript:close_popup(\''+ id +'\');">&#10005;</a></div>';
            element = element + '<div style="clear: both"></div></div><div class="popup-messages"></div></div>';

            document.getElementsByTagName("body")[0].innerHTML = document.getElementsByTagName("body")[0].innerHTML + element;

            popups.unshift(id);

            calculate_popups();

        }

        //calculate the total number of popups suitable and then populate the toatal_popups variable.
        function calculate_popups()
        {
            var width = window.innerWidth;
            if(width < 540)
            {
                total_popups = 0;
            }
            else
            {
                width = width - 200;
                //320 is width of a single popup box
                total_popups = parseInt(width/320);
            }

            display_popups();

        }

        //recalculate when window is loaded and also when window is resized.
        window.addEventListener("resize", calculate_popups);
        window.addEventListener("load", calculate_popups);

    </script>


</head>
<body>
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



<div class="chat-sidebar">
    <div class="sidebar-name">
        <!-- Pass username and display name to register popup -->
        <a href="javascript:register_popup('narayan-prusty', 'Narayan Prusty');">
            <img width="30" height="30" src="https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xap1/v/t1.0-1/p50x50/1510656_10203002897620130_521137935_n.jpg?oh=572eaca929315b26c58852d24bb73310&oe=54BEE7DA&__gda__=1418131725_c7fb34dd0f499751e94e77b1dd067f4c" />
            <span>Narayan Prusty</span>
        </a>
    </div>

</div>


<section class="module" id="chat_box">


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
    </ol>

</section>

<script>


</script>


</body>
</html>
