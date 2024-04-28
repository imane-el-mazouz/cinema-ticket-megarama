<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style><%@include file ="../CSS/styles.css"%></style>
    <title>Movie Seat Booking</title>
</head>
<body class="body-reserve">
<div class="movie-container">
    <label>Pick a movie:</label>
    <select id="movie">
        <option value="${price}">${name} ($${price})</option>
    </select>
</div>

<ul class="showcase">
    <li>
        <div class="seat"></div>
        <small>N/A</small>
    </li>

    <li>
        <div class="seat selected"></div>
        <small>Selected</small>
    </li>

    <li>
        <div class="seat occupied"></div>
        <small>Occupied</small>
    </li>
</ul>

<form action="user/reserve" method="post">
    <input type="hidden" name="userId" value="${userId}">
    <input type="hidden" name="movieId" value="${movieId}">
    <div class="container-reserve">
        <div class="screen"></div>
        <c:forEach var="seat" items="${availableSeats}">
            <div class="row row-reserve">
                <c:choose>
                    <c:when test="${seat.isAvailable}">
                        <div class="seat" value="${seat.seatNumber}"></div>
                    </c:when>
                    <c:otherwise>
                        <div class="seat occupied" value="${seat.seatNumber}"></div>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:forEach>
    </div>

    <p class="text">
        You have selected <span id="count">0</span> seats for a price of $<span id="total">${price}</span>
    </p>
    <br>
    <input type="submit" value="Réserver">
</form>



<script><%@include file ="../JS/script.js"%></script>

</body>
</html>