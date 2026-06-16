package com.telu.pinjamruang.controller.auth;

import com.telu.pinjamruang.dao.auth.UserDAO;
import com.telu.pinjamruang.model.auth.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher(
                "/WEB-INF/views/auth/login.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        UserDAO userDAO =
                new UserDAO();

        User user =
                userDAO.login(email, password);

        if (user != null) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "user", user);

            response.sendRedirect(
                    request.getContextPath()
                            + "/dashboard");

        } else {

            request.setAttribute(
                    "error",
                    "Email atau password salah");

            request.getRequestDispatcher(
                    "/WEB-INF/views/auth/login.jsp")
                    .forward(request, response);
        }
    }
}