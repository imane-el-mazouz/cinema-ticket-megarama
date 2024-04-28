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

        int userId = 2;
        int movieId = Integer.parseInt(request.getParameter("movieId"));

        List<AvailableSeat> availableSeats = availableSeatDAO.getAllSeats().stream()
                .filter(seat -> seat.getMovieId() == movieId) .collect(Collectors.toList());


        int price = movieDAO.getPrice(movieId);
        request.setAttribute("price", price);
        String name = movieDAO.getName(movieId);
        request.setAttribute("name", name);
        request.setAttribute("userId", userId);
        request.setAttribute("movieId", movieId);
        request.setAttribute("availableSeats", availableSeats);
        request.getRequestDispatcher("/user/reserve-movie.jsp").forward(request, response);

    }

    protected void doPot(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        String[] selectedSeatStrings = request.getParameterValues("selectedSeats");

        int[] selectedSeats = Arrays.stream(selectedSeatStrings) .mapToInt(Integer::parseInt) .toArray();

        if (selectedSeats == null || selectedSeats.length == 0) {
            response.getWriter().println("Aucun siège sélectionné.");
            return;
        }

        int priceTotal = reservationDAO.calculatePrice(movieId, selectedSeats.length);

        List<Reservation> previousReservations = reservationDAO.getPreviousReservations(userId);
        request.setAttribute("previousReservations", previousReservations);
        request.getRequestDispatcher("/user/reservation-history.jsp").forward(request, response);
    }

}