<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!--
      - custom css link
    -->
    <style><%@include file ="./CSS/styles.css"%></style>
    <link rel="stylesheet" href="CSS/styles.css">
    <!--
      - google font link
    -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        /* Style pour le bouton Payer */
        .butn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .butn:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body id="#top">

<!--
  - #HEADER
-->

<header class="header" data-header>
    <div class="container">
        <div class="overlay" data-overlay></div>
        <a href="movies" class="logo">
            <img src="images/logo.png" height="50px" alt="Cinema-TV">
        </a>
        <div class="header-actions">
            <nav>
                <ul>
                    <li><a href="#" onclick="showPanier()"><i class="fas fa-shopping-cart"></i> Panier</a></li>
                </ul>
            </nav>
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
        <!--
          - #Rating MOVIE
        -->
        <section class="top-rated">
            <div class="container">
                <h2 class="h2 section-title">Top Rated Movies</h2>
                <ul class="movies-list">
                    <c:forEach var="movie" items="${ratingMovies}">
                        <li>
                            <div class="movie-card">
                                <a href="${pageContext.request.contextPath}/details?movieId=${movie.getMovieId()}">
                                    <figure class="card-banner">
                                        <img src="${movie.getImgUrl()}" alt="${movie.getTitle()}">
                                    </figure>
                                </a>

                                <div class="title-wrapper">
                                    <a href="${pageContext.request.contextPath}/details?movieId=${movie.getMovieId()}">
                                        <h3 class="card-title">${movie.getTitle()}</h3>
                                    </a>
                                    <div class="badge">${movie.getGenre()} </div>
                                </div>

                                <div class="card-meta">
                                    <div class="badge badge-outline">${movie.getPrice()}$</div>
                                    <div class="duration">
                                        <ion-icon name="time-outline"></ion-icon>

                                        <time datetime="PT122M">122 min</time>
                                    </div>
                                    <div class="rating">
                                        <ion-icon name="star"></ion-icon>

                                        <data>${movie.getRating()}</data>
                                    </div>
                                </div>
                                <form action="${pageContext.request.contextPath}/panier" method="post">
                                <button class="butn" type="submit" name="movieId" value="${movie.getMovieId()}">Ajouter au Panier</button>
                            </form>

                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </section>
        <!--
          - #ALL MOVIE
        -->
        <section class="tv-series">
            <div class="container">
                <h2 class="h2 section-title">World Best TV Series</h2>
                <ul class="movies-list">
                    <c:forEach var="movie" items="${getAllMovies}">
                        <li>
                            <div class="movie-card">
                                <a href="${pageContext.request.contextPath}/details?movieId=${movie.getMovieId()}">
                                    <figure class="card-banner">
                                        <img src="${movie.getImgUrl()}" alt="${movie.getTitle()} ">
                                    </figure>
                                </a>
                                <div class="title-wrapper">
                                    <a href="${pageContext.request.contextPath}/details?movieId=${movie.getMovieId()}">
                                        <h3 class="card-title">${movie.getTitle()} </h3>
                                    </a>
                                    <div class="badge">${movie.getGenre()} </div>
                                </div>
                                <div class="card-meta">
                                    <div class="badge badge-outline">$${movie.getPrice()}</div>
                                    <div class="duration">
                                        <ion-icon name="time-outline"></ion-icon>

                                        <time datetime="${movie.getDuration()}">${movie.getDuration()}</time>
                                    </div>
                                    <div class="rating">
                                        <ion-icon name="star"></ion-icon>
                                        <data>${movie.getRating()}</data>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </section>
    </article>
</main>
<!--
  - #FOOTER
-->
<footer class="footer">
    <div class="footer-top">
        <div class="container">
            <div class="divider"></div>
            <div class="quicklink-wrapper">
                <ul class="quicklink-list">
                    <li>
                        <a href="#" class="quicklink-link">Faq</a>
                    </li>
                    <li>
                        <a href="#" class="quicklink-link">Help center</a>
                    </li>
                    <li>
                        <a href="#" class="quicklink-link">Terms of use</a>
                    </li>
                    <li>
                        <a href="#" class="quicklink-link">Privacy</a>
                    </li>
                </ul>
                <ul class="social-list">
                    <li>
                        <a href="#" class="social-link">
                            <ion-icon name="logo-facebook"></ion-icon>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="social-link">
                            <ion-icon name="logo-twitter"></ion-icon>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="social-link">
                            <ion-icon name="logo-pinterest"></ion-icon>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="social-link">
                            <ion-icon name="logo-linkedin"></ion-icon>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <p class="copyright">
                &copy; 2022 <a href="#">Megarama Béni Mellal</a>. All Rights Reserved
            </p>
            <img src="images/footer-bottom-img.png" alt="Online banking companies logo" class="footer-bottom-img">
        </div>
    </div>
</footer>
<!--
  - #GO TO TOP
-->
<a href="#top" class="go-top" data-go-top>
    <ion-icon name="chevron-up"></ion-icon>
</a>
<div id="PanierModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeDeleteForm()">&times;</span>
        <h2>Panier</h2>
        <div id="panier-content" class="panier-content"></div>
        <b action="${pageContext.request.contextPath}/Payer" method="post">
        </b>
            <div class="details-produit">

                <table>
                    <thead>
                    <tr>
                        <th>Title</th>
                        <th>Genre</th>
                        <th>Show date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th>mohamed</th>
                        <th>med</th>
                        <th>2020</th>
                    </tr>

                    </tbody>
                </table>
                <div >
                    <h3>Totale : </h3>

                    <button>Payer</button>
                </div>



            </div>
    </div>
</div>

            <script>
                function showPanier() {
                    //document.getElementById('idDeleteCategorie').value = categorieId;
                    document.getElementById('PanierModal').style.display = 'block';
                }

                function closeDeleteForm() {
                    document.getElementById('PanierModal').style.display = 'none';
                }

            </script>
<!--
  - custom js link
-->
<script src="JS/script.js"></script>
<!--
  - ionicon link
-->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>


</body>
</html>