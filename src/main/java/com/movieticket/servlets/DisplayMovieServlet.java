package com.movieticket.servlets;

import com.movieticket.dao.MovieDAO;
import com.movieticket.dao.MovieDAOImpl;
import com.movieticket.model.Movie;


import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

public class DisplayMovieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final MovieDAO movieDAO;

    public DisplayMovieServlet() {
        super();
        movieDAO = new MovieDAOImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Movie> ratingMovies = movieDAO.getRatingMovies();
            request.setAttribute("ratingMovies", ratingMovies);

            List<Movie> getAllMovies = movieDAO.getAllMovies();
            request.setAttribute("getAllMovies", getAllMovies);
            request.getRequestDispatcher("/movies.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("");
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
