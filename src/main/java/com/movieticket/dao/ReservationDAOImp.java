package com.movieticket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Connection.DatabaseManager;
import com.movieticket.model.Movie;
import com.movieticket.model.Reservation;

public class ReservationDAOImp implements ReservationDAO {

    @Override
    public int calculatePrice(int movieId, int numberOfSeats) {
        int pricePerSeat = 0;
        String sql = "SELECT price FROM movies WHERE movie_id = ?";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, movieId);
            ResultSet resultSet = statement.executeQuery();

            pricePerSeat = resultSet.getInt("price");

        } catch (SQLException e) {
            e.printStackTrace();
        }
        int totalPrice = pricePerSeat * numberOfSeats;
        return totalPrice;
    }


    @Override
    public void addReservation(int userId, int movieId, String seatNumber, int priceTotal) {
        String sql = "INSERT INTO reservations (user_id, movie_id, seat_id, price_total) VALUES (?, ?, (SELECT available_seat_id FROM available_seats WHERE movie_id = ? AND seat_number = ?), ?)";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            connection.setAutoCommit(false);

            // Insérer la réservation
            statement.setInt(1, userId);
            statement.setInt(2, movieId);
            statement.setInt(3, movieId);
            statement.setString(4, seatNumber);
            statement.setInt(5, priceTotal);
            statement.executeUpdate();

            String updateSql = "UPDATE available_seats SET is_available = FALSE WHERE movie_id = ? AND seat_number = ?";
            PreparedStatement updateStatement = connection.prepareStatement(updateSql);
            updateStatement.setInt(1, movieId);
            updateStatement.setString(2, seatNumber);
            updateStatement.executeUpdate();

            connection.commit();

        } catch (SQLException e) {
            System.err.println("Error adding reservation: " + e.getMessage());
        }
    }


    @Override
    public List<Reservation> getPreviousReservations(int userId) {
        List<Reservation> reservations = new ArrayList<>();
        String sql = "SELECT r.reservation_id, r.movie_id, r.price_total, a.seat_number " +
                "FROM reservations r " +
                "JOIN available_seats a ON r.seat_id = a.available_seat_id " +
                "WHERE r.user_id = ?";
        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int reservationId = resultSet.getInt("reservation_id");
                int movieId = resultSet.getInt("movie_id");
                int priceTotal = resultSet.getInt("price_total");

                Reservation reservation = new Reservation();
                reservation.setReservationId(reservationId);
                reservation.setUserId(userId);
                reservation.setMovieId(movieId);
                reservation.setPriceTotal(priceTotal);

                reservations.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reservations;
    }


}
