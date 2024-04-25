package com.movieticket.servlets;

import com.movieticket.DAO.MovieDAO;
import com.movieticket.DAO.MovieDAOImpl;
import com.movieticket.model.Movie;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;

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
        ////////////////
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Movie> getAllMovies = movieDAO.getAllMovies();
            request.setAttribute("getAllMovies", getAllMovies);
            request.getRequestDispatcher("/WEB-INF/displayMovies.jsp").forward((ServletRequest) request, (ServletResponse) response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("");
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
