$(document).ready(function () {
    $(".slider").slider();


    $("#subscirption_button").click(function () {
        $("#account_info").hide();
        $("#subscription").show();
    })

    $("#account_info_button").click(function(){
        $("#subscription").hide();
        $("#account_info").show();
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
});

