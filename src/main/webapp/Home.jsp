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
    <style>
        #con {
            padding: 20px;
            text-align: center;
            max-width: 800px;
            margin: 0 auto;
        }

        .video {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            margin-top: 70px;

        }


        .cinema-title {
            font-size: 36px;
            font-weight: bold;
            color: black;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.07);
            animation: shadow-pulse 2s infinite alternate;

        }

        .discount-button {
            background-color: #E2D703FF;
            color: #000;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .discount-button:hover {
            background-color: #E2D703FF;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 20px;
            padding: 20px;
            width: 300px;
            text-align: center;
            background-color: #fff;
        }

        .card h2 {
            font-size: 24px;
            font-weight: bold;
            color: #E2D703FF;
        }

        .card p {
            font-size: 14px;
        }
        .movie-image {
            width: 100%;
            height: auto;
            border-radius: 10px 10px 0 0;
        }
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes popIn {
            from {
                opacity: 0;
                transform: scale(0.8);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        @keyframes shadow-pulse {
            from {
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.07);
            }
            to {
                text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.3);
            }
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
                    <a href="Home" class="navbar-link">Home</a>
                </li>
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
<div style="padding:20px;margin-top:200px;background-color:#f1f1f1;">
    <div style="margin-top: 50px; padding: 20px; background-color: #ffffff; border-radius: 10px;">
        <h2 style="text-align: center; font-size: 36px; font-weight: bold;color:#E2D703FF ">Welcome to Megarama Cinema</h2>
        <p style="text-align: center; font-size: 18px;">At Megarama Cinema, we are dedicated to providing our customers with an exceptional movie-watching experience. Our state-of-the-art facilities, comfortable seating, and diverse selection of films ensure that every visit to Megarama is memorable. Whether you're a fan of action, comedy, drama, or romance, there's something for everyone at Megarama Cinema. Come join us and immerse yourself in the magic of cinema!</p>
    </div>
    <div class="container"id="con">
        <div style="display: flex; justify-content: center;">
            <div style="flex: 1;">
                <iframe class="video" width="1200" height="500" src="https://www.youtube.com/embed/YoHD9XEInc0" frameborder="0" allowfullscreen></iframe>
            </div>
        </div>
        <div style="text-align: center; margin-top: 20px;display :flex ;justify-content: center">
            <button class="discount-button">Get 10% off today - Claim Now!</button>
        </div>
    </div>
    <h2 style="text-align: center; margin-top: 20px;font-size: 26px;font-weight: bold;color: black;font-size: 36px;text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.07);animation: shadow-pulse 2s infinite alternate;

">Coming soon</h2>
    <div style="display: flex; justify-content: center; flex-wrap: wrap;">
        <div class="card">
            <img src="images/movie-1.png" alt="Movie Title 1" class="movie-image">
            <h2>SONIC</h2>
        </div>
        <div class="card">
            <img src="images/movie-2.png" alt="Movie Title 2" class="movie-image">
            <h2>MORBUIS</h2>
        </div>
        <div class="card">
            <img src="images/movie-6.png" alt="Movie Title 3" class="movie-image">
            <h2>UNCHARTED</h2>
        </div>
    </div>
</div>

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