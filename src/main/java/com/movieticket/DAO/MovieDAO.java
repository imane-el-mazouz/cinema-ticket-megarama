package com.movieticket.DAO;

import com.movieticket.model.Movie;

import java.sql.SQLException;
import java.util.List;

public interface MovieDAO {
    List<Movie> getAllMovies() throws SQLException;
    void addMovie(Movie movie) throws SQLException;

    void deleteMovie(int movieId ) throws SQLException;

}