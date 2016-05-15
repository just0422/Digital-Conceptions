/**
 * Created by ZEXUN on 4/27/16.
 */
$(document).ready(function () {
    var name;
    var chatBoxList = [];
    var cssOffSet = 320;
    var pixel = "px";
    var rightOffSet = 20;


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
            $("<li class=" + $className + ">" +
                "<div class='avatar'><img src='image/1.jpg' /></div>" +
                "<div class='messages'><p id='message_content'>" + message + "</p></div>" +
                "</li>");

        $("#discussion_content").append($messageNode);
        var height = document.getElementById("discussion_content").scrollHeight;
        $("#discussion_content").scrollTop(height);

    }

    function onOpened() {
        console.log("Channel created");


    }

    function createChatBox(){
        // start of header section
        var $section = $("<section>", {class: "module", id: "chat_box"});
        $section.css("right",chatBoxList.length*cssOffSet+rightOffSet+pixel);
        var $header = $("<header>", {class: "top-bar"});
        var $header_message_div = $("<div>", {class: "left"});
        var $header_message_icon = $("<span>", {class: "incon typicons-message"});
        var $header_message_h1 = $("<h1>SimpleChat</h1>");
        var $header_close_div = $("<div>", {class: "right hoverable-1"});
        var $header_close_icon = $("<span>", {
            class: "icon typicons-times hoverable-1",
            onclick: "$(this).closest('section').remove()"
        });

        $header_message_div.append($header_message_icon, $header_message_h1);
        $header_close_div.append($header_close_icon);
        $header.append($header_message_div, $header_close_div);

        // End of header section

        // Start of message body section
        var $ol = $("<ol>", {class: "discussion", id: "discussion_content"});
        var $chat_info_div = $("<div>", {class: "container", id: "this_chat_info"});
        var $style_div = $("<div>", {class: "center", style: "margin-top:20%"});
        var $h4 = $("<h4 class='flow-text center-align'>Send To</h4>");
        var $receiver_name = $("<input>", {type: "text",id:"receiver_name"});
        var $self_name = $("<input>", {type: "text",id:"self_name"});
        var $confirm_receiver = $("<button>", {
            class: "btn waves-effect waves-light brown darken-2",
            id: "confirm_receiver"
        });
        $confirm_receiver.html("Submit");

        $style_div.append($h4, $receiver_name, $self_name, $confirm_receiver);
        $chat_info_div.append($style_div);
        $ol.append($chat_info_div);

        // End of message body section

        // Start of typing bar
        var $typing_bar = $("<div>", {class: "bot-bar center", id: "type_message", style: "display:none"});
        var $input_field = $("<input>", {type: "text", placeholder: "Type a message", id:"message_body"});
        var $submit_message = $("<button>", {class: "btn waves-effect waves-light btn-medium", id: "submit_message"});
        $submit_message.html("Submit");

        $typing_bar.append($input_field, $submit_message);

        // End of typing bar

        $section.append($header, $ol, $typing_bar);

        chatBoxList[chatBoxList.length] = $section;



        $("#forChatBox").append($section);
    }


    $("#start_chat").click(function () {
        createChatBox();
    });



    $("#forChatBox").on("click", "button", function (event) {
        console.log($(this).attr("id"));

        if ($(this).attr("id") == "confirm_receiver") {
            $(this).parent().parent().hide();
            $(this).closest("section").children("div").show();

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


        } else {
            var receiver_name = $(this).closest("section").children("ol").children("div").children("div").children("input[type=text]").val();
            console.log(receiver_name);
            var message_body = $(this).closest("div").children("input[type=text]").val();
            console.log(message_body);
            var self_name = $(this).closest("section").children("ol").children("div").children("div").children("input:nth-child(3)").val();
            console.log(self_name);
            $(this).closest("div").children("input[type=text]").val("");

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
                $("<li class=" + $className + ">" +
                    "<div class='avatar'><img src='image/1.jpg' /></div>" +
                    "<div class='messages'><p id='message_content'>" + message_body + "</p></div>" +
                    "</li>");

            $("#discussion_content").append($messageNode);
            var height = document.getElementById("discussion_content").scrollHeight;
            $("#discussion_content").scrollTop(height);
        }


    });

    /*  $("#submit_message").click(function () {
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

     });*/


});
