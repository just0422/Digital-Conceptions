


function removeActiveClass()
{
    $("#pages").children().each(function(index)
    {
        $(this).removeClass("active");
    })
}


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

    $("#previous").click(function()
    {
        
    })

    $("#next").click(function()
    {

    })

    var activePage = $("li.active");

    $("#pages").children().each(function(index)
    {
        console.log(index + ": " + $( this ).text());
        $(this).click(function()
        {
            if ($(this).attr("class").indexOf("active") == -1)
            {
                activePage.removeClass("active");
                $(this).addClass("active");
                activePage = $(this);
            }
        })
    })

    $( document ).on( "click .collapsible-body", ".collapsible-body .material-icons", function() {
        $(this).parent().parent().remove();
    });
});

