package com.movieticket.dao;

import com.Connection.HibernateConf;
import com.movieticket.model.Movie;
import com.movieticket.model.MovieActor;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class MovieActorDAOImpl implements MovieActorDAO {

    @Override
    public void addMovieActor(MovieActor movieActor) {
        try (Session session = HibernateConf.getFactory().openSession()) {
            session.beginTransaction();
            session.save(movieActor);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<MovieActor> getActorsByMovieId(int movieId) {
        List<MovieActor> actors = new ArrayList<>();
        try (Session session = HibernateConf.getFactory().openSession()) {
            Query<MovieActor> query = session.createQuery("FROM MovieActor WHERE movie.movieId = :movieId", MovieActor.class);
            query.setParameter("movieId", movieId);
            actors = query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return actors;
    }

}
