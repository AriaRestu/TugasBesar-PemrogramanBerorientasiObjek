package com.telu.pinjamruang.controller;

import com.telu.pinjamruang.model.auth.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login");

            return;
        }

        User user =
                (User) session.getAttribute("user");

        if (user == null) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login");

            return;
        }

        switch (user.getRole()) {

            case "PEMINJAM":

                request.getRequestDispatcher(
                        "/WEB-INF/views/dashboard/peminjam.jsp")
                        .forward(request, response);

                break;

            case "PEMBINA":

                request.getRequestDispatcher(
                        "/WEB-INF/views/dashboard/pembina.jsp")
                        .forward(request, response);

                break;

            case "SSC":

                request.getRequestDispatcher(
                        "/WEB-INF/views/dashboard/ssc.jsp")
                        .forward(request, response);

                break;

            case "LOGAM_TUS":

                request.getRequestDispatcher(
                        "/WEB-INF/views/dashboard/logamtus.jsp")
                        .forward(request, response);

                break;

            default:

                response.sendRedirect(
                        request.getContextPath()
                                + "/login");
        }
    }
}