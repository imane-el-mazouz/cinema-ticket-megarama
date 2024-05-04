package com.movieticket.dao;

import java.util.ArrayList;
import java.util.List;

import com.Connection.HibernateConf;
import com.movieticket.model.AvailableSeats;
import com.movieticket.model.Movie;
import com.movieticket.model.Reservation;
import com.movieticket.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ReservationDAOImp implements ReservationDAO {
    private SessionFactory factory = HibernateConf.getFactory();


    @Override
    public void addReservation(User userId, Movie movie, AvailableSeats seat, int priceTotal) {
        Session session = factory.openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();

            // Insérer la réservation
            Reservation reservation = new Reservation();
            reservation.setUserId(userId);
            reservation.setMovieId(movie);
            reservation.setSeat(seat);
            reservation.setPriceTotal(priceTotal);
            session.save(reservation);

            // Mettre à jour la disponibilité du siège
            String updateHQL = "UPDATE AvailableSeats SET isAvailable = false WHERE movie.movieId = :movieId AND seatNumber = :seatNumber";
            Query updateQuery = session.createQuery(updateHQL);
            updateQuery.setParameter("movieId", movie.getMovieId());
            updateQuery.setParameter("seatNumber", seat.getSeatNumber());
            updateQuery.executeUpdate();

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }



    @Override
    public List<Reservation> getPreviousReservations(User userId) {
        List<Reservation> reservations = new ArrayList<>();

        Session session = factory.openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();

            String hql = "SELECT r FROM Reservation r JOIN FETCH r.seat WHERE r.userId = :userId";
            Query query = session.createQuery(hql);
            query.setParameter("userId", userId);
            List<Reservation> results = query.getResultList();
            reservations.addAll(results);

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

        return reservations;
    }



}
