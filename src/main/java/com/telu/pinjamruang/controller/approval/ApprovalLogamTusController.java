package com.telu.pinjamruang.controller.approval;

import com.telu.pinjamruang.dao.approval.ApprovalDAO;
import com.telu.pinjamruang.dao.dokumen.F03DAO;
import com.telu.pinjamruang.dao.notification.NotifikasiDAO;
import com.telu.pinjamruang.dao.peminjaman.PengajuanDAO;
import com.telu.pinjamruang.model.approval.Approval;
import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.model.dokumen.F03;
import com.telu.pinjamruang.model.notification.Notifikasi;
import com.telu.pinjamruang.model.peminjaman.Pengajuan;
import com.telu.pinjamruang.util.PDFGenerator;
import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/approval/logamtus")
public class ApprovalLogamTusController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request, response);
        if (user == null || !"LOGAM_TUS".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String keyword = request.getParameter("keyword");
        int page = 1;
        try { page = Integer.parseInt(request.getParameter("page")); } catch (Exception ignored) {}
        if (page < 1) page = 1;

        final int PAGE_SIZE = 10;
        PengajuanDAO pengajuanDAO = new PengajuanDAO();
        int total = pengajuanDAO.count(null, "MENUNGGU_LOGAM_TUS", keyword);

        request.setAttribute("pendingList", pengajuanDAO.search(null, "MENUNGGU_LOGAM_TUS", keyword, page, PAGE_SIZE));
        request.setAttribute("total", total);
        request.setAttribute("page", page);
        request.setAttribute("totalPages", (int) Math.ceil((double) total / PAGE_SIZE));

        request.getRequestDispatcher("/WEB-INF/views/approval/logamtus.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request, response);
        if (user == null || !"LOGAM_TUS".equals(user.getRole())) {
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
            response.sendRedirect(request.getContextPath() + "/approval/logamtus");
            return;
        }

        Approval approval = new Approval();
        approval.setPengajuanId(pengajuanId);
        approval.setApproverId(user.getId());
        approval.setRoleApprover("LOGAM_TUS");
        approval.setCatatan(catatan);

        if ("setujui".equals(action)) {
            approval.setStatus("DISETUJUI");
            approvalDAO.insert(approval);
            pengajuanDAO.updateStatus(pengajuanId, "DISETUJUI", catatan);

            // Generate PDF F03
            String savePath = getServletContext().getRealPath("/uploads/f03");
            String fileName = PDFGenerator.generateF03(pengajuan, savePath);

            if (fileName != null) {
                F03DAO f03DAO = new F03DAO();
                F03 f03 = new F03();
                f03.setPengajuanId(pengajuanId);
                f03.setNoTiket(pengajuan.getNoTiket());
                f03.setDiterbitkanOleh(user.getId());
                f03.setFilePdf(fileName);
                f03DAO.insert(f03);
            }

            // Notifikasi ke peminjam
            Notifikasi notif = new Notifikasi();
            notif.setUserId(pengajuan.getUserId());
            notif.setPengajuanId(pengajuanId);
            notif.setPesan("Pengajuan #" + pengajuan.getNoTiket() + " telah DISETUJUI oleh Logam TUS. Tiket Anda sudah dapat diunduh.");
            notif.setTipe("DISETUJUI");
            notif.setLink(request.getContextPath() + "/f03?pengajuan_id=" + pengajuanId);
            notifDAO.insert(notif);

        } else if ("tolak".equals(action)) {
            approval.setStatus("DITOLAK");
            approvalDAO.insert(approval);
            pengajuanDAO.updateStatus(pengajuanId, "DITOLAK", catatan);

            Notifikasi notif = new Notifikasi();
            notif.setUserId(pengajuan.getUserId());
            notif.setPengajuanId(pengajuanId);
            notif.setPesan("Pengajuan #" + pengajuan.getNoTiket() + " ditolak oleh Logam TUS. Alasan: " + catatan);
            notif.setTipe("DITOLAK");
            notif.setLink(request.getContextPath() + "/detail-pengajuan?id=" + pengajuanId);
            notifDAO.insert(notif);
        }

        response.sendRedirect(request.getContextPath() + "/approval/logamtus");
    }
}
