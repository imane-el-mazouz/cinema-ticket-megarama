package com.movieticket.filters;

import com.movieticket.model.User;
import com.movieticket.model.UserRole;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/admin/*", "/user/*"})
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code, if any
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                String requestURI = httpRequest.getRequestURI();
                if (user.getRole() == UserRole.admin && requestURI.startsWith(httpRequest.getContextPath() + "/admin")) {
                    chain.doFilter(request, response);
                    return;
                }
                if (user.getRole() == UserRole.user && requestURI.startsWith(httpRequest.getContextPath() + "/user")) {
                    chain.doFilter(request, response);
                    return;
                }
            }
        }

        httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
    }

    @Override
    public void destroy() {
        // Cleanup code, if any
    }
}
