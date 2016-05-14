/**
 * Created by ZEXUN on 4/12/16.
 */
$(document).ready(function () {
    $('.modal-trigger').leanModal();
    $('select').material_select();

    //When the Life tap is clicked
    $("#fantasy").click(function () {
        // First remove the z-depth effect from the previous active tap
        $("#genres").children().removeClass("z-depth-1");

        // Add z-depth effect to Life tap
        $("#fantasy").addClass("z-depth-1");

        hideComics();
        $("#fantasy_comics").show();
    });

    $("#horror").click(function () {
        $("#genres").children().removeClass("z-depth-1");
        $("#horror").addClass("z-depth-1");
        hideComics();
        $("#horror_comics").show();
    });

    $("#sport").click(function () {
        $("#genres").children().removeClass("z-depth-1");
        $("#sport").addClass("z-depth-1");
        hideComics();
        $("#sport_comics").show();
    });

    $("#romance").click(function () {
        $("#genres").children().removeClass("z-depth-1");
        $("#romance").addClass("z-depth-1");
        hideComics();
        $("#romance_comics").show();
    });

    $("#drama").click(function () {
        $("#genres").children().removeClass("z-depth-1");
        $("#drama").addClass("z-depth-1");
        hideComics();
        $("#drama_comics").show();
    });

    $("#comedy").click(function () {
        $("#genres").children().removeClass("z-depth-1");
        $("#comedy").addClass("z-depth-1");
        hideComics();
        $("#comedy_comics").show();
    });

    $("#action").click(function () {
        $("#genres").children().removeClass("z-depth-1");
        $("#action").addClass("z-depth-1");
        hideComics();
        $("#action_comics").show();
    });

    $("#my_comic_button").click(function () {
        $("#upload").hide();
        $("#create_canvas").hide();
        $("#my_comic").show();
    });

    $("#upload_button").click(function () {
        $("#my_comic").hide();
        $("#create_canvas").hide();
        $("#upload").show();
    });
    
    $("#new_comic_button").click(function () {
       $("#upload").hide();
        $("#my_comic").hide();
        $("#create_canvas").show();
    });
});

function hideComics()
{
    $("#action_comics").hide();
    $("#drama_comics").hide();
    $("#romance_comics").hide();
    $("#comedy_comics").hide();
    $("#horror_comics").hide();
    $("#fantasy_comics").hide();
    $("#sport_comics").hide();

}