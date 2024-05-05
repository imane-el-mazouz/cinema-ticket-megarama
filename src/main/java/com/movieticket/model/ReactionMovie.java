package com.movieticket.model;

import jakarta.persistence.*;

@Entity
@Table(name = "reaction_movie")
public class ReactionMovie {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reaction_movie_id")
    private int reactionMovieId;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "movie_id")
    private Movie movie;

    @Column(name = "rating", nullable = false)
    private int rating;

    @Column(name = "comment")
    private String comment;


    public ReactionMovie() {}

    public ReactionMovie(User user, Movie movie, int rating, String comment) {
        this.user = user;
        this.movie = movie;
        this.rating = rating;
        this.comment = comment;
    }

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
