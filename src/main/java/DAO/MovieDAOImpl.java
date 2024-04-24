package DAO;

import Connection.DatabaseManager;
import com.movieticket.model.Movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MovieDAOImpl implements MovieDAO {

    @Override
    public List<Movie> getAllMovies() throws SQLException {
        List<Movie> movies = new ArrayList<>();

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM movie");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int movie_id = resultSet.getInt("movie_id");
                String img_url = resultSet.getString("img_url");
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                Movie.Genre genre = Movie.Genre.valueOf(resultSet.getString("genre"));
                Movie.Language language = Movie.Language.valueOf(resultSet.getString("language"));
                java.sql.Time duration = resultSet.getTime("duration");
                int price = resultSet.getInt("price");
                int rating = resultSet.getInt("rating");
                Movie.SeatNumber number_of_seats = Movie.SeatNumber.valueOf(resultSet.getString("number_of_seats"));
                java.sql.Time show_time = resultSet.getTime("show_time");
                java.sql.Date show_date = resultSet.getDate("show_date");

                Movie movie = new Movie(movie_id, img_url, title, description, genre, language, duration, price, rating, number_of_seats, show_time, show_date);
                movies.add(movie);
            }
        } catch (SQLException e) {
            throw e;
        }
        return movies;
    }
}

