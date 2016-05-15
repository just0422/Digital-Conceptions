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



    $("#start_chat").click(function () {

        // start of header section
        var $section = $("<secion>",{class:"module"});
        var $header = $("<header>", {class:"top-bar"});
        var $header_message_div = $("<div>", {class:"left"});
        var $header_message_icon = $("<span>",{class:"incon typicons-message"});
        var $header_message_h1 = $("<h1>SimpleChat</h1>");
        var $header_close_div = $("<div>", {class:"right hoverable-1"});
        var $header_close_icon = $("<span>",{class:"icon typicons-times hoverable-1"});

        $header_message_div.append($header_message_icon, $header_message_h1);
        $header_close_div.append($header_close_icon);
        $header.append($header_message_div,$header_close_div);

        // End of header section

        // Start of message body section
        var $ol = $("<ol>", {class:"discussion"});
        var $chat_info_div = $("<div>", {class:"container"});
        var $style_div = $("<div>", {class:"center", style:"margin-top:20%"});
        var $h4 = $("<h4 class='flow-text center-align'>Send To</h4>");
        var $receiver_name = $("<input>", {type:"text"} );
        var $self_name = $("<input>", {type:"text"});
        var $confirm_receiver = $("<button>", {class:"btn waves-effect waves-light brown darken-2", id:"confirm_receiver"});
        $confirm_receiver.html("Submit");

        $style_div.append($h4, $receiver_name, $self_name, $confirm_receiver);
        $chat_info_div.append($style_div);
        $ol.append($chat_info_div);

        // End of message body section

        // Start of typing bar
        var $typing_bar = $("<div>", {class:"bot-bar center", style:"display:none", id:"type_message"});
        var $input_field = $("<input>", {type:"text", placeholder:"Type a message"});
        var $submit_message = $("<button>", {class:"btn waves-effect waves-light btn-medium"})

        $typing_bar.append($input_field, $submit_message);

        // End of typing bar



        $section.append($header, $ol, $typing_bar);


        $("#main").append($section);
    });




});
