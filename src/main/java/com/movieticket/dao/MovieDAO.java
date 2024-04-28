package com.movieticket.dao;

import com.movieticket.model.Movie;

import java.sql.SQLException;
import java.util.List;

public interface MovieDAO {
    List<Movie> getAllMovies() throws SQLException;
    Movie getMovieById(int movieId) throws SQLException;
    List<Movie> getRatingMovies() throws SQLException;
    void addMovie(Movie movie) throws SQLException;
    void deleteMovie(int movieId) throws SQLException;
    int getPrice(int movieId);
    String getName(int movieId);

}