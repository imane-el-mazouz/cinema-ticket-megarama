package com.movieticket.servlets.user;

import com.Connection.HibernateConf;
import com.movieticket.dao.CartDAO;
import com.movieticket.dao.CartDAOImpl;
import com.movieticket.model.Cart;
import com.movieticket.model.User;
import com.movieticket.model.UserRole;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/panier")
public class PanierServlet extends HttpServlet {
    private final CartDAO cartDAO = new CartDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int userId = (int) session.getAttribute("userID");
        int movieId = Integer.parseInt(req.getParameter("movieId"));
        Cart cart = new Cart(userId, movieId);
        cartDAO.addToCart(cart);
        resp.sendRedirect(req.getContextPath() + "/movie"); // Redirect to the cart page
    }
}
