package DAO;

import com.movieticket.model.Movie;

import java.sql.SQLException;
import java.util.List;

public interface MovieDAO {
    List<Movie> getAllMovies() throws SQLException;

}