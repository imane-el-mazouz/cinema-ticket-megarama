package com.movieticket.dao;

import com.movieticket.model.ReactionMovie;
import com.Connection.DatabaseManager;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import static com.Connection.DatabaseManager.getConnection;

public class ReactionMovieDAOImp implements ReactionMovieDAO {
    @Override
    public ReactionMovie getReactionMovieById(int reactionMovieId) {
        return null;
    }

    @Override
    public List<ReactionMovie> getReactionMoviesByUserId(int userId) {
        return null;
    }

    @Override
    public List<ReactionMovie> getReactionMoviesByMovieId(int movieId) {
        return null;
    }

    @Override
    public void addReactionMovie(ReactionMovie reactionMovie) {
        String query = "INSERT INTO reaction_movies (reactionMovieId ,user_id, movie_id, rating, comment) VALUES (?, ?, ?, ? ,?)";


        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, reactionMovie.getReactionMovieId());
            preparedStatement.setInt(2, reactionMovie.getUserId());
            preparedStatement.setInt(3, reactionMovie.getMovieId());
            preparedStatement.setInt(4, reactionMovie.getRating());
            preparedStatement.setString(5, reactionMovie.getComment());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void updateReactionMovie(ReactionMovie reactionMovie) {

    }

    @Override
    public void deleteReactionMovie(int reactionMovieId) {
        String sql = "DELETE FROM reaction_movies WHERE reactionMovieId = ?";
        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, reactionMovieId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}