package com.movieticket.dao;

import com.movieticket.model.Reservation;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface ReservationDAO {
    int calculatePrice(int movieId, int numberOfSeats);
    void addReservation(int userId, int movieId, String seatNumber, int priceTotal);
    List<Reservation> getPreviousReservations(int userId);
}
