package com.movieticket.servlets.user;

import com.movieticket.dao.ReactionMovieDAO;
import com.movieticket.dao.ReactionMovieDAOImp;
import com.movieticket.model.ReactionMovie;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class DisplayReactionsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ReactionMovieDAO reactionMovieDAO;

    public DisplayReactionsServlet() {
        super();
        reactionMovieDAO = new ReactionMovieDAOImp();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
