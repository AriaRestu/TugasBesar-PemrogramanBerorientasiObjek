package com.telu.pinjamruang.controller.dokumen;

import com.telu.pinjamruang.dao.dokumen.F03DAO;
import com.telu.pinjamruang.dao.peminjaman.PengajuanDAO;
import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.model.dokumen.F03;
import com.telu.pinjamruang.model.peminjaman.Pengajuan;
import com.telu.pinjamruang.util.PDFGenerator;
import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.nio.file.Files;
import java.util.List;

@WebServlet("/f03")
public class F03Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request, response);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        if (!"SSC".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }

        String downloadParam = request.getParameter("download");
        String pengajuanIdParam = request.getParameter("pengajuan_id");
        F03DAO f03DAO = new F03DAO();

        if (downloadParam != null) {
            int f03Id = Integer.parseInt(downloadParam);
            F03 f03 = f03DAO.findById(f03Id);

            if (f03 == null || f03.getFilePdf() == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Dokumen tidak ditemukan.");
                return;
            }

            String pdfPath = getServletContext().getRealPath("/uploads/f03") + File.separator + f03.getFilePdf();
            File pdfFile = new File(pdfPath);

            if (!pdfFile.exists()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "File PDF tidak ditemukan di server.");
                return;
            }

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + f03.getFilePdf() + "\"");
            response.setContentLengthLong(pdfFile.length());
            try (InputStream in = Files.newInputStream(pdfFile.toPath());
                 OutputStream out = response.getOutputStream()) {
                byte[] buf = new byte[4096];
                int len;
                while ((len = in.read(buf)) > 0) out.write(buf, 0, len);
            }

        } else if (pengajuanIdParam != null) {
            int pengajuanId = Integer.parseInt(pengajuanIdParam);
            F03 f03 = f03DAO.findByPengajuanId(pengajuanId);
            request.setAttribute("f03", f03);
            request.setAttribute("mode", "detail");
            request.getRequestDispatcher("/WEB-INF/views/dokumen/f03.jsp").forward(request, response);

        } else {
            // List: semua F03 yang sudah ada + pengajuan DISETUJUI yang belum punya F03
            List<F03> f03List = f03DAO.findAll();
            List<Pengajuan> belumAdaF03 = new PengajuanDAO().findByStatus("DISETUJUI")
                    .stream()
                    .filter(p -> f03DAO.findByPengajuanId(p.getId()) == null)
                    .collect(java.util.stream.Collectors.toList());

            request.setAttribute("f03List", f03List);
            request.setAttribute("belumAdaF03", belumAdaF03);
            request.setAttribute("mode", "list");
            request.getRequestDispatcher("/WEB-INF/views/dokumen/f03.jsp").forward(request, response);
        }
    }

    /** POST /f03 — generate F03 manual untuk pengajuan yang sudah DISETUJUI */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request, response);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        if (!"SSC".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }

        int pengajuanId = Integer.parseInt(request.getParameter("pengajuan_id"));
        PengajuanDAO pengajuanDAO = new PengajuanDAO();
        F03DAO f03DAO = new F03DAO();

        Pengajuan pengajuan = pengajuanDAO.findById(pengajuanId);
        if (pengajuan == null || !"DISETUJUI".equals(pengajuan.getStatus())) {
            response.sendRedirect(request.getContextPath() + "/f03");
            return;
        }

        // Jangan generate ulang kalau sudah ada
        if (f03DAO.findByPengajuanId(pengajuanId) != null) {
            response.sendRedirect(request.getContextPath() + "/f03");
            return;
        }

        String savePath = getServletContext().getRealPath("/uploads/f03");
        String fileName = PDFGenerator.generateF03(pengajuan, savePath);

        if (fileName != null) {
            F03 f03 = new F03();
            f03.setPengajuanId(pengajuanId);
            f03.setNoTiket(pengajuan.getNoTiket());
            f03.setDiterbitkanOleh(user.getId());
            f03.setFilePdf(fileName);
            f03DAO.insert(f03);
        }

        response.sendRedirect(request.getContextPath() + "/f03");
    }
}
