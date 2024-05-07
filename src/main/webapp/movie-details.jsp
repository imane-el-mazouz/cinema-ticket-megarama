<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<head>
    <title>Megarama Béni Mellal</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style><%@include file ="./CSS/styles.css"%></style>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Potta+One&display=swap");

        html {
            font-size: 6.25vmax;
        }

        @media (max-width: 992px) {
            html {
                font-size: 60px;
            }
        }

        .section-reaction {
            padding: 0.5rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            font-size: 0.24rem;
        }

        .wrapper-reaction {
            width: 10rem;
            padding: 0.3rem 0.6rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 0.2rem;
            border-radius: 0.25rem;
            box-shadow: 10px 10px 30px rgba(0, 0, 0, 0.2);
            background-image: url("./images/footer-bg.jpg");
        }


        .rate-box {
            display: flex;
            flex-direction: row-reverse;
            gap: 0.1rem;
        }

        .rate-box input {
            display: none;
        }

        .rate-box input:hover~.star:before {
            color: rgba(255, 204, 51, 0.5);
        }

        .rate-box input:active+.star:before {
            transform: scale(0.9);
        }

        .rate-box input:checked~.star:before {
            color: #ffcc33;
            text-shadow: -3px 3px 8px rgba(0, 0, 0, 0.3), -3px 3px 8px rgba(255, 255, 255, 0.8);
        }

        .rate-box .star:before {
            content: "★";
            display: inline-block;
            font-family: "Potta One", cursive;
            font-size: 0.6rem;
            cursor: pointer;
            color: #0000;
            text-shadow: 2px 2px 3px rgba(255, 255, 255, 0.5);
            background-color: #aaa;
            background-clip: text;
            -webkit-background-clip: text;
            transition: all 0.3s;
        }

        textarea {
            border: none;
            resize: none;
            width: 100%;
            padding: 0.2rem;
            color: inherit;
            font-family: inherit;
            line-height: 1.5;
            border-radius: 0.2rem;
            box-shadow: inset 2px 2px 8px rgba(0, 0, 0, 0.3), inset -2px -2px 8px rgba(255, 255, 255, 0.8);
            background-color: rgb(255, 255, 255);
        }

        textarea::placeholder {
            font-size: 1rem;
            color: #aaa;
        }

        textarea:focus {
            outline-color: #ffcc33;
        }

        .submit-btn {
            padding: 0.2rem 0.5rem;
            box-shadow: -3px 3px 8px rgba(0, 0, 0, 0.3), -3px 3px 8px rgba(255, 255, 255, 0.8);
            border-radius: 1rem;
            cursor: pointer;
            background-color: rgba(255, 204, 51, 0.8);
            transition: all 0.2s;
        }

        .submit-btn:active {
            transform: translate(2px, 2px);
        }


        .wrapper-comment {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin-top: 3%;
        }

        .review-card-comment {
            background-color: #faf7d6;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            margin-top: 3%;
            min-width: 600px;
        }

        .img-area-comment {
            width: 80px;
            height: 80px;
            overflow: hidden;
            border-radius: 50%;
            margin-right: 25px;
        }

        .img-area-comment img {
            width: 100%;
        }

        .header-content-comment {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .info-comment h4 {
            margin: 0;
            font-size: 22px;
            font-weight: 600;
        }

        .info-comment p {
            margin: 5px 0 0;
            font-size: 14px;
            font-weight: 400;
            color: #666;
        }

        .single-review-comment p {
            margin: 0;
            font-size: 16px;
            font-weight: 400;
            line-height: 1.7;
            color: #333;
        }

        .review-footer-comment {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
            font-size: 14px;
            color: #666;
        }

        .rating-comment {
            display: flex;
        }

        .rating-comment span {
            color: #000;
            font-size: 18px;
        }

        .rating-comment span.active {
            color: #fbc02d;
        }

        @media screen and (max-width: 767px) {
            .wrapper-comment {
                flex-direction: column;
                align-items: center;
            }

            .review-card-comment {
                width: 85%;
            }
        }
    </style>
</head>
<header class="header" data-header>
    <div class="container">
        <div class="overlay" data-overlay></div>
        <a href="movie" class="logo">
            <img src="images/logo.png" height="50px" alt="Cinema-TV">
        </a>
        <div class="header-actions">
            <button class="search-btn">
                <ion-icon name="search-outline" style="font-size: 2vmax;"></ion-icon>
            </button>
            <button class="btn btn-primary"><a href="login">Sign In</a> </button>
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
                    <a href="${pageContext.request.contextPath}/" class="navbar-link">Movies</a>
                </li>
                <li>
                    <a href="user/reservations" class="navbar-link">All Reservation</a>
                </li>
                <li>
                    <a href="#" onclick="showPanier()" class="navbar-link">cart</a>
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
        <section class="movie-detail" style="background-image: url(https://wallpapers.com/images/hd/plain-background-7h91softhxck36gv.jpg) ; background-size: cover;background-position: center;padding-top: 160px;">
            <div class="container">

                <figure class="movie-detail-banner">

                    <img src="${selectedMovie.getImgUrl()}" alt="${selectedMovie.getTitle()} poster">

                    <button class="play-btn">
                        <ion-icon name="play-circle-outline"></ion-icon>
                    </button>

                </figure>
                <div class="movie-detail-content">
                    <p class=" detail-subtitle" style="color: white">Movie Details</p>
                    <h1 class="h1 detail-title">
                        <strong>${selectedMovie.getTitle()}</strong>
                    </h1>

                    <div class="meta-wrapper">

                        <div class="badge-wrapper">
                            <div class="badge badge-fill">${selectedMovie.getLanguage()}</div>

                            <div class="badge badge-outline">$ ${selectedMovie.getPrice()}</div>
                        </div>

                        <div class="ganre-wrapper">
                            <a href="#">${selectedMovie.getGenre()}</a>
                        </div>

                        <div class="date-time">
                            <div>
                                <ion-icon name="star"></ion-icon>

                                <p >${selectedMovie.getRating()}</p>
                            </div>

                            <div>
                                <ion-icon name="calendar-outline"></ion-icon>

                                <time datetime="2021">${selectedMovie.getShowDate()}</time>
                            </div>

                            <div>
                                <ion-icon name="time-outline"></ion-icon>

                                <time datetime="PT115M">${selectedMovie.getDuration()}</time>
                            </div>

                        </div>

                    </div>

                    <p class="storyline">
                        ${selectedMovie.getDescription()}
                    </p>

                    <button class="btn btn-primary">
                        <span> <a href="${pageContext.request.contextPath}/user/reserve?movieId=${selectedMovie.getMovieId()}&&">Reserve Now</a> </span>
                    </button>

                </div>
            </div>

        </section>

        <div class="container-actors"  style="width: 100%;  text-align: center; background: url(./images/service-bg.jpg) no-repeat;">
            <div class="title-wrapper">
                <p class="section-subtitle">OUR</p>

                <h2 class="h2 section-title">Movie's Actors</h2>
            </div>
            <div class="team-slider owl-carousel">

                <c:forEach var="actor" items="${movieActors}">
                    <div style="color: #ffbf00;">
                        <div class="img-area"><img alt="" class="img-fluid move-animation" src="${actor.getActorPhotoUrl()}" style="border-radius: 50%; height: 200px !important; width: 200px !important; position: relative; left: 40px; top: -80px; object-fit: cover;"></div>
                        <div class="info-area">
                            <h4 style="font-size: 1vmax;">${actor.getActorName()}</h4>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <section class="section-reaction">

        <form action="${pageContext.request.contextPath}/user/addReaction" method="post">
            <input type="hidden" name="movieId" value="${selectedMovie.getMovieId()}" />
            <div class="wrapper-reaction">
                <div style="font-weight: bold; font-size: 0.36rem; color: #ffffff;">Rate your experience</div>
                <div class="rate-box">
                    <input type="radio" name="rating" id="star0" value="5" />
                    <label class="star" for="star0"></label>
                    <input type="radio" name="rating" id="star1" value="4" />
                    <label class="star" for="star1"></label>
                    <input type="radio" name="rating" id="star2" value="3" checked="checked" />
                    <label class="star" for="star2"></label>
                    <input type="radio" name="rating" id="star3" value="2" />
                    <label class="star" for="star3"></label>
                    <input type="radio" name="rating" id="star4" value="1" />
                    <label class="star" for="star4"></label>
                </div>
                <textarea cols="30" rows="2"  style="font-size: 0.36rem;" name="comment"></textarea>
                <div class="submit-btn">
                    <button type="submit">Send</button>
                </div>
            </div>
        </form>
            <div class="wrapper-comment">
                <c:if test="${not empty allReactions}">
                    <c:forEach var="reaction" items="${allReactions}">
                        <div class="review-card-comment">
                            <div style="display: flex; flex-direction: row; justify-content: space-between;">
                            <div class="header-content-comment">
                                <div class="img-area-comment">
                                    <img alt="customer1" src="https://www.verbolabs.com/wp-content/uploads/2023/12/Person-6.webp">
                                </div>
                                <div class="info">
                                    <h4>${reaction[4]}</h4>
                                    <p>${reaction[5]}</p>
                                </div>
                            </div>
                            <div >
                                <a style="color: black;" href="${pageContext.request.contextPath}/user/deletReaction?reactionMovieId=${reaction[2]}&movieId=${reaction[0]}"><ion-icon name="trash"></ion-icon></a>
                            </div>
                            </div>
                            <div class="single-review-comment">
                                <p>${reaction[3]}</p>
                            </div>
                            <div class="review-footer-comment">
                                <div class="rating-comment">
                                    <c:set var="rating" value="${reaction[1]}" />
                                    <c:forEach begin="1" end="5">
                                        <c:choose>
                                            <c:when test="${rating >= loop.index}">
                                                <span class="star active">★</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="star">★</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </div>
                                <p>01/01/2023</p>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>

        </section>
    </article>
</main>
<!--
  - #FOOTER
-->
<footer class="footer">
    <div class="footer-top" >
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
            <img src="./images/footer-bottom-img.png" alt="Online banking companies logo" class="footer-bottom-img">
        </div>
    </div>
</footer>
<!--
  - #GO TO TOP
-->
<a href="#top" class="go-top" data-go-top>
    <ion-icon name="chevron-up" style="font-size: 2vmax;"></ion-icon>
</a>
<script src="JS/script.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

<script>
    $('.team-slider').owlCarousel({
        loop: true,
        nav: false,
        autoplay: true,
        autoplayTimeout: 5000,
        smartSpeed: 450,
        margin: 20,
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 2
            },
            991: {
                items: 3
            },
            1200: {
                items: 4
            },
            1920: {
                items: 5
            }
        }
    });
</script>
</body>
</html>
