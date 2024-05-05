package com.movieticket.model;

import jakarta.persistence.*;

@Entity
@Table(name = "movie_actors")
public class MovieActor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "actor_id")
    private int actorId;

    @ManyToOne
    @JoinColumn(name = "movie_id", referencedColumnName = "movie_id")
    private Movie movie;

    @Column(name = "actor_name")
    private String actorName;

    @Column(name = "actor_photo_url")
    private String actorPhotoUrl;

    // Getters and setters
    public int getActorId() {
        return actorId;
    }

    public void setActorId(int actorId) {
        this.actorId = actorId;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public String getActorName() {
        return actorName;
    }

    public void setActorName(String actorName) {
        this.actorName = actorName;
    }

    public String getActorPhotoUrl() {
        return actorPhotoUrl;
    }

    public void setActorPhotoUrl(String actorPhotoUrl) {
        this.actorPhotoUrl = actorPhotoUrl;
    }
}
