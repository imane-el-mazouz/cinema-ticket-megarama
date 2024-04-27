<%--
  Created by IntelliJ IDEA.
  User: Dell PC
  Date: 24/04/2024
  Time: 22:34
  To change this template use File | Settings | File Templates.
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
<form action="admin/add" method="POST" class="container">


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
    <div class="mb-3">
        <label for="number_of_seats" class="form-label">Number of Seats:</label>
        <input type="text" id="number_of_seats" name="number_of_seats" class="form-control">
    </div>
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