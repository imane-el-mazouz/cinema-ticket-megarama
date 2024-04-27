<%--
  Created by IntelliJ IDEA.
  User: PCPACK
  Date: 25/04/2024
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container" id="reserveRoomId" style="display: none; max-width: 40%;">
    <button type="button" class="btn btn-outline-light btn-close float-end" aria-label="Close" style="background-color: #fff"></button>
    <h2>Make Reservation</h2>
    <form action="user/reserve" method="get">
        <input type="hidden" name="action" value="reserveMovie">
        <input type="hidden" name="userId" id="userId">
        <input type="hidden" name="movieId" id="movieId">
        <label>Number Of Tickets:</label>
        <input class="form-control" type="text" name="numberOfTickets"><br>
        <select name="numberOfTickets">
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
            <option value="D">D</option>
            <option value="E">E</option>
            <option value="F">F</option>
            <option value="G">G</option>
            <option value="H">H</option>
            <option value="I">I</option>
            <option value="J">J</option>
            <option value="K">K</option>
            <option value="L">L</option>
            <option value="M">M</option>
            <option value="N">N</option>
            <option value="O">O</option>
            <option value="P">P</option>
            <option value="Q">Q</option>
            <option value="R">R</option>
            <option value="S">S</option>
            <option value="T">T</option>

        </select><br>
        <label>Price Total:</label>
        <input class="form-control" type="text" name="priceTotal"><br>
        <input class="btn-save" type="submit" value="Save">
    </form>

</div>
</body>
</html>
