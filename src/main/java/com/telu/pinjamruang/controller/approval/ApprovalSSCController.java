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
import java.util.List;

@WebServlet("/approval/ssc")
public class ApprovalSSCController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request, response);
        if (user == null || !"SSC".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        PengajuanDAO pengajuanDAO = new PengajuanDAO();
        List<Pengajuan> pendingList = pengajuanDAO.findByStatus("MENUNGGU_SSC");
        request.setAttribute("pendingList", pendingList);

        request.getRequestDispatcher(
                "/WEB-INF/views/approval/ssc.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request, response);
        if (user == null || !"SSC".equals(user.getRole())) {
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
            response.sendRedirect(request.getContextPath() + "/approval/ssc");
            return;
        }

        Approval approval = new Approval();
        approval.setPengajuanId(pengajuanId);
        approval.setApproverId(user.getId());
        approval.setRoleApprover("SSC");
        approval.setCatatan(catatan);

        if ("setujui".equals(action)) {
            approval.setStatus("DISETUJUI");
            approvalDAO.insert(approval);

            // Teruskan ke Logam TUS
            pengajuanDAO.updateStatus(pengajuanId, "MENUNGGU_LOGAM_TUS", catatan);

            // Notifikasi ke Logam TUS
            com.telu.pinjamruang.dao.auth.UserDAO userDAO = new com.telu.pinjamruang.dao.auth.UserDAO();
            for (User logamtus : userDAO.findByRole("LOGAM_TUS")) {
                Notifikasi notif = new Notifikasi();
                notif.setUserId(logamtus.getId());
                notif.setPengajuanId(pengajuanId);
                notif.setPesan("Pengajuan #" + pengajuan.getNoTiket() + " telah diverifikasi SSC, menunggu persetujuan Anda.");
                notif.setTipe("APPROVAL_SSC");
                notif.setLink(request.getContextPath() + "/detail-pengajuan?id=" + pengajuanId);
                notifDAO.insert(notif);
            }

            // Notifikasi ke peminjam
            Notifikasi notifPeminjam = new Notifikasi();
            notifPeminjam.setUserId(pengajuan.getUserId());
            notifPeminjam.setPengajuanId(pengajuanId);
            notifPeminjam.setPesan("Pengajuan #" + pengajuan.getNoTiket() + " telah diverifikasi oleh SSC.");
            notifPeminjam.setTipe("STATUS_UPDATE");
            notifPeminjam.setLink(request.getContextPath() + "/detail-pengajuan?id=" + pengajuanId);
            notifDAO.insert(notifPeminjam);

        } else if ("tolak".equals(action)) {
            approval.setStatus("DITOLAK");
            approvalDAO.insert(approval);

            pengajuanDAO.updateStatus(pengajuanId, "DITOLAK", catatan);

            Notifikasi notif = new Notifikasi();
            notif.setUserId(pengajuan.getUserId());
            notif.setPengajuanId(pengajuanId);
            notif.setPesan("Pengajuan #" + pengajuan.getNoTiket() + " ditolak oleh SSC. Alasan: " + catatan);
            notif.setTipe("DITOLAK");
            notif.setLink(request.getContextPath() + "/detail-pengajuan?id=" + pengajuanId);
            notifDAO.insert(notif);
        }

        response.sendRedirect(request.getContextPath() + "/approval/ssc");
    }
}