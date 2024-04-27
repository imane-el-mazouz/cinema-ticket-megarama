<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25/04/2024
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<main class="d-flex flex-column justify-content-centre align-items-center">
    <section class="container mt-5" id="previousReservations"
             style="${not empty previousReservations ? 'display: block;' : 'display: none;'}">
        <h2 class="text-start mb-4">Previous Reservations</h2>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <!-- Previous Reservation Cards - Dynamically Generated -->
            <c:if test="${previousReservations.size() == 0}">
                <h5>aucune reservation </h5>
            </c:if >
            <c:forEach var="reservation" items="${previousReservations}">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <h5 class="card-title fw-bold fs-3">Reservation ID: ${reservation.reservation_id}</h5>
                            </div>
                            <p class="card-text">Room ID: ${reservation.movie_id}</p>
                            <p class="card-text">Start Date: ${reservation.number_of_tickets}</p>
                            <p class="card-text">End Date: ${reservation.price_total}</p>
                        </div>

                    </div>
                </div>
            </c:forEach>
        </div>
    </section>
</body>
</html>
