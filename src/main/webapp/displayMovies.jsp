<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Movies</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .movie-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }

        .movie-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            animation: fadeIn 0.5s ease;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .movie-card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .movie-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            display: block;
        }

        .card-body {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card-body h5 {
            font-size: 1.2rem;
            margin-bottom: 10px;
            color: #333;
        }

        .card-body p {
            margin-bottom: 8px;
            color: #666;
            flex-grow: 1;
        }

        .btn-container {
            display: flex;
            justify-content: center;
            margin-top: 16px;
        }

        .btn-details {
            background-color: #4CAF50;
            color: #fff;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .btn-details:hover {
            background-color: #45a049;
        }

        .rating-container {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            margin-top: 8px;
        }

        .rating-container i {
            color: #ffd700;
            margin-left: 4px;
        }

        .section-title {
            font-size: 2rem;
            margin-bottom: 30px;
            color: #333;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="section-title">List of Movies</h1>
    <div class="movie-grid">
        <c:forEach var="movie" items="${getAllMovies}">
            <div class="movie-card">
                <img src="${movie.getImg_url()}" alt="${movie.getTitle()}">
                <div class="card-body">
                    <h5>${movie.getTitle()}</h5>
                    <p><strong>Genre:</strong> ${movie.getGenre()}</p>
                    <p><strong>Price:</strong> $${movie.getPrice()}</p>
                    <div class="rating-container">
                        <p><strong>Rating:</strong> ${movie.getRating()}</p>
                        <c:forEach var="i" begin="1" end="${movie.getRating()}">
                            <i class="fas fa-star"></i>
                        </c:forEach>
                    </div>
                    <div class="btn-container">
                        <button class="btn-details">View Details <i class="fas fa-info-circle"></i></button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>