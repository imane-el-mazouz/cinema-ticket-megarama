<%@ page import="com.movieticket.model.Movie" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 24/04/2024
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of Movies</title>
</head>
<body>
<h1>List of Movies</h1>
<table>
    <tr>
        <th>Titre</th>
        <th>Description</th>M
    </tr>
    <% for (Movie movie : (List<Movie>)request.getAttribute("getAllMovies")) { %>
    <tr>
        <td><%= movie.getTitle() %></td>
        <td><%= movie.getDescription() %></td>
        <td><%= movie.getGenre() %></td>
        <td><%= movie.getLanguage() %></td>
        <td><%= movie.getDuration() %></td>
        <td><%= movie.getPrice() %></td>

    </tr>
    <% } %>
</table>
</body>
</html>
<table border="1">
    <thead>
    <tr>
        <th>Type</th>
        <th>Prix</th>
        <th>Equipements</th>
        <th>Availaibility</th>
        <th>Image</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach var="room" items="${availableRooms}">
        <tr>
            <td>${room.type}</td>
            <td>${room.price}</td>
            <td>${room.equipements}</td>
            <td>${room.available ? 'Available' : 'Not Available'}</td>
            <td><img src="${room.image_Path}" alt="image_path" width="100"></td>

        </tr>
    </c:forEach>
    </tbody>
</table>