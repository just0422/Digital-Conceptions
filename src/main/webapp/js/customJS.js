$(document).ready(function () {
    $(".slider").slider();


    $("#subscription_button").click(function () {
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

    $(".pagination").children().each(function(index)
    {
        {
            console.log(index + ": " + $( this ).text());
            $(this).attr("id", "pagination" + index);
            $(this).addClass("active");
            $(this).click(function()
            {

            })
        }
    })

    $( document ).on( "click .collapsible-body", ".collapsible-body .material-icons", function() {
        $(this).parent().parent().remove();
    });
});

