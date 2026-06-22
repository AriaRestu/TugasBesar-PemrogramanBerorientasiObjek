package com.telu.pinjamruang.controller.peminjaman;

import com.telu.pinjamruang.dao.approval.ApprovalDAO;
import com.telu.pinjamruang.dao.dokumen.F01DAO;
import com.telu.pinjamruang.dao.dokumen.F02DAO;
import com.telu.pinjamruang.dao.dokumen.F03DAO;
import com.telu.pinjamruang.dao.peminjaman.PengajuanDAO;
import com.telu.pinjamruang.dao.peminjaman.PengajuanLogistikDAO;
import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.model.peminjaman.Pengajuan;
import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/detail-pengajuan")
public class DetailPengajuanController extends HttpServlet {

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

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }

        int pengajuanId = Integer.parseInt(idStr);

        // Ambil data pengajuan
        PengajuanDAO pengajuanDAO = new PengajuanDAO();
        Pengajuan pengajuan = pengajuanDAO.findById(pengajuanId);

        if (pengajuan == null) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }

        request.setAttribute("pengajuan", pengajuan);

        // Ambil logistik yang diminta
        PengajuanLogistikDAO plDAO = new PengajuanLogistikDAO();
        request.setAttribute("logistikList", plDAO.findByPengajuanId(pengajuanId));

        // Ambil riwayat approval
        ApprovalDAO approvalDAO = new ApprovalDAO();
        request.setAttribute("approvalList", approvalDAO.findByPengajuanId(pengajuanId));

        // Ambil dokumen F01, F02, F03 jika ada
        F01DAO f01DAO = new F01DAO();
        request.setAttribute("f01", f01DAO.findByPengajuanId(pengajuanId));

        F02DAO f02DAO = new F02DAO();
        request.setAttribute("f02", f02DAO.findByPengajuanId(pengajuanId));

        F03DAO f03DAO = new F03DAO();
        request.setAttribute("f03", f03DAO.findByPengajuanId(pengajuanId));

        // Cek pesan sukses
        if ("true".equals(request.getParameter("success"))) {
            request.setAttribute("success", "Pengajuan berhasil dibuat!");
        }

        request.getRequestDispatcher(
                "/WEB-INF/views/peminjaman/detail.jsp")
                .forward(request, response);
    }
}