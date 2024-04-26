package com.movieticket.DAO;



import com.Connection.DatabaseManager;
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
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM movies");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int movie_id = resultSet.getInt("movie_id");
                String img_url = resultSet.getString("img_url");
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                String genreStr = resultSet.getString("genre").toUpperCase(); // Convertir en majuscules pour correspondre aux constantes d'énumération
                Movie.Genre genre = Movie.Genre.valueOf(genreStr);
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
    @Override
    public void addMovie(Movie movie) throws SQLException {
        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "INSERT INTO movies (img_url, title, description, genre, language, duration, price, rating, number_of_seats, show_time, show_date) " +
                             "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {

            statement.setString(1, movie.getImg_url());
            statement.setString(2, movie.getTitle());
            statement.setString(3, movie.getDescription());
            statement.setString(4, movie.getGenre().toString());
            statement.setString(5, movie.getLanguage().toString());
            statement.setTime(6, movie.getDuration());
            statement.setInt(7, movie.getPrice());
            statement.setInt(8, movie.getRating());
            statement.setString(9, movie.getNumber_of_seats().toString());
            statement.setTime(10, movie.getShow_time());
            statement.setDate(11, movie.getShow_date());

            statement.executeUpdate();
        } catch (SQLException e) {
            throw e;
        }
    }

}