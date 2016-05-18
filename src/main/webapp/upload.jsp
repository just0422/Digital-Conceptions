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

        <div class="pad-top-20"></div>
        <div class="pad-top-20"></div>

        <%-- Loading spinner --%>
        <div id="spinner" hidden>
            <i class="fa fa-spinner fa-pulse fa-3x fa-fw margin-bottom"></i>
            <span class="sr-only">Loading...</span>
        </div>
        <!-- Buttons for My Comics and Upload -->
        <div class="row">
            <div class="col s12">

                <div class="container">
                    <!-- My Comic Button-->
                    <a id="my_comic_button" class="waves-effect waves-light btn cyan lighten-2 left"><i
                            class="material-icons right">dashboard</i>My Comics</a>

                    <!-- Upload button-->
                    <a id="upload_button" class="waves-effect waves-light btn cyan lighten-2 right"><i
                            class="material-icons right">file_upload</i>Upload</a>
                </div>

            </div>
        </div>

        <div class="pad-top-20"></div>


        <!-- The upload section -->
        <div id="upload" style="display: none">
            <div class="container-1">


                <div class="row">

                    <!-- Comic Cover -->
                    <div class="col s3">
                        <div class="card hoverable cyan lighten-3" onclick="">
                            <div class="card-image">
                                <img id="cover_image" src="image/9.jpg" style="max-height: 200px; min-height:200px">
                            </div>
                            <div class="card-content white-text">
                                <p class="flow-text center">Cover</p>
                            </div>
                        </div>
                    </div>

                    <script>
                        $(document).ready(function () {
                            var options = {
                                beforeSend: function () {
                                    console.log("Sending");
                                    $("#spinner").show();
                                    $("#failure").attr('display', 'none');
                                    $("#success").attr('display', 'none');
                                },
                                complete: function(){
                                    $("#spinner").hide();
                                    $("#success").attr('display', 'inline-block');
                                },
                                error: function(){
                                    $("#failure").attr('display', 'inline-block');
                                    $("#spinner").hide();
                                },
                                success: function (data, status) {
                                    console.log(data + status);
                                    var req = data.split(',');
                                    window.location.href = "/editimages?series_title=" + req[0] +
                                            "&issue_title=" + req[1] + "&volume=" + req[2] +
                                            "&issue=" + req[3];
                                }
                            }
                            $("#comic_upload").ajaxForm(options);
                        });
                    </script>
                    <!-- Upload information -->
                    <div class="col s9">
                        <div class="container-1">
                            <form action="${upload}" method="post" id="comic_upload" enctype="multipart/form-data">
                                <div class="input-field titles">
                                    <input id="series_title" type="text" class="validate" name="series_title" required >
                                    <label for="series_title">Series Title</label>
                                </div>
                                <div class="input-field titles issues">
                                    <input id="issue_title" type="text" class="validate" name="issue_title" required >
                                    <label for="issue_title">Issue Title</label>
                                </div>
                                <div class="input-field titles">
                                    <input id="volume" type="number" class="validate" name="volume" required >
                                    <label for="volume">Volume</label>
                                </div>
                                <div class="input-field titles issues">
                                    <input id="issue" type="number" class="validate" name="issue" required >
                                    <label for="issue">Issues</label>
                                </div>



                                <div class="input-field col s11">
                                    <select name="genre" form="comic_upload" required>
                                        <option value="" disabled selected>Choose your genre</option>
                                        <option value="Action">Action</option>
                                        <option value="Comedy">Comedy</option>
                                        <option value="Drama">Drama</option>
                                        <option value="Horror">Horror</option>
                                        <option value="Fantasy">Fantasy</option>
                                        <option value="Romance">Romance</option>
                                        <option value="Sport">Sports</option>
                                    </select>
                                </div>


                                <div class="input-field col s12">
                                        <textarea id="description" class="materialize-textarea" name="description"
                                                  required></textarea>
                                    <label for="description">Description of the comic</label>
                                </div>
                            </form>

                        </div>

                        <div class="pad-top-20"></div>
                        <div class="pad-top-20"></div>
                        <!-- Browse and Submit buttons -->
                        <div class="col s12">
                            <div class="file-field input-field">
                                <div class="waves-effect waves-light btn cyan lighten-2"><i
                                        class="material-icons right">cloud_upload</i>Browse</input>
                                    <input type="file" multiple form="comic_upload" name="upload_images" required>
                                </div>
                                <div class="file-path-wrapper">
                                    <input class="file-path validate" type="text"
                                           placeholder="Upload one or more files">
                                </div>
                            </div>


                            <div class="pad-top-20"></div><div>
                            <button id="submit" class="waves-effect waves-light btn cyan lighten-2 center"
                                    form="comic_upload" type="submit"><i
                                    class="material-icons right">send</i>Submit
                            </button>
                            <div class="pad-top-10"></div>
                            <div id="answer_result">
                                <strong id="success">Success! Redirecting...</strong><br/>
                                <strong id="failure">Oops! Something went wrong!</strong>
                            </div></div>

                        </div>

                    </div>

                </div>
            </div>
            <div class="pad-top-20"></div>
            <div class="pad-top-20"></div>

        </div>
        <!-- End of upload section -->

        <!-- Start of My Comic section -->
        <div id="my_comic">

            <!-- Start of empty_comic -->
            <!-- User hasn't create any comic -->
            <div id="empty_comic" style="display: none">
                <div class="center flow-text valign-wrapper" style="padding-top: 20%; padding-left: 25%">
                    <h4 class="valign"> You Haven't Created Anything Yet </h4>
                </div>
            </div>
            <!-- End of empty_comic-->

            <!-- Start of sample my_comic layout -->
            <div id="my_comic_content" class="container-1">
                <div class="row">
                    <!-- Start of left pointer -->
                    <%--<div class="col s1" style="float: left">--%>
                        <%--<div class="valign-wrapper" style="min-height: 80vh;">--%>
                            <%--<i class="valign material-icons medium hoverable-1">keyboard_arrow_left</i>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <!-- End of left pointer -->


                    <div class="col s10">
                        <div class="row">
                            <c:forEach var="comic" items="${my_comics}">
                                <c:set var="req_details" value="series_title=${comic.seriesTitle}&issue_title=${comic.issueTitle}&volume=${comic.volume}&issue=${comic.issue}&new=false"/>
                                <div class="col s3">
                                    <c:choose>
                                        <c:when test="${comic.isCanvas}">
                                            <a href="/create?${req_details}">
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/editimages?${req_details}">
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="card cyan lighten-3">
                                        <div class="card-image">
                                            <img src="${comic.coverPage}" style="max-height: 200px; min-height:200px">
                                        </div>
                                        <div class="card-title center">${comic.seriesTitle}</div>
                                    </div>
                                    </a>
                                </div>
                            </c:forEach>
                            <c:forEach var="comic" items="${collaborations}">
                                <c:set var="req_details" value="series_title=${comic.seriesTitle}&issue_title=${comic.issueTitle}&volume=${comic.volume}&issue=${comic.issue}&new=false"/>
                                <div class="col s3">
                                    <c:choose>
                                    <c:when test="${comic.isCanvas}">
                                    <a href="/create?${req_details}">
                                        </c:when>
                                        <c:otherwise>
                                        <a href="/editimages?${req_details}">
                                            </c:otherwise>
                                            </c:choose>
                                            <div class="card cyan lighten-3">
                                                <div class="card-image">
                                                    <img src="${comic.coverPage}" style="max-height: 200px; min-height:200px">
                                                </div>
                                                <div class="card-title center">${comic.seriesTitle}</div>
                                            </div>
                                        </a>
                                </div>
                            </c:forEach>

                        </div>
                    </div>


                    <!-- Start of right pointer-->
                    <%--<div class="col s1" style="float: right;">--%>
                        <%--<div class="valign-wrapper" style="min-height: 80vh; max-height:80vh;">--%>
                            <%--<i class="valign material-icons medium hoverable-1">keyboard_arrow_right</i>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <!-- End of right pointer -->

                </div>
                <!-- End of the grid layout -->
                <div class="pad-top-20"></div>
            </div>
            <!-- End of sample my_comic layout-->
        </div>
        <!-- End of My Comic section -->


        <!-- Start of Add button -->
        <div id="new_comic_button" class="fixed-action-btn" style="bottom: 45px; left: 24px;">
            <a class="btn-floating btn-large red waves-effect tooltipped" href="/create?new=true">
                <i class="large material-icons">add</i>
            </a>
        </div>
        <!-- End of Add button -->

    </main>


    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>