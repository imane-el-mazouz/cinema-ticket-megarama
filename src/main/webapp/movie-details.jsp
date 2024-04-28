<%--
  Created by IntelliJ IDEA.
  User: PCPACK
  Date: 26/04/2024
  Time: 00:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Free Guy 2021</title>

    <!--
      - favicon
    -->
    <link rel="shortcut icon" href="../favicon.svg" type="image/svg+xml">

    <!--
      - custom css link
    -->
    <link rel="stylesheet" href="../assets/css/style.css">

    <!--
      - google font link
    -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>

<body id="#top">

<!--
  - #HEADER
-->

<header class="header" data-header>
    <div class="container">

        <div class="overlay" data-overlay></div>

        <a href="../index.html" class="logo">
            <img src="./assets/images/logo.svg" alt="Filmlane logo">
        </a>

        <div class="header-actions">

            <button class="search-btn">
                <ion-icon name="search-outline"></ion-icon>
            </button>

            <div class="lang-wrapper">
                <label for="language">
                    <ion-icon name="globe-outline"></ion-icon>
                </label>

                <select name="language" id="language">
                    <option value="en">EN</option>
                    <option value="au">AU</option>
                    <option value="ar">AR</option>
                    <option value="tu">TU</option>
                </select>
            </div>

            <button class="btn btn-primary">Sign in</button>

        </div>

        <button class="menu-open-btn" data-menu-open-btn>
            <ion-icon name="reorder-two"></ion-icon>
        </button>

        <nav class="navbar" data-navbar>

            <div class="navbar-top">

                <a href="../index.html" class="logo">
                    <img src="./assets/images/logo.svg" alt="Filmlane logo">
                </a>

                <button class="menu-close-btn" data-menu-close-btn>
                    <ion-icon name="close-outline"></ion-icon>
                </button>

            </div>

            <ul class="navbar-list">

                <li>
                    <a href="../index.html" class="navbar-link">Home</a>
                </li>

                <li>
                    <a href="#" class="navbar-link">Movie</a>
                </li>

                <li>
                    <a href="#" class="navbar-link">Tv Show</a>
                </li>

                <li>
                    <a href="#" class="navbar-link">Web Series</a>
                </li>

                <li>
                    <a href="#" class="navbar-link">Pricing</a>
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
                    <p class="detail-subtitle">New Episodes</p>
                    <h1 class="h1 detail-title">${selectedMovie.getTitle()}</h1>
                    <div class="meta-wrapper">
                        <div class="badge-wrapper">
                            <div class="badge badge-fill">PG 13</div>
                            <div class="badge badge-outline">HD</div>
                        </div>
                        <div class="ganre-wrapper">
                            <c:forEach var="genre" items="${selectedMovie.getGenres()}">
                                <a href="#">${genre}</a>
                            </c:forEach>
                        </div>
                        <div class="date-time">
                            <div>
                                <ion-icon name="calendar-outline"></ion-icon>
                                <time datetime="${selectedMovie.getReleaseYear()}">${selectedMovie.getReleaseYear()}</time>
                            </div>
                            <div>
                                <ion-icon name="time-outline"></ion-icon>
                                <time datetime="${selectedMovie.getDuration()}">${selectedMovie.getDuration()}</time>
                            </div>
                        </div>
                    </div>
                    <p class="storyline">${selectedMovie.getDescription()}</p>
                    <div class="details-actions">
                        <button class="share">
                            <ion-icon name="share-social"></ion-icon>
                            <span>Share</span>
                        </button>
                        <div class="title-wrapper">
                            <p class="title">${selectedMovie.getProvider()}</p>
                            <p class="text">Streaming Channels</p>
                        </div>
                        <button class="btn btn-primary">
                            <ion-icon name="play"></ion-icon>
                            <span>Watch Now</span>
                        </button>
                    </div>
                    <a href="${selectedMovie.getImgUrl()}" download class="download-btn">
                        <span>Download</span>
                        <ion-icon name="download-outline"></ion-icon>
                    </a>
                </div>
            </div>
        </section>






        <!--
          - #TV SERIES
        -->

        <section class="tv-series">
            <div class="container">

                <p class="section-subtitle">Best TV Series</p>

                <h2 class="h2 section-title">World Best TV Series</h2>

                <ul class="movies-list">
                    <c:forEach var="movie" items="${getAllMovies}">
                        <li>
                            <div class="movie-card">

                                <a href="./movie-details.html">
                                    <figure class="card-banner">
                                        <img src="${movie.getImgUrl()}" alt="${movie.getTitle()} ">
                                    </figure>
                                </a>

                                <div class="title-wrapper">
                                    <a href="./movie-details.html">
                                        <h3 class="card-title">${movie.getTitle()} </h3>
                                    </a>

                                    <time datetime="${movie.getTitle()} ">${movie.getTitle()} </time>
                                </div>

                                <div class="card-meta">
                                    <div class="badge badge-outline">${movie.getPrice()}</div>

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

            <div class="footer-brand-wrapper">

                <a href="../filmlane/index.html" class="logo">
                    <img src="./assets/images/logo.svg" alt="Filmlane logo">
                </a>

                <ul class="footer-list">

                    <li>
                        <a href="../filmlane/index.html" class="footer-link">Home</a>
                    </li>

                    <li>
                        <a href="#" class="footer-link">Movie</a>
                    </li>

                    <li>
                        <a href="#" class="footer-link">TV Show</a>
                    </li>

                    <li>
                        <a href="#" class="footer-link">Web Series</a>
                    </li>

                    <li>
                        <a href="#" class="footer-link">Pricing</a>
                    </li>

                </ul>

            </div>

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
                &copy; 2022 <a href="#">codewithsadee</a>. All Rights Reserved
            </p>

            <img src="./assets/images/footer-bottom-img.png" alt="Online banking companies logo" class="footer-bottom-img">

        </div>
    </div>

</footer>





<!--
  - #GO TO TOP
-->

<a href="#top" class="go-top" data-go-top>
    <ion-icon name="chevron-up"></ion-icon>
</a>





<!--
  - custom js link
-->
<script src="../assets/js/script.js"></script>

<!--
  - ionicon link
-->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>
</html>
