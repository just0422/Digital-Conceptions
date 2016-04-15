/**
 * Created by ZEXUN on 4/12/16.
 */
$(document).ready(function () {
    $('.modal-trigger').leanModal();
    $('select').material_select();

    //When the Life tap is clicked
    $("#life").click(function () {
        // First remove the z-depth effect from the previous active tap
        $("#genres").children().removeClass("z-depth-1");

        // Add z-depth effect to Life tap
        $("#life").addClass("z-depth-1");

    });

    $("#thriller").click(function () {
        $("#genres").children().removeClass("z-depth-1");
        $("#thriller").addClass("z-depth-1");

    });

    $("#science").click(function () {
        $("#genres").children().removeClass("z-depth-1");
        $("#science").addClass("z-depth-1");

    });
    $("#sport").click(function () {
        $("#genres").children().removeClass("z-depth-1");
        $("#sport").addClass("z-depth-1");

    });
    $("#romance").click(function () {
        $("#genres").children().removeClass("z-depth-1");
        $("#romance").addClass("z-depth-1");

    });
    $("#drama").click(function () {
        $("#genres").children().removeClass("z-depth-1");
        $("#drama").addClass("z-depth-1");

    });

    $("#comedy").click(function () {
        $("#genres").children().removeClass("z-depth-1");
        $("#comedy").addClass("z-depth-1");

    });

    $("#action").click(function () {
        $("#genres").children().removeClass("z-depth-1");
        $("#action").addClass("z-depth-1");

    });
});