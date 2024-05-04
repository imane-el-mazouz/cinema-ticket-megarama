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
    public ReactionMovie getReactionMovieById(int reactionMovieId) {
        return null;
    }

    @Override
    public List<ReactionMovie> getReactionMoviesByUserId(int userId) {
        return null;
    }

    @Override
    public List<ReactionMovie> getReactionMoviesByMovieId(int movieId) {
        return null;
    }

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
    public void updateReactionMovie(ReactionMovie reactionMovie) {
        try (Session session = HibernateConf.getFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(reactionMovie);
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

    public List<ReactionMovie> getAllReactions() {
        List<ReactionMovie> reactions = new ArrayList<>();
        try (Session session = HibernateConf.getFactory().openSession()) {
            Query<ReactionMovie> query = session.createQuery("FROM ReactionMovie", ReactionMovie.class);
            reactions = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reactions;
    }


}
