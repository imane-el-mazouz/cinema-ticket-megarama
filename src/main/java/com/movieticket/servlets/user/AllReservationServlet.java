package com.movieticket.servlets.user;

import com.movieticket.dao.ReservationDAO;
import com.movieticket.dao.ReservationDAOImp;
import com.movieticket.dao.UserDAO;
import com.movieticket.dao.UserDAOImpl;
import com.movieticket.model.Movie;
import com.movieticket.model.Reservation;
import com.movieticket.model.User;

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
    private final UserDAO userDAO;

    public AllReservationServlet() {
        super();
        reservationDAO = new ReservationDAOImp();
        userDAO = new UserDAOImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userID");
        User user = userDAO.getUserById(userId);

        List<Reservation> userReservations = reservationDAO.getPreviousReservations(user);

        request.setAttribute("userReservations", userReservations);

        request.getRequestDispatcher("/user/reservations-history.jsp").forward(request, response);
    }
}
