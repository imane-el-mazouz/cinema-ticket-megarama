package com.movieticket.servlets;

import DAO.MovieDAO;
import DAO.MovieDAOImpl;
import com.movieticket.model.Movie;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

mport java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AddMovieServlet")
public class AddMovieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MovieDAO movieDAO;

    public AddMovieServlet() {
        super();
        movieDAO = new MovieDAOImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // No need for GET request handling in adding movie, you can redirect to a form
        response.sendRedirect("add_movie_form.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String director = request.getParameter("director");
        int year = Integer.parseInt(request.getParameter("year"));

        Movie movie = new Movie(title, director, year);

        // Call DAO to add the movie
        movieDAO.addMovie(movie);
        response.sendRedirect("DisplayMovieServlet");
    }
}