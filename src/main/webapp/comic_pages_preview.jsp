<%--
  Created by IntelliJ IDEA.
  User: ZEXUN
  Date: 4/5/16
  Time: 12:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <%--<% System.out.println ("------------------------------------------------------------------"); %>--%>
    <%--<% System.out.println (((ComicInfo)request.getAttribute("current_comic")).getLocked()); %>--%>
    <%--<% System.out.println (((ComicInfo)request.getAttribute("current_comic")).getLockHolder()); %>--%>
    <%--<% System.out.println (((User)session.getAttribute("user")).getNickname()); %>--%>
    <%--<% System.out.println ("------------------------------------------------------------------"); %>--%>
    <c:choose>
        <c:when test="${current_comic.locked && user.nickname != current_comic.lockHolder}">
            <div class="col s4 right-align" style="padding-top: 5px">
                <a id="my_comics" class="waves-effect waves-light btn black lighten-2 left" href="/upload">Back
                    to My Comics</a>
            </div>
            <h1 class="center"><i id="page_locked" class="fa fa-lock fa-5x" aria-hidden="true"></i></h1>
            <h1 class="center">${current_comic.lockHolder} is currently editing</h1>
        </c:when>
        <c:otherwise>
            <main class="main body body-background-color">
                <div id="spinner" hidden>
                    <i class="fa fa-spinner fa-pulse fa-3x fa-fw margin-bottom"></i>
                    <span class="sr-only">Loading...</span>
                </div>

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
                        );
                        window.location.href = "/upload";
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
                <div class="row">
                    <c:choose>
                    <c:when test="${user.nickname != current_comic.username}">
                        <div class="input-field col s12">

                        </c:when>
                        <c:otherwise>
                            <div class="input-field col s6">

                            </c:otherwise>
                            </c:choose>
                        <textarea id="description" class="materialize-textarea" name="description" rows="2"
                                                      required>${current_comic.description}</textarea>
                        <label for="description">Description of the comic</label>
                    </div>
                    <c:if test="${user.nickname == current_comic.username}">
                        <c:set var="collab1" value="${fn:length(current_comic.collaborators) > 0 ? current_comic.collaborators[0] : ''}"/>
                        <c:set var="collab2" value="${fn:length(current_comic.collaborators) > 1 ? current_comic.collaborators[1] : ''}"/>
                        <c:set var="collab3" value="${fn:length(current_comic.collaborators) > 2 ? current_comic.collaborators[2] : ''}"/>
                        <c:set var="collab4" value="${fn:length(current_comic.collaborators) > 3 ? current_comic.collaborators[3] : ''}"/>
                        <div class="col s6">
                            <div class="row">
                                <h5 class="center">Collaborators</h5>
                                <ul class="col s6" style="margin: 0px;">
                                    <li><input class="collab" type="text" style="margin: 0px;"
                                               value="${collab1}"></li>
                                    <li><input class="collab" type="text" style="margin: 0px;"
                                               value="${collab2}"></li>
                                </ul>
                                <ul class="col s6" style="margin: 0px;">
                                    <li><input class="collab" type="text" style="margin: 0px;"
                                               value="${collab3}"></li>
                                    <li><input class="collab" type="text" style="margin: 0px;"
                                               value="${collab4}"></li>
                                </ul>
                            </div>
                        </div>
                    </c:if>

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
                    $(window).on('beforeunload', function () {
                        $.ajax({
                            type: "POST",
                            url: "/editimages",
                            data: {
                                series_title : '${current_comic.seriesTitle}',
                                issue_title : '${current_comic.issueTitle}',
                                volume : '${current_comic.volume}',
                                issue : '${current_comic.issue}',
                                unlock : 'yes'
                            }
                        });
                    });

                    function select(element) {
                        $(element).toggleClass("selected-page");
                    }

                    function trash() {
                        var elements = document.getElementsByClassName("page-image");
                        for (var i = 0; i < elements.length; i++) {
                            if ($($(elements[i]).find('img')[0]).hasClass("selected-page")) {
                                $(elements[i]).remove();
                            }
                        }
                    }

                    function save_images() {
                        var formdata = new FormData();

                        var elements = document.getElementsByClassName("page-image");
                        var links=[];
                        for (var i = 0; i < elements.length; i++) {
                            links.push($($(elements[i]).find('img')[0]).attr('src'));
                        }

                        var collaborators=[];
                        $.each($(".collab"), function(index, item) {
                            if ($(item).val().length > 0)
                                collaborators.push($(item).val());
                        });

                        if (collaborators != null){
                            formdata.append("old_collaborators", ['${collab1}','${collab2}','${collab3}','${collab4}'].toString());
                            formdata.append("new_collaborators", collaborators.toString());
                        }

                        console.log(formdata);

//                        $.post("/editimages", { series_title : "hii"});
                        $("#spinner").show();

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
                                    new_genre : $('#genre_select').val(),
                                    new_description : $('#description').val(),
                                    images : links.toString(),
                                    old_collaborators : ['${collab1}','${collab2}','${collab3}','${collab4}'].toString(),
                                    new_collaborators : collaborators.toString()
                                },
                                function(data){
                                    $("#spinner").hide();
                                    window.location.href = "/upload";
                                });
//
//                        $.ajax({
//                            url: "/editimages",
//                            data: { series_title : "hiiii"},
//                            method: "post",
//                            processData: false,
//                            contentType: false,
//                            beforeSend: function () {
//                                console.log("Sending");
//                                $("#spinner").show();
////                                $("#failure").attr('display', 'none');
////                                $("#success").attr('display', 'none');
//                            },
//                            complete: function(){
//                                $("#spinner").hide();
////                                $("#success").attr('display', 'inline-block');
//                            },
//                            error: function(xhr, ajaxOptions, thrownError) {
//                                alert(xhr.status);
//                                alert(xhr.responseText);
//                                alert(thrownError);
////                                $("#failure").attr('display', 'inline-block');
//                                $("#spinner").hide();
//
//                            },
//                            success: function () {
//                                window.location.href = "/upload";
//                            }
//                        });
                    }

                    $(document).ready(function () {
                        $("#sortable").sortable();
                    });

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
        </c:otherwise>
    </c:choose>


    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>