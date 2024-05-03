package com.movieticket.servlets.user;

import com.movieticket.dao.ReactionMovieDAO;
import com.movieticket.dao.ReactionMovieDAOImp;
import com.movieticket.model.Movie;
import com.movieticket.model.ReactionMovie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "DeleteReactionServlet", value = "/DeleteReactionServlet")
public class DeleteReactionServlet extends HttpServlet {

    public DeleteReactionServlet() {
        super();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int reactionMovieId = Integer.parseInt(request.getParameter("reactionMovieId"));
            ReactionMovieDAO reactionMovieDAO = new ReactionMovieDAOImp();
            reactionMovieDAO.deleteReactionMovie(reactionMovieId);
            response.sendRedirect(request.getContextPath() + "/movie-details");
        } catch (NumberFormatException | NullPointerException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to add reaction movie.");
            request.getRequestDispatcher("").forward(request, response);
        }
    }
}