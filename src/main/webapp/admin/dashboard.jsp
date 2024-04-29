<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <span class="text">AJI TFERAJ</span>
    </a>
    <ul class="side-menu top">
        <li class="active">
            <a href="dashboard.jsp">
                <i class='bx bxs-dashboard' ></i>
                <span class="text">Dashboard</span>
            </a>
        </li>
        <li>
            <a href="/Megarama_war_exploded/movies">
                <i class='bx bxs-shopping-bag-alt' ></i>
                <span class="text">Movie</span>
            </a>
        </li>


    </ul>
    <ul class="side-menu">

        <li>
            <a href="/Megarama_war_exploded/login" class="logout">
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
            <img src="/images/admin.png">
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
                        <a class="active" href="dashboard.jsp">Admin Mangement</a>
                    </li>
                </ul>
            </div>
            <a href="add_movie.jsp" class="btn-download">
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
                        <th>Image</th>
                        <th>Title</th>
                        <th>Genre</th>
                        <th>Show Date</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${not empty movies}">
                            <c:forEach var="movie" items="${movies}">
                                <tr>
                                    <td><img src="${movie.imgUrl}" width="100"></td>
                                    <td>${movie.title}</td>
                                    <td>${movie.genre}</td>
                                    <td>${movie.showDate}</td>
                                    <td>
                                        <a  class="status pending" href="${pageContext.request.contextPath}/admin/dashboard?action=delete&id=${movie.movieId}">Delete</a>                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5">No movies found</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
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