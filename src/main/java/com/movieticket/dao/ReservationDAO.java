package com.movieticket.dao;

import com.movieticket.model.AvailableSeats;
import com.movieticket.model.Movie;
import com.movieticket.model.Reservation;
import com.movieticket.model.User;

import java.util.List;

public interface ReservationDAO {
    void addReservation(User userId, Movie movieId, AvailableSeats seat, int priceTotal);
    List<Object[]> getReservationDetails(int userId);
}
