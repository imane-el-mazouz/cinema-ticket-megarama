package com.movieticket.servlets.user;


import com.movieticket.dao.*;
import com.movieticket.model.Movie;
import com.movieticket.model.ReactionMovie;
import com.movieticket.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


public class DisplayReactionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final MovieDAO movieDAO;
    private final UserDAO userDAO;
    private final ReservationDAO reservationDAO;
    private final AvailableSeatDAO availableSeatDAO;
    private final ReactionMovieDAO reactionMovieDAO;

    public DisplayReactionsServlet() {
        super();
        movieDAO = new MovieDAOImpl();
        userDAO = new UserDAOImpl();
        reservationDAO = new ReservationDAOImp();
        availableSeatDAO = new AvailableSeatDAOImpl();
        reactionMovieDAO = new ReactionMovieDAOImp();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            List<ReactionMovie> reactionMovies = reactionMovieDAO.getAllReactions();
            request.setAttribute("reactionMovies", reactionMovies);
            request.getRequestDispatcher("/movie-details.jsp").forward(request, response);
        } catch (NumberFormatException | NullPointerException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to add reaction movie.");
            request.getRequestDispatcher("").forward(request, response);
        }
    }

}