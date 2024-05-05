package com.movieticket.servlets.user;


import com.movieticket.dao.*;
import com.movieticket.model.*;


import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;


public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final MovieDAO movieDAO;
    private final UserDAO userDAO;
    private final ReservationDAO reservationDAO;
    private final AvailableSeatDAO availableSeatDAO;

    public ReservationServlet() {
        super();
        movieDAO = new MovieDAOImpl();
        userDAO = new UserDAOImpl();
        reservationDAO = new ReservationDAOImp();
        availableSeatDAO = new AvailableSeatDAOImpl();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userID");
        User user = userDAO.getUserById(userId);
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        Movie movie = movieDAO.getMovieById(movieId);

        List<AvailableSeats> availableSeats = availableSeatDAO.getAllSeats(movie);
        request.setAttribute("availableSeats", availableSeats);
        Movie selectedMovie = movieDAO.getMovieById(movieId);
        request.setAttribute("selectedMovie", selectedMovie);

        request.setAttribute("userId", user);
        request.setAttribute("movieId", movie);

        request.getRequestDispatcher("/user/reserve-movie.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userID");
        User user = userDAO.getUserById(userId);
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        Movie movie = movieDAO.getMovieById(movieId);

        String[] selectedSeats = request.getParameterValues("selectedSeats");
        int price = movieDAO.getPrice(movie);
        for (String seatNumber : selectedSeats) {
            AvailableSeats seat = availableSeatDAO.getSeatByNumber(seatNumber);
            reservationDAO.addReservation(user, movie, seat, price);
        }

        request.setAttribute("successMessage", "Congratulations! Your reservation has been successfully confirmed.");
        response.sendRedirect(request.getContextPath() + "/user/reservations?successMessage=" + request.getAttribute("successMessage"));
    }
}