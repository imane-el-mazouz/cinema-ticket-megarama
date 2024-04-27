package com.movieticket.servlets.admin;

import com.movieticket.dao.MovieDAO;
import com.movieticket.dao.MovieDAOImpl; // Replace with your actual DAO implementation
import com.movieticket.model.Movie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/dashboard.jsp") // Assuming your dashboard JSP is at /dashboard.jsp
public class DashboardServlet extends HttpServlet {

    private MovieDAO movieDAO;

    public void init() {
        movieDAO = new MovieDAOImpl(); // Inject your concrete DAO implementation here
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Movie> movies = movieDAO.getAllMovies();
            request.setAttribute("movies", movies);
            request.getRequestDispatcher("/dashboard.jsp").forward(request, response); // Forward to your actual JSP
        } catch (SQLException e) {
            // Handle exceptions (e.g., log error, display error page)
            throw new ServletException("Error retrieving movies", e);
        }
    }
}