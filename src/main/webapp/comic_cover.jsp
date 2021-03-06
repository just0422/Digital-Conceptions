<%--Created by IntelliJ IDEA.
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

    <script type="text/javascript" src="js/jquery.star.rating.js"></script>

    <!-- Import JSZip and FileSaver.js -->
    <script type="text/javascript" src="js/jszip.js"></script>
    <script type="text/javascript" src="js/jszip-utils.js"></script>
    <script type="text/javascript" src="js/FileSaver.js"></script>

    <!--Import custom js-->
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
                    <c:choose>
                        <c:when test="${user != null}">
                            <div class="col s4">
                        </c:when>
                        <c:otherwise>
                            <div class="col s5">
                        </c:otherwise>
                    </c:choose>
                        <div class="card cyan lighten-3" onclick="">
                            <div class="card-image">
                                <img src="${current_comic.coverPage}"  style="max-height: 270px; min-height:270px">
                            </div>
                        </div>
                        <p>
                            ${current_comic.description}
                        </p>
                    </div>

                <c:choose>
                    <c:when test="${user != null}">
                        <div class="col s5">
                    </c:when>
                    <c:otherwise>
                        <div class="col s7">
                    </c:otherwise>
                </c:choose>
                        <!-- Comic Name-->
                        <div class="pad-top-10"></div>
                        <div class="pad-top-10"></div>
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Series:<span class="right">${current_comic.seriesTitle} ${current_comic.volume}</span>
                            <div class="divider"></div>
                        </div>
                        <div class="container-1 flow-text cyan-text">
                            Issue:<span class="right">${current_comic.issueTitle} ${current_comic.issue}</span>
                            <div class="divider"></div>
                        </div>
                        <div class="pad-top-10"></div>

                        <!-- Genre -->
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Genre:<span class="right">${current_comic.genre}</span>
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

                        <!-- Current  Rating-->
                        <div class="pad-top-10"></div>
                        <form method="post" action="/comic">
                            <div class="container-1 flow-text cyan-text">
                                Current Rating:<span class="right" id="full_rate">${current_comic.rating}</span>
                                <div class="divider"></div>
                            </div>
                        </form>
                        <script>
                            function rate() {
                                console.log("Sending");
                                $.ajax({
                                    url: "/comic",
                                    method: "POST",
                                    data: {
                                        rating: $("#rating").val(),
                                        comic_name: "${current_comic.comicName}"
                                    },
                                    success: function(result) {
                                        console.log(result);
                                        $("#full_rate").html(result);
                                    }
                                })
                            }
                        </script>
                        <!-- End of rating -->

                        <!-- Reading Structure -->
                        <!-- Reading Modal -->
                        <div id="reading" class="modal" id="comic_viewer">

                            <!-- Start of modal content -->
                            <div class="modal-content" >
                                <i class="material-icons modal-close right">close</i>

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
                                        <div class="center reading-height">
                                            <img id="comic_page_image" class="reading-height">
                                            <%--<p hidden id="page_number" value=""></p>--%>
                                        </div>
                                            <script>
                                                function jumpPage(x){
                                                    deactivatePage(currentPageNumber);
                                                    activatePage(x);

                                                    currentPageNumber = x;
                                                    goToPage();
                                                }

                                                var pages, currentPageNumber = parseInt("${current_comic.pageNumber}") + 1;
                                                pages = '<c:out value="${current_comic.urls}"/>';
                                                pages = pages.replace(" ", "");
                                                pages = pages.slice(1, -1);
                                                pages = pages.split(',');
//                                                pages = pages.slice(0, pages.length / 2);
                                                $(document).ready(function()
                                                {

                                                    $('#comic_page_image').attr("src", pages["${current_comic.pageNumber}"]);
                                                    goToPage();

                                                    if (currentPageNumber != 1){
                                                        $("#start").html("RESUME");
                                                    }
                                                });

                                                function deactivatePage(num){
                                                    $("#page" + num).addClass("waves-effect");
                                                    $("#page" + num).removeClass("active");
                                                }
                                                function activatePage(num){
                                                    $("#page" + num).removeClass("waves-effect");
                                                    $("#page" + num).addClass("active");
                                                }
                                                function nextPage(){
                                                    if (currentPageNumber < pages.length) {
                                                        deactivatePage(currentPageNumber)
                                                        currentPageNumber++;
                                                        activatePage(currentPageNumber);

                                                        goToPage();
                                                    }
                                                }
                                                function prevPage(){
                                                    if (currentPageNumber > 1) {
                                                        deactivatePage(currentPageNumber);
                                                        currentPageNumber--;
                                                        activatePage(currentPageNumber);
                                                        goToPage();
                                                    }
                                                }

                                                function jumpToPage(){
                                                    for (i = 0; i < pages.length; i++)
                                                       deactivatePage(i);
                                                    currentPageNumber = parseInt($("#jump_to_page").val());
                                                    activatePage(currentPageNumber);

                                                    goToPage();
                                                }

                                                function goToPage(){
                                                    $("#comic_page_image").attr("src", pages[currentPageNumber - 1]);
                                                    $('#jump_to_page').val(currentPageNumber);
                                                }
                                            </script>

                                        <!-- Start of Pagination -->
                                        <div class="flow-text center">
                                            <div class="row">
                                                <ul class="pagination cente r">
                                                    <div id="comic_pages" style="display:inline;">
                                                        <script>
                                                            for (x = 1; x <= pages.length; x++){
                                                                document.write('<li class="waves-effect teal lighten-2" id="page' + x + '"><a onclick="jumpPage(' + x + ')">' + x + '</a></li>');
                                                            }
                                                            $("#page" + currentPageNumber).removeClass("waves-effect");
                                                            $("#page" + currentPageNumber).addClass("active");

                                                        </script>
                                                        <%--<li class="active teal lighten-2"><button onclick="jumpPage()">1</button></li>--%>
                                                        <%--<li class="waves-effect teal lighten-2"><button href="#!">2</button></li>--%>
                                                    </div>
                                                </ul>

                                                <!-- Start of form -->
                                                <!-- Use Ajax to jump page -->
                                                <%--<form onclicksubmit="goToPage()">--%>
                                                    <div class="col s1 offset-s11 input-field"
                                                         style="position: relative; top:-88px">
                                                        <input id="jump_to_page" type="number" class="validate" required value="${current_comic.pageNumber}" onchange="jumpToPage()">
                                                        <label for="jump_to_page">Jump to</label>
                                                    </div>
                                                    <div class="col s1 offset-s12"
                                                         style="position: relative; top:-138px">
                                                        <button class="btn waves-effect waves-light btn-small teal lighten-2"
                                                                onclick="jumpToPage()">Go
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

                                </div>
                            </div>
                            <!-- End of modal content -->
                        </div>
                        <% System.out.println("GOT HERE0"); %>
                        <!-- End of modal -->
                    </div>
                    <!-- End of middle column -->

                    <c:if test="${user != null}">
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
                                    <script>
                                            $('#rating').addRating();
                                            $('#rating').val(${current_comic.rate});
                                            $('#rating').setRating(${current_comic.rate});
                                            $('#rating').showRating(${current_comic.rate}, true);

                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:if>

                        <!-- Start of start, subscribe and download button -->
                        <div class="row">
                        <div class="container-1 col s12">
                            <div class="pad-top-20"></div>
                            <div class="pad-top-20"></div>
                            <div class="center">
                                <a class="waves-effect waves-light btn lighten-3 modal-trigger"
                                   href="#reading" id="start">Start</a>

                                <c:if test="${user != null}">

                                    <button id="subscription" class="waves-effect waves-light btn" onclick="un_subscribe()">${subscription}</button>
                                    <script>
                                        function un_subscribe(){
                                            $.post(
                                                "/comic",
                                                {
                                                    subscribe: $("#subscription").text(),
                                                    comic_name: "${current_comic.comicName}"
                                                },
                                                function(response) {
                                                    $("#subscription").text(response);
                                                });
                                        }
                                    </script>
                                </c:if>

                                <a id="download" class="waves-effect waves-light btn">Download</a>
                            </div>
                        </div>
                            </div>
                        <script>
                            $(document).ready(function()
                            {
                                $("#download").click(function()
                                {
                                    // For downloading the comic images to a zip file
                                    var zip = new JSZip();
                                    var images = zip.folder("${current_comic.seriesTitle}").folder("images");
                                    var deferreds = [];

                                    <c:forEach var="imgLink" items="${current_comic.urls}" varStatus="loop">
                                    deferreds.push(addToZip(images, "${imgLink}", "image" + ${loop.index} + ".jpg"));
                                    </c:forEach>

                                    function addToZip(zip, imgLink, imgTitle)
                                    {
                                        var deferred = $.Deferred();
                                        JSZipUtils.getBinaryContent(imgLink, function(err, data)
                                        {
                                            if (err)
                                            {
                                                alert("An error has occurred while trying to load: " + imgLink);
                                            } else
                                            {
                                                zip.file(imgTitle, data, {binary: true});
                                            }
                                            deferred.resolve(zip);
                                        })
                                        return deferred;
                                    }

                                    $.when.apply(window, deferreds).done(function()
                                    {
                                        zip.generateAsync({type: "blob"}).then(function(content)
                                        {
                                            saveAs(content, "${current_comic.seriesTitle}");
                                        });
                                    })
                                })
                            })
                        </script>

                        <!-- End of start, subscribe and download button -->


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
                    <!-- List of issues-->
                    <div class="col s12 flow-text medium-font" style="overflow-y: scroll; height:25vh; ">

                        <%-- Other comics in series / title --%>
                        <div class="row">
                                <div class="col s6">
                                    <c:forEach var="issue" items="${all}" begin="0" step="2">
                                        <a class="modal-trigger"
                                           href="/comic?series_title=${issue.seriesTitle}&issue_title=${issue.issueTitle}&volume=${issue.volume}&issue=${issue.issue}">
                                                ${issue.seriesTitle} vol. ${issue.volume}: ${issue.issueTitle} #${issue.issue}
                                        </a><br>
                                    </c:forEach>
                                </div>
                                <div class="col s6 ${comic_class} issueList">
                                    <c:forEach var="issue" items="${all}" begin="1" step="2">
                                        <a class="modal-trigger"
                                           href="/comic?series_title=${issue.seriesTitle}&issue_title=${issue.issueTitle}&volume=${issue.volume}&issue=${issue.issue}">
                                                ${issue.seriesTitle} vol. ${issue.volume}: ${issue.issueTitle} #${issue.issue}
                                        </a><br>
                                    </c:forEach>
                                </div>
                        </div>


                    </div>
                    <!-- End of issues-->

                </div>
                <!-- End of volume issue and issue title listing -->
                <div class="divider" style="position: relative; bottom: 0;"></div>

                <!-- Start of write Comment-->
                <%-- Might have to use AJAX for this so that the page doesn't reload every time
                                         the user comments on the comic. js/customJS.js line 38--%>
                <div class="row" style="margin-top: 10vh">
                    <c:if test="${user != null}">

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
                                            success: function(response) {
                                                ucd = jQuery.parseJSON(response);
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
                    </c:if>

                </div>
                <!-- End of write comment -->


                <!-- Comments for comic -->
                <div class="card-1" style="margin-top: 10vh;">
                    <%--<div class="card-content-1 flow-text">--%>
                        <%--Comments from readers:--%>
                    <%--</div>--%>
                    <div class="divider"></div>

                    <div id="comments">
                        <c:forEach items="${current_comic.commentList}" var="comment">
                            <c:set var="commentParts" value="${fn:split(comment, '|')}"></c:set>
                            <div class="card-content-1">
                                <div class="chip purple lighten-3 z-depth-1">
                                    <img src="image/5.jpg">${commentParts[1]}
                                </div>
                                <div class="pad-top-2"></div>

                                <!-- Acutal comment-->
                                <div class="flow-text small-font">
                                    <span>${commentParts[2]}</span>
                                    <span class="right">${commentParts[0]}</span>
                                </div>

                                <div class="pad-top-2"></div>
                                <div class="divider"></div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="pad-top-10"></div>
                </div>
            </div>
        </div>
</main>


<jsp:include page="footer.jsp"/>


</div>
</body>

</html>