<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List of Movies</title>
    <style>
        /* Style pour la liste de films */
        .container {
            max-width: 960px;
            margin: 0 auto;
            padding: 20px;
        }

        .movie-card {
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }

        .movie-card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .movie-card img {
            width: 100%;
            height: auto;
        }

        .movie-card .card-body {
            padding: 20px;
        }

        .movie-card h5 {
            font-size: 1.25rem;
            margin-bottom: 10px;
        }

        .movie-card p {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>List of Movies</h1>
    <div class="row">
        <c:forEach var="movie" items="${getAllMovies}">
            <div class="col-md-4">
                <div class="movie-card">
                    <img src="${movie.getImg_url()}" alt="Movie Image">
                    <div class="card-body">
                        <h5>${movie.getTitle()}</h5>
                        <p>${movie.getDescription()}</p>
                        <p>Genre: ${movie.getGenre()}</p>
                        <p>Language: ${movie.getLanguage()}</p>
                        <p>Duration: ${movie.getDuration()}</p>
                        <p>Price: ${movie.getPrice()}</p>
                        <p>Rating: ${movie.getRating()}</p>
                        <p>Number of Seats: ${movie.getNumber_of_seats()}</p>
                        <p>Show Time: ${movie.getShow_time()}</p>
                        <p>Show Date: ${movie.getShow_date()}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
