<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add a new Movie</title>
</head>
<body>
<h1>Add a new Movie</h1>
<form action="AddMovieServlet" method="POST">
    <label for="movie_id">Movie Id:</label>
    <input type="text" id="movie_id" name="movie_id"><br>

    <label for="img_url">Image URL:</label>
    <input type="text" id="img_url" name="img_url"><br>

    <label for="title">Title:</label>
    <input type="text" id="title" name="title"><br>

    <label for="description">Description:</label>
    <textarea id="description" name="description"></textarea><br>

    <label for="genre">Genre:</label>
    <select id="genre" name="genre">
        <option value="ACTION">Action</option>
        <option value="COMEDY">Comedy</option>
        <option value="DRAMA">Drama</option>
        <option value="HORROR">Horror</option>
        <option value="Science Fiction">Horror</option>
        <option value="HORROR">Romance</option>



    </select><br>

    <label for="language">Language:</label>
    <select id="language" name="language">
        <option value="ar">Arabic</option>
        <option value="en">English</option>
        <option value="fr">French</option>
    </select><br>

    <label for="duration">Duration (hh:mm:ss):</label>
    <input type="text" id="duration" name="duration"><br>

    <label for="price">Price:</label>
    <input type="text" id="price" name="price"><br>

    <label for="rating">Rating:</label>
    <input type="text" id="rating" name="rating"><br>

    <label for="number_of_seats">Number of Seats:</label>
    <select id="number_of_seats" name="number_of_seats">
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

    <label for="show_time">Showing time:</label>
    <input type="text" id="show_time" name="show_time"><br>

    <label for="show_date">Screening date:</label>
    <input type="text" id="show_date" name="show_date"><br>

    <input type="submit" value="Add">
</form>
</body>
</html>

