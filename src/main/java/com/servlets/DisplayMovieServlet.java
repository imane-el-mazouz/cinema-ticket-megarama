package com.servlets;

import DAO.MovieDAO;
import DAO.MovieDAOImpl;
import com.model.Movie;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/DisplayMovieServlet")
public class DisplayMovieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MovieDAO movieDAO;

    public DisplayMovieServlet() {
        super();
        movieDAO = new MovieDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Movie> getAllMovies = movieDAO.getAllMovies();
            request.setAttribute("getAllMovies", getAllMovies);
            request.getRequestDispatcher("/WEB-INF/displayMovies.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

