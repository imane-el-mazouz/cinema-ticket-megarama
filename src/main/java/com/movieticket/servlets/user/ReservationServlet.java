package com.movieticket.servlets.user;


import com.movieticket.dao.*;
import com.movieticket.model.*;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Arrays;
import java.util.stream.Collectors;


public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final MovieDAO movieDAO;
    private final ReservationDAO reservationDAO;
    private final AvailableSeatDAO availableSeatDAO;

    public ReservationServlet() {
        super();
        movieDAO = new MovieDAOImpl();
        reservationDAO = new ReservationDAOImp();
        availableSeatDAO = new AvailableSeatDAOImpl();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        int movieId = Integer.parseInt(request.getParameter("movieId"));

        List<AvailableSeat> availableSeats = availableSeatDAO.getAllSeats().stream()
                .filter(seat -> seat.getMovieId() == movieId) .collect(Collectors.toList());
        request.setAttribute("availableSeats", availableSeats);

        int price = movieDAO.getPrice(movieId);
        request.setAttribute("price", price);
        String title = movieDAO.getName(movieId);
        request.setAttribute("userId", userId);
        request.setAttribute("movieId", movieId);
        request.setAttribute("title", title);

        request.getRequestDispatcher("/user/reserve-movie.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userID");
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        String[] selectedSeats = request.getParameterValues("selectedSeats");
        int price = movieDAO.getPrice(movieId);
        for (String seatNumber : selectedSeats) {
            reservationDAO.addReservation(userId, movieId, seatNumber, price);
        }


        // Get all reservations for the current user from the DAO
        List<Reservation> userReservations = reservationDAO.getPreviousReservations(userId);
        request.setAttribute("previousReservations", userReservations);
        request.getRequestDispatcher("/user/reservations").forward(request, response);
    }

}