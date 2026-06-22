package com.telu.pinjamruang.controller.ruang;

import com.telu.pinjamruang.dao.ruang.RuanganDAO;
import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.model.ruang.Ruangan;
import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/ruangan")
public class RuanganController extends HttpServlet {

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

        RuanganDAO ruanganDAO = new RuanganDAO();

        // Admin (SSC, LOGAM_TUS) bisa lihat semua termasuk non-aktif
        if ("SSC".equals(user.getRole()) || "LOGAM_TUS".equals(user.getRole())) {
            request.setAttribute("ruanganList", ruanganDAO.findAll());
            request.setAttribute("isAdmin", true);
        } else {
            request.setAttribute("ruanganList", ruanganDAO.findAllAktif());
            request.setAttribute("isAdmin", false);
        }

        request.getRequestDispatcher(
                "/WEB-INF/views/ruang/ruangan.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request, response);
        if (user == null || (!"SSC".equals(user.getRole()) && !"LOGAM_TUS".equals(user.getRole()))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        RuanganDAO ruanganDAO = new RuanganDAO();

        if ("tambah".equals(action)) {

            Ruangan r = new Ruangan();
            r.setNamaRuangan(request.getParameter("nama_ruangan"));
            r.setJenis(request.getParameter("jenis"));
            r.setKapasitas(Integer.parseInt(request.getParameter("kapasitas")));
            r.setLokasi(request.getParameter("lokasi"));
            r.setDeskripsi(request.getParameter("deskripsi"));
            r.setStatusAktif(true);
            ruanganDAO.insert(r);

        } else if ("ubah".equals(action)) {

            int id = Integer.parseInt(request.getParameter("id"));
            Ruangan r = ruanganDAO.findById(id);
            if (r != null) {
                r.setNamaRuangan(request.getParameter("nama_ruangan"));
                r.setJenis(request.getParameter("jenis"));
                r.setKapasitas(Integer.parseInt(request.getParameter("kapasitas")));
                r.setLokasi(request.getParameter("lokasi"));
                r.setDeskripsi(request.getParameter("deskripsi"));
                String statusAktif = request.getParameter("status_aktif");
                r.setStatusAktif("true".equals(statusAktif) || "on".equals(statusAktif));
                ruanganDAO.update(r);
            }

        } else if ("hapus".equals(action)) {

            int id = Integer.parseInt(request.getParameter("id"));
            ruanganDAO.delete(id);
        }

        response.sendRedirect(request.getContextPath() + "/ruangan");
    }
}