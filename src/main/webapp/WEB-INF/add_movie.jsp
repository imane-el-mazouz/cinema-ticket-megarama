<%--
  Created by IntelliJ IDEA.
  User: Dell PC
  Date: 24/04/2024
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add a new Movie</title>
</head>
<body>
<h1>Add a new Movie</h1>
<form action="AddMovieServlet" method="post">
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
--%>

<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add a new Movie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<h1>Add a new Movie</h1>
<form action="AddMovieServlet" method="POST" class="container">


    <div class="mb-3">
        <label for="img_url" class="form-label">Image URL:</label>
        <input type="text" id="img_url" name="img_url" class="form-control">
    </div>

    <div class="mb-3">
        <label for="title" class="form-label">Title:</label>
        <input type="text" id="title" name="title" class="form-control">
    </div>

    <div class="mb-3">
        <label for="description" class="form-label">Description:</label>
        <textarea id="description" name="description" class="form-control"></textarea>
    </div>

    <div class="mb-3">
        <label for="genre" class="form-label">Genre:</label>
        <select id="genre" name="genre" class="form-select">
            <option value="ACTION">Action</option>
            <option value="COMEDY">Comedy</option>
            <option value="DRAMA">Drama</option>
            <option value="HORROR">Horror</option>
            <option value="ROMANCE">Romance</option>
            <option value="SCIENCE_FICTION">Science Fiction</option>
        </select>
    </div>

    <div class="mb-3">
        <label for="language" class="form-label">Language:</label>
        <select id="language" name="language" class="form-select">
            <option value="ar">Arabic</option>
            <option value="en">English</option>
            <option value="fr">French</option>
        </select>
    </div>

    <div class="mb-3">
        <label for="duration" class="form-label">Duration (hh:mm):</label>
        <input type="time" id="duration" name="duration" class="form-control">
    </div>


    <div class="mb-3">
        <label for="price" class="form-label">Price:</label>
        <input type="text" id="price" name="price" class="form-control">
    </div>
    <div class="mb-3">
        <label for="rating" class="form-label">Rating:</label>
        <input type="text" id="rating" name="rating" class="form-control">
    </div>
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
    <div class="mb-3">
        <label for="show_time" class="form-label">Showing time:</label>
        <input type="time" id="show_time" name="show_time" class="form-control">
    </div>
    <div class="mb-3">
        <label for="show_date" class="form-label">Screening date:</label>
        <input type="date" id="show_date" name="show_date" class="form-control">
    </div>





    <button type="submit" class="btn btn-primary">Add</button>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>