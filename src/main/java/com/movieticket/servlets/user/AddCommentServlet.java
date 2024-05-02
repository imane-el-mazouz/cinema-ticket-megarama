package com.movieticket.servlets.user;

import com.movieticket.dao.MovieDAO;
import com.movieticket.dao.MovieDAOImpl;
import com.movieticket.model.Movie;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

//
//@WebServlet(name = "AddCommentServlet", value = "/AddCommentServlet")
//public class AddCommentServlet extends HttpServlet {
//        private static final long serialVersionUID = 1L;
//        private final MovieDAO movieDAO;
//
//        public AddCommentServlet() {
//            super();
//            movieDAO = new MovieDAOImpl();
//        }
//
//        @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            this.getServletContext().getRequestDispatcher("/webapp/movie-details.jsp").forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String title = request.getParameter("title");
//        String commentaire = request.getParameter("commentaire");
//        Movie movie = new Movie(title,commentaire);
//
//        try {
//            movieDAO.addComment(title, commentaire);
//            response.sendRedirect(request.getContextPath() + "/movie-details");
//        //response.sendRedirect(request.getContextPath() + "/movie-details?title=" + title);
//
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//
//
//    }
//}
@WebServlet(name = "AddCommentServlet", value = "/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final MovieDAO movieDAO;

    public AddCommentServlet() {
        super();
        movieDAO = new MovieDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/webapp/movie-details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String commentaire = request.getParameter("commentaire");

        try {
            movieDAO.addComment(title, commentaire);

            List<String> commentaires = movieDAO.getCommentairesForMovieTitle(title);

            request.setAttribute("commentaires", commentaires);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect(request.getContextPath() + "/movie-details?title=" + title);
    }
}