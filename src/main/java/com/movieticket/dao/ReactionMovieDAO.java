package com.movieticket.dao;

import com.movieticket.model.ReactionMovie;

import java.util.List;

public interface ReactionMovieDAO {
    List<Object[]> getReactionDetailsForMovie(int movieId);
    void addReactionMovie(ReactionMovie reactionMovie);
    void deleteReactionMovie(int reactionMovieId);
}
