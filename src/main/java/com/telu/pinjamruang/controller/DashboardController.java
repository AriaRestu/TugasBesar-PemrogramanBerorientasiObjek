package com.telu.pinjamruang.controller;

import com.telu.pinjamruang.dao.notification.NotifikasiDAO;
import com.telu.pinjamruang.dao.peminjaman.PengajuanDAO;
import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Cek session atau pulihkan dari cookie
        User user = SessionUtil.getLoggedInUser(request, response);

        if (user == null) {
            response.sendRedirect(
                    request.getContextPath() + "/login");
            return;
        }

        // Hitung notifikasi belum dibaca
        NotifikasiDAO notifikasiDAO = new NotifikasiDAO();
        int unreadCount = notifikasiDAO.countUnread(user.getId());
        request.setAttribute("unreadCount", unreadCount);

        // Ambil data pengajuan sesuai role
        PengajuanDAO pengajuanDAO = new PengajuanDAO();

        switch (user.getRole()) {

            case "PEMINJAM":
                request.setAttribute("pengajuanList",
                        pengajuanDAO.findByUserId(user.getId()));
                request.getRequestDispatcher(
                        "/WEB-INF/views/dashboard/peminjam.jsp")
                        .forward(request, response);
                break;

            case "PEMBINA":
                request.setAttribute("pengajuanList",
                        pengajuanDAO.findByStatus("MENUNGGU_PEMBINA"));
                request.getRequestDispatcher(
                        "/WEB-INF/views/dashboard/pembina.jsp")
                        .forward(request, response);
                break;

            case "SSC":
                request.setAttribute("pengajuanList",
                        pengajuanDAO.findByStatus("MENUNGGU_SSC"));
                request.getRequestDispatcher(
                        "/WEB-INF/views/dashboard/ssc.jsp")
                        .forward(request, response);
                break;

            case "LOGAM_TUS":
                request.setAttribute("pengajuanList",
                        pengajuanDAO.findByStatus("MENUNGGU_LOGAM_TUS"));
                request.getRequestDispatcher(
                        "/WEB-INF/views/dashboard/logamtus.jsp")
                        .forward(request, response);
                break;

            default:
                response.sendRedirect(
                        request.getContextPath() + "/login");
        }
    }
}