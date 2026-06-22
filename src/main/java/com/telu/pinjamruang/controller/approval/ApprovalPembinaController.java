package com.telu.pinjamruang.controller.approval;

import com.telu.pinjamruang.dao.approval.ApprovalDAO;
import com.telu.pinjamruang.dao.notification.NotifikasiDAO;
import com.telu.pinjamruang.dao.peminjaman.PengajuanDAO;
import com.telu.pinjamruang.model.approval.Approval;
import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.model.notification.Notifikasi;
import com.telu.pinjamruang.model.peminjaman.Pengajuan;
import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/approval/pembina")
public class ApprovalPembinaController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request, response);
        if (user == null || !"PEMBINA".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String keyword = request.getParameter("keyword");
        int page = 1;
        try { page = Integer.parseInt(request.getParameter("page")); } catch (Exception ignored) {}
        if (page < 1) page = 1;

        final int PAGE_SIZE = 10;
        PengajuanDAO pengajuanDAO = new PengajuanDAO();
        int total = pengajuanDAO.count(null, "MENUNGGU_PEMBINA", keyword);

        request.setAttribute("pendingList", pengajuanDAO.search(null, "MENUNGGU_PEMBINA", keyword, page, PAGE_SIZE));
        request.setAttribute("total", total);
        request.setAttribute("page", page);
        request.setAttribute("totalPages", (int) Math.ceil((double) total / PAGE_SIZE));

        request.getRequestDispatcher("/WEB-INF/views/approval/pembina.jsp").forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request, response);
        if (user == null || !"PEMBINA".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int pengajuanId = Integer.parseInt(request.getParameter("pengajuan_id"));
        String action = request.getParameter("action");
        String catatan = request.getParameter("catatan");

        PengajuanDAO pengajuanDAO = new PengajuanDAO();
        ApprovalDAO approvalDAO = new ApprovalDAO();
        NotifikasiDAO notifDAO = new NotifikasiDAO();

        Pengajuan pengajuan = pengajuanDAO.findById(pengajuanId);
        if (pengajuan == null) {
            response.sendRedirect(request.getContextPath() + "/approval/pembina");
            return;
        }

        // Simpan record approval
        Approval approval = new Approval();
        approval.setPengajuanId(pengajuanId);
        approval.setApproverId(user.getId());
        approval.setRoleApprover("PEMBINA");
        approval.setCatatan(catatan);

        if ("setujui".equals(action)) {
            approval.setStatus("DISETUJUI");
            approvalDAO.insert(approval);

            // Teruskan ke SSC
            pengajuanDAO.updateStatus(pengajuanId, "MENUNGGU_SSC", catatan);

            // Notifikasi ke SSC
            com.telu.pinjamruang.dao.auth.UserDAO userDAO = new com.telu.pinjamruang.dao.auth.UserDAO();
            for (User ssc : userDAO.findByRole("SSC")) {
                Notifikasi notif = new Notifikasi();
                notif.setUserId(ssc.getId());
                notif.setPengajuanId(pengajuanId);
                notif.setPesan("Pengajuan #" + pengajuan.getNoTiket() + " telah disetujui Pembina, menunggu verifikasi Anda.");
                notif.setTipe("APPROVAL_PEMBINA");
                notif.setLink(request.getContextPath() + "/detail-pengajuan?id=" + pengajuanId);
                notifDAO.insert(notif);
            }

            // Notifikasi ke peminjam
            Notifikasi notifPeminjam = new Notifikasi();
            notifPeminjam.setUserId(pengajuan.getUserId());
            notifPeminjam.setPengajuanId(pengajuanId);
            notifPeminjam.setPesan("Pengajuan #" + pengajuan.getNoTiket() + " telah disetujui oleh Pembina.");
            notifPeminjam.setTipe("STATUS_UPDATE");
            notifPeminjam.setLink(request.getContextPath() + "/detail-pengajuan?id=" + pengajuanId);
            notifDAO.insert(notifPeminjam);

        } else if ("tolak".equals(action)) {
            approval.setStatus("DITOLAK");
            approvalDAO.insert(approval);

            pengajuanDAO.updateStatus(pengajuanId, "DITOLAK", catatan);

            // Notifikasi ke peminjam
            Notifikasi notif = new Notifikasi();
            notif.setUserId(pengajuan.getUserId());
            notif.setPengajuanId(pengajuanId);
            notif.setPesan("Pengajuan #" + pengajuan.getNoTiket() + " ditolak oleh Pembina. Alasan: " + catatan);
            notif.setTipe("DITOLAK");
            notif.setLink(request.getContextPath() + "/detail-pengajuan?id=" + pengajuanId);
            notifDAO.insert(notif);
        }

        response.sendRedirect(request.getContextPath() + "/approval/pembina");
    }
}