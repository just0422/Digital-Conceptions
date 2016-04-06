$(document).ready(function () {
    $(".slider").slider();


    $("#subscirption_button").click(function () {
        $("#account_info").hide();
        $("#subscription").show();
    })

    $("#accoutn_info_button").click(function(){
        $("#subscription").hide();
        $("#account_info").show();
    })
});

