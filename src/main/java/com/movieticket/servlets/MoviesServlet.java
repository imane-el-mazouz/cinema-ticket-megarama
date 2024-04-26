package com.movieticket.servlets;

import com.Connection.DatabaseManager;
import com.movieticket.model.Movie;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/movies")
public class MoviesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Get a connection from the database manager
            connection = com.Connection.DatabaseManager.getConnection();
            String query = "SELECT * FROM movies";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            List<Movie> movies = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String genre = resultSet.getString("genre");
                String showDate = resultSet.getString("show_date");
                String imgUrl = resultSet.getString("img_url");

                Movie movie = new Movie(imgUrl, title, genre, showDate);
                movies.add(movie);
            }

            request.setAttribute("movies", movies);
            request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQL exception
            // You might want to redirect to an error page or display an error message
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle exception while closing resources
            }
        }
    }
}
