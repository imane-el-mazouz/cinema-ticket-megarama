package com.movieticket.model;

public class ReactionMovie {
    private int reactionMovieId;
    private User user;
    private Movie movie;
    private int rating;
    private String comment;
    public ReactionMovie() {}

    public ReactionMovie(int reactionMovieId, int userId, int movieId, int rating, String comment) {
    }

    public int getReactionMovieId() {
        return reactionMovieId;
    }

    public void setReactionMovieId(int reactionMovieId) {
        this.reactionMovieId = reactionMovieId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
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
