package com.movieticket.dao;

import com.movieticket.model.Reservation;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface ReservationDAO {
    public int calculatePrice(int movieId, int numberOfSeats);
    int getSeatId(Connection conn, int movieId, String seatNumber) throws SQLException;
    boolean makeReservation(Reservation reservation);
    List<Reservation> getPreviousReservations(int userId);
}
