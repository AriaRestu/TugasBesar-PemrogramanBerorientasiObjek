package com.telu.pinjamruang.controller.auth;

import com.telu.pinjamruang.dao.auth.UserDAO;
import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Jika sudah login (session/cookie), langsung ke dashboard
        User user = SessionUtil.getLoggedInUser(request, response);
        if (user != null) {
            response.sendRedirect(
                    request.getContextPath() + "/dashboard");
            return;
        }

        request.getRequestDispatcher(
                "/WEB-INF/views/auth/login.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("remember");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.login(email, password);

        if (user != null) {

            // Simpan session + cookie (remember me)
            boolean remember = "on".equals(rememberMe) || "true".equals(rememberMe);
            SessionUtil.createLoginSession(request, response, user, remember);

            response.sendRedirect(
                    request.getContextPath() + "/dashboard");

        } else {

            request.setAttribute("error",
                    "Email atau password salah");

            request.getRequestDispatcher(
                    "/WEB-INF/views/auth/login.jsp")
                    .forward(request, response);
        }
    }
}