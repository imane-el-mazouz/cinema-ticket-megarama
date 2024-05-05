package com.movieticket.dao;

import com.movieticket.model.MovieActor;

import java.util.List;

public interface MovieActorDAO {
    void addMovieActor(MovieActor movieActor);
    List<MovieActor> getActorsByMovieId(int movieId);
}

