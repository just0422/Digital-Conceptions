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

    <script type="text/javascript" src="js/jquery.star.rating.js"></script>

    <!--Impot custom css-->
    <link type="text/css" rel="stylesheet" href="css/custom.css">

    <script src="js/customJS_2.js"></script>

    <!--Import custom js-->
    <script type="text/javascript" src="js/customJS.js"></script>
    <script type="text/javascript" src="js/pagination.js"></script>

    <title>Comic Cover - Digital Conceptions</title>
</head>

<body class="background">

<!-- Outer most container -->
<div class="container">

    <jsp:include page="header.jsp"/>

    <!-- Main home page content-->
    <main class="main body body-background-color">

        <!-- Comic cover and control buttons-->

        <div class="card-1">
            <div class="card-content-1">

                <div class="row">

                    <div class="col s4">
                        <div class="card cyan lighten-3" onclick="">
                            <div class="card-image">
                                <img src="${current_comic.coverPage}">
                            </div>
                        </div>
                    </div>

                    <div class="col s5">

                        <!-- Comic Name-->
                        <div class="pad-top-10"></div>
                        <div class="pad-top-10"></div>
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Series Title:<span class="right">${requestScope.test_comic.seriesTitle}</span>
                            <div class="divider"></div>
                        </div>
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Issue Title:<span class="right">${current_comic.issueTitle}</span>
                            <div class="divider"></div>
                        </div>

                        <!-- Author Name-->
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Author:<span class="right">${current_comic.username}</span>
                            <div class="divider"></div>
                        </div>

                        <!-- Release Date-->
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Release Date:<span class="right">${current_comic.dateFormat}</span>
                            <div class="divider"></div>
                        </div>

                        <!-- Latest Chapter-->
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Latest Chapter:<span class="right">Bye</span>
                            <div class="divider"></div>
                        </div>

                        <!-- Current  Rating-->
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Current Rating:<span class="right">4</span>
                            <div class="divider"></div>
                        </div>

                        <div class="container-1">
                            <div class="pad-top-20"></div>
                            <div class="pad-top-20"></div>
                            <div class="center">
                                <a class="waves-effect waves-light btn lighten-3 modal-trigger"
                                   href="#reading">Start</a>
                                <a class="waves-effect waves-light btn">Subscribe</a>
                                <a class="waves-effect waves-light btn">Download</a>
                            </div>
                        </div>


                        <!-- Reading Modal -->
                        <div id="reading" class="modal">

                            <!-- Start of modal content -->
                            <div class="modal-content">
                                <i class="material-icons modal-close right">close</i>

                                <%--<script>--%>
                                <%--$.get(--%>
                                <%--"/comic",--%>
                                <%--{page : '${current_user.page}'}--%>
                                <%--)--%>
                                <%--</script>--%>


                                <div class="row">
                                    <!--Previous page-->
                                    <div class="col s1">
                                        <div class="valign-wrapper" style="min-height: 80vh">
                                            <i class="valign material-icons medium hoverable-1">keyboard_arrow_left</i>
                                        </div>

                                    </div>
                                    <!-- End of previous page-->

                                    <!-- Comic reading area-->
                                    <div class="col s10">
                                        <%--<img src="${current_comic.coverPage}">--%>

                                        <!-- Sample image to test UI -->
                                        <div class="center">
                                            <img src="/image/preview.jpg" class="reading-height">
                                        </div>

                                        <!-- Start of Pagination -->
                                        <div class="flow-text center">
                                            <div class="row">
                                                <ul class="pagination cente r">
                                                    <div id="pages" style="display:inline;">
                                                        <li class="active teal lighten-2"><a href="#!">1</a></li>
                                                        <li class="waves-effect teal lighten-2"><a href="#!">2</a></li>
                                                    </div>
                                                </ul>

                                                <!-- Start of form -->
                                                <!-- Use Ajax to jump page -->
                                                <form action="#" method="get">
                                                    <div class="col s1 offset-s11 input-field"
                                                         style="position: relative; top:-88px">
                                                        <input id="jump_to" type="text" class="validate">
                                                        <label for="jump_to">Jump to</label>
                                                    </div>
                                                    <div class="col s1 offset-s12"
                                                         style="position: relative; top:-139px">
                                                        <button class="btn waves-effect waves-light btn-small teal lighten-2"
                                                                type="submit" name="action">Go
                                                        </button>
                                                    </div>
                                                </form>
                                                <!-- End of form-->

                                            </div>

                                        </div>
                                        <!-- End of pagination -->

                                    </div>


                                    <!--Next page-->
                                    <div class="col s1">
                                        <div class="valign-wrapper" style="min-height: 80vh">
                                            <i class="valign material-icons medium hoverable-1">keyboard_arrow_right</i>
                                        </div>
                                    </div>
                                    <!-- End of next page -->
                                </div>
                            </div>
                            <!-- End of modal content -->
                        </div>


                    </div>

                    <div class="col s3">
                        <div class="container-1 flow-text center cyan-text">
                            <div class="pad-top-20"></div>
                            <div class="pad-top-20"></div>
                            <div class="pad-top-20"></div>
                            <div class="pad-top-20"></div>
                            Rating

                            <!-- Stars -->
                            <div class="card-1">
                                <div class="card-content-1">
                                    <div id="rating" class="center" onclick="rate()"></div>
                                </div>

                            </div>
                            <script>
                                $(document).ready(function () {
                                    $('#rating').addRating();
                                })

                                function rate() {
                                    $.post(
                                            "/comic",
                                            {
                                                rating: $('#rating').val(),
                                                current_comic: '${current_comic.comicName}'
                                            },
                                            function (result) {
                                                console.log(result);
                                                $("#full_rate").html(result);
                                            }
                                    )
                                }
                            </script>
                        </div>
                    </div>

                </div>


                <!-- Buttons for start, download and subscripbe -->

                <div class="divider-grey-3"></div>
                <div class="pad-top-10"></div>
                <div class="pad-top-10"></div>
                <div class="pad-top-10"></div>

                <%-- Might have to use AJAX for this so that the page doesn't reload every time
                                             the user comments on the comic. js/customJS.js line 38--%>
                <div class="row">

                    <div class="input-field col s12">
                        <form class="col s12" id="comment_form" action="/comic" method="POST">
                            <label for="textarea1">Write Your Comment here</label>
                            <textarea id="textarea1" class="materialize-textarea" name="comment"></textarea>
                            <button id="post_button" class="btn waves-effect waves-light right" type="submit">
                                Post<i class="material-icons right">send</i>
                            </button>
                            <script>
                                $(document).ready(function () {
                                    $("#comment_form").on("submit", function (e) {
                                        e.preventDefault();
//                                        PERFORM AJAX TO SUBMIT COMMENT
//                                        THIS DOES NOT RELOAD THE COMIC COVER PAGE
                                        $.ajax({
                                            url: "/comic",
                                            method: "POST",
                                            data: {
                                                comment: $("#textarea1").val(),
                                                comic_name: '${current_comic.comicName}'
                                            },
                                            error: function () {
                                                alert("Comment could not be posted.");
                                            },
                                            success: function () {
                                                var comment = $("#textarea1").val();
                                                var post =
                                                        "<div class='card-content-1'>" +
                                                        "<div class='chip purple lighten-3 z-depth-1'>" +
                                                        "<img src='image/5.jpg'>" +
                                                        "Superman" +
                                                        "</div>" +
                                                        "<div class='pad-top-2'></div>" +
                                                        "<div class='flow-text small-font'>" +
                                                        "<span>" + comment + "</span>" +
                                                        "<span class='right'>3/4/16</span>" +
                                                        "</div>" +
                                                        "<div class='pad-top-2'></div>" +
                                                        "<div class='divider'></div>" +
                                                        "</div>";
                                                $("#comments").prepend(post);
                                            }
                                        })
                                    })
                                })
                            </script>
                        </form>
                    </div>

                </div>

                <!-- Comments for comic -->
                <div class="card-1">
                    <div class="card-content-1 flow-text">
                        Comments from readers:
                    </div>
                    <div class="divider"></div>

                    <div id="comments">

                        <!-- Comment 1 -->
                        <div class="card-content-1">
                            <div class="chip purple lighten-3 z-depth-1">
                                <img src="image/5.jpg">
                                Superman
                            </div>
                            <div class="pad-top-2"></div>

                            <!-- Acutal comment-->
                            <div class="flow-text small-font">
                                <span>Superman is better</span>
                                <span class="right">3/4/16</span>
                            </div>

                            <div class="pad-top-2"></div>
                            <div class="divider"></div>
                        </div>

                        <!-- Comment 2 -->
                        <div class="card-content-1">
                            <div>
                                <div class="chip orange lighten-3 z-depth-1">
                                    <img src="image/6.jpg">
                                    Batman
                                </div>
                                <div class="pad-top-2"></div>

                                <!-- Acutal comment-->
                                <div class="flow-text small-font">
                                    <span>Batman Batman Batman</span>
                                    <span class="right">3/3/16</span>
                                </div>

                                <div class="pad-top-2"></div>
                                <div class="divider"></div>
                            </div>
                        </div>

                        <!-- Comment 3 -->
                        <div class="card-content-1">
                            <div>
                                <div class="chip green lighten-3 z-depth-1">
                                    <img src="image/7.jpg">
                                    Luffy
                                </div>
                                <div class="pad-top-2"></div>

                                <!-- Acutal comment-->
                                <div class="flow-text small-font">
                                    <span>Boring</span>
                                    <span class="right">3/3/16</span>
                                </div>

                                <div class="pad-top-2"></div>
                                <div class="divider"></div>
                            </div>
                        </div>

                        <!-- Comment 4 -->
                        <div class="card-content-1">
                            <div>
                                <div class="chip blue lighten-3 z-depth-1">
                                    <img src="image/8.jpg">
                                    Crayon Shin-chan
                                </div>
                                <div class="pad-top-2"></div>

                                <!-- Acutal comment-->
                                <div class="flow-text small-font">
                                    <span>...</span>
                                    <span class="right">3/3/16</span>
                                </div>

                                <div class="pad-top-2"></div>
                                <div class="divider"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Pagination -->
                    <div class="card-content-1">
                        <ul class="pagination right">
                            <li class="disabled teal lighten-2"><a href="#!"><i class="material-icons">chevron_left</i></a>
                            </li>
                            <li class="active teal lighten-2"><a href="#!">1</a></li>
                            <li class="waves-effect teal lighten-2"><a href="#!">2</a></li>
                            <li class="waves-effect teal lighten-2"><a href="#!"><i
                                    class="material-icons">chevron_right</i></a></li>
                        </ul>
                        <div class="pad-top-10"></div>
                    </div>


                    <div class="pad-top-10"></div>
                    <div class="pad-top-10"></div>
                    <div class="pad-top-10"></div>
                    <!-- Write Comment-->
                    <div class="card-content-1">
                        <%--<div class="divider-grey-3"></div>--%>
                        <%--<div class="pad-top-10"></div>--%>
                        <%--<div class="pad-top-10"></div>--%>
                        <%--<div class="pad-top-10"></div>--%>
                        <%--<div class="pad-top-10"></div>--%>
                        <%--<div class="pad-top-10"></div>--%>


                    </div>

                </div>


            </div>
        </div>
    </main>


    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>