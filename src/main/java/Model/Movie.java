package Model;

import jakarta.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;


public class Movie {
    private int movie_id;
    private String img_url;
    private String title;
    private String description;
    private Genre genre;
    private Language language;
    private Time duration;
    private int price;
    private int rating;
    private SeatNumber number_of_seats;
    private Time show_time;
    private Date show_date;
    public enum Genre {
        ACTION, COMEDY, DRAMA, HORROR, SCIENCE_FICTION, ROMANCE,
    }

public enum Language{
        ar, en, fr,
}
public enum SeatNumber{
        A, B, C, D, E, F ,G, H, I, J ,K, L , M, N, O, P, Q, R, S, T,

}

    public Movie(int movie_id, String img_url, String title, String description, Genre genre, Language language, Time duration, int price, int rating, SeatNumber number_of_seats, Time show_time, Date show_date) {
        this.movie_id = movie_id;
        this.img_url = img_url;
        this.title = title;
        this.description = description;
        this.genre = genre;
        this.language = language;
        this.duration = duration;
        this.price = price;
        this.rating = rating;
        this.number_of_seats = number_of_seats;
        this.show_time = show_time;
        this.show_date = show_date;
    }
   //Getters
    public int getMovie_id() {
        return movie_id;
    }
    public String getImg_url() {
        return img_url;
    }
    public String getTitle() {
        return title;
    }
    public String getDescription() {
        return description;
    }
    public Genre getGenre() {
        return genre;
    }
    public Language getLanguage() {
        return language;
    }

    public Time getDuration() {
        return duration;
    }

    public int getPrice() {
        return price;
    }

    public int getRating() {
        return rating;
    }

    public SeatNumber getNumber_of_seats() {
        return number_of_seats;
    }

    public Time getShow_time() {
        return show_time;
    }

    public Date getShow_date() {
        return show_date;
    }


    //Setters
    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public void setGenre(Genre genre) {
        this.genre = genre;
    }



    public void setLanguage(Language language) {
        this.language = language;
    }



    public void setDuration(Time duration) {
        this.duration = duration;
    }



    public void setPrice(int price) {
        this.price = price;
    }


    public void setRating(int rating) {
        this.rating = rating;
    }



    public void setNumber_of_seats(SeatNumber number_of_seats) {
        this.number_of_seats = number_of_seats;
    }


    public void setShow_time(Time show_time) {
        this.show_time = show_time;
    }



    public void setShow_date(Date show_date) {
        this.show_date = show_date;
    }
}
