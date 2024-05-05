<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<head>
    <title>Megarama Béni Mellal</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style><%@include file ="../CSS/styles.css"%></style>
</head>
<header class="header" data-header>
    <div class="container">
        <div class="overlay" data-overlay></div>
        <a href="movie" class="logo">
            <img src="../images/logo.png" height="50px" alt="Cinema-TV">
        </a>
        <div class="header-actions">
            <button class="search-btn">
                <ion-icon name="search-outline"></ion-icon>
            </button>
            <button class="btn btn-primary"><a href="login">Sign In</a> </button>
            <button class="btn btn-primary"><a href="signup">Sign Up</a> </button>

        </div>
        <button class="menu-open-btn" data-menu-open-btn>
            <ion-icon name="reorder-two"></ion-icon>
        </button>
        <nav class="navbar" data-navbar>
            <div class="navbar-top">
                <a href="movie" class="logo">
                    <img src="images/logo.png" alt="Cinema LOgo">
                </a>
                <button class="menu-close-btn" data-menu-close-btn>
                    <ion-icon name="close-outline"></ion-icon>
                </button>
            </div>
            <ul class="navbar-list">
                <li>
                    <a href="movie" class="navbar-link">Movies</a>
                </li>
                <li>
                    <a href="user/reservations" class="navbar-link">Reserve Ticket</a>
                </li>
                <li>
                    <a href="user/reservations" class="navbar-link">All Reservation</a>
                </li>
            </ul>

            <ul class="navbar-social-list">
                <li>
                    <a href="#" class="navbar-social-link">
                        <ion-icon name="logo-twitter"></ion-icon>
                    </a>
                </li>
                <li>
                    <a href="#" class="navbar-social-link">
                        <ion-icon name="logo-facebook"></ion-icon>
                    </a>
                </li>
                <li>
                    <a href="#" class="navbar-social-link">
                        <ion-icon name="logo-pinterest"></ion-icon>
                    </a>
                </li>
                <li>
                    <a href="#" class="navbar-social-link">
                        <ion-icon name="logo-instagram"></ion-icon>
                    </a>
                </li>
                <li>
                    <a href="#" class="navbar-social-link">
                        <ion-icon name="logo-youtube"></ion-icon>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</header>
<main>
    <article>
        <section class="movie-detail">
            <div class="container">
                <div class="container" style="display: flex; flex-direction: column; gap: 5%;">
                    <h1 class="h1 detail-title">${selectedMovie.getTitle()}</h1>
                    <figure class="movie-detail-banner">
                        <img src="${selectedMovie.getImgUrl()}" alt="${selectedMovie.getTitle()} poster">
                    </figure>
                </div>

                <div class="movie-detail-content">
                    <form id="reservationForm" action="reserve" method="POST" style="color:white; margin-right: 5%;">
                            <input type="hidden" name="userId" value="<%= request.getParameter("userId")%>"></input>
                            <input type="hidden" name="movieId" value="<%= request.getParameter("movieId") %>"></input>
                        <div class="seating-container">
                            <div class="screen"></div>

                            <div class="row-reserve" style="display: flex; gap: 5%; flex-wrap: wrap">

                                <c:forEach var="seat" items="${availableSeats}" varStatus="loop">
                                    <div class="col-md-4">
                                        <c:choose>
                                            <c:when test="${seat.available}">
                                                <label for="${seat.seatNumber}">
                                                    <div style="display: flex; flex-direction: column; align-items: center;"></div>
                                                    <input type="checkbox" name="selectedSeats" value="${seat.seatNumber}" id="${seat.seatNumber}"  style="color: white; display: flex; flex-direction: column; align-items: center;" >${seat.seatNumber}<img src="../images/GREYseat.png" alt="A1" width="50" height="40">
                                                    </input>
                                                </label>
                                            </c:when>
                                            <c:otherwise>
                                                <label for="${seat.seatNumber}">
                                                    <div style="display: flex; flex-direction: column; align-items: center;"></div>
                                                    <input type="checkbox" id="${seat.seatNumber}"  style="color: white; display: flex; flex-direction: column; align-items: center;" disabled>${seat.seatNumber}<img src="../images/READseat.png" alt="A1" width="50" height="40">
                                                    </input>
                                                </label>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    <button class="btn btn-primary" type="submit" style="margin-top: 10px;">Confirmer</button>
                    </form>
                </div>
            </div>
        </section>
    </article>
</main>

<script src="../JS/script.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
