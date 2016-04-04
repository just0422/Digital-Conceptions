<!DOCTYPE html>
<html>

<head>
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.css" media="screen,projection" />

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0 /">

    <!--Import Jquery-->
    <script type="text/javascript" src="js/jquery-2.2.2.js"></script>

    <!--Import materialize.js-->
    <script type="text/javascript" src="js/materialize.min.js"></script>

    <!--Impot custom css-->
    <link type="text/css" rel="stylesheet" href="css/custom.css">

    <!--Import custom js-->
    <script type="text/javascript" src="js/customJS.js"></script>

    <title>Digital Conceptions</title>
</head>

<body class="backgroud">


    <!-- Outer most container -->
    <div class="container">

        <!-- Header section-->
        <header class="main">
            <!-- Nav bar-->
            <nav>
                <div class="nav-wrapper cyan lighten-2">

                    <!-- Home button and Genre button-->
                    <ul id="nav-mobile" class="left">
                        <li><a href="index.jsp" class="custom-nav-font-size z-depth-1">Home</a></li>
                        <li><a href="genre.jsp" class="custom-nav-font-size">Genre</a></li>
                    </ul>

                    <!-- Profile butto n-->
                    <ul class="right">
                        <li><a href="/usersignin"><i class="material-icons">face</i></a></li>
                    </ul>

                    <!-- Search bar -->
                    <ul>
                        <form action="search.jsp">
                            <div class="input-field right">
                                <input id="search" type="search" required>
                                <label for="search"><i class="material-icons right">search</i></label>
                                <i class="material-icons">close</i>
                            </div>
                        </form>
                    </ul>

                </div>
            </nav>
        </header>

        <main class="main body body-background-color"></main>

        <!-- Footer -->
        <footer class="page-footer cyan lighten-2 ">
            <div class="container ">
                <div class="row ">
                    <div class="col s12 ">
                        <span class="white-text text-lighten-4 ">About Us</span>
                        <span class="white-text text-lighten-4 right ">Contact Us</span>
                        <p class="white-text text-lighten-4 ">© 2016 Degital Conceptions, All rights reserved.</p>
                    </div>
                </div>
            </div>
        </footer>

    </div>
</body>

</html>