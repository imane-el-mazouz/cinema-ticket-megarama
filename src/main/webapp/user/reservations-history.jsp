<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Reservations</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        .card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card h3 {
            margin-top: 0;
        }

        .card p {
            margin: 5px 0;
        }

        .no-reservation {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <h2>My Reservations</h2>

    <c:choose>
        <c:when test="${not empty userReservations}">
            <c:forEach var="reservation" items="${userReservations}">
                <div class="card">
                    <h3>Reservation ID: ${reservation.reservationId}</h3>
                    <p><strong>User ID:</strong> ${reservation.userId}</p>
                    <p><strong>Movie ID:</strong> ${reservation.movieId}</p>
                    <p><strong>Total Price:</strong> ${reservation.priceTotal}</p>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div class="no-reservation">
                <p>No reservations found.</p>
            </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
