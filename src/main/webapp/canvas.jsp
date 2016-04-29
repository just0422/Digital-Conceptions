<%--
  Created by IntelliJ IDEA.
  User: ZEXUN
  Date: 4/5/16
  Time: 12:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.css" media="screen,projection"/>

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Import Jquery-->
    <script type="text/javascript" src="js/jquery-2.2.2.js"></script>

    <!--Import materialize.js-->
    <script type="text/javascript" src="js/materialize.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>

    <!--Impot custom css-->
    <link type="text/css" rel="stylesheet" href="css/custom.css">

    <!--Import custom js-->
    <script type="text/javascript" src="js/customJS.js"></script>

    <script type="text/javascript" src="js/customJS_2.js"></script>

    <!-- For FabricJS Canvas -->
    <script type="text/javascript" src="js/prism.min.js"></script>
    <script type="text/javascript" src="js/fabric.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.6/angular.min.js"></script>

    <%--<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.3.min.js" integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo="   crossorigin="anonymous"></script>--%>
    <%--<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>--%>
    <script type="text/javascript" src="js/paster.js"></script>
    <script type="text/javascript" src="js/jquery.mousewheel.min.js"></script>

    <%--<link type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">--%>
    <link type="text/css" rel="stylesheet" href="css/kitchensink.css">

    <link href='http://fonts.googleapis.com/css?family=Plaster' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Engagement' rel='stylesheet' type='text/css'>

    <script type="text/javascript" src="js/font_definitions.js"></script>

    <script type="text/javascript" src="js/utils.js"></script>
    <script type="text/javascript" src="js/app_config.js"></script>
    <script type="text/javascript" src="js/controller.js"></script>

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
        <div id="create_canvas" ng-app="kitchensink">

            <!-- Start of create tools -->
            <div id="bd-wrapper" ng-controller="CanvasControls" class="ng-scope">

                <%--<script src="https://code.jquery.com/jquery-2.2.3.min.js" integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo="   crossorigin="anonymous"></script>--%>
                <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>--%>
                <%--<script src="js/paster.js"></script>--%>
                <%--<script src="js/jquery.mousewheel.min.js"></script>--%>

                <%--<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">--%>
                <%--<link rel="stylesheet" href="css/kitchensink.css">--%>

                <%--<link href='http://fonts.googleapis.com/css?family=Plaster' rel='stylesheet' type='text/css'>--%>
                <%--<link href='http://fonts.googleapis.com/css?family=Engagement' rel='stylesheet' type='text/css'>--%>

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

                    <canvas id="canvas" width="700" height="600"></canvas>

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

                    <ul class="tabs">
                        <li class="tab col s2"><a href="#simple-shapes">Simple</a></li>
                        <li class="tab col s2"><a href="#svg-shapes">SVG</a></li>
                        <li class="tab col s2"><a class="active" href="#object-controls-pane">Controls</a></li>
                        <%--<li class="tab col s2"><a href="#load-svg-pane">Load SVG</a></li>--%>
                        <%--<li class="tab col s2"><a href="#execute-code">Execute</a></li>--%>
                        <li class="tab col s2"><a href="#json-inout">JSON</a></li>
                    </ul>

                    <div class="tab-content">

                        <div class="tab-pane" id="svg-shapes">
                            <p>Comic Templates:</p>

                            <ul class="svg-shapes">
                                <li><button class="btn btn-small shape" id="shape1">2 panes</button></li>
                                <%--<li><button class="btn btn-small shape" id="shape25"><strong>36</strong> paths</button></li>--%>
                                <%--<li><button class="btn btn-small shape" id="shape36"><strong>41</strong> paths</button></li>--%>
                                <%--<li><button class="btn btn-small shape" id="shape58"><strong>54</strong> paths</button></li>--%>
                                <%--<li><button class="btn btn-small shape" id="shape59"><strong>57</strong> paths</button></li>--%>
                                <%--<li><button class="btn btn-small shape" id="shape8"><strong>65</strong> paths</button></li>--%>
                                <%--<li><button class="btn btn-small shape" id="shape151">Lighthouse(<strong>78</strong> paths)</button></li>--%>
                                <%--<li><button class="btn btn-small shape" id="shape17"><strong>87</strong> paths</button></li>--%>
                            </ul>

                            <p>Speech bubbles:</p>

                            <ul class="svg-shapes">
                                <li><button class="btn btn-small shape" id="shape100">Bubble</button></li>
                            </ul>

                        </div>

                        <div class="tab-pane" id="simple-shapes">
                            <p>Add <strong>simple shapes</strong> to canvas:</p>
                            <p>
                                <button type="button" class="btn rect" ng-click="addRect()">Rectangle</button>
                                <button type="button" class="btn circle" ng-click="addCircle()">Circle</button>
                                <button type="button" class="btn triangle" ng-click="addTriangle()">Triangle
                                </button>
                                <button type="button" class="btn line" ng-click="addLine()">Line</button>
                                <button type="button" class="btn polygon" ng-click="addPolygon()">Polygon</button>
                            </p>

                            <p>
                                <button class="btn" ng-click="addText()">Add text</button>
                            </p>

                            <%--<p>Add <strong>images</strong> to canvas:</p>--%>
                            <%--<p>--%>
                            <%--<button type="button" class="btn image1" ng-click="addImage1()">Image 1 (pug)--%>
                            <%--</button>--%>
                            <%--<button type="button" class="btn image2" ng-click="addImage2()">Image 2 (google)--%>
                            <%--</button>--%>
                            <%--<button type="button" class="btn image3" n-click="addImage3()">Image 3 (printio)--%>
                            <%--</button>--%>
                            <%--</p>--%>

                            <%--<p>Add <strong>gradient-based shapes</strong> to canvas:</p>--%>

                            <%--<p>--%>
                            <%--<button class="btn shape" id="shape74">Gradient 1</button>--%>
                            <%--<button class="btn shape" id="shape66">Gradient 2</button>--%>
                            <%--<button class="btn shape" id="shape75">Gradient 3</button>--%>
                            <%--<button class="btn shape" id="shape148">Gradient 4</button>--%>
                            <%--</p>--%>

                            <%--<p>Add <strong>arcs</strong> and misc to canvas:</p>--%>

                            <%--<p>--%>
                            <%--<button class="btn shape" id="shape104">Arc(s) 1</button>--%>
                            <%--<button class="btn shape" id="shape105">Arc(s) 2</button>--%>
                            <%--<button class="btn shape" id="shape106">Arc(s) 3</button>--%>
                            <%--<button class="btn shape" id="shape107">Arc(s) 4</button>--%>
                            <%--</p>--%>
                            <%--<p>--%>
                            <%--<button class="btn shape" id="shape103">Transformed paths</button>--%>
                            <%--</p>--%>
                            <%--<p>--%>
                            <%--<button class="btn shape" id="shape54">Image</button>--%>
                            <%--</p>--%>
                        </div>

                        <div class="tab-pane active" id="object-controls-pane">
                            <div id="global-controls">
                                <p>
                                    Rasterize canvas to
                                    <button class="btn btn-success" id="rasterize" ng-click="rasterize()">
                                        Image
                                    </button>
                                    <%--<button class="btn btn-success" id="rasterize-svg" ng-click="rasterizeSVG()">--%>
                                    <%--SVG--%>
                                    <%--</button>--%>
                                    <button class="btn btn-success" id="rasterize-json" ng-click="rasterizeJSON()">
                                        JSON
                                    </button>
                                </p>
                                <p>
                                    <button class="btn btn-danger clear" ng-click="confirmClear()">Clear canvas
                                    </button>
                                </p>
                            </div>

                            <div class="object-controls" object-buttons-enabled="getSelected()">

                                <div style="margin-top:10px;">
                                    <p>
                                        <button class="btn btn-object-action" id="remove-selected"ng-click="removeSelected()">Remove selected object/group</button>
                                    </p>

                                    <button class="btn btn-lock btn-object-action"
                                            ng-click="setHorizontalLock(!getHorizontalLock())"
                                            ng-class="{'btn-inverse': getHorizontalLock()}">
                                        {[ getHorizontalLock() ? 'Unlock horizontal movement' : 'Lock horizontal movement' ]}
                                    </button>
                                    <br>
                                    <button class="btn btn-lock btn-object-action"
                                            ng-click="setVerticalLock(!getVerticalLock())"
                                            ng-class="{'btn-inverse': getVerticalLock()}">
                                        {[ getVerticalLock() ? 'Unlock vertical movement' : 'Lock vertical movement']}
                                    </button>
                                    <br>
                                    <button class="btn btn-lock btn-object-action"
                                            ng-click="setScaleLockX(!getScaleLockX())"
                                            ng-class="{'btn-inverse': getScaleLockX()}">
                                        {[ getScaleLockX() ? 'Unlock horizontal scaling' : 'Lock horizontal scaling']}
                                    </button>
                                    <br>
                                    <button class="btn btn-lock btn-object-action"
                                            ng-click="setScaleLockY(!getScaleLockY())"
                                            ng-class="{'btn-inverse': getScaleLockY()}">
                                        {[ getScaleLockY() ? 'Unlock vertical scaling' : 'Lock vertical scaling' ]}
                                    </button>
                                    <br>
                                    <button class="btn btn-lock btn-object-action"
                                            ng-click="setRotationLock(!getRotationLock())"
                                            ng-class="{'btn-inverse': getRotationLock()}">
                                        {[ getRotationLock() ? 'Unlock rotation' : 'Lock rotation' ]}
                                    </button>
                                </div>

                                <div style="margin-top:10px">
                                    <p>
                                        <span style="margin-right: 10px">Origin X: </span>
                                        <label>Left
                                            <input type="radio" name="origin-x" class="origin-x btn-object-action" value="left" bind-value-to="originX">
                                        </label>
                                        <label>Center
                                            <input type="radio" name="origin-x" class="origin-x btn-object-action" value="center" bind-value-to="originX">
                                        </label>
                                        <label>Right
                                            <input type="radio" name="origin-x" class="origin-x btn-object-action" value="right" bind-value-to="originX">
                                        </label>
                                    </p>
                                    <p>
                                        <span style="margin-right: 10px">Origin Y: </span>
                                        <label>Top
                                            <input type="radio" name="origin-y" class="origin-y btn-object-action" value="top" bind-value-to="originY">
                                        </label>
                                        <label>Center
                                            <input type="radio" name="origin-y" class="origin-y btn-object-action" value="center" bind-value-to="originY">
                                        </label>
                                        <label>Bottom
                                            <input type="radio" name="origin-y" class="origin-y btn-object-action" value="bottom" bind-value-to="originY">
                                        </label>
                                    </p>
                                </div>

                                <div style="margin-top:10px;">
                                    <button id="send-backwards" class="btn btn-object-action"
                                            ng-click="sendBackwards()">Send backwards
                                    </button>
                                    <button id="send-to-back" class="btn btn-object-action"
                                            ng-click="sendToBack()">Send to back
                                    </button>
                                </div>

                                <div style="margin-top:4px;">
                                    <button id="bring-forward" class="btn btn-object-action"
                                            ng-click="bringForward()">Bring forwards
                                    </button>
                                    <button id="bring-to-front" class="btn btn-object-action"
                                            ng-click="bringToFront()">Bring to front
                                    </button>
                                </div>

                                <div style="margin-top:10px;">
                                    <button id="gradientify" class="btn btn-object-action" ng-click="gradientify()">
                                        Gradientify
                                    </button>
                                    <button id="shadowify" class="btn btn-object-action" ng-click="shadowify()">
                                        Shadowify
                                    </button>
                                    <button id="patternify" class="btn btn-object-action" ng-click="patternify()">
                                        Patternify
                                    </button>
                                    <button id="clip" class="btn btn-object-action" ng-click="clip()">
                                        Clip
                                    </button>
                                </div>
                            </div>
                            <div style="margin-top:10px;" id="drawing-mode-wrapper">

                                <button id="drawing-mode" class="btn btn-info"
                                        ng-click="setFreeDrawingMode(!getFreeDrawingMode())"
                                        ng-class="{'btn-inverse': getFreeDrawingMode()}">
                                    {[ getFreeDrawingMode() ? 'Exit free drawing mode' : 'Enter free drawing mode'
                                    ]}
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
                                    <br>
                                    <label for="drawing-line-width">Line width:</label>
                                    <input type="range" value="30" min="0" max="150"
                                           bind-value-to="drawingLineWidth">
                                    <br>
                                    <label for="drawing-color">Line color:</label>
                                    <input type="color" value="#005E7A" bind-value-to="drawingLineColor">
                                    <br>
                                    <label for="drawing-shadow-width">Line shadow width:</label>
                                    <input type="range" value="0" min="0" max="50"
                                           bind-value-to="drawingLineShadowWidth">
                                </div>
                            </div>
                        </div>

                        <%--<div class="tab-pane" id="load-svg-pane">--%>
                        <%--<textarea id="svg-console" bind-value-to="consoleSVG"></textarea>--%>
                        <%--<button type="button" class="btn btn-info" ng-click="loadSVG()">--%>
                        <%--Load--%>
                        <%--</button>--%>
                        <%--<button type="button" class="btn" ng-click="loadSVGWithoutGrouping()">--%>
                        <%--Load without grouping--%>
                        <%--</button>--%>
                        <%--</div>--%>

                        <%--<div class="tab-pane" id="execute-code">--%>
                        <%--<textarea id="canvas-console" bind-value-to="console"></textarea>--%>
                        <%--<button type="button" class="btn btn-info" ng-click="execute()">Execute</button>--%>
                        <%--</div>--%>

                        <div class="tab-pane" id="json-inout">
                            <textarea id="json-console" bind-value-to="consoleJSON"></textarea>
                            <button type="button" class="btn btn-info" ng-click="loadJSON()">
                                Load
                            </button>
                            <button type="button" class="btn btn-info" onclick="save()">
                                    <%--ng-click="saveJSON()">--%>
                                Save
                            </button>
                        </div>

                    </div>

                </div>
                    <%--<input name="canvas_JSON" id="canvas_JSON" form="comic_upload" hidden>--%>
                    <%--<input type="file" name="canvas_image" id="canvas_image" form="comic_upload" hidden>--%>

                <script src="js/font_definitions.js"></script>
                <script>
                    var kitchensink = {};
                    var canvas = new fabric.Canvas('canvas');

                    function save(){
                        var string = JSON.stringify(canvas);
//                        console.log(string);

                        var url = canvas.toDataURL("image/jpeg");//.replace(/^data:image\/(png|jpg);base64,/, "");
//                        console.log(url);


                        var blobBin = atob(url.split(',')[1]);
                        var array = [];
                        for(var i = 0; i < blobBin.length; i++) {
                            array.push(blobBin.charCodeAt(i));
                        }
                        var file=new Blob([new Uint8Array(array)], {type: 'image/png'});

//                        $("#canvas_JSON").val(string);
//                        $("#canvas_image").val(file);

                        var formdata = new FormData();
                        formdata.append("canvas_image", file);
                        formdata.append("canvas_JSON", string);
                        formdata.append("series_title", $("#series_title").val());
                        formdata.append("issue_title", $("#issue_title").val());
                        formdata.append("volume", $("#volume").val());
                        formdata.append("issue", $("#issue").val());
                        formdata.append("genre", $("#genre_select").val());
                        formdata.append("description", $("#description").val());

                        $.ajax({
                            url: "${create}",
                            type: "POST",
                            data: formdata,
                            processData: false,
                            contentType: false,
                        }).done(function(respond){
                            alert(respond);
                        });
//                        var options = {
//                            data:formdata,
//                            success: respond
//                        };
//                        $("#comic_upload").ajaxForm(options);


                        <%--$.ajax({--%>
                            <%--url : "${create}",--%>
                            <%--type : "POST",--%>
                            <%--enctype: 'multipart/form-data',--%>
                            <%--data : {--%>
                                <%--canvas_JSON : string,--%>
                                <%--canvas_image : url--%>
                            <%--},--%>
                            <%--success: function () {--%>
                                <%--console.log("Data Uploaded: ");--%>
                            <%--}--%>
                        <%--});--%>
                    }

                    function respond(){
                        console.log("DONE");
                    }
                </script>

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
                        <input id="series_title" type="text" class="validate" name="series_title" required>
                        <label for="series_title">Series Title</label>
                    </div>
                    <div class="input-field titles issues">
                        <input id="issue_title" type="text" class="validate" name="issue_title" required>
                        <label for="issue_title">Issue Title</label>
                    </div>
                    <div class="input-field titles">
                        <input id="volume" type="number" class="validate" name="volume" required>
                        <label for="volume">Volume</label>
                    </div>
                    <div class="input-field titles issues">
                        <input id="issue" type="number" class="validate" name="issue" required>
                        <label for="issue">Issues</label>
                    </div>



                    <div class="input-field col s11">
                        <select name="genre" id="genre_select" required>
                            <option value="" disabled selected>Choose your genre</option>
                            <option value="action">Action</option>
                            <option value="comedy">Comedy</option>
                            <option value="drama">Drama</option>
                            <option value="horror">Horror</option>
                            <option value="fantasy">Fantasy</option>
                            <option value="romance">Romance</option>
                            <option value="sport">Sports</option>
                        </select>
                    </div>


                    <div class="input-field col s12">
                                        <textarea id="description" class="materialize-textarea" name="description"
                                                  required></textarea>
                        <label for="description">Description of the comic</label>
                    </div>
                <%--</form>--%>

            </div>

            <div class="pad-top-20"></div>
            <div class="pad-top-20"></div>
            <!-- Browse and Submit buttons -->
            <div class="col s12">
                <%--<div class="file-field input-field">--%>
                    <%--<div class="waves-effect waves-light btn cyan lighten-2"><i--%>
                            <%--class="material-icons right">cloud_upload</i>Browse</input>--%>
                        <%--<input type="file" multiple form="comic_upload" name="upload_images">--%>
                    <%--</div>--%>
                    <%--<div class="file-path-wrapper">--%>
                        <%--<input class="file-path validate" type="text"--%>
                               <%--placeholder="Upload one or more files">--%>
                    <%--</div>--%>
                <%--</div>--%>


                <%--<div class="pad-top-20"></div>--%>
                <%--<button id="submit" class="waves-effect waves-light btn cyan lighten-2 center"--%>
                        <%--form="comic_upload" type="submit"><i--%>
                        <%--class="material-icons right">send</i>Submit--%>
                <%--</button>--%>
            </div>

        </div>

        <!-- Start of Add button -->
        <div id="new_comic_button" class="fixed-action-btn" style="bottom: 45px; right: 24px;">
            <a class="btn-floating btn-large red waves-effect tooltipped" data-position="top"
               data-delay="50" data-tooltip="Create new comic">
                <i class="large material-icons">add</i>
            </a>
        </div>
        <!-- End of Add button -->

    </main>

    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>