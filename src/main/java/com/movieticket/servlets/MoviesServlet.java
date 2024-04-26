package com.movieticket.servlets;

import com.Connection.DatabaseManager;
import com.movieticket.model.Movie;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class MoviesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Movie> movies = getMoviesFromDatabase(); // Fetch movie data from the database

        request.setAttribute("movies", movies);
        request.getRequestDispatcher("dashbord.jsp").forward(request, response);
    }

    private List<Movie> getMoviesFromDatabase() {
        List<Movie> movies = new ArrayList<>();

        String sql = "SELECT * FROM movies";

        try (Connection connection = DatabaseManager.getConnection(); // Use the existing connection code to get the connection
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                String imgUrl = resultSet.getString("img_url");
                String title = resultSet.getString("title");
                Movie.Genre genre = Movie.Genre.valueOf(resultSet.getString("genre"));
                Date showDate = resultSet.getDate("show_time");

                Movie movie = new Movie( imgUrl, title, genre, showDate);
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle any potential database errors
        }

        return movies;
    }
}