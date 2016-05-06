/**
 * Created by justin on 5/5/16.
 */
var current_page_edit = 0;
var canvas;

function changeCanvas(current){
    //var edit_canvas = document.getElementById("canvas");
    $('#canvas_' + current).attr('src', canvas.toDataURL("image/png"))
    $('#json_'+current).html(JSON.stringify(canvas));

    //console.log()
    //canvas.loadFromJSON(
    //    JSON.stringify(edit_canvas));
    //    //canvas.renderAll.bind('canvas_'+current));
    //canvas.deactivateAll();
}

function updatePage(){
    var pages = $('#pages_list').getElementsByTagName("li");
    for (var i = 0; i < pages.length; i++) {
        if ($(pages).hasClass("active")) {
            current_page_edit = i;
            break;
        }
    }
    changeCanvas(current_page_edit);
}

function updateCanvas(canvas_id_num){
    changeCanvas(current_page_edit);

    current_page_edit = canvas_id_num;
    //var canvas = new fabric.Canvas('canvas');
    //var canvas = document.getElementById("canvas").fabric;
    //var ctx = canvas.getContext('2d');
    //ctx.clearRect(0, 0, canvas.width, canvas.height);
    canvas.clear();
    canvas.loadFromJSON($('#json_'+current_page_edit).html(), canvas.renderAll.bind(canvas));
}
