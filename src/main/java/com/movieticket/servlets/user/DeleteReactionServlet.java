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


public class DeleteReactionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final MovieDAO movieDAO;
    private final UserDAO userDAO;
    private final ReservationDAO reservationDAO;
    private final AvailableSeatDAO availableSeatDAO;
    private final ReactionMovieDAO reactionMovieDAO;

    public DeleteReactionServlet() {
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
            int reactionMovieId = Integer.parseInt(request.getParameter("reactionMovieId"));
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            HttpSession session = request.getSession();
            int userId = (int) session.getAttribute("userID");

            reactionMovieDAO.deleteReactionMovie(reactionMovieId);
            response.sendRedirect(request.getContextPath() + "/details?movieId=" + request.getParameter("movieId"));
        } catch (NumberFormatException | NullPointerException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to add reaction movie.");
            request.getRequestDispatcher("").forward(request, response);
        }
        }

}