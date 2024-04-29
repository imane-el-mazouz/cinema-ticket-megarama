package com.movieticket.servlets.user;

import com.movieticket.dao.ReservationDAO;
import com.movieticket.dao.ReservationDAOImp;
import com.movieticket.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class AllReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ReservationDAO reservationDAO;

    public AllReservationServlet() {
        super();
        reservationDAO = new ReservationDAOImp();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userID");

        // Get all reservations for the current user from the DAO
        List<Reservation> userReservations = reservationDAO.getPreviousReservations(userId);

        // Set the reservations as an attribute in the request
        request.setAttribute("userReservations", userReservations);

        // Forward the request to the JSP to display the reservations
        request.getRequestDispatcher("/user/reservations-history.jsp").forward(request, response);
    }
}
