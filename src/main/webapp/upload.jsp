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
    <script type="text/javascript" src="js/materialize.min.js"></script>

    <!--Impot custom css-->
    <link type="text/css" rel="stylesheet" href="css/custom.css">

    <!--Import custom js-->
    <script type="text/javascript" src="js/customJS.js"></script>

    <script type="text/javascript" src="js/customJS_2.js"></script>

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
        <!-- Buttons for My Comics and Upload -->
        <div class="row">
            <div class="col s12">

                <div class="container">
                    <!-- My Comic Button-->
                    <a id="my_comic_button" class="waves-effect waves-light btn cyan lighten-2 left"><i
                            class="material-icons right">dashboard</i>My Comic</a>

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

                <form action="#">


                    <div class="row">

                        <!-- Comic Cover -->
                        <div class="col s3">

                            <div class="card hoverable cyan lighten-3" onclick="">
                                <div class="card-image">
                                    <img src="image/9.jpg">
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
                                    },
                                    success: function (resp) {
                                        console.log(resp);
                                    }
                                }
                                $("#comic_upload").ajaxForm(options);
                                <%--$('#comic_upload').submit(function(e){--%>
                                <%--var postData = $(this).serializeArray();--%>
                                <%--console.log("Uploading " + postData);--%>

                                <%--$.post(--%>
                                <%--'<c:out value="${upload}"/>',--%>
                                <%--data : {--%>
                                <%--series_title : $('#series_title').val(),--%>
                                <%--issue_title : $("#issue_title").val()--%>
                                <%--},--%>
                                <%--function (text) {--%>
                                <%--console.log("Returned " + text);--%>
                                <%--console.log("0 : Failure\n1 : Success");--%>
                                <%--}--%>
                                <%--)--%>
                                <%--e.preventDefault();--%>
                                <%--})--%>
                            });
                        </script>
                        <!-- Upload information -->
                        <div class="col s9">
                            <div class="container-1">
                                <form action="${upload}" method="post" id="comic_upload" enctype="multipart/form-data">
                                    <div class="input-field titles">
                                        <input id="series_title" type="text" class="validate" name="series_title">
                                        <label for="series_title">Series Title</label>
                                    </div>
                                    <div class="input-field titles issues">
                                        <input id="issue_title" type="text" class="validate" name="issue_title">
                                        <label for="issue_title">Issue Title</label>
                                    </div>
                                    <div class="input-field titles">
                                        <input id="volume" type="number" class="validate" name="volume">
                                        <label for="volume">Volume</label>
                                    </div>
                                    <div class="input-field titles issues">
                                        <input id="issue" type="number" class="validate" name="issue">
                                        <label for="issue">Issues</label>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col s12">
                                            <select name="genre" form="comic_upload" required>
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
                                    </div>

                                    <div class="input-field">
                                        <textarea id="description" class="materialize-textarea" name="description"
                                                  required></textarea>
                                        <label for="description">Description of the comic</label>
                                    </div>
                                </form>

                            </div>

                            <!-- Preview of the uploaded comics -->
                            <div class="container-1">

                                <%--<!-- Small cards for uploaded comics preview -->--%>
                                <%--<div class="row">--%>
                                <%--<div class="col s3">--%>
                                <%--<div class="card cyan lighten-3" onclick="">--%>
                                <%--<div class="card-image">--%>
                                <%--<img src="image/preview.jpg">--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <%--<div class="card cyan lighten-3" onclick="">--%>
                                <%--<div class="card-image">--%>
                                <%--<img src="image/preview.jpg">--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <%--</div>--%>


                                <%--<div class="col s3">--%>
                                <%--<div class="card cyan lighten-3" onclick="">--%>
                                <%--<div class="card-image">--%>
                                <%--<img src="image/preview.jpg">--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <%--<div class="card cyan lighten-3" onclick="">--%>
                                <%--<div class="card-image">--%>
                                <%--<img src="image/preview.jpg">--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <%--<div class="col s3">--%>
                                <%--<div class="card cyan lighten-3" onclick="">--%>
                                <%--<div class="card-image">--%>
                                <%--<img src="image/preview.jpg">--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <%--<div class="card cyan lighten-3" onclick="">--%>
                                <%--<div class="card-image">--%>
                                <%--<img src="image/preview.jpg">--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <%--<div class="col s3">--%>
                                <%--<div class="card cyan lighten-3" onclick="">--%>
                                <%--<div class="card-image">--%>
                                <%--<img src="image/preview.jpg">--%>
                                <%--</div>--%>
                                <%--</div>--%>

                                <%--<div class="card cyan lighten-3" onclick="">--%>
                                <%--<div class="card-image">--%>
                                <%--<img src="image/preview.jpg">--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <%--</div>--%>


                                <div class="pad-top-20"></div>
                                <div class="pad-top-20"></div>
                                <!-- Browse and sbumt buttons -->
                                <div class="col s12">
                                    <div class="file-field input-field">
                                        <div class="waves-effect waves-light btn cyan lighten-2"><i
                                                class="material-icons right">cloud_upload</i>Browse</input>
                                            <input type="file" multiple>
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text"
                                                   placeholder="Upload one or more files">
                                        </div>
                                    </div>


                                    <div class="pad-top-20"></div>
                                    <button id="submit" class="waves-effect waves-light btn cyan lighten-2 center"><i
                                            class="material-icons right">send</i>Submit
                                    </button>
                                </div>

                            </div>

                        </div>
                    </div>
                </form>
                <div class="pad-top-20"></div>
                <div class="pad-top-20"></div>

            </div>
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
                <div class="row" style="padding-left: 6%">
                    <!-- Start of left pointer -->
                    <div class="col s1">

                        <div class="valign-wrapper" style="min-height: 80vh">
                            <i class="valign material-icons medium hoverable-1">keyboard_arrow_left</i>
                        </div>

                    </div>
                    <!-- End of left pointer -->

                    <div class="center">
                        <!-- Start of first column -->
                        <div class="col s3">

                            <!--Start of first card-->
                            <div class="card cyan lighten-3" onclick="">
                                <div class="card-image">
                                    <img src="image/6.jpg">
                                </div>
                                <div class="card-title center">Batman</div>
                            </div>
                            <!--End of first card-->

                            <!--Start of second card-->
                            <div class="card cyan lighten-3" onclick="">
                                <div class="card-image">
                                    <img src="image/6.jpg">
                                </div>
                                <div class="card-title center">Batman</div>
                            </div>
                            <!--End of second card-->

                            <!--Start of third card-->
                            <div class="card cyan lighten-3" onclick="">
                                <div class="card-image">
                                    <img src="image/6.jpg">
                                </div>
                                <div class="card-title center">Batman</div>
                            </div>
                            <!--End of third card-->

                        </div>
                        <!-- End of the first column-->


                        <!-- start of second column -->
                        <div class="col s3">
                            <!--Start of first card-->
                            <div class="card cyan lighten-3" onclick="">
                                <div class="card-image">
                                    <img src="image/6.jpg">
                                </div>
                                <div class="card-title center">Batman</div>
                            </div>
                            <!--End of first card-->

                            <!--Start of second card-->
                            <div class="card cyan lighten-3" onclick="">
                                <div class="card-image">
                                    <img src="image/6.jpg">
                                </div>
                                <div class="card-title center">Batman</div>
                            </div>
                            <!--End of second card-->

                            <!--Start of third card-->
                            <div class="card cyan lighten-3" onclick="">
                                <div class="card-image">
                                    <img src="image/6.jpg">
                                </div>
                                <div class="card-title center">Batman</div>
                            </div>
                            <!--End of third card-->
                        </div>
                        <!-- End of second column-->


                        <!-- Start of third column -->
                        <div class="col s3">
                            <!--Start of first card-->
                            <div class="card cyan lighten-3" onclick="">
                                <div class="card-image">
                                    <img src="image/6.jpg">
                                </div>
                                <div class="card-title center">Batman</div>
                            </div>
                            <!--End of first card-->

                            <!--Start of second card-->
                            <div class="card cyan lighten-3" onclick="">
                                <div class="card-image">
                                    <img src="image/6.jpg">
                                </div>
                                <div class="card-title center">Batman</div>
                            </div>
                            <!--End of second card-->

                            <!--Start of third card-->
                            <div class="card cyan lighten-3" onclick="">
                                <div class="card-image">
                                    <img src="image/6.jpg">
                                </div>
                                <div class="card-title center">Batman</div>
                            </div>
                            <!--End of third card-->
                        </div>
                        <!-- End of third column-->
                    </div>

                    <!-- Start of right pointer-->
                    <div class="col s1">
                        <div class="valign-wrapper" style="min-height: 80vh">
                            <i class="valign material-icons medium hoverable-1">keyboard_arrow_right</i>
                        </div>
                    </div>
                    <!-- End of right pointer -->

                </div>
                <!-- End of the grid layout -->
                <div class="pad-top-20"></div>
            </div>
            <!-- End of sample my_comic layout-->

            <!-- Start of actual create comic secion -->
            <div id="create_canvas">

                <!-- Start of create tools -->
                <!-- End of create tools -->

            </div>
            <!-- End of actual create comic seciont -->


        </div>
        <!-- End of My Comic section -->


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