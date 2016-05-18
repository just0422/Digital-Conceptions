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

    <title>Home - Digital Conceptions</title>
    <script type="text/javascript" src="js/jquery-ui.js"></script>
    <link rel="icon" href="http://rocketdock.com/images/screenshots/CBR.png">
</head>

<body class="background">

<!-- Outer most container -->
<div class="container">

    <jsp:include page="header.jsp"/>

    <!-- Home Page -->
    <!-- Main body-->
    <main class="main body body-background-color">

        <script>
            $(document).ready(function(){
                // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
                $('.modal-trigger').leanModal({
                    dismissible: false
                });
//                $('#modal1').openModal();
            });
        </script>

        <div class="container-1 min-height">
            <div class="row">
                <div class="col s12 center flow-text">
                    <h4>Edit Comic</h4>
                    <div class="divider"></div>
                    <div class="pad-top-10"></div>
                    <div class="pad-top-10"></div>
                </div>
                <div class="col s4 right-align" style="padding-top: 5px">
                    <a id="my_comic_button" class="waves-effect waves-light btn black lighten-2 left" href="/upload">Back
                        to My Comics</a>
                </div>

                <div class="col s4 center-align" style="padding-top: 5px">
                    <a class="waves-effect waves-light btn red lighten-2 center modal-trigger" href="#modal1">Delete Comic</a>
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



                <div class="col s4 right-align">
                    <i id="delete" class="material-icons hoverable-1"  style="font-size: 3rem" onclick="trash()">delete_forever</i>
                    <i id="save" class="material-icons hoverable-1" style="font-size: 3rem" onclick="save_images()">save</i>
                </div>



                <input type="hidden" id="old_series_title" value="${current_comic.seriesTitle}">
                <input type="hidden" id="old_issue_title" value="${current_comic.issueTitle}">
                <input type="hidden" id="old_volume" value="${current_comic.volume}">
                <input type="hidden" id="old_issue" value="${current_comic.issue}">
                <input type="hidden" id="old_genre" value="${current_comic.genre}">
                <input type="hidden" id="old_description" value="${current_comic.description}">
                <div class="editor">
                    <div class="input-field modify_titles">
                        <input id="series" type="text" name="new_series_title" value="${current_comic.seriesTitle}">
                        <label for="series">Series Title</label>
                    </div>
                    <div class="input-field modify_titles modify_issues">
                        <input id="volume" type="number" class="validate" name="new_volume" value="${current_comic.volume}" required>
                        <label for="volume">Volume</label>
                    </div>
                    <div class="input-field modify_titles modify_issues">
                        <input id="issue_title" type="text" class="validate" name="new_issue_title" value="${current_comic.issueTitle}" required>
                        <label for="issue_title">Issue Title</label>
                    </div>
                    <div class="input-field modify_titles modify_issues">
                        <input id="issue" type="number" class="validate" name="new_issue" value="${current_comic.issue}" required>
                        <label for="issue">Issues</label>
                    </div>
                    <div class="input-field modify_titles modify_issues">
                        <select name="genre" id="genre_select">
                            <option value="" disabled>Choose genre</option>
                            <option value="Action">Action</option>
                            <option value="Comedy">Comedy</option>
                            <option value="Drama">Drama</option>
                            <option value="Horror">Horror</option>
                            <option value="Fantasy">Fantasy</option>
                            <option value="Romance">Romance</option>
                            <option value="Sport">Sports</option>
                        </select>
                        <label>Genre</label>
                    </div>
                </div>
                <script>
                    $(document).ready(function() {
                        $('select').material_select();
                        $("#genre_select select").val("${current_comic.genre}");
                });
                </script>
                <div class="input-field col s12">
                                        <textarea id="description" class="materialize-textarea" name="description" rows="2"
                                                  required>${current_comic.description}</textarea>
                    <label for="description">Description of the comic</label>
                </div>



                <c:set var="column" value="${0}"/>

                <ul id="sortable">
                    <c:forEach var="imgLink" items="${current_comic.urls}" varStatus="loop">
                        <li class="card hoverable cyan lighten-3 col s4 pad-top-10 page-image">
                            <div class="card-image">
                                <img id="img${column}" src="${imgLink}" onclick="select(this)">
                            </div>
                        </li>
                        <c:set var="column" value="${column + 1}"/>
                    </c:forEach>
                </ul>

                <script>
                    $(document).ready(function () {
                        var options = {
                            beforeSend: function () {
                                console.log("Sending");
                            },
                            success: function (data, status) {
//                                console.log(data + status);
//                                var req = data.split(',');
//                                window.location.href = "/editimages?series_title=" + req[0] +
//                                        "&issue_title=" + req[1] + "&volume=" + req[2] +
//                                        "&issue=" + req[3];
                            }
                        }
                        $("#comic_upload").ajaxForm(options);
                    });

                    function select(element) {
                        $(element).toggleClass("selected-page");
                    }

                    function trash() {
                        var elements = document.getElementsByClassName("page-image");
                        for (i = 0; i < elements.length; i++) {
                            if ($($(elements[i]).find('img')[0]).hasClass("selected-page")) {
                                $(elements[i]).remove();
                            }
                        }
                    }

                    function save_images() {
                        var elements = document.getElementsByClassName("page-image");
                        var links=[];
                        for (i = 0; i < elements.length; i++) {
                            links.push($($(elements[i]).find('img')[0]).attr('src'))
                        }

                        console.log(links);
                        $.post(
                            "/editimages",
                            {
                                series_title : '${current_comic.seriesTitle}',
                                issue_title : '${current_comic.issueTitle}',
                                volume : '${current_comic.volume}',
                                issue : '${current_comic.issue}',
                                new_series_title : $('#series').val(),
                                new_issue_title : $('#issue_title').val(),
                                new_volume : $('#volume').val(),
                                new_issue : $('#issue').val(),
                                images : links.toString()
                            },
                            function(data){
                                console.log("Response: " + data);
                                window.document.href = "/upload";
                        });
                    }

                    $(document).ready(function () {
                        $("#sortable").sortable();
                    })

                    $(document).keydown(function (e) {
                        var element = e.target.nodeName.toLowerCase();
                        if (element != 'input' && element != 'textarea'){
                            if (e.which == 8)
                                e.preventDefault();

                            if (e.which == 8 || e.which == 48)
                                trash();
                        }
                        console.log(e.which);
                    });
                </script>
            </div>
        </div>

        <!-- Divider -->
    </main>


    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>