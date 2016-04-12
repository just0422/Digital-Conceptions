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
    <meta name="viewport" content="width=device-width, initial-scale=1.0 /">

    <!--Import Jquery-->
    <script type="text/javascript" src="js/jquery-2.2.2.js"></script>

    <!--Import materialize.js-->
    <script type="text/javascript" src="js/materialize.min.js"></script>

    <script type="text/javascript" src="js/jquery.star.rating.js"></script>

    <!--Impot custom css-->
    <link type="text/css" rel="stylesheet" href="css/custom.css">

    <!--Import custom js-->
    <script type="text/javascript" src="js/customJS.js"></script>

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
                                <img src="image/5.jpg">
                            </div>
                        </div>
                    </div>

                    <div class="col s5">

                        <!-- Comic Name-->
                        <div class="pad-top-10"></div>
                        <div class="pad-top-10"></div>
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Comic Name:<span class="right">Hello World</span>
                            <div class="divider"></div>
                        </div>

                        <!-- Author Name-->
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Author:<span class="right">ABC</span>
                            <div class="divider"></div>
                        </div>

                        <!-- Release Date-->
                        <div class="pad-top-10"></div>
                        <div class="container-1 flow-text cyan-text">
                            Release Date:<span class="right">03/03/2016</span>
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
                                <a class="waves-effect waves-light btn lighten-3">Start</a>
                                <a class="waves-effect waves-light btn">Subscribe</a>
                                <a class="waves-effect waves-light btn">Download</a>
                            </div>
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
                                    <div id="rating" class="center"></div>
                                </div>

                            </div>
                            <script>
                                $('#rating').addRating();
                            </script>
                        </div>
                    </div>

                </div>


                <!-- Buttons for start, download and subscripbe -->

                <div class="divider-grey-3"></div>
                <div class="pad-top-10"></div>
                <div class="pad-top-10"></div>
                <div class="pad-top-10"></div>


                <!-- Comments for comic -->
                <div class="card-1">
                    <div class="card-content-1 flow-text">
                        Comments from readers:
                    </div>
                    <div class="divider"></div>

                    <!-- Comment 1 -->
                    <div class="card-content-1">
                        <div>
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
                        <div class="divider-grey-3"></div>
                        <div class="pad-top-10"></div>
                        <div class="pad-top-10"></div>
                        <div class="pad-top-10"></div>
                        <div class="pad-top-10"></div>
                        <div class="pad-top-10"></div>

                        <div class="row">
                            <form class="col s12">
                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea id="textarea1" class="materialize-textarea"></textarea>
                                        <label for="textarea1">Write Your Comment here</label>
                                    </div>
                                </div>
                            </form>

                            <div>
                                <button class="btn waves-effect waves-light right" type="submit" name="action">Submit
                                    <i class="material-icons right">send</i>
                                </button>
                            </div>
                        </div>
                    </div>

                </div>


            </div>
        </div>
    </main>


    <jsp:include page="footer.jsp"/>


</div>
</body>

</html>