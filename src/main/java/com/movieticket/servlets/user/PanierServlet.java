package com.movieticket.servlets.user;

import com.Connection.HibernateConf;
import com.movieticket.dao.CartDAO;
import com.movieticket.dao.CartDAOImpl;
import com.movieticket.model.Cart;
import com.movieticket.dao.*;
import com.movieticket.model.*;


import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;


public class PanierServlet extends HttpServlet {
    private final CartDAO cartDAO = new CartDAOImpl();
    private final UserDAO userDAO = new UserDAOImpl();
    private final MovieDAO movieDAO = new MovieDAOImpl();

    protected  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int userId = (int) session.getAttribute("userID");
        User user = userDAO.getUserById(userId);
        int movieId = Integer.parseInt(req.getParameter("movieId"));
        Movie movie = movieDAO.getMovieById(movieId);

        Cart cart = new Cart(user, movie);
        cartDAO.addToCart(cart);
        resp.sendRedirect(req.getContextPath() + "/movie"); // Redirect to the cart page
    }
}
