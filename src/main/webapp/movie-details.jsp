<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Megarama Béni Mellal</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style><%@include file ="./CSS/styles.css"%></style>
    <link rel="stylesheet" href="CSS/styles.css">
</head>
<header class="header" data-header>
    <div class="container">
        <div class="overlay" data-overlay></div>
        <a href="movies" class="logo">
            <img src="images/logo.png" height="50px" alt="Cinema-TV">
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
                <a href="movies" class="logo">
                    <img src="images/logo.png" alt="Cinema LOgo">
                </a>
                <button class="menu-close-btn" data-menu-close-btn>
                    <ion-icon name="close-outline"></ion-icon>
                </button>
            </div>
            <ul class="navbar-list">
                <li>
                    <a href="movies" class="navbar-link">Movies</a>
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
                <figure class="movie-detail-banner">
                    <img src="${selectedMovie.getImgUrl()}" alt="${selectedMovie.getTitle()} poster">
                    <button class="play-btn">
                        <ion-icon name="play-circle-outline"></ion-icon>
                    </button>
                </figure>
                <div class="movie-detail-content">
                    <h1 class="h1 detail-title">${selectedMovie.getTitle()}</h1>
                    <div class="meta-wrapper">
                        <div class="ganre-wrapper">
                            <a href="#">${selectedMovie.getGenre()}</a>
                        </div>
                        <div class="date-time">
                            <div>
                                <ion-icon name="time-outline"></ion-icon>
                                <time datetime="${selectedMovie.getDuration()}">${selectedMovie.getDuration()}</time>
                            </div>
                        </div>
                    </div>
                    <p class="storyline">${selectedMovie.getDescription()}</p>
                    <p class="storyline">Show Time : ${selectedMovie.getShowTime()}</p>
                    <p class="storyline">Show Date : ${selectedMovie.getShowDate()}</p>

                    <button class="btn btn-primary">
                        <span> <a href="${pageContext.request.contextPath}/user/reserve?movieId=${selectedMovie.getMovieId()}&&">Reserve Now</a> </span>
                    </button>

                    <div class="form-group">
                        <label for="commentaire">Comment</label>
                        <input type="text" class="form-control" id="commentaire" name="commentaire" placeholder="Commentaire">
                    </div>

                    <a href="movies" class="btn btn-primary">Submit Comment</a>
                </div>
            </div>
        </section>
    </article>
</main>
<script src="JS/script.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
