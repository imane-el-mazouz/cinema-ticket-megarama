<%@ page import="com.movieticket.model.Movie" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Box icons test-->
    <link href='https://onpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <!-- My CSS -->
    <style><%@include file ="dashbord.css"%></style>

    <title>AdminHub</title>
</head>
<body>


<!-- SIDEBAR  new version-->
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
                <span  class="text">User</span>
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
                <div class="head">
                    <h3>Recent Movie</h3>
                    <i class='bx bx-search' ></i>
                    <i class='bx bx-filter' ></i>
                </div>
                <body>
                <h1>Movie List</h1>
                <table>
                    <tr>
                        <th>Image</th>
                        <th>Title</th>
                        <th>Genre</th>
                        <th>Show Date</th>

                    </tr>
                    <jsp:useBean id="movies" scope="request" type="java.util.List"/>
                    <c:forEach var="movie" items="${movies}">
                        <tr>
                            <td><img src="${movie.imgUrl}" alt="${movie.title}"></td>
                            <td>${movie.title}</td>
                            <td>${movie.genre}</td>
                            <td>${movie.showDate}</td>

                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="4">No movies found</td>
                    </tr>


                </table>
                </body>
            </div>
        </div>

    </main>
    <!-- MAIN -->
</section>
<!-- CONTENT -->


<script><%@include file ="script.js"%></script>
</body>
</html>