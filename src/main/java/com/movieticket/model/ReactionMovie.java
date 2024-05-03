package com.movieticket.model;

public class ReactionMovie {
    private int reactionMovieId;
    private int userId;
    private int movieId;
    private int rating;
    private String comment;
    public ReactionMovie() {}
    public int getReactionMovieId() {
        return reactionMovieId;
    }

    public void setReactionMovieId(int reactionMovieId) {
        this.reactionMovieId = reactionMovieId;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public int getMovieId() {
        return movieId;
    }
    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }
    public int getRating() {
        return rating;
    }
    public void setRating(int rating) {
        this.rating = rating;
    }
    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }
}
