package com.movieticket.dao;

import com.movieticket.model.Movie;

import java.sql.SQLException;
import java.util.List;

public interface MovieDAO {
    List<Movie> getAllMovies();
    Movie getMovieById(int movieId);
    List<Movie> getRatingMovies();
    void addMovie(Movie movie);
    void deleteMovie(Movie movieId);
    int getPrice(Movie movieId);
    String getName(Movie movieId);
    List<Movie> searchMovie(String title);
    List<Movie> getRecommendedMovies();
}