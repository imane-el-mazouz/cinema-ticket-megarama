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
    private final MovieDAO movieDAO;

    public AddMovieServlet() {
        super();
        movieDAO = new MovieDAOImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/WEB-INF/add_movie.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String img_url = request.getParameter("img_url");
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            Movie.Genre genre = Movie.Genre.valueOf(request.getParameter("genre"));
            Movie.Language language = Movie.Language.valueOf(request.getParameter("language"));
            //java.sql.Time duration = java.sql.Time.valueOf(request.getParameter("duration"));
            String durationStr = request.getParameter("duration") + ":00";
            java.sql.Time duration = java.sql.Time.valueOf(durationStr);
            int price = Integer.parseInt(request.getParameter("price"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            Movie.SeatNumber number_of_seats = Movie.SeatNumber.valueOf(request.getParameter("number_of_seats"));
            //java.sql.Time show_time = java.sql.Time.valueOf(request.getParameter("show_time"));
            String showTimeStr = request.getParameter("show_time") + ":00";
            java.sql.Time show_time = java.sql.Time.valueOf(showTimeStr);

            java.sql.Date show_date = java.sql.Date.valueOf(request.getParameter("show_date"));
//            String showDateStr = request.getParameter("show_date") ;
//            java.sql.Date show_date = java.sql.Date.valueOf(showTimeStr);

            Movie movie = new Movie(img_url, title, description, genre, language, duration, price, 0, number_of_seats, show_time, show_date);

            movieDAO.addMovie(movie);
            response.sendRedirect("/WEB-INF/index.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to add movie.");
            request.getRequestDispatcher("").forward(request, response);
            ////
        }
    }
}

