package com.movieticket.servlets;

import com.movieticket.dao.*;
import com.movieticket.model.Movie;
import com.movieticket.model.MovieActor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class MovieDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final MovieDAO movieDAO;
    private final MovieActorDAO movieActorDAO;
    private final ReactionMovieDAO reactionMovieDAO;


    public MovieDetailsServlet() {
        super();
        movieDAO = new MovieDAOImpl();
        movieActorDAO = new MovieActorDAOImpl();
        reactionMovieDAO = new ReactionMovieDAOImp();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        movieDAO.updateMovieRating(movieId);

        Movie selectedMovie = movieDAO.getMovieById(movieId);
        List<MovieActor> movieActors = movieActorDAO.getActorsByMovieId(movieId);

        request.setAttribute("selectedMovie", selectedMovie);
        request.setAttribute("movieActors", movieActors);

        List<Object[]> allReactions = reactionMovieDAO.getReactionDetailsForMovie(movieId);
        request.setAttribute("allReactions", allReactions);

        request.getRequestDispatcher("/movie-details.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
