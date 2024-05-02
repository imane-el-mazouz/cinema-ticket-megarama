package com.movieticket.dao;


import com.Connection.DatabaseManager;
import com.movieticket.model.Movie;
import com.movieticket.model.Genre;
import com.movieticket.model.Language;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MovieDAOImpl implements MovieDAO {
    @Override
    public void deleteMovie(int movieId) throws SQLException {
        String sql = "DELETE FROM movies WHERE movie_id = ?";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, movieId);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw e;
        }
    }

    @Override
    public List<Movie> getAllMovies() throws SQLException {
        List<Movie> movies = new ArrayList<>();

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM movies");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int movieId = resultSet.getInt("movie_id");
                String imgUrl = resultSet.getString("img_url");
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                Movie.Genre genreStr = Movie.Genre.valueOf(resultSet.getString("genre").toUpperCase());
                Movie.Language language = Movie.Language.valueOf(resultSet.getString("language"));
                java.sql.Time duration = resultSet.getTime("duration");
                int price = resultSet.getInt("price");
                int rating = resultSet.getInt("rating");
                int numberOfSeats = resultSet.getInt("number_of_seats");
                java.sql.Time showTime = resultSet.getTime("show_time");
                java.sql.Date showDate = resultSet.getDate("show_date");
                String commentaire= resultSet.getString("commentaire");


                Movie movie = new Movie(movieId, imgUrl, title, description, genreStr, language, duration, price, rating, numberOfSeats, showTime, showDate , commentaire);
                movies.add(movie);
            }
        } catch (SQLException e) {
            throw e;
        }
        return movies;
    }

    public Movie getMovieById(int movieId) throws SQLException {
        Movie movie = null;

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM movies WHERE movie_id = ?");
        ) {
            statement.setInt(1, movieId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String imgUrl = resultSet.getString("img_url");
                    String title = resultSet.getString("title");
                    String description = resultSet.getString("description");
                    Movie.Genre genreStr = Movie.Genre.valueOf(resultSet.getString("genre").toUpperCase());
                    Movie.Language language = Movie.Language.valueOf(resultSet.getString("language"));
                    java.sql.Time duration = resultSet.getTime("duration");
                    int price = resultSet.getInt("price");
                    int rating = resultSet.getInt("rating");
                    int numberOfSeats = resultSet.getInt("number_of_seats");
                    java.sql.Time showTime = resultSet.getTime("show_time");
                    java.sql.Date showDate = resultSet.getDate("show_date");
                    String commentaire= resultSet.getString("commentaire");


                    movie = new Movie(movieId, imgUrl, title, description, genreStr, language, duration, price, rating, numberOfSeats, showTime, showDate , commentaire);
                }
            }
        } catch (SQLException e) {
            throw e;
        }
        return movie;
    }


    @Override
    public List<Movie> getRatingMovies() throws SQLException {
        List<Movie> movies = new ArrayList<>();

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM movies WHERE rating > 8 ORDER BY rating DESC");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int movie_id = resultSet.getInt("movie_id");
                String img_url = resultSet.getString("img_url");
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                Movie.Genre genreStr = Movie.Genre.valueOf(resultSet.getString("genre").toUpperCase());
                Movie.Language language = Movie.Language.valueOf(resultSet.getString("language"));
                java.sql.Time duration = resultSet.getTime("duration");
                int price = resultSet.getInt("price");
                int rating = resultSet.getInt("rating");
                int number_of_seats = resultSet.getInt("number_of_seats");
                java.sql.Time show_time = resultSet.getTime("show_time");
                java.sql.Date show_date = resultSet.getDate("show_date");
                String commentaire= resultSet.getString("commentaire");


                Movie movie = new Movie(movie_id, img_url, title, description, genreStr, language, duration, price, rating, number_of_seats, show_time, show_date , commentaire);
                movies.add(movie);
            }
        } catch (SQLException e) {
            throw e;
        }
        return movies;
    }

    @Override
    public int getPrice(int movieId) {
        String sql = "SELECT price FROM movies WHERE movie_id = ?";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, movieId);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return rs.getInt("price");
            }

        } catch (SQLException e) {
            System.err.println("Error fetching movie price: " + e.getMessage());
        }

        return 0;
    }

    @Override
    public String getName(int movieId) {
        String sql = "SELECT name FROM movies WHERE movie_id = ?";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, movieId);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                return rs.getString("name");
            }

        } catch (SQLException e) {
            System.err.println("Error fetching movie name: " + e.getMessage());
        }

        return null;
    }

    @Override
    public void searchMovie(String title) throws SQLException {
        try(Connection connection = DatabaseManager.getConnection();
            PreparedStatement statement= connection.prepareStatement(
                    "SELECT * FROM movies WHERE title = ?")){
            statement.setString(1,title);

            }
    }




    @Override
    public void addMovie(Movie movie) throws SQLException {
        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "INSERT INTO movies (img_url, title, description, genre, language, duration, price, rating, number_of_seats, show_time, show_date , commentaire) " +
                             "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? , ?)")) {

            statement.setString(1, movie.getImgUrl());
            statement.setString(2, movie.getTitle());
            statement.setString(3, movie.getDescription());
            statement.setString(4, movie.getGenre().toString());
            statement.setString(5, movie.getLanguage().toString());
            statement.setTime(6, movie.getDuration());
            statement.setInt(7, movie.getPrice());
            statement.setInt(8, movie.getRating());
            statement.setInt(9, movie.getNumberOfSeats());
            statement.setTime(10, movie.getShowTime());
            statement.setDate(11, movie.getShowDate());
            statement.setString(12, movie.getCommentaire());

            statement.executeUpdate();
        } catch (SQLException e) {
            throw e;
        }

    }
    @Override
    public void addComment(String title, String commentaire) throws SQLException {
         try(Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "INSERT INTO movies (title, commentaire) " +
                     "VALUES (?, ?)")) {

             statement.setString(1, title);
             statement.setString(2,commentaire);
             statement.executeUpdate();


         }
}

    @Override
    public List<String> getCommentairesForMovieTitle(String title) {
        return null;
    }
}
