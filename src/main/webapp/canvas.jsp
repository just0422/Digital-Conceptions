<%@ page import="com.digitalconeptions.www.ComicInfo" %><%--
  Created by IntelliJ IDEA.
  User: ZEXUN
  Date: 4/5/16
  Time: 12:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html ng-app="kitchensink">

<head>
    <jsp:include page="head.jsp"/>

    <!-- For FabricJS Canvas -->
    <script type="text/javascript" src="js/prism.min.js"></script>
    <script type="text/javascript" src="js/fabric.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.6/angular.min.js"></script>


    <script type="text/javascript" src="js/paster.js"></script>
    <script type="text/javascript" src="js/jquery.mousewheel.min.js"></script>

    <link type="text/css" rel="stylesheet" href="css/kitchensink.css">

    <link href='http://fonts.googleapis.com/css?family=Plaster' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Engagement' rel='stylesheet' type='text/css'>

    <script type="text/javascript" src="js/font_definitions.js"></script>

    <script type="text/javascript" src="js/utils.js"></script>
    <script type="text/javascript" src="js/app_config.js"></script>
    <script type="text/javascript" src="js/controller.js"></script>

    <link type="text/css" rel="stylesheet" href="css/horizontal.css">
    <script type="text/javascript" src="js/canvas_functions.js"></script>
    <script type="text/javascript" src="js/sly.min.js"></script>
    <script type="text/javascript" src="js/modernizr.js"></script>
    <script type="text/javascript" src="js/horizontal.js"></script>

    <title>Home - Digital Conceptions</title>
    <link rel="icon" href="http://rocketdock.com/images/screenshots/CBR.png">

</head>

<body class="background">

<!-- Outer most container -->
<div class="container">

    <jsp:include page="header.jsp"/>

    <!-- Home Page -->
    <!-- Main body-->
    <main class="main body body-background-color">

        <!-- Start of actual create comic secion -->
        <div id="create_canvas" >

            <!-- Start of create tools -->
            <div id="bd-wrapper" ng-controller="CanvasControls" class="ng-scope">
                <%-- Pages scroll view --%>
                    <div class="pad-top-10"></div>

                    <div class="col s6 right-align" style="padding-top: 5px">
                        <a id="my_comic_button" class="waves-effect waves-light btn black lighten-2 left" href="/upload">Back
                            to My Comics</a>
                    </div>
                    <c:if test="${current_comic != null}">
                        <div class="col s6 right-align" style="padding-top: 5px">
                            <a class="waves-effect waves-light btn red lighten-2 right modal-trigger" href="#modal1">Delete Comic</a>
                        </div>

                        <div id="modal1" class="modal">
                            <div class="modal-content">
                                <h3>Are you sure you want to delete this comic???</h3>
                                <h4>There's not coming back form this one</h4>
                            </div>
                            <div class="modal-footer">
                                <a href="#!" class="modal-action modal-close waves-effect waves-red btn-flat " onclick="fadeout()">Cancel</a>
                                <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat " onclick="delete_comic()">Delete Forever</a>
                            </div>
                        </div>
                        <script>
                        function fadeout(){ $('.lean-overlay').fadeOut(300); }
                        function delete_comic(){
                            fadeout();

                            $.post(
                                    "/editimages",
                                    {
                                        series_title : '${current_comic.seriesTitle}',
                                        issue_title : '${current_comic.issueTitle}',
                                        volume : '${current_comic.volume}',
                                        issue : '${current_comic.issue}',
                                        remove : "yes"
                                    }
                            )
                            window.location.href = "/upload"
                        }
                    </script>
                    </c:if>
                    <div class="pad-top-10"></div>

                    <div class="wrap">
                    <div class="scrollbar">
                        <div class="handle">
                            <div class="mousearea"></div>
                        </div>
                    </div>

                    <div class="frame" id="basic">
                        <ul id="pages_list" class="clearfix">
                            <c:choose>
                                <c:when test="${current_comic == null}">
                                    <li onclick="updateCanvas(0)">
                                        <img id="img_0" class="page_previews"/>
                                        <div id="json_0" style="display: none;"></div>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="num" value="0"/>
                                    <c:forEach var="json" items="${current_comic.json}" varStatus="loop">
                                        <li onclick="updateCanvas(${num})">
                                            <img id="img_${num}" class="page_previews"/>
                                            <%--src="${current_comic.urls[num]}"/>--%>

                                            <div id="json_${num}" style="display: none;">${json}</div>
                                        </li>
                                        <c:set var="num" value="${num + 1}"/>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>

                    <div class="controls center">
                        <button class="btn toStart tooltipped" data-position="bottom" data-delay="50" data-tooltip="First Pages"><i class="fa fa-fast-backward" aria-hidden="true"></i></button>
                        <button class="btn prevPage tooltipped" data-position="bottom" data-delay="50" data-tooltip="Previous Section"><i class="fa fa-step-backward" aria-hidden="true"></i></button>
                        <button class="btn prev tooltipped" data-position="bottom" data-delay="50" data-tooltip="Previous Pages"><i class="fa fa-caret-left fa-2x" aria-hidden="true"></i></button>

                        <button class="btn remove tooltipped" data-position="bottom" data-delay="50" data-tooltip="Remove Page"><i class="fa fa-minus" aria-hidden="true"></i></button>
                        <button class="btn add tooltipped" data-position="bottom" data-delay="50" data-tooltip="Add Page"><i class="fa fa-plus" aria-hidden="true"></i></button>

                        <button class="btn next tooltipped" data-position="bottom" data-delay="50" data-tooltip="Next Page"><i class="fa fa-caret-right fa-2x" aria-hidden="true"></i></button>
                        <button class="btn nextPagetooltipped" data-position="bottom" data-delay="50" data-tooltip="Next Section"><i class="fa fa-step-forward" aria-hidden="true"></i></button>
                        <button class="btn toEnd tooltipped" data-position="bottom" data-delay="50" data-tooltip="Last Pages"><i class="fa fa-fast-forward" aria-hidden="true"></i></button>
                    </div>
                </div>
                <div style="position:relative;width:704px;float:left;" id="canvas-wrapper">

                    <div id="canvas-controls">
                        <div id="complexity">
                            Canvas complexity (number of paths):
                            <strong>{[ canvas.complexity() ]}</strong>
                        </div>

                        <div id="canvas-background">
                            <label for="canvas-background-picker">Canvas background:</label>
                            <input type="color" bind-value-to="canvasBgColor">
                        </div>
                    </div>

                    <canvas id="canvas" width="700" height="600" onchange="updatePage()"></canvas>


                    <div id="color-opacity-controls" ng-show="canvas.getActiveObject()">

                        <label for="opacity">Opacity: </label>
                        <input value="100" type="range" bind-value-to="opacity">

                        <label for="color" style="margin-left:10px">Color: </label>
                        <input type="color" style="width:40px" bind-value-to="fill">
                    </div>

                    <div id="text-wrapper" style="margin-top: 10px" ng-show="getText()">

                        <textarea bind-value-to="text"></textarea>

                        <div id="text-controls">
                            <label for="font-family" style="display:inline-block">Font family:</label>
                            <select id="font-family" class="btn-object-action" bind-value-to="fontFamily">
                                <option value="arial">Arial</option>
                                <option value="helvetica" selected>Helvetica</option>
                                <option value="myriad pro">Myriad Pro</option>
                                <option value="delicious">Delicious</option>
                                <option value="verdana">Verdana</option>
                                <option value="georgia">Georgia</option>
                                <option value="courier">Courier</option>
                                <option value="comic sans ms">Comic Sans MS</option>
                                <option value="impact">Impact</option>
                                <option value="monaco">Monaco</option>
                                <option value="optima">Optima</option>
                                <option value="hoefler text">Hoefler Text</option>
                                <option value="plaster">Plaster</option>
                                <option value="engagement">Engagement</option>
                            </select>
                            <br>
                            <label for="text-align" style="display:inline-block">Text align:</label>
                            <select id="text-align" class="btn-object-action" bind-value-to="textAlign">
                                <option>Left</option>
                                <option>Center</option>
                                <option>Right</option>
                                <option>Justify</option>
                            </select>
                            <div>
                                <label for="text-bg-color">Background color:</label>
                                <input type="color" value="" id="text-bg-color" size="10" class="btn-object-action"
                                       bind-value-to="bgColor">
                            </div>
                            <div>
                                <label for="text-lines-bg-color">Background text color:</label>
                                <input type="color" value="" id="text-lines-bg-color" size="10"
                                       class="btn-object-action"
                                       bind-value-to="textBgColor">
                            </div>
                            <div>
                                <label for="text-stroke-color">Stroke color:</label>
                                <input type="color" value="" id="text-stroke-color" class="btn-object-action"
                                       bind-value-to="strokeColor">
                            </div>
                            <div>
                                <label for="text-stroke-width">Stroke width:</label>
                                <input type="range" value="1" min="1" max="5" id="text-stroke-width"
                                       class="btn-object-action"
                                       bind-value-to="strokeWidth">
                            </div>
                            <div>
                                <label for="text-font-size">Font size:</label>
                                <input type="range" value="" min="1" max="120" step="1" id="text-font-size"
                                       class="btn-object-action"
                                       bind-value-to="fontSize">
                            </div>
                            <div>
                                <label for="text-line-height">Line height:</label>
                                <input type="range" value="" min="0" max="10" step="0.1" id="text-line-height"
                                       class="btn-object-action"
                                       bind-value-to="lineHeight">
                            </div>
                        </div>
                        <div id="text-controls-additional">
                            <button type="button" class="btn btn-object-action"
                                    ng-click="toggleBold()"
                                    ng-class="{'btn-inverse': isBold()}">
                                Bold
                            </button>
                            <button type="button" class="btn btn-object-action" id="text-cmd-italic"
                                    ng-click="toggleItalic()"
                                    ng-class="{'btn-inverse': isItalic()}">
                                Italic
                            </button>
                            <button type="button" class="btn btn-object-action" id="text-cmd-underline"
                                    ng-click="toggleUnderline()"
                                    ng-class="{'btn-inverse': isUnderline()}">
                                Underline
                            </button>
                            <button type="button" class="btn btn-object-action" id="text-cmd-linethrough"
                                    ng-click="toggleLinethrough()"
                                    ng-class="{'btn-inverse': isLinethrough()}">
                                Linethrough
                            </button>
                            <button type="button" class="btn btn-object-action" id="text-cmd-overline"
                                    ng-click="toggleOverline()"
                                    ng-class="{'btn-inverse': isOverline()}">
                                Overline
                            </button>
                        </div>
                    </div>
                </div>

                <div id="commands" ng-click="maybeLoadShape($event)">

                    <div class="tab-content">

                        <%--<div class="tab-pane" id="svg-shapes">--%>
                            <p>Comic Templates:</p>

                            <button class="btn clear" ng-click="confirmClear()">Clear canvas</button>

                            <ul class="svg-shapes">
                                <li><button class="btn shape" id="shape1">2 panes</button></li>
                                <%--<li><button class="btn btn-small shape" id="shape25"><strong>36</strong> paths</button></li>--%>
                                <%--<li><button class="btn btn-small shape" id="shape36"><strong>41</strong> paths</button></li>--%>
                                <%--<li><button class="btn btn-small shape" id="shape58"><strong>54</strong> paths</button></li>--%>
                                <%--<li><button class="btn btn-small shape" id="shape59"><strong>57</strong> paths</button></li>--%>
                                <%--<li><button class="btn btn-small shape" id="shape8"><strong>65</strong> paths</button></li>--%>
                                <%--<li><button class="btn btn-small shape" id="shape151">Lighthouse(<strong>78</strong> paths)</button></li>--%>
                                <%--<li><button class="btn btn-small shape" id="shape17"><strong>87</strong> paths</button></li>--%>
                            </ul>

                            <p>Add <strong>shapes</strong> to canvas:</p>
                            <div class="object-controls" object-buttons-enabled="getSelected()">
                                <p>
                                    <button class="btn shape tooltipped" data-position="bottom" data-delay="50" data-tooltip="Speech Bubble" id="shape100">
                                        <i class="fa fa-comment-o" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn rect tooltipped" data-position="bottom" data-delay="50" data-tooltip="Square" ng-click="addRect()">
                                        <i class="fa fa-stop" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn circle tooltipped" data-position="bottom" data-delay="50" data-tooltip="Circle" ng-click="addCircle()">
                                        <i class="fa fa-circle" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn triangle tooltipped" data-position="bottom" data-delay="50" data-tooltip="Triangle" ng-click="addTriangle()">
                                        <i class="fa fa-caret-up" aria-hidden="true"></i>
                                    </button>
                                    <button type="button" class="btn line tooltipped" data-position="bottom" data-delay="50" data-tooltip="Line" ng-click="addLine()">\</button>
                                    <button type="button" class="btn polygon tooltipped" data-position="bottom" data-delay="50" data-tooltip="Polygon" ng-click="addPolygon()">
                                    </button>
                                    <button class="btn tooltipped" data-position="bottom" data-delay="50" data-tooltip="Add Text" ng-click="addText()">
                                        <i class="fa fa-font" aria-hidden="true"></i>
                                    </button>
                                    <button class="btn btn-object-action tooltipped" data-position="bottom" data-delay="50" data-tooltip="Delete" id="remove-selected"ng-click="removeSelected()">
                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                    </button>
                                </p>
                            </div>

                            <div class="object-controls" object-buttons-enabled="getSelected()">
                                <%-- Positional Locks --%>
                                <div style="margin-top:10px;">
                                    <button id="horizontal-lock"
                                            class="btn btn-lock btn-object-action lock-buttons tooltipped" data-position="bottom" data-delay="50" data-tooltip="Move X Lock"
                                            ng-click="setHorizontalLock(!getHorizontalLock())"
                                            ng-class="{'btn-inverse': getHorizontalLock()}"
                                            title="Lock horizontal movement">
                                    </button>
                                    <button id="vertical-lock"
                                            class="btn btn-lock btn-object-action lock-buttons tooltipped" data-position="bottom" data-delay="50" data-tooltip="Move Y Lock"
                                            ng-click="setVerticalLock(!getVerticalLock());"
                                            ng-class="{'btn-inverse': getVerticalLock()}"
                                            title="Lock vertical movement">
                                    </button>
                                    <button id="scale-x-lock" onclick="check_locks()"
                                            class="btn btn-lock btn-object-action lock-buttons tooltipped" data-position="bottom" data-delay="50" data-tooltip="Scale X Lock"
                                            ng-click="setScaleLockX(!getScaleLockX())"
                                            ng-class="{'btn-inverse': getScaleLockX()}"
                                            title="Lock horizontal scaling">
                                    </button>
                                    <button id="scale-y-lock" onclick="check_locks()"
                                            class="btn btn-lock btn-object-action lock-buttons tooltipped" data-position="bottom" data-delay="50" data-tooltip="Scale Y Lock"
                                            ng-click="setScaleLockY(!getScaleLockY())"
                                            ng-class="{'btn-inverse': getScaleLockY()}"
                                            title="Lock vertical scaling">
                                    </button>
                                    <button id="rotate-lock" onclick="check_locks()"
                                            class="btn btn-lock btn-object-action lock-buttons tooltipped" data-position="bottom" data-delay="50" data-tooltip="Rotation Lock"
                                            ng-click="setRotationLock(!getRotationLock())"
                                            ng-class="{'btn-inverse': getRotationLock()}"
                                            title="Lock Rotation">
                                    </button>
                                </div>

                                <%-- Backwards/Forwards --%>
                                <div style="margin-top:10px;">
                                    <button id="send-to-back" class="btn btn-object-action tooltipped" data-position="bottom" data-delay="50" data-tooltip="Send to the Back"
                                            ng-click="sendToBack()" title="Send to back"><img src="https://git.io/vrcSg"/>
                                    </button>
                                    <button id="send-backwards" class="btn btn-object-action tooltipped" data-position="bottom" data-delay="50" data-tooltip="Send Backward"
                                            ng-click="sendBackwards()" title="Send Backwards"><img src="https://git.io/vrcS9"/>
                                    </button>
                                    <button id="bring-forward" class="btn btn-object-action tooltipped" data-position="bottom" data-delay="50" data-tooltip="Bring Forward"
                                            ng-click="bringForward()" title="Bring Forwards"><img src="https://git.io/vrcSj"/>
                                    </button>
                                    <button id="bring-to-front" class="btn btn-object-action tooltipped" data-position="bottom" data-delay="50" data-tooltip="Bring to the Front"
                                            ng-click="bringToFront()" title="Bring to front"><img src="https://git.io/vrc93"/>
                                    </button>
                                </div>

                                <div style="margin-top:10px;">
                                    <button id="gradientify" class="btn btn-object-action tooltipped" data-position="bottom" data-delay="50" data-tooltip="Gradient" ng-click="gradientify()" title="Gradient"></button>
                                    <button id="shadowify" class="btn btn-object-action tooltipped" data-position="bottom" data-delay="50" data-tooltip="Shadow" ng-click="shadowify()" title="Shadow">
                                        <i class="fa fa-square" aria-hidden="true" id="shadow_button"></i>
                                    </button>
                                </div>
                            </div>
                            <div style="margin-top:10px;" id="drawing-mode-wrapper">
                                <button id="drawing-modetooltipped" data-position="bottom" data-delay="50" data-tooltip="Free Drawing Mode" class="btn btn-info"
                                        ng-click="setFreeDrawingMode(!getFreeDrawingMode())"
                                        ng-class="{'btn-inverse': getFreeDrawingMode()}">
                                    <script>
                                        function check_locks(){
                                            var open_span = '<span class="fa-stack">';
                                            var lock = '<i class="fa fa-lock fa-stack-2x" style="color:black"></i>'
                                            var close_span = '</span>';
                                            var object = canvas.getActiveObject();
                                            var moveX = open_span + '<i class="fa fa-arrows-h fa-stack-1x"></i>';
                                            var moveY = open_span + '<i class="fa fa-arrows-v fa-stack-1x"></i>';
                                            var scaleX = open_span + '<i class="fa fa-arrows-h fa-stack-1x"></i>' +
                                                    '<i style="font-size:2.1rem;" class="fa fa-square-o fa-stack-1x scale_square"></i>';
                                            var scaleY = open_span + '<i class="fa fa-arrows-v fa-stack-1x"></i>' +
                                                    '<i style="font-size:2.1rem;" class="fa fa-square-o fa-stack-1x scale_square"></i>';
                                            var rot = open_span + '<i class="fa fa-refresh fa-stack-1x"></i>';


                                            if (object) {
                                                if (object.lockMovementX)
                                                    moveX += lock;
                                                if (object.lockMovementY)
                                                    moveY += lock;
                                                if (object.lockScalingX)
                                                    scaleX += lock;
                                                if (object.lockScalingY)
                                                    scaleY += lock;
                                                if (object.lockRotation)
                                                    rot += lock;
                                            }

                                            moveX += close_span;
                                            moveY += close_span;
                                            scaleX += close_span;
                                            scaleY += close_span;
                                            rot += close_span;

                                            $("#horizontal-lock").html(moveX);
                                            $("#vertical-lock").html(moveY);
                                            $("#scale-x-lock").html(scaleX);
                                            $("#scale-y-lock").html(scaleY);
                                            $("#rotate-lock").html(rot);

                                        }

                                        function draw_stop(){
                                            if (!canvas.isDrawingMode)
                                                $('#drawing-mode').html('<i class="fa fa-stop-circle-o" aria-hidden="true"></i>');
                                            else
                                                $('#drawing-mode').html('<i class="fa fa-pencil" aria-hidden="true"></i>');
                                        }

                                        $(document).ready(draw_stop);
                                        $(document).ready(check_locks);
                                        $('#drawing-mode').click(draw_stop);

                                    </script>
                                    <%--{[ getFreeDrawingMode() ? 'Exit' : 'Enter free drawing mode'--%>
                                    <%--]}--%>
                                </button>

                                <div id="drawing-mode-options" ng-show="getFreeDrawingMode()">
                                    <label for="drawing-mode-selector">Mode:</label>
                                    <select id="drawing-mode-selector" bind-value-to="drawingMode">
                                        <option>Pencil</option>
                                        <option>Circle</option>
                                        <option>Spray</option>
                                        <option>Pattern</option>

                                        <option>hline</option>
                                        <option>vline</option>
                                        <option>square</option>
                                        <option>diamond</option>
                                        <option>texture</option>
                                    </select>
                                    <%--<br>--%>
                                    <label for="drawing-line-width">Line width:</label>
                                    <input type="range" value="30" min="0" max="150"
                                           bind-value-to="drawingLineWidth">
                                    <%--<br>--%>
                                    <label for="drawing-color">Line color:</label>
                                    <input type="color" value="#005E7A" bind-value-to="drawingLineColor">
                                    <%--<br>--%>
                                    <label for="drawing-shadow-width">Line shadow width:</label>
                                    <input type="range" value="0" min="0" max="50"
                                           bind-value-to="drawingLineShadowWidth">
                                </div>
                            </div>
                            <button type="button" class="btn btn-info tooltipped" data-position="bottom" data-delay="50" data-tooltip="Make sure you've filled out the info below" onclick="save()">
                                Save
                            </button>

                    </div>

                </div>

                <script src="js/font_definitions.js"></script>
                <script>
                    var kitchensink = {};
                    canvas = new fabric.Canvas('canvas');
                    canvas.on('object:selected', check_locks);


                    function save(){
                        updateCanvas(current_page_edit);
                        var pages = $('#pages_list').children();
                        var formdata = new FormData();

                        for (var i = 0; i < pages.length; i++) {
                            console.log(i);
                            console.log(pages.length);


                            if ($('#img_' + i).attr('src') != null) {
                                var blobBin = atob($('#img_' + i).attr('src').split(',')[1]);
                                var array = [];
                                for(var j = 0; j < blobBin.length; j++) {
                                    array.push(blobBin.charCodeAt(j));
                                }
                                formdata.append("image_" + i, new Blob([new Uint8Array(array)], {type: 'image/png'}));
                                formdata.append("json_" + i, $('#json_' + i).html());
                            }
                        }

                        var vol = '${current_comic.volume}';
                        if (vol.length == 0)
                                vol = -1;
                        var iss = '${current_comic.issue}';
                        if (iss.length == 0)
                                iss = -1;

                        formdata.append("series_title", '${current_comic.seriesTitle}');
                        formdata.append("issue_title", '${current_comic.issueTitle}');
                        formdata.append("volume", vol);
                        formdata.append("issue", iss);
                        <%--formdata.append('description', '${current_comic.description}')--%>
                        <%--formdata.append('genre', '${current_comic.genre}')--%>
                        formdata.append("new_series_title", $("#series_title").val());
                        formdata.append("new_issue_title", $("#issue_title").val());
                        formdata.append("new_volume", $("#volume").val());
                        formdata.append("new_issue", $("#issue").val());
                        formdata.append("new_genre", $("#genre_select").val());
                        formdata.append("new_description", $("#description").val());

                        $.ajax({
                            url: "${create}",
                            type: "POST",
                            data: formdata,
                            success: function(){
                                window.location.href = "/upload";
                            },
                            processData: false,
                            contentType: false,
                            beforeSend: function () {
                                console.log("Sending");
                                $("#spinner").show();
//                                $("#failure").attr('display', 'none');
//                                $("#success").attr('display', 'none');
                            },
                            complete: function(){
                                $("#spinner").hide();
//                                $("#success").attr('display', 'inline-block');
                            },
                            error: function(){
//                                $("#failure").attr('display', 'inline-block');
                                $("#spinner").hide();
                            },
                            success: function (data, status) {
                                console.log(data + status);
                                var req = data.split(',');
                                window.location.href = "/upload";
                            }
                        });
//                        $("#comic_upload").ajaxForm(options);

//                        $('#canvas_create').ajaxSubmit(options);
                    }
                </script>
                    <%--<form id="canvas_create" action="${create}" method="POST"></form>--%>

                <script src="js/utils.js"></script>
                <script src="js/app_config.js"></script>
                <script src="js/controller.js"></script>

                <script>

                    (function () {

                        if (document.location.hash !== '#zoom') return;

                        function renderVieportBorders() {
                            var ctx = canvas.getContext();

                            ctx.save();

                            ctx.fillStyle = 'rgba(0,0,0,0.1)';

                            ctx.fillRect(
                                    canvas.viewportTransform[4],
                                    canvas.viewportTransform[5],
                                    canvas.getWidth() * canvas.getZoom(),
                                    canvas.getHeight() * canvas.getZoom());

                            ctx.setLineDash([5, 5]);

                            ctx.strokeRect(
                                    canvas.viewportTransform[4],
                                    canvas.viewportTransform[5],
                                    canvas.getWidth() * canvas.getZoom(),
                                    canvas.getHeight() * canvas.getZoom());

                            ctx.restore();
                        }

                        $(canvas.getElement().parentNode).on('mousewheel', function (e) {

                            var newZoom = canvas.getZoom() + e.deltaY / 300;
                            canvas.zoomToPoint({x: e.offsetX, y: e.offsetY}, newZoom);

                            renderVieportBorders();

                            return false;
                        });

                        var viewportLeft = 0,
                                viewportTop = 0,
                                mouseLeft,
                                mouseTop,
                                _drawSelection = canvas._drawSelection,
                                isDown = false;

                        canvas.on('mouse:down', function (options) {
                            isDown = true;

                            viewportLeft = canvas.viewportTransform[4];
                            viewportTop = canvas.viewportTransform[5];

                            mouseLeft = options.e.x;
                            mouseTop = options.e.y;

                            if (options.e.altKey) {
                                _drawSelection = canvas._drawSelection;
                                canvas._drawSelection = function () {
                                };
                            }

                            renderVieportBorders();
                        });

                        canvas.on('mouse:move', function (options) {
                            if (options.e.altKey && isDown) {
                                var currentMouseLeft = options.e.x;
                                var currentMouseTop = options.e.y;

                                var deltaLeft = currentMouseLeft - mouseLeft,
                                        deltaTop = currentMouseTop - mouseTop;

                                canvas.viewportTransform[4] = viewportLeft + deltaLeft;
                                canvas.viewportTransform[5] = viewportTop + deltaTop;

                                canvas.renderAll();
                                renderVieportBorders();
                            }
                        });

                        canvas.on('mouse:up', function () {
                            canvas._drawSelection = _drawSelection;
                            isDown = false;
                        });
                    })();

                </script>

            </div>

            <script>
                (function () {
                    fabric.util.addListener(fabric.window, 'load', function () {
                        var canvas = this.__canvas || this.canvas,
                                canvases = this.__canvases || this.canvases;

                        canvas && canvas.calcOffset && canvas.calcOffset();

                        if (canvases && canvases.length) {
                            for (var i = 0, len = canvases.length; i < len; i++) {
                                canvases[i].calcOffset();
                            }
                        }
                    });
                })();
            </script>

        </div>
        <!-- End of create tools -->

        <!-- End of actual create comic seciont -->

        <div class="col s9">
            <div class="container-1">
                <%--<form action="${create}" method="post" id="comic_upload" enctype="multipart/form-data">--%>
                    <div class="input-field titles">
                        <input id="series_title" type="text" class="validate" name="series_title" value="${current_comic.seriesTitle}" required>
                        <label for="series_title">Series Title</label>
                    </div>
                    <div class="input-field titles issues">
                        <input id="issue_title" type="text" class="validate" name="issue_title" value="${current_comic.issueTitle}" required>
                        <label for="issue_title">Issue Title</label>
                    </div>
                    <div class="input-field titles">
                        <input id="volume" type="number" class="validate" name="volume" value="${current_comic.volume}" required>
                        <label for="volume">Volume</label>
                    </div>
                    <div class="input-field titles issues">
                        <input id="issue" type="number" class="validate" name="issue" value="${current_comic.issue}" required>
                        <label for="issue">Issues</label>
                    </div>



                    <div class="input-field col s11">
                        <select name="genre" id="genre_select" required>
                            <option value="" disabled selected>Choose your genre</option>
                            <option value="Action">Action</option>
                            <option value="Comedy">Comedy</option>
                            <option value="Drama">Drama</option>
                            <option value="Horror">Horror</option>
                            <option value="Fantasy">Fantasy</option>
                            <option value="Romance">Romance</option>
                            <option value="Sports">Sports</option>
                        </select>
                    </div>


                    <div class="input-field col s12">
                                        <textarea id="description" class="materialize-textarea" name="description"
                                                  required>${current_comic.description}</textarea>
                        <label for="description">Description of the comic</label>
                    </div>
                <%--</form>--%>

            </div>

        </div>
        <c:if test="${current_comic != null}">
            <c:set var="num" value="0"/>
            <c:forEach var="json" items="${current_comic.json}" varStatus="loop" begin="0">
                <script>
    //                                                var canvas = new fabric.Canvas('dummy')
                    canvas.clear()
                    canvas.loadFromJSON(${json}, canvas.renderAll.bind(canvas));
    //                canvas.setHeight(700);
    //                canvas.setWidth(600);
                    $('#img_' + ${num}).attr('src', canvas.toDataURL("image/png"));
    //                $('#dummy').remove();
                </script>
                <c:set var="num" value="${num + 1}"/>
            </c:forEach>
            <script> canvas.loadFromJSON($('#json_0').html(), canvas.renderAll.bind(canvas)); </script>
        </c:if>
    </main>

    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>