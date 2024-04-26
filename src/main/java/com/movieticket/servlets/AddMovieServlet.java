package com.movieticket.servlets;

import com.movieticket.DAO.MovieDAO;
import com.movieticket.DAO.MovieDAOImpl;
import com.movieticket.model.Movie;


import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

@WebServlet("/AddMovieServlet")
public class AddMovieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MovieDAO movieDAO;

    public AddMovieServlet() {
        super();
        movieDAO = new MovieDAOImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/add_movie.jsp").forward((ServletRequest) request, (ServletResponse) response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int movie_id = Integer.parseInt(request.getParameter("movie_id"));
        String img_url = request.getParameter("img_url");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String genreStr = request.getParameter("genre");
        String languageStr = request.getParameter("language");
        String durationStr = request.getParameter("duration");
        int price = Integer.parseInt(request.getParameter("price"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String numberOfSeatsStr = request.getParameter("number_of_seats");
        String showTimeStr = request.getParameter("show_time");
        String showDateStr = request.getParameter("show_date");
        try {
            Movie.Genre genre = Movie.Genre.valueOf(genreStr);
            Movie.Language language = Movie.Language.valueOf(languageStr);
            java.sql.Time duration = java.sql.Time.valueOf(durationStr);
            Movie.SeatNumber number_of_seats = Movie.SeatNumber.valueOf(numberOfSeatsStr);
            java.sql.Time show_time = java.sql.Time.valueOf(showTimeStr);
            java.sql.Date show_date = java.sql.Date.valueOf(showDateStr);

            Movie movie = new Movie(movie_id, img_url, title, description, genre, language, duration, price, rating, number_of_seats, show_time, show_date);
            movieDAO.addMovie(movie);

            this.getServletContext().getRequestDispatcher("/WEB-INF/displayMovies.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}