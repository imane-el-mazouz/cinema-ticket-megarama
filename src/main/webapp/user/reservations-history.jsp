<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!--
      - custom css link
    -->
    <style><%@include file ="../CSS/styles.css"%></style>
    <link rel="stylesheet" href="../CSS/styles.css">    <!--
      - google font link
    -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>

<body id="#top">
<% String successMessage = (String) request.getAttribute("successMessage"); %>
<!--
  - #HEADER
-->

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
        </div>
        <button class="menu-open-btn" data-menu-open-btn>
            <ion-icon name="reorder-two"></ion-icon>
        </button>
        <nav class="navbar" data-navbar>
            <div class="navbar-top">
                <a href="movie" class="logo">
                    <img src="../images/logo.png" alt="Cinema LOgo">
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
                    <a href="#" class="navbar-link">All Reservation</a>
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
<main style="margin-top: 12%;">
    <h2 class="h2 section-title" style="margin-bottom: 4%">My Reservations</h2>
    <c:choose>
        <c:when test="${not empty reservationDetails}">
            <div class="card-my-reservation">
                <c:forEach var="reservationDetail" items="${reservationDetails}">
                    <div class="ticket" style="margin-bottom: 1rem;">
                        <div class="left">
                            <div class="image" style="background-image: url(${reservationDetail[2]});">
                                <p class="admit-one">
                                    <span>ADMIT ONE</span>
                                    <span>ADMIT ONE</span>
                                    <span>ADMIT ONE</span>
                                </p>
                                <div class="ticket-number">
                                    <p>
                                        #${reservationDetail[0]}${reservationDetail[14]}
                                    </p>
                                </div>
                            </div>
                            <div class="ticket-info">
                                <p class="date">
                                    <span>${reservationDetail[13]}</span>
                                    <span class="june-29"><i class="far fa-smile"></i></span>
                                    <span>${reservationDetail[14]}</span>
                                </p>
                                <div class="show-name">
                                    <h3>${reservationDetail[4]}</h3>
                                </div>
                                <div class="time">
                                    <p>Your Seat</p>
                                    <p>${reservationDetail[17]}</p>
                                </div>
                                <p class="location">
                                    <span class="separator"><i class="far fa-smile"></i></span>
                                    <span class="separator">Enjoy</span>
                                    <span class="separator"><i class="far fa-smile"></i></span>
                                </p>
                            </div>
                        </div>
                        <div class="right">
                            <p class="admit-one">
                                <span>ADMIT ONE</span>
                                <span>ADMIT ONE</span>
                                <span>ADMIT ONE</span>
                            </p>
                            <div class="right-info-container">
                                <div class="show-name">
                                    <h1>${reservationDetail[4]}</h1>
                                </div>
                                <div class="time">
                                    <p>${reservationDetail[17]}</p>
                                </div>
                                <div class="barcode">
                                    <img src="https://external-preview.redd.it/cg8k976AV52mDvDb5jDVJABPrSZ3tpi1aXhPjgcDTbw.png?auto=webp&s=1c205ba303c1fa0370b813ea83b9e1bddb7215eb" alt="QR code">
                                </div>
                                <p class="ticket-number">
                                    #${reservationDetail[0]}${reservationDetail[14]}
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="no-reservation">
                <p>No reservations found.</p>
            </div>
        </c:otherwise>
    </c:choose>
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
            <img src="../images/footer-bottom-img.png" alt="Online banking companies logo" class="footer-bottom-img">
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
<script src="../JS/script.js"></script>
<!--
  - ionicon link
-->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>
    <%-- Affichage de l'alerte de succès --%>
    <%if (successMessage != null && !successMessage.isEmpty()) {%>
    alert("<%=successMessage%>");
    <%}%>
</script>
</body>
</html>