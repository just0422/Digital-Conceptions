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
        <%--<form action="demo_form.asp">
            <input type="file" name="upload" accept="image/*">
            <input type="submit">
        </form>--%>

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


        <div class="container-1">

            <form action="#">


                <div class="row">

                    <!-- Comic Cover -->
                    <div class="col s3">

                        <div class="card hoverable grey lighten-3" onclick="">
                            <div class="card-image">
                                <img src="image/9.jpg">
                            </div>
                            <div class="card-content white-text">
                                <p class="flow-text center">Cover</p>
                            </div>
                        </div>
                    </div>


                    <!-- Upload information -->


                    <div class="col s9">
                        <div class="container-1">
                            <div class="input-field">
                                <input id="title" type="text" class="validate">
                                <label for="title">Title</label>
                            </div>


                            <div class="row">
                                <div class="input-field col s12">
                                    <select>
                                        <option value="" disabled selected>Choose your genre</option>
                                        <option value="action">Action</option>
                                        <option value="drama">Drama</option>
                                        <option value="comedy">Comedy</option>
                                        <option value="thriller">Thriller</option>
                                        <option value="life">Slice of Life</option>
                                        <option value="sport">Sport</option>
                                        <option value="science">Sci-Fi</option>
                                    </select>

                                </div>
                            </div>


                            <div class="input-field">
                                <input id="volumn" type="text" class="validate">
                                <label for="volumn">Volumn</label>
                            </div>

                            <div class="input-field">
                                <textarea id="description" class="materialize-textarea"></textarea>
                                <label for="description">Description of the comic</label>
                            </div>

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
        </div>

    </main>


    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>