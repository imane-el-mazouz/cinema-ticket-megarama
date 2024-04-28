package com.movieticket.servlets.admin;

import com.movieticket.dao.MovieDAO;
import com.movieticket.dao.MovieDAOImpl;
import com.movieticket.model.Movie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class DashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final MovieDAO movieDAO;

    public DashboardServlet() {
        super();
        movieDAO = new MovieDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            try {
                int movieId = Integer.parseInt(request.getParameter("id"));
                movieDAO.deleteMovie(movieId);
            } catch (SQLException | NumberFormatException e) {
                // Handle errors (e.g., invalid movie ID, database error)
                throw new ServletException("Error deleting movie", e);
            }
        }

        // Fetch and display movies (same as before)
        try {
            List<Movie> allMovies = movieDAO.getAllMovies();
            request.setAttribute("movies", allMovies);
            request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error fetching movies from database", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}