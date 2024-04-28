package com.movieticket.servlets;

import com.movieticket.dao.MovieDAO;
import com.movieticket.dao.MovieDAOImpl;
import com.movieticket.model.Movie;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class MovieDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final MovieDAO movieDAO;

    public MovieDetailsServlet() {
        super();
        movieDAO = new MovieDAOImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            Movie selectedMovie = movieDAO.getMovieById(movieId);
            request.setAttribute("selectedMovie", selectedMovie);
            

            List<Movie> getAllMovies = movieDAO.getAllMovies();
            request.setAttribute("getAllMovies", getAllMovies);
            request.getRequestDispatcher("/movie-details.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
