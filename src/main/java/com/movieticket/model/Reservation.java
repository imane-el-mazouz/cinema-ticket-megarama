package com.movieticket.model;

import java.util.Arrays;

public class Reservation {
    private int reservationId;
    private int userId;
    private int movieId;
    private int[] selectedSeats;
    private String[] reservedSeatNumbersArray;
    private int priceTotal;

    public Reservation() {
    }

    public Reservation(int userId, int movieId, int[] selectedSeats, int priceTotal) {
        this.reservationId = reservationId;
        this.userId = userId;
        this.movieId = movieId;
        this.selectedSeats = selectedSeats;
        this.priceTotal = priceTotal;
    }

    public Reservation(int reservationId, int userId, int movieId, String[] reservedSeatNumbersArray, int priceTotal) {
        this.reservationId = reservationId;
        this.userId = userId;
        this.movieId = movieId;
        this.reservedSeatNumbersArray = reservedSeatNumbersArray;
        this.priceTotal = priceTotal;
    }


    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public int[] getSelectedSeats() {
        return selectedSeats;
    }

    public void setSelectedSeats(int[] selectedSeats) {
        this.selectedSeats = selectedSeats;
    }

    public int getPriceTotal() {
        return priceTotal;
    }

    public void setPriceTotal(int priceTotal) {
        this.priceTotal = priceTotal;
    }
}
