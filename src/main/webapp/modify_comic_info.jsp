<%--
  Created by IntelliJ IDEA.
  User: stevenliao
  Date: 5/5/16
  Time: 12:34 PM
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

    <%--<!-- For FabricJS Canvas -->--%>
    <%--<script type="text/javascript" src="js/prism.min.js"></script>--%>
    <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.6/angular.min.js"></script>--%>

    <%--<script type="text/javascript" src="js/paster.js"></script>--%>
    <%--<script type="text/javascript" src="js/jquery.mousewheel.min.js"></script>--%>

    <%--<link href='http://fonts.googleapis.com/css?family=Plaster' rel='stylesheet' type='text/css'>--%>
    <%--<link href='http://fonts.googleapis.com/css?family=Engagement' rel='stylesheet' type='text/css'>--%>

    <script type="text/javascript" src="js/font_definitions.js"></script>

    <title>Modify Comic Info</title>
    <link rel="icon" href="http://rocketdock.com/images/screenshots/CBR.png">
</head>

<body class="background">

    <!-- Outer most container -->
    <div class="container">

        <jsp:include page="header.jsp"/>

        <!-- Main body-->
        <main class="main body body-background-color">

            <div class="pad-top-20"></div>
            <div class="pad-top-20"></div>

            <!-- The upload section -->
            <div id="modify">
                <div class="container-1">

                    <div class="row">

                        <!-- Comic Cover -->
                        <div class="col s3">
                            <div class="card hoverable cyan lighten-3" onclick="">
                                <div class="card-image">
                                    <img id="cover_image" src="${current_comic.coverPage}" style="max-height: 200px; min-height:200px">
                                </div>
                                <div class="card-content white-text">
                                    <p class="flow-text center">Cover</p>
                                </div>
                            </div>
                        </div>

                        <%--<script>--%>
                            <%--$(document).ready(function () {--%>
                                <%--var options = {--%>
                                    <%--beforeSend: function () {--%>
                                        <%--console.log("Sending");--%>
                                    <%--},--%>
                                    <%--success: function (data, status) {--%>
                                        <%--console.log(data + status);--%>
                                        <%--var req = data.split(',');--%>
                                        <%--window.location.href = "/editimages?series_title=" + req[0] +--%>
                                                <%--"&issue_title=" + req[1] + "&volume=" + req[2] +--%>
                                                <%--"&issue=" + req[3];--%>
                                    <%--}--%>
                                <%--}--%>
                                <%--$("#comic_upload").ajaxForm(options);--%>
                            <%--});--%>
                        <%--</script>--%>
                        <!-- Upload information -->
                        <div class="col s9">
                            <div class="container-1">
                                <form action="/modifycomicinfo" method="post" id="modify_comic_info" enctype="multipart/form-data">
                                    <div class="input-field titles">
                                        <input id="series_title" type="text" class="validate" name="series_title" value="${current_comic.seriesTitle}" required >
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
                                        <select id="genre" name="genre" form="modify_comic_info" required>
                                            <option value="" disabled>Choose your genre</option>
                                            <option value="action">Action</option>
                                            <option value="comedy">Comedy</option>
                                            <option value="drama">Drama</option>
                                            <option value="horror">Horror</option>
                                            <option value="fantasy">Fantasy</option>
                                            <option value="romance">Romance</option>
                                            <option value="sport">Sports</option>
                                        </select>
                                    </div>

                                    <script>
                                        $("#genre").val("${current_comic.genre}");
                                    </script>

                                    <div class="input-field col s12">
                                        <textarea id="description" class="materialize-textarea" name="description"
                                                   required>${current_comic.description}</textarea>
                                        <label for="description">Description of the comic</label>
                                    </div>

                                </form>
                                    <div class="pad-top-20"></div>
                                    <div class="pad-top-20"></div>

                                    <!-- Submit button -->
                                    <div class="col s12">
                                        <div class="pad-top-20"></div>
                                        <button id="submit" class="waves-effect waves-light btn cyan lighten-2 center"
                                                form="modify_comic_info" type="submit"><i class="material-icons right">send</i>Save
                                        </button>
                                    </div>

                            </div>
                        </div>
                    </div>

                    <div class="pad-top-20"></div>
                    <div class="pad-top-20"></div>

                </div>
                <!-- End of upload section -->
            </div>
        </main>

        <jsp:include page="footer.jsp"/>

    </div>
</body>

</html>
