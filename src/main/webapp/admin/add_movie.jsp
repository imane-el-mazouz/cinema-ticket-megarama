<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add a new Movie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 600px;
            padding: 40px;
            background-color: white;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
        .form-control, .form-select {
            border-color: #ddd;
            border-radius: 5px;
        }
        .form-control:focus, .form-select:focus {
            border-color: #007bff;
            box-shadow: none;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            width: 100%;
            font-size: 16px;
            padding: 12px 20px;
            border-radius: 5px;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Add a new Movie</h1>
    <form action="${pageContext.request.contextPath}/admin/add" method="POST">
        <div class="mb-3">
            <label for="img_url" class="form-label">Image URL:</label>
            <input type="text" id="img_url" name="img_url" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="title" class="form-label">Title:</label>
            <input type="text" id="title" name="title" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description:</label>
            <textarea id="description" name="description" class="form-control" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label for="genre" class="form-label">Genre:</label>
            <select id="genre" name="genre" class="form-select" required>
                <option value="">Select a genre</option>
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
            <select id="language" name="language" class="form-select" required>
                <option value="">Select a language</option>
                <option value="ar">Arabic</option>
                <option value="en">English</option>
                <option value="fr">French</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="duration" class="form-label">Duration (hh:mm):</label>
            <input type="time" id="duration" name="duration" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price:</label>
            <input type="number" id="price" name="price" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="rating" class="form-label">Rating:</label>
            <input type="number" id="rating" name="rating" class="form-control" step="0.1" required>
        </div>
        <div class="mb-3">
            <label for="number_of_seats" class="form-label">Number of Seats:</label>
            <input type="number" id="number_of_seats" name="number_of_seats" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="show_time" class="form-label">Showing time:</label>
            <input type="time" id="show_time" name="show_time" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="show_date" class="form-label">Screening date:</label>
            <input type="date" id="show_date" name="show_date" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Add</button> <br>
        <a href="/Megarama_war_exploded/admin/dashboard">Back to Admin Dashboard </a>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>