package com.telu.pinjamruang.controller.peminjaman;

import com.telu.pinjamruang.dao.peminjaman.PengajuanDAO;
import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/riwayat")
public class RiwayatPengajuanController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request, response);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        PengajuanDAO pengajuanDAO = new PengajuanDAO();

        // Untuk peminjam — tampilkan miliknya sendiri
        // Untuk role lain — tampilkan semua
        if ("PEMINJAM".equals(user.getRole())) {
            request.setAttribute("pengajuanList",
                    pengajuanDAO.findByUserId(user.getId()));
        } else {
            request.setAttribute("pengajuanList",
                    pengajuanDAO.findAll());
        }

        request.getRequestDispatcher(
                "/WEB-INF/views/peminjaman/riwayat.jsp")
                .forward(request, response);
    }
}