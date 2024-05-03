package com.movieticket.dao;

import com.movieticket.model.ReactionMovie;

import java.util.List;

public interface ReactionMovieDAO {
    ReactionMovie getReactionMovieById(int reactionMovieId);
    List<ReactionMovie> getReactionMoviesByUserId(int userId);
    List<ReactionMovie> getReactionMoviesByMovieId(int movieId);
    void addReactionMovie(ReactionMovie reactionMovie);
    void updateReactionMovie(ReactionMovie reactionMovie);
    void deleteReactionMovie(int reactionMovieId);
}
