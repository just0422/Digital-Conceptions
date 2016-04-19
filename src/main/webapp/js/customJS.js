

$(document).ready(function ()
{
    $(".slider").slider();


    $("#subscription_button").click(function(){
        $("#account_info").hide();
        $("#notification").hide();
        $("#subscription").show();
    })

    $("#account_info_button").click(function(){
        $("#subscription").hide();
        $("#notification").hide();
        $("#account_info").show();
    })

    $("#notification_button").click(function(){
        $("#subscription").hide();
        $("#account_info").hide();
        $("#notification").show();
    })

    // $(".card.hoverable").each(function()
    // {
    //     // Give each card the comic image
    //
    //
    //
    //
    //     $(this).mouseover(function()
    //     {
    //         $(this).css("cursor", "pointer");
    //     })
    // })

    // $("#post_button").click(function()
    // {
    //     PERFORM AJAX TO SUBMIT COMMENT
    //     THIS DOES NOT RELOAD THE COMIC COVER PAGE
    //     $.ajax({
    //         url: "/comic",
    //         method: "POST",
    //         data: {comment: $("#textarea1").val()},
    //         error: function()
    //         {
    //             alert("Comment could not be posted.");
    //         },
    //         success: function ()
    //         {
    //             var comment = $("#textarea1").val();
    //             var post =
    //                 "<div class='card-content-1'>" +
    //                 "<div class='chip purple lighten-3 z-depth-1'>" +
    //                 "<img src='image/5.jpg'>" +
    //                 "Superman" +
    //                 "</div>" +
    //                 "<div class='pad-top-2'></div>" +
    //                 "<div class='flow-text small-font'>" +
    //                 "<span>" + comment + "</span>" +
    //                 "<span class='right'>3/4/16</span>" +
    //                 "</div>" +
    //                 "<div class='pad-top-2'></div>" +
    //                 "<div class='divider'></div>" +
    //                 "</div>";
    //             $("#comments").prepend(post);
    //         }
    //     })

            // PERFORM AJAX TO SUBMIT COMMENT
            // THIS DOES NOT RELOAD THE COMIC COVER PAGE
    //         $.post(
    //             "/comic",
    //             {
    //                 comment: $("#textarea1").val(),
    //                 comic_name: ${current_comic.comicName}
    //             },
    //             function(data, status, xhr)
    //             {
    //                 if (status == "success")
    //                 {
    //                     var comment = $("#textarea1").val();
    //                     var post =
    //                         "<div class='card-content-1'>" +
    //                         "<div class='chip purple lighten-3 z-depth-1'>" +
    //                         "<img src='image/5.jpg'>" +
    //                         "Superman" +
    //                         "</div>" +
    //                         "<div class='pad-top-2'></div>" +
    //                         "<div class='flow-text small-font'>" +
    //                         "<span>" + comment + "</span>" +
    //                         "<span class='right'>3/4/16</span>" +
    //                         "</div>" +
    //                         "<div class='pad-top-2'></div>" +
    //                         "<div class='divider'></div>" +
    //                         "</div>";
    //                     $("#comments").prepend(post);
    //                 } else if (status == "error" || status == "parsererror")
    //                 {
    //                     alert("Comment could not be posted.");
    //
    //                 }
    //             }
    //         )
    // })
    
    $("#subscribe").click(function()
    {
        $.ajax({
            url: "",
            data: ""})
    })

    $( document ).on( "click .collapsible-body", ".collapsible-body .material-icons", function() {
        $(this).parent().parent().remove();
        var numOfNoti = $("#numOfNoti").attr("data-badge");
        numOfNoti --;
        if(numOfNoti == 0){
            $("#numOfNoti").hide();
        }
        $("#numOfNoti").attr("data-badge",numOfNoti);




    });
});

