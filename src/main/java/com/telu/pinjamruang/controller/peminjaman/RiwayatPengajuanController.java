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

    private static final int PAGE_SIZE = 10;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request, response);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String status  = request.getParameter("status");
        String keyword = request.getParameter("keyword");
        int page = 1;
        try { page = Integer.parseInt(request.getParameter("page")); } catch (Exception ignored) {}
        if (page < 1) page = 1;

        // PEMINJAM hanya lihat miliknya, role lain lihat semua
        Integer userId = "PEMINJAM".equals(user.getRole()) ? user.getId() : null;

        PengajuanDAO dao = new PengajuanDAO();
        int total = dao.count(userId, status, keyword);
        int totalPages = (int) Math.ceil((double) total / PAGE_SIZE);

        request.setAttribute("pengajuanList", dao.search(userId, status, keyword, page, PAGE_SIZE));
        request.setAttribute("total", total);
        request.setAttribute("page", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("/WEB-INF/views/peminjaman/riwayat.jsp").forward(request, response);
    }
}
