package com.movieticket.servlets;

import com.movieticket.dao.UserDAO;
import com.movieticket.dao.UserDAOImpl;
import com.movieticket.model.User;
import com.movieticket.model.UserRole;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SignUpServlet", value = "/signup")
public class SignUpServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAOImpl();
    }
    //nothing

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (username != null && !username.isEmpty() && email != null && !email.isEmpty() && password != null && !password.isEmpty()) {
            User newUser = new User(username, email, password, UserRole.user);
            try {
                userDAO.addUser(newUser);
                response.sendRedirect("login");
                return;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("signup?error=1");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/signup.jsp").forward(req, resp);
    }
}