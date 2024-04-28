<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <!-- My CSS -->
    <link rel="stylesheet" href="../CSS/dashboard.css">


    <title>AdminHub</title>
</head>
<body>


<!-- SIDEBAR -->
<section id="sidebar">
    <a href="#" class="brand">
        <i class='bx bxs-smile'></i>
        <span class="text">CINM MOVIE</span>
    </a>
    <ul class="side-menu top">
        <li class="active">
            <a href="dashboard.jsp">
                <i class='bx bxs-dashboard' ></i>
                <span class="text">Dashboard</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class='bx bxs-shopping-bag-alt' ></i>
                <span class="text">Movie</span>
            </a>
        </li>

        <li>
            <a href="#">
                <i class='bx bxs-message-dots' ></i>
                <span class="text">Resrvation</span>
            </a>
        </li>
        <li>
            <a href="user.jsp">
                <i class='bx bxs-group' ></i>
                <span class="text">User</span>
            </a>
        </li>
    </ul>
    <ul class="side-menu">
        <li>
            <a href="#">
                <i class='bx bxs-cog' ></i>
                <span class="text">Settings</span>
            </a>
        </li>
        <li>
            <a href="#" class="logout">
                <i class='bx bxs-log-out-circle' ></i>
                <span class="text">Logout</span>
            </a>
        </li>
    </ul>
</section>
<!-- SIDEBAR -->



<!-- CONTENT -->
<section id="content">
    <!-- NAVBAR -->
    <nav>
        <i class='bx bx-menu' ></i>
        <a href="#" class="nav-link">Categories</a>
        <form action="#">
            <div class="form-input">
                <label>
                    <input type="search" placeholder="Search...">
                </label>
                <button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
            </div>
        </form>
        <input type="checkbox" id="switch-mode" hidden>
        <label for="switch-mode" class="switch-mode"></label>
        <a href="#" class="notification">
            <i class='bx bxs-bell' ></i>
            <span class="num">8</span>
        </a>
        <a href="#" class="profile">
            <img src="<%= request.getContextPath() %>/img/people.png" alt="">
        </a>
    </nav>
    <!-- NAVBAR -->

    <!-- MAIN -->
    <main>
        <div class="head-title">
            <div class="left">
                <h1>Dashboard</h1>
                <ul class="breadcrumb">
                    <li>
                        <a href="#">Dashboard</a>
                    </li>
                    <li><i class='bx bx-chevron-right' ></i></li>
                    <li>
                        <a class="active" href="admin.jsp">Admin Mangement</a>
                    </li>
                </ul>
            </div>
            <a href="#" class="btn-download">
                <i class='bx bxs-cloud-download' ></i>
                <span class="text">add movie</span>
            </a>
        </div>

        <ul class="box-info">
            <li>
                <i class='bx bxs-calendar-check' ></i>
                <span class="text">
						<h3>1020</h3>
						<p>Users</p>
					</span>
            </li>
            <li>
                <i class='bx bxs-group' ></i>
                <span class="text">
						<h3>2834</h3>
						<p>Visitors</p>
					</span>
            </li>
            <li>
                <i class='bx bxs-dollar-circle' ></i>
                <span class="text">
						<h3>643</h3>
						<p>Total Movies</p>
					</span>
            </li>
        </ul>


        <div class="table-data">
            <div class="order">
                <h1>Movie List</h1>
                <table>
                    <thead>
                    <tr>
                        <th>Title</th>
                        <th>Genre</th>
                        <th>Show Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="movie" items="${movies}">
                        <tr>
                            <td>${movie.title}</td>
                            <td>${movie.genre}</td>
                            <td>${movie.show_date}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
        </div>
        </div>

    </main>
    <!-- MAIN -->
</section>
<!-- CONTENT -->


<script src="../JS/dashboard.js"></script>
</body>
</html>