<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Megarama Béni Mellal</title>
    <link rel="stylesheet" href="CSS/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<main>
    <article>
        <section class="movie-detail">
            <div class="container">
                <figure class="movie-detail-banner">
                    <img src="${selectedMovie.getImgUrl()}" alt="${selectedMovie.getTitle()} poster">
                    <button class="play-btn">
                        <ion-icon name="play-circle-outline"></ion-icon>
                    </button>
                </figure>
                <div class="movie-detail-content">
                    <h1 class="h1 detail-title">${selectedMovie.getTitle()}</h1>
                    <div class="meta-wrapper">
                        <div class="ganre-wrapper">
                            <a href="#">${selectedMovie.getGenre()}</a>
                        </div>
                        <div class="date-time">
                            <div>
                                <ion-icon name="time-outline"></ion-icon>
                                <time datetime="${selectedMovie.getDuration()}">${selectedMovie.getDuration()}</time>
                            </div>
                        </div>
                    </div>
                    <p class="storyline">${selectedMovie.getDescription()}</p>
                    <p class="storyline">Show Time : ${selectedMovie.getShowTime()}</p>
                    <p class="storyline">Show Date : ${selectedMovie.getShowDate()}</p>

                    <button class="btn btn-primary">
                        <span> <a href="${pageContext.request.contextPath}/user/reserve?movieId=${selectedMovie.getMovieId()}">Reserve Now</a> </span>
                    </button>
                </div>
            </div>
        </section>
    </article>
</main>
<script src="JS/script.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
