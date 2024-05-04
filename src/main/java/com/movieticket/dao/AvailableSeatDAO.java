package com.movieticket.dao;

import com.movieticket.model.AvailableSeats;
import com.movieticket.model.Movie;

import java.util.List;

public interface AvailableSeatDAO {
    List<AvailableSeats> getAllSeats(Movie movieId);
    AvailableSeats getSeatByNumber(String seatNumber);
    void updateSeat(AvailableSeats seat);
}
