package com.movieticket.dao;

import com.movieticket.model.AvailableSeat;

import java.util.List;

public interface AvailableSeatDAO {
    List<AvailableSeat> getAllSeats();
    AvailableSeat getSeat(int id);
    void updateSeat(AvailableSeat seat);
}
