package com.movieticket.model;

public class Reservation {
    private int reservationId;
    private int userId;
    private int movieId;
    private SeatNumber numberOfTickets;
    private int priceTotal;

    public enum SeatNumber{
        A, B, C, D, E, F ,G, H, I, J ,K, L , M, N, O, P, Q, R, S, T,

    }

    public Reservation() {
    }

    public Reservation(int movieId) {
        this.movieId = movieId;
    }

    public Reservation(int reservationId, int userId, int movieId, SeatNumber numberOfTickets, int priceTotal) {
        this.reservationId = reservationId;
        this.userId = userId;
        this.movieId = movieId;
        this.numberOfTickets = numberOfTickets;
        this.priceTotal = priceTotal;
    }

    public Reservation(int userId, int movieId, SeatNumber numberOfTickets, int priceTotal) {

        this.userId = userId;
        this.movieId = movieId;
        this.numberOfTickets = numberOfTickets;
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

    public SeatNumber getNumberOfTickets() {
        return numberOfTickets;
    }

    public void setNumberOfTickets(SeatNumber numberOfTickets) {
        this.numberOfTickets = numberOfTickets;
    }

    public int getPriceTotal() {
        return priceTotal;
    }

    public void setPriceTotal(int priceTotal) {
        this.priceTotal = priceTotal;
    }
}
