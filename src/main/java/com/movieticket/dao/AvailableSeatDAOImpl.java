package com.movieticket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Connection.DatabaseManager;
import com.movieticket.model.AvailableSeat;

public class AvailableSeatDAOImpl implements AvailableSeatDAO{
    @Override
    public List<AvailableSeat> getAllSeats() {
        List<AvailableSeat> seats = new ArrayList<>();
        String sql = "SELECT * FROM available_seats";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                AvailableSeat seat = new AvailableSeat();
                seat.setAvailableSeatId(rs.getInt("available_seat_id"));
                seat.setMovieId(rs.getInt("movie_id"));
                seat.setSeatNumber(rs.getString("seat_number"));
                seat.setAvailable(rs.getBoolean("is_available"));
                seats.add(seat);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching seats: " + e.getMessage());
        }

        return seats;
    }

    @Override
    public AvailableSeat getSeat(int id) {
        AvailableSeat seat = null;
        String sql = "SELECT * FROM available_seats WHERE available_seat_id = ?";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                seat = new AvailableSeat();
                seat.setAvailableSeatId(rs.getInt("available_seat_id"));
                seat.setMovieId(rs.getInt("movie_id"));
                seat.setSeatNumber(rs.getString("seat_number"));
                seat.setAvailable(rs.getBoolean("is_available"));
            }

        } catch (SQLException e) {
            System.err.println("Error fetching seat: " + e.getMessage());
        }

        return seat;
    }

    @Override
    public void updateSeat(AvailableSeat seat) {
        String sql = "UPDATE available_seats SET movie_id = ?, seat_number = ?, is_available = ? WHERE available_seat_id = ?";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, seat.getMovieId());
            statement.setString(2, seat.getSeatNumber());
            statement.setBoolean(3, seat.isAvailable());
            statement.setInt(4, seat.getAvailableSeatId());
            statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error updating seat: " + e.getMessage());
        }
    }
}
