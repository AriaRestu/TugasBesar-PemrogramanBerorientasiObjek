package com.telu.pinjamruang.controller;

import com.telu.pinjamruang.common.BaseViewController;
import com.telu.pinjamruang.dao.notification.NotifikasiDAO;
import com.telu.pinjamruang.dao.peminjaman.PengajuanDAO;
import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * [INHERITANCE] DashboardController extends BaseViewController extends HttpServlet
 * [POLYMORPHISM] Override doGet() — setiap controller punya perilaku berbeda
 */
@WebServlet("/dashboard")
public class DashboardController extends BaseViewController {

    public DashboardController() {
        // Default view — akan di-override sesuai role di doGet
        super("/WEB-INF/views/dashboard/peminjam.jsp");
    }

    /**
     * [POLYMORPHISM] Override doGet dari BaseViewController.
     * Menentukan view JSP berdasarkan role user → berbeda perilaku di satu method.
     */
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

        // [OBJECT] Instantiasi DAO
        NotifikasiDAO notifikasiDAO = new NotifikasiDAO();
        int unreadCount = notifikasiDAO.countUnread(user.getId());
        request.setAttribute("unreadCount", unreadCount);

        PengajuanDAO pengajuanDAO = new PengajuanDAO();

        // Polymorphism: satu method doGet → perilaku berbeda per role
        switch (user.getRole()) {
            case "PEMINJAM":
                request.setAttribute("pengajuanList", pengajuanDAO.findByUserId(user.getId()));
                request.getRequestDispatcher("/WEB-INF/views/dashboard/peminjam.jsp").forward(request, response);
                break;
            case "PEMBINA":
                request.setAttribute("pengajuanList", pengajuanDAO.findByStatus("MENUNGGU_PEMBINA"));
                request.getRequestDispatcher("/WEB-INF/views/dashboard/pembina.jsp").forward(request, response);
                break;
            case "SSC":
                request.setAttribute("pengajuanList", pengajuanDAO.findByStatus("MENUNGGU_SSC"));
                request.getRequestDispatcher("/WEB-INF/views/dashboard/ssc.jsp").forward(request, response);
                break;
            case "LOGAM_TUS":
                request.setAttribute("pengajuanList", pengajuanDAO.findByStatus("MENUNGGU_LOGAM_TUS"));
                request.getRequestDispatcher("/WEB-INF/views/dashboard/logamtus.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
