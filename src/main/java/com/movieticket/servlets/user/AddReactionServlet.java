package com.movieticket.servlets.user;

import com.movieticket.dao.ReactionMovieDAO;
import com.movieticket.dao.ReactionMovieDAOImp;
import com.movieticket.model.ReactionMovie;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddReactionServlet", value = "/AddReactionServlet")
public class AddReactionServlet extends HttpServlet {

    public AddReactionServlet() {
        super();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ReactionMovieDAO reactionMovieDAO = new ReactionMovieDAOImp();
            int reactionMovieId = Integer.parseInt(request.getParameter("reactionMovieId"));
            HttpSession session = request.getSession();
            int userId = (int) session.getAttribute("userId");
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");

            ReactionMovie reactionMovie = new ReactionMovie();
            reactionMovie.setReactionMovieId(reactionMovieId);
            reactionMovie.setUserId(userId);
            reactionMovie.setMovieId(movieId);
            reactionMovie.setRating(rating);
            reactionMovie.setComment(comment);

            reactionMovieDAO.addReactionMovie(reactionMovie);
            response.sendRedirect(request.getContextPath() + "/movie-details");
        } catch (NumberFormatException | NullPointerException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to add reaction movie.");
            request.getRequestDispatcher("").forward(request, response);
        }
    }
}