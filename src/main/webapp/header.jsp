<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header section-->
        <header class="main">
            <!-- Nav bar-->
            <nav>
                <div class="nav-wrapper cyan lighten-2">
                    <script>
                        var highlight_select = "z-depth-1";
                        var page_title = document.title;
                    </script>

                    <!-- Home button and Genre button-->
                    <ul id="nav-mobile" class="left">
                        <%-- Active button has class 'z-depth-1' --%>

                        <li><a href="/" class="custom-nav-font-size" id="home">Home</a></li>
                        <li><a href="/genre" class="custom-nav-font-size" id="genre">Genre</a></li>
                    </ul>

                    <!-- Profile butto n-->
                    <ul class="right">
                        <script>console.log("right");</script>
                        <c:choose>
                            <c:when test="${user == null}">
                                <script>console.log("when");</script>
                                <li><a href="/usersignin"><i class="material-icons">face</i></a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="#" class="dropdown-button" data-activates="features" id="profile"><i class="material-icons">face</i></a></li>
                                <script>console.log("otherwise");</script>
                                <!-- Dropdown Data -->
                                <ul id='features' class='dropdown-content'>
                                    <li><a href="#!">Create <img></a></li>
                                    <li><a href="/user_profile">Profile</a></li>
                                    <li class="divider"></li>
                                    <li><a href="/usersignin">Log out</a></li>
                                </ul>
                            </c:otherwise>
                        </c:choose>
                    </ul>

                    <!-- Search bar -->
                    <ul>
                        <form action="/search" method="get">
                            <div class="input-field right">
                                <input id="search" type="search" name="search" required>
                                <label for="search"><i class="material-icons right">search</i></label>
                                <i class="material-icons">close</i>
                            </div>
                        </form>
                    </ul>
                    <script>
                        console.log(page_title);
                        if (page_title.toLowerCase().indexOf('home') >= 0)
                            $("#home").addClass(highlight_select);

                        if (page_title.toLowerCase().indexOf('genre') >= 0)
                            $('#genre').addClass(highlight_select);

                        if (page_title.toLowerCase().indexOf('profile') >= 0)
                            $('#profile').addClass(highlight_select);
                    </script>

                </div>
            </nav>
        </header>