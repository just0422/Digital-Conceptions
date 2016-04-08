
<!-- Header section-->
<header class="main">
    <!-- Nav bar-->
    <nav>
        <div class="nav-wrapper cyan lighten-2">
            <ul id="nav-mobile" class="left">
                <li><a href="/" class="custom-nav-font-size z-depth-1">Home</a></li>
                <li><a href="/genre" class="custom-nav-font-size">Genre</a></li>
            </ul>


            <ul class="right">
                <li><a href="#" class="dropdown-button" data-activates="features"><i class="material-icons">face</i></a></li>

                <!-- Dropdown Data -->
                <ul id='features' class='dropdown-content'>
                    <li><a href="#!">Create <img></a></li>
                    <li><a href="/user_profile">Profile</a></li>
                    <li class="divider"></li>
                    <li><a href="/usersignin">Log out</a></li>
                </ul>
            </ul>

            <!-- Search bar-->
            <ul>
                <form action="/search" method="get">
                    <div class="input-field right">
                        <input id="search" type="search" name="search" required>
                        <label for="search"><i class="material-icons right">search</i></label>
                        <i class="material-icons">close</i>
                    </div>
                </form>
            </ul>

        </div>
    </nav>
</header>
