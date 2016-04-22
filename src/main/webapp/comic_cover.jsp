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

    <script type="text/javascript" src="js/jquery.star.rating.js"></script>

    <!-- Import JSZip and FileSaver.js -->
    <script type="text/javascript" src="js/jszip.js"></script>
    <script type="text/javascript" src="js/jszip-utils.js"></script>
    <script type="text/javascript" src="js/FileSaver.js"></script>

    <!--Import custom css-->
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
                            Series Title:<span class="right">${current_comic.seriesTitle}</span>
                            <div class="divider"></div>
                        </div>
                        <div class="pad-top-10"></div>

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
                            Latest Updated:<br>
                            <span>Volume # + Issue # + Issue title </span>
                            <div class="divider"></div>
                        </div>

                        <!-- Current  Rating-->
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Current Rating:<span class="right">4</span>
                            <div class="divider"></div>
                        </div>
                        <!-- End of rating -->


                        <!-- Start of start, subscribe and download button -->
                        <div class="container-1">
                            <div class="pad-top-20"></div>
                            <div class="pad-top-20"></div>
                            <div class="center">
                                <a class="waves-effect waves-light btn lighten-3 modal-trigger"
                                   href="#reading">Start</a>
                                <a id="subscribe" class="waves-effect waves-light btn">Subscribe</a>
                                <form action="/comic" method="post" id="comic_download">
                                    <input hidden name="comic_name" value="${current_comic.comicName}">
                                    <%--<input hidden name="seriesTitle" value="${current_comic.seriesTitle}">--%>
                                    <%--<input hidden name="issueTitle" value="${current_comic.issueTitle}">--%>
                                    <%--<input hidden name="volume" value="${current_comic.volume}">--%>
                                    <%--<input hidden name="issue" value="${current_comic.issue}">--%>
                                    <button name="download" id="download" class="waves-effect waves-light btn" type="submit">Download</button>
                                </form>
                            </div>
                        </div>

                        <script>
                            $(document).ready(function () {
                                var options = {
                                    beforeSend: function () {
                                        console.log("Sending");
                                    },
                                    success: function () {
                                        console.log("Response");
//                                        console.log(resp);
                                    }
                                }
                                $("#comic_download").ajaxForm(options);
                            });
                        </script>
                        <script>
                            <%--$(document).ready(function()--%>
                            <%--{--%>
                                <%--$("#download").click(function()--%>
                                <%--{--%>
                                    <%--// For downloading the comic images to a zip file--%>
                                    <%--var zip = new JSZip();--%>
                                    <%--var images = zip.folder("${current_comic.seriesTitle}").folder("images");--%>
                                    <%--var deferreds = [];--%>

                                    <%--<c:forEach var="imgLink" items="${current_comic.urls}" varStatus="loop">--%>
                                        <%--deferreds.push(addToZip(images, "${imgLink}", "image" + ${loop.index} + ".jpg"));--%>
                                    <%--</c:forEach>--%>

                                    <%--function addToZip(zip, imgLink, imgTitle)--%>
                                    <%--{--%>
                                        <%--var deferred = $.Deferred();--%>
                                        <%--JSZipUtils.getBinaryContent(imgLink, function(err, data)--%>
                                        <%--{--%>
                                            <%--if (err)--%>
                                            <%--{--%>
                                                <%--alert("An error has occurred while trying to load: " + imgLink);--%>
                                            <%--} else--%>
                                            <%--{--%>
                                                <%--zip.file(imgTitle, data, {binary: true});--%>
                                            <%--}--%>
                                            <%--deferred.resolve(zip);--%>
                                        <%--})--%>
                                        <%--return deferred;--%>
                                    <%--}--%>

                                    <%--$.when.apply(window, deferreds).done(function()--%>
                                    <%--{--%>
                                        <%--zip.generateAsync({type: "blob"}).then(function(content)--%>
                                        <%--{--%>
                                            <%--saveAs(content, "${current_comic.seriesTitle}");--%>
                                        <%--});--%>
                                    <%--})--%>
                                <%--})--%>
                            <%--})--%>
                        </script>
                        <!-- End of start, subscribe and download button -->


                        <!-- Reading Structure -->
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
                                            <a href="javascript:prevPage()">
                                                <i class="valign material-icons medium hoverable-1" id="prev_page">keyboard_arrow_left</i>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- End of previous page-->

                                    <!-- Comic reading area-->
                                    <div class="col s10">
                                        <%--<img src="${current_comic.coverPage}">--%>

                                        <!-- Sample image to test UI -->
                                        <div class="center">
                                            <img class="reading-height" id="comic_page_image">
                                            <%--<p hidden id="page_number" value=""></p>--%>
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
                                                <%--<form onclicksubmit="goToPage()">--%>
                                                    <div class="col s1 offset-s11 input-field"
                                                         style="position: relative; top:-88px">
                                                        <input id="jump_to_page" type="number" class="validate" required value="${current_comic.pageNumber}" onchange="goToPage()">
                                                        <label for="jump_to_page">Jump to</label>
                                                    </div>
                                                    <div class="col s1 offset-s12"
                                                         style="position: relative; top:-138px">
                                                        <button class="btn waves-effect waves-light btn-small teal lighten-2"
                                                                onclick="goToPage()">Go
                                                        </button>
                                                    </div>
                                                <%--</form>--%>
                                                <!-- End of form-->

                                            </div>

                                        </div>
                                        <!-- End of pagination -->
                                    </div>


                                    <!--Next page-->
                                    <div class="col s1">
                                        <div class="valign-wrapper" style="min-height: 80vh">
                                            <a href="javascript:nextPage()">
                                                <i class="valign material-icons medium hoverable-1" id="next_page">keyboard_arrow_right</i>
                                            </a>
                                        </div>
                                    </div>
                                    <!-- End of next page -->

                                    <script>
                                        var pages;
                                        $(document).ready(function()
                                        {
                                            pages = '<c:out value="${current_comic.urls}"/>';
                                            pages = pages.replace(" ", "");
                                            pages = pages.slice(1, -1);
                                            pages = pages.split(',');
                                            pages = pages.slice(0, pages.length / 2);

                                            $('#comic_page_image').attr("src", pages["${current_comic.pageNumber}"]);
                                            <%--var currentPage = $("#current_page");--%>
                                            <%--var prevButton = $("#previous_page");--%>
                                            <%--var nextButton = $("#next_page");--%>

                                            <%--prevButton.click(function()--%>
                                            <%--{--%>
                                                <%--// This should be edited--%>
                                                <%--currentPage.attr("src", "${current_comic.urls[0]}");--%>
                                            <%--})--%>

                                            <%--nextButton.click(function()--%>
                                            <%--{--%>
                                                <%--// This should be edited--%>
                                                <%--currentPage.attr("src", "${current_comic.urls[2]}");--%>
                                            <%--})--%>
                                        })

                                        function nextPage(){
                                            console.log("Current page: " + $("#jump_to_page").val());
                                            $('#jump_to_page').val(parseInt($("#jump_to_page").val()) + 1);
                                            console.log("Next page: " + $("#jump_to_page").val());
                                            goToPage();
                                        }
                                        function prevPage(){
                                            console.log("Current page: " + $("#jump_to_page").val());
                                            $('#jump_to_page').val(parseInt($("#jump_to_page").val()) - 1);
                                            console.log("Prev page: " + $("#jump_to_page").val());
                                            goToPage();
                                        }

                                        function goToPage(){
                                            console.log("Jumping to page: " + $("#jump_to_page").val());
                                            $("#comic_page_image").attr("src", pages[$('#jump_to_page').val()]);
                                        }
                                    </script>
                                </div>
                            </div>
                            <!-- End of modal content -->
                        </div>
                        <!-- End of modal -->
                    </div>
                    <!-- End of middle column -->

                    <!-- Start of rating -->
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
                                                current_comic: "${current_comic.comicName}"
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
                    <!-- End of rating -->
                </div>
                <!-- End of the top part grid layout -->


                <!-- Padding for bottom haft of the site -->
                <div class="pad-top-10"></div>
                <div class="divider-grey-3"></div>
                <div class="pad-top-10"></div>
                <div class="pad-top-10"></div>

                <!-- Start of Volume issue and issue title listing -->
                <div class="row" style="min-height: 25vh;margin-top: 2vh;">
                    <!-- Start of volume selection -->
                    <div class="col s3">
                        <!-- Dropdown Trigger -->
                        <a class='dropdown-button btn' href='#' data-activates='volume'>Select a volume</a>

                        <!-- Dropdown Structure -->
                        <ul id='volume' class='dropdown-content'>
                            <li><a href="#!">1</a></li>
                            <li><a href="#!">2</a></li>
                            <li><a href="#!">3</a></li>
                        </ul>
                    </div>
                    <!-- End of volumn selection -->

                    <!-- List of issues-->
                    <div class="col s9 flow-text medium-font" style="overflow-y: scroll; height:25vh; ">

                        <div class="row">
                            <div class="col s4">
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>

                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                            </div>
                            <div class="col s4">
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                            </div>
                            <div class="col s4">
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                                <a class="modal-trigger"
                                   href="#reading">Issue: Issue title</a><br>
                            </div>
                        </div>


                    </div>
                    <!-- End of issues-->

                </div>
                <!-- End of volume issue and issue title listing -->
                <div class="divider" style="position: relative; bottom: 0;"></div>


                <!-- Comments for comic -->
                <div class="card-1" style="margin-top: 10vh;">
                    <div class="card-content-1 flow-text">
                        Comments from readers:
                    </div>
                    <div class="divider"></div>

                    <div id="comments">
                        <c:forEach items="${current_comic.commentList}" var="comment">
                            <div class="card-content-1">
                                <div class="chip purple lighten-3 z-depth-1">
                                    <img src="image/5.jpg">
                                    Superman
                                </div>
                                <div class="pad-top-2"></div>

                                <!-- Acutal comment-->
                                <div class="flow-text small-font">
                                    <span>${comment}</span>
                                    <span class="right">3/4/16</span>
                                </div>

                                <div class="pad-top-2"></div>
                                <div class="divider"></div>
                            </div>
                        </c:forEach>
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


                    <!-- Start of write Comment-->
                    <%-- Might have to use AJAX for this so that the page doesn't reload every time
                                             the user comments on the comic. js/customJS.js line 38--%>
                    <div class="row" style="margin-top: 10vh">

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
                                            console.log("Sending");
                                            $.ajax({
                                                url: "/comic",
                                                method: "POST",
                                                data: {
                                                    comment: $("#textarea1").val(),
                                                    comic_name: "${current_comic.comicName}"
                                                },
//                                                error: function () {
//                                                    alert("Comment could not be posted."));
//                                                },
                                                success: function(response) {
//                                                    console.log("received");
//                                                    console.log(response);
                                                    ucd = jQuery.parseJSON(response);
//                                                    console.log(ucd.user);
                                                    var post =
                                                            "<div class='card-content-1'>" +
                                                            "<div class='chip purple lighten-3 z-depth-1'>" +
                                                            "<img src='image/5.jpg'>" +
                                                            ucd.user +
                                                            "</div>" +
                                                            "<div class='pad-top-2'></div>" +
                                                            "<div class='flow-text small-font'>" +
                                                            "<span>" + ucd.comment + "</span>" +
                                                            "<span class='right'>" + ucd.date + "</span>" +
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
                    <!-- End of write comment -->


                </div>

            </div>
        </div>
</main>


<jsp:include page="footer.jsp"/>


</div>
</body>

</html>