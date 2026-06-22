package com.telu.pinjamruang.controller.notification;

import com.telu.pinjamruang.dao.notification.NotifikasiDAO;
import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.model.notification.Notifikasi;
import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/notifikasi")
public class NotifikasiController extends HttpServlet {

    /** GET /notifikasi → tampilkan semua notifikasi user, tandai semua sudah dibaca */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request, response);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        NotifikasiDAO notifDAO = new NotifikasiDAO();
        List<Notifikasi> notifikasiList = notifDAO.findByUserId(user.getId());

        // Tandai semua sudah dibaca saat halaman dibuka
        notifDAO.markAllAsRead(user.getId());

        request.setAttribute("notifikasiList", notifikasiList);
        request.getRequestDispatcher("/WEB-INF/views/notification/notifikasi.jsp")
                .forward(request, response);
    }

    /** POST /notifikasi → tandai semua sudah dibaca (AJAX / form submit) */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request, response);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        NotifikasiDAO notifDAO = new NotifikasiDAO();
        notifDAO.markAllAsRead(user.getId());

        response.sendRedirect(request.getContextPath() + "/notifikasi");
    }
}
