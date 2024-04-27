package com.movieticket.dao;

import com.movieticket.model.Reservation;

import java.util.List;

public interface ReservationDAO {
    void AddNewReservation(Reservation movieId);
    List<Reservation> getPreviousReservations(int userId);
}
