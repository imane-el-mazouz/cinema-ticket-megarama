package com.movieticket.servlets.user;


import com.movieticket.dao.ReservationDAO;
import com.movieticket.dao.ReservationDAOImp;
import com.movieticket.model.Reservation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;


public class AllReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ReservationDAO reservationDAO;

    public AllReservationServlet() {
        super();
        reservationDAO = new ReservationDAOImp();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPot(request,response);
    }

    protected void doPot(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));

        List<Reservation> previousReservations = reservationDAO.getPreviousReservations(userId);
        request.setAttribute("previousReservations", previousReservations);
        request.getRequestDispatcher("/user/reservation-history.jsp").forward(request, response);
    }

}