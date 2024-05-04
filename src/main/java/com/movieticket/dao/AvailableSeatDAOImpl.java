package com.movieticket.dao;

import java.util.ArrayList;
import java.util.List;

import com.Connection.HibernateConf;
import com.movieticket.model.AvailableSeats;
import com.movieticket.model.Movie;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class AvailableSeatDAOImpl implements AvailableSeatDAO{
    private SessionFactory factory = HibernateConf.getFactory();

    @Override
    public List<AvailableSeats> getAllSeats(Movie movie) {
        List<AvailableSeats> seats = new ArrayList<>();
        try (Session session = HibernateConf.getFactory().openSession()) {
            Query<AvailableSeats> query = session.createQuery("FROM AvailableSeats AS s WHERE s.movie = :movie", AvailableSeats.class);
            query.setParameter("movie", movie);
            seats = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return seats;
    }

    @Override
    public AvailableSeats getSeatByNumber(String seatNumber) {
        AvailableSeats seat = null;
        try (Session session = HibernateConf.getFactory().openSession()) {
            String hql = "FROM AvailableSeats AS s WHERE s.seatNumber = :seatNumber";
            Query<AvailableSeats> query = session.createQuery(hql, AvailableSeats.class);
            query.setParameter("seatNumber", seatNumber);
            List<AvailableSeats> seats = query.list();
            if (!seats.isEmpty()) {
                seat = seats.get(0); // Prendre le premier siège trouvé
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return seat;
    }


    @Override
    public void updateSeat(AvailableSeats seat) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            transaction = session.beginTransaction();
            session.update(seat);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            System.err.println("Error updating seat: " + e.getMessage());
        }
    }
}
