/**
 * Created by ZEXUN on 4/27/16.
 */
$(document).ready(function () {

    if($("#currentNumOfChatBox").val() != 0){
        var chatBoxList = jQuery.makeArray($("section"));

        for(var i = 0; i<chatBoxList.length; i++){
            chatBoxList[i] = $(chatBoxList[i]);
        }

        console.log("Number of chat box when page first loads: " + chatBoxList.length);
    }else{
        var chatBoxList = [];
    }

    var userName;

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


    function updateChatBoxPosition() {

        for (var i = 0; i < chatBoxList.length; i++) {
            chatBoxList[i].css("right", i * cssOffSet + rightOffSet + pixel);
        }
    }


    function onOpened(){
        $.post(
            "/_ah/channel/connected/"
        );
    }

    function onClosed(){
        $.post(
            "/_ah/channel/disconnected/"
        );
    }

    function onMessage(msg) {
        var message = msg.data.split("&")[0];
        var comeFrom = msg.data.split("&")[1];
        var sendTo = msg.data.split("&")[2];
        var noUserFound = msg.data.split("&")[3];
        console.log("***No user found "+noUserFound+"***");
        console.log("***")

        if(noUserFound.trim() != "no"){
            var $className = "others";

            var $messageNode =
                $("<li class=" + $className + ">" +
                    "<div class='avatar'><img src='image/others.jpg' /></div>" +
                    "<div class='messages'><p id='message_content'>" + message + "</p></div>" +
                    "</li>");


            var indexForIncomingMessage = -1;
            var foundChatBox;
            // Check if there is a open chat box for incoming message
            for (var i = 0; i < chatBoxList.length; i++) {
                var eachChatBoxName = chatBoxList[i].children("header").children("div:first-child").children("h1").html();
                console.log("Opened chat box : " + eachChatBoxName + " Message From : " + comeFrom) ;
                if (eachChatBoxName.trim() == comeFrom.trim()) {
                    indexForIncomingMessage = i;
                }
            }
            if (indexForIncomingMessage != -1) {
                foundChatBox = chatBoxList[indexForIncomingMessage];
                foundChatBox.closest("section").children("ol").append($messageNode);
                var height = foundChatBox.closest("section").children("ol").prop("scrollHeight");
                foundChatBox.closest("section").children("ol").scrollTop(height);
            } else {
                console.log("No such open chat box");
                createChatBoxWithKnownInfo(comeFrom.trim());
                var foundChatBox = chatBoxList[chatBoxList.length-1];
                foundChatBox.closest("section").children("ol").append($messageNode);
                var height = foundChatBox.closest("section").children("ol").prop("scrollHeight");
                foundChatBox.closest("section").children("ol").scrollTop(height);
            }


        }else{
            var $className = "others";

            var $messageNode =
                $("<li class=" + $className + ">" +
                    "<div class='avatar'><img src='image/others.jpg' /></div>" +
                    "<div class='messages'><p id='message_content'>" + message + "</p></div>" +
                    "</li>");


            var indexForIncomingMessage = -1;
            var foundChatBox;
            // Check if there is a open chat box for incoming message
            for (var i = 0; i < chatBoxList.length; i++) {
                var eachChatBoxName = chatBoxList[i].children("header").children("div:first-child").children("h1").html();
                console.log("Opened chat box : " + eachChatBoxName + " Message From : " + sendTo) ;
                if (eachChatBoxName.trim() == sendTo.trim()) {
                    indexForIncomingMessage = i;
                }
            }
            if (indexForIncomingMessage != -1) {
                foundChatBox = chatBoxList[indexForIncomingMessage];
                foundChatBox.closest("section").children("ol").append($messageNode);
                var height = foundChatBox.closest("section").children("ol").prop("scrollHeight");
                foundChatBox.closest("section").children("ol").scrollTop(height);
            } else {
                console.log("No such open chat box");
                createChatBoxWithKnownInfo(sendTo.trim());
                var foundChatBox = chatBoxList[chatBoxList.length-1];
                foundChatBox.closest("section").children("ol").append($messageNode);
                var height = foundChatBox.closest("section").children("ol").prop("scrollHeight");
                foundChatBox.closest("section").children("ol").scrollTop(height);
            }



        }




    }

    function onOpened() {
        console.log("Channel created");


    }

    function onClosed(){
        console.log("Channel is closed");
    }

    function removeChatBox() {
        console.log("hello");
    }


    function createChatBoxWithKnownInfo(comeFrom){
        // start of header section
        var $section = $("<section>", {class: "module", id: "chat_box"});
        /*$section.css("right",chatBoxList.length*cssOffSet+rightOffSet+pixel);*/
        var $header = $("<header>", {class: "top-bar"});
        var $header_message_div = $("<div>", {class: "left"});
        var $header_message_icon = $("<span>", {class: "incon typicons-message"});
        var $header_message_h1 = $("<h1>");
        $header_message_h1.html(comeFrom);
        var $header_close_div = $("<div>", {class: "right hoverable-1"});
        var $header_close_icon = $("<span>", {
            class: "icon typicons-times hoverable-1",
        });

        $header_message_div.append($header_message_icon, $header_message_h1);
        $header_close_div.append($header_close_icon);
        $header.append($header_message_div, $header_close_div);

        // End of header section

        // Start of message body section
        var $ol = $("<ol>", {class: "discussion", id: "discussion_content"});
        var $chat_info_div = $("<div>", {class: "container", id: "this_chat_info", style:"display:none"});
        var $style_div = $("<div>", {class: "center", style: "margin-top:20%"});
        var $h4 = $("<h4 class='flow-text center-align'>Send To</h4>");
        var $receiver_name = $("<input>", {type: "text", id: "receiver_name", value:comeFrom});
        var $self_name = $("<input>", {type: "text", id: "self_name",value:userName});
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
        var $typing_bar = $("<div>", {class: "bot-bar center", id: "type_message"});
        var $input_field = $("<input>", {type: "text", placeholder: "Type a message", id: "message_body"});
        var $submit_message = $("<button>", {class: "btn waves-effect waves-light btn-medium", id: "submit_message"});
        $submit_message.html("Submit");

        $typing_bar.append($input_field, $submit_message);

        // End of typing bar

        var currentPosition = chatBoxList.length;
        var $positionValue = $("<input>", {value: currentPosition, type: "hidden"});


        $section.append($header, $ol, $typing_bar, $positionValue);


        chatBoxList[chatBoxList.length] = $section;

        updateChatBoxPosition();

        $("#forChatBox").append($section);
    }
    function createChatBox() {
        // start of header section
        var $section = $("<section>", {class: "module", id: "chat_box"});
        /*$section.css("right",chatBoxList.length*cssOffSet+rightOffSet+pixel);*/
        var $header = $("<header>", {class: "top-bar"});
        var $header_message_div = $("<div>", {class: "left"});
        var $header_message_icon = $("<span>", {class: "incon typicons-message"});
        var $header_message_h1 = $("<h1>SimpleChat</h1>");
        var $header_close_div = $("<div>", {class: "right hoverable-1"});
        var $header_close_icon = $("<span>", {
            class: "icon typicons-times hoverable-1",
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
        var $receiver_name = $("<input>", {type: "text", id: "receiver_name", placeholder:"Enter receiver's ID"});
        var $self_name = $("<input>", {type: "hidden", id: "self_name", value:userName});
        var $confirm_receiver = $("<button>", {
            class: "btn waves-effect waves-light brown darken-2",
            id: "confirm_receiver",
            style:"margin-top:25px"

        });
        $confirm_receiver.html("Submit");

        $style_div.append($h4, $receiver_name, $self_name, $confirm_receiver);
        $chat_info_div.append($style_div);
        $ol.append($chat_info_div);

        // End of message body section

        // Start of typing bar
        var $typing_bar = $("<div>", {class: "bot-bar center", id: "type_message", style: "display:none"});
        var $input_field = $("<input>", {type: "text", placeholder: "Type a message", id: "message_body"});
        var $submit_message = $("<button>", {class: "btn waves-effect waves-light btn-medium", id: "submit_message"});
        $submit_message.html("Submit");

        $typing_bar.append($input_field, $submit_message);

        // End of typing bar

        var currentPosition = chatBoxList.length;
        var $positionValue = $("<input>", {value: currentPosition, type: "hidden"});


        $section.append($header, $ol, $typing_bar, $positionValue);


        chatBoxList[chatBoxList.length] = $section;

        updateChatBoxPosition();

        $("#forChatBox").append($section);
    }


    $("#open_new_chat").click(function () {
        createChatBox();
    });


    $("#forChatBox").on("click", "button", function (event) {
        console.log($(this).attr("id"));

        if ($(this).attr("id") == "confirm_receiver") {
            $(this).parent().parent().hide();
            $(this).closest("section").children("div").show();

            var receiver_name = $(this).closest("section").children("ol").children("div").children("div").children("input[type=text]").val();
            $(this).closest("section").children("header").children("div:first-child").children("h1").html(receiver_name);
            var self_name = $(this).closest("section").children("ol").children("div").children("div").children("input:nth-child(3)").val();
            console.log("This is my id" + self_name);
            var $incoming = $("<input>", {type: "hidden", value: receiver_name, name:"incoming_name"});
            $(this).closest("section").append($incoming);




        } else {
            var receiver_name = $(this).closest("section").children("ol").children("div").children("div").children("input[type=text]").val();
            console.log(receiver_name);
            var message_body = $(this).closest("div").children("input[type=text]").val();
            console.log(message_body);
            var self_name = $(this).closest("section").children("ol").children("div").children("div").children("input:nth-child(3)").val();
            console.log(self_name);
            $(this).closest("div").children("input[type=text]").val("");

            var fullMessage = message_body + "&" + self_name +"&" + receiver_name;
            $.post("" +
                "/generatemessage",
                {
                    reciption: receiver_name,
                    message: fullMessage,
                    selfId: self_name
                }
            )

            var $className = "self";

            var $messageNode =
                $("<li class=" + $className + ">" +
                    "<div class='avatar'><img src='image/me.jpg' /></div>" +
                    "<div class='messages'><p id='message_content'>" + message_body + "</p></div>" +
                    "</li>");

            $(this).closest("section").children("ol").append($messageNode);
            var height = $(this).closest("section").children("ol").prop("scrollHeight");
            $(this).closest("section").children("ol").scrollTop(height);
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


    $("#forChatBox").on("click", "span[class='icon typicons-times hoverable-1']", function () {
        console.log("Remove: " + $(this).closest("section").children("input[type='hidden']").val());
        var position = $(this).closest("section").children("input[type='hidden']").val();
        chatBoxList.splice(position, 1);
        $(this).closest("section").remove();


        for (var i = position; i < chatBoxList.length; i++) {
            chatBoxList[i].children("input[type='hidden']").val(i);
        }

        for (var i = 0; i < chatBoxList.length; i++) {
            console.log("index: " + i + " : " + chatBoxList[i].children("input[type='hidden']").val());
        }
        console.log("ChatBoxList size after removing: " + chatBoxList.length);

        updateChatBoxPosition();

        /*$(this).closest("section").remove();*/
    });


    $("#chatOnOff").click(function(){
        console.log($("#chatOnOff").is(":checked"));
        var self_name = $("#userEmalAsChatName").val();
        userName = self_name;
        $("#open_new_chat").show();

        if($("#chatOnOff").is(":checked") == true){

            $.post("/buildchannel",
                {
                    id: self_name
                },
                function (data, status) {
                    channelKey = data;
                    console.log("Channel key: " + channelKey);
                    channel = new goog.appengine.Channel(data);
                    socket = channel.open();
                    socket.onopen = onOpened;
                    socket.onmessage = onMessage;
                    socket.onclose = onClosed;
                }
            )
        }else{
            socket.close();
            $("#open_new_chat").hide();
        }
    });




    $(window).on("beforeunload",function(){

        var chatBoxString = [];
        var chatBoxStringWithDelimiter = "";

        for(var i = 0; i < chatBoxList.length; i ++){
            chatBoxString[i] = chatBoxList[i].wrap("<div></div>").parent().html();
        }

        for(var i = 0; i <chatBoxString.length; i ++){
            chatBoxStringWithDelimiter += chatBoxString[i]+"&";
        }

        console.log("Printing out chatBosList size before doing post" + chatBoxList);

        $.post(
            "/persist",
            {chatBox: chatBoxStringWithDelimiter}
        )

        clearTimeout(socket.pollingTimer_);
    });



});
