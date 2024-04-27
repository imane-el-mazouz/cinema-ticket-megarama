package com.movieticket.servlets.user;


import com.movieticket.dao.ReservationDAO;
import com.movieticket.dao.ReservationDAOImp;
import com.movieticket.model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ReservationDAO reservationDAO;

    public ReservationServlet() {
        super();
        reservationDAO = new ReservationDAOImp();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "/user/reserve":
                    reserveMovie(request, response);
                    break;
                case "/user/history":
                    showReservation(request, response);
                    break;
                case "delete":

                    break;
                case "search":

                    break;
                default:

                    break;
            }
        } else {

        }
    }

    public void reserveMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        Reservation.SeatNumber numberOfTickets = Reservation.SeatNumber.valueOf(request.getParameter("numberOfTickets"));
        int priceTotal = Integer.parseInt(request.getParameter("priceTotal"));
        Reservation reservation = new Reservation(userId, movieId, numberOfTickets, priceTotal);
            reservationDAO.AddNewReservation(reservation);
            System.out.println("Reservation successful.");
    }

    public void showReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));

        List<Reservation> previousReservations = reservationDAO.getPreviousReservations(userId);
        request.setAttribute("previousReservations", previousReservations);
        request.getRequestDispatcher("/WEB-INF/listOfReservation.jsp").forward(request, response);

    }
}