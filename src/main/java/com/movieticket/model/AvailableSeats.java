package com.movieticket.model;

import jakarta.persistence.*;

@Entity
@Table(name = "available_seats")
public class AvailableSeats {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "available_seat_id")
    private int availableSeatId;

    @ManyToOne
    @JoinColumn(name = "movie_id")
    private Movie movie;

    @Column(name = "seat_number")
    private String seatNumber;

    @Column(name = "is_available")
    private boolean isAvailable;

    public AvailableSeats() {
    }

    public int getAvailableSeatId() {
        return availableSeatId;
    }

    public void setAvailableSeatId(int availableSeatId) {
        this.availableSeatId = availableSeatId;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
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
