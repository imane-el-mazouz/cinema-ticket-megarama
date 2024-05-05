package com.movieticket.dao;

import com.Connection.HibernateConf;
import com.movieticket.model.ReactionMovie;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReactionMovieDAOImp implements ReactionMovieDAO {

    @Override
    public void addReactionMovie(ReactionMovie reactionMovie) {
        try (Session session = HibernateConf.getFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(reactionMovie);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteReactionMovie(int reactionMovieId) {
        try (Session session = HibernateConf.getFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            ReactionMovie reactionMovie = session.get(ReactionMovie.class, reactionMovieId);
            if (reactionMovie != null) {
                session.delete(reactionMovie);
                transaction.commit();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Object[]> getReactionDetailsForMovie(int movieId) {
        List<Object[]> results = null;

        try (Session session = HibernateConf.getFactory().openSession()){
            Transaction transaction = session.beginTransaction();
            String sql = "SELECT m.movie_id, rm.reaction_movie_id, rm.rating, rm.comment, u.user_name, u.email " +
                         "FROM movies m " +
                         "JOIN reaction_movie rm ON rm.movie_id = m.movie_id " +
                         "JOIN users u ON rm.user_id = u.user_id " +
                         "WHERE m.movie_id = :movieId";

            Query query = session.createNativeQuery(sql);
            query.setParameter("movieId", movieId);
            results = query.getResultList();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }
}
