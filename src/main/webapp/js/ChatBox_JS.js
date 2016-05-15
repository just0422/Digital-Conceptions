/**
 * Created by ZEXUN on 4/27/16.
 */
$(document).ready(function () {
    var name;

    /*$("#user_name").change(function () {
        name = $(this).val();
        console.log(name);

        $.post("/buildchannel",
            {
                id: name
            },
            function (data, status) {
                channelKey = data;
                console.log("Channel key: " + channelKey);
                channel = new goog.appengine.Channel(data);
                socket = channel.open();
                socket.onopen = onOpened;
                socket.onmessage = onMessage;
            }
        )
    })*/


    function onMessage(msg) {
        var message = msg.data;

        var $className = "others";

        var $messageNode =
            $("<li class="+ $className + ">" +
                "<div class='avatar'><img src='image/1.jpg' /></div>" +
                "<div class='messages'><p id='message_content'>" + message + "</p></div>" +
                "</li>");

        $("#discussion_content").append($messageNode);
        var height = document.getElementById("discussion_content").scrollHeight;
        $("#discussion_content").scrollTop( height) ;

    }

    function onOpened() {
        console.log("Channel created");


    }


    $("#submit_message").click(function () {
        var receiver_name = $("#receiver_name").val();
        var message_body = $("#message_body").val();
        var self_name = $("#self_name").val();
        $("#message_body").val("");

        $.post("" +
            "/generatemessage",
            {
                reciption: receiver_name,
                message: message_body,
                selfId: self_name
            }
        )

        var $className = "self";

        var $messageNode =
            $("<li class="+ $className + ">" +
                "<div class='avatar'><img src='image/1.jpg' /></div>" +
                "<div class='messages'><p id='message_content'>" + message_body + "</p></div>" +
                "</li>");

        $("#discussion_content").append($messageNode);
        var height = document.getElementById("discussion_content").scrollHeight;
        $("#discussion_content").scrollTop( height) ;

    });


    var channelKey;

    $("#confirm_receiver").click(function () {
        $("#this_chat_info").hide();
        $("#type_message").show();

        $.post("/buildchannel",
            {
                id: $("#self_name").val()
            },
            function (data, status) {
                channelKey = data;
                console.log("Channel key: " + channelKey);
                channel = new goog.appengine.Channel(data);
                socket = channel.open();
                socket.onopen = onOpened;
                socket.onmessage = onMessage;
            }
        )


    });



});