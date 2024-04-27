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
    Reservation reservation = new Reservation();
    @Override
    public void AddNewReservation(Reservation reservation) {
    	String sql = "INSERT INTO reservations (user_id, movie_id, number_of_tickets, price_total) VALUES (?, ?, ?, ?)";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, reservation.getUserId());
            statement.setInt(2, reservation.getMovieId());
            statement.setString(3, reservation.getNumberOfTickets().toString());
            statement.setInt(4, reservation.getPriceTotal());

            statement.executeUpdate();
            System.out.println("Reservation added successfully.");

        } catch (SQLException e) {
            System.err.println("Error adding reservation: " + e.getMessage());
        }
    }

    @Override
    public List<Reservation> getPreviousReservations(int userId) {
        List<Reservation> reservations = new ArrayList<>();
        String sql = "SELECT * FROM reservations WHERE user_id = ?";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int reservationId = resultSet.getInt("reservation_id");
                int movieId  = resultSet.getInt("movie_id");
                Reservation.SeatNumber numberOfTickets = Reservation.SeatNumber.valueOf(resultSet.getString("number_of_seats"));
                int priceTotal  = resultSet.getInt("price_total");

                Reservation reservation = new Reservation(reservationId, userId, movieId, numberOfTickets, priceTotal);
                reservations.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reservations;
    }
}
