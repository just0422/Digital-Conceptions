

$(document).ready(function () {
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

