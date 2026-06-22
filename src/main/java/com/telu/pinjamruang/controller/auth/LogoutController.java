package com.telu.pinjamruang.controller.auth;

import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        // Hapus session + cookie
        SessionUtil.destroySession(request, response);

        response.sendRedirect(
                request.getContextPath() + "/login");
    }
}