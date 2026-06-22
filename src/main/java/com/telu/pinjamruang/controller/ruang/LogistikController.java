package com.telu.pinjamruang.controller.ruang;

import com.telu.pinjamruang.dao.ruang.LogistikDAO;
import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.model.ruang.Logistik;
import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/logistik")
public class LogistikController extends HttpServlet {

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

        LogistikDAO logistikDAO = new LogistikDAO();

        if ("SSC".equals(user.getRole()) || "LOGAM_TUS".equals(user.getRole())) {
            request.setAttribute("logistikList", logistikDAO.findAll());
            request.setAttribute("isAdmin", true);
        } else {
            request.setAttribute("logistikList", logistikDAO.findAllAktif());
            request.setAttribute("isAdmin", false);
        }

        request.getRequestDispatcher(
                "/WEB-INF/views/ruang/logistik.jsp")
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
        LogistikDAO logistikDAO = new LogistikDAO();

        if ("tambah".equals(action)) {

            Logistik l = new Logistik();
            l.setNamaLogistik(request.getParameter("nama_logistik"));
            l.setKategori(request.getParameter("kategori"));
            l.setSatuan(request.getParameter("satuan"));
            l.setJumlahTersedia(Integer.parseInt(request.getParameter("jumlah_tersedia")));
            l.setDeskripsi(request.getParameter("deskripsi"));
            l.setStatusAktif(true);
            logistikDAO.insert(l);

        } else if ("ubah".equals(action)) {

            int id = Integer.parseInt(request.getParameter("id"));
            Logistik l = logistikDAO.findById(id);
            if (l != null) {
                l.setNamaLogistik(request.getParameter("nama_logistik"));
                l.setKategori(request.getParameter("kategori"));
                l.setSatuan(request.getParameter("satuan"));
                l.setJumlahTersedia(Integer.parseInt(request.getParameter("jumlah_tersedia")));
                l.setDeskripsi(request.getParameter("deskripsi"));
                String statusAktif = request.getParameter("status_aktif");
                l.setStatusAktif("true".equals(statusAktif) || "on".equals(statusAktif));
                logistikDAO.update(l);
            }

        } else if ("hapus".equals(action)) {

            int id = Integer.parseInt(request.getParameter("id"));
            logistikDAO.delete(id);
        }

        response.sendRedirect(request.getContextPath() + "/logistik");
    }
}