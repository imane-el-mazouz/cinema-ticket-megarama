package com.movieticket.model;

public class AvailableSeat {
    private int availableSeatId;
    private int movieId;
    private String seatNumber;
    private boolean isAvailable;

    public AvailableSeat() {
    }

    public AvailableSeat(int availableSeatId, int movieId, String seatNumber, boolean isAvailable) {
        this.availableSeatId = availableSeatId;
        this.movieId = movieId;
        this.seatNumber = seatNumber;
        this.isAvailable = isAvailable;
    }

    public int getAvailableSeatId() {
        return availableSeatId;
    }

    public void setAvailableSeatId(int availableSeatId) {
        this.availableSeatId = availableSeatId;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }
}
