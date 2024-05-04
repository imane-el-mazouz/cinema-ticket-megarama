package com.movieticket.dao;

import com.Connection.HibernateConf;
import com.movieticket.model.Movie;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class MovieDAOImpl implements MovieDAO {
    private SessionFactory factory = HibernateConf.getFactory();

    @Override
    public List<Movie> getAllMovies(){
        List<Movie> movies = new ArrayList<>();
        try (Session session = factory.openSession()) {
            movies = session.createQuery("FROM Movie", Movie.class).list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    @Override
    public Movie getMovieById(int movieId){
        Movie movie = null;
        try (Session session = factory.openSession()) {
            movie = session.get(Movie.class, movieId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movie;
    }

    @Override
    public List<Movie> getRatingMovies(){
        List<Movie> movies = new ArrayList<>();
        try (Session session = factory.openSession()) {
            Query query = session.createQuery("FROM Movie WHERE rating > 8 ORDER BY rating DESC");
            movies = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    @Override
    public int getPrice(Movie movieId) {
        int price = 0;
        try (Session session = factory.openSession()) {
            Movie movie = session.get(Movie.class, movieId);
            if (movie != null) {
                price = movie.getPrice();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return price;
    }

    @Override
    public String getName(Movie movieId) {
        String name = null;
        try (Session session = factory.openSession()) {
            Movie movie = session.get(Movie.class, movieId);
            if (movie != null) {
                name = movie.getTitle();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    @Override
    public void deleteMovie(Movie movieId){
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            transaction = session.beginTransaction();
            Movie movie = session.get(Movie.class, movieId);
            if (movie != null) {
                session.delete(movie);
                transaction.commit();
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }


    @Override
    public List<Movie> searchMovie(String title){
        List<Movie> movies = new ArrayList<>();
        try (Session session = factory.openSession()) {
            Query query = session.createQuery("FROM Movie WHERE title = :title");
            query.setParameter("title", title);
            movies = query.getResultList();
            // Handle search results here
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    @Override
    public void addMovie(Movie movie){
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            transaction = session.beginTransaction();
            session.save(movie);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
}
