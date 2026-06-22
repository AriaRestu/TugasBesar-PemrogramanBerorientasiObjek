package com.telu.pinjamruang.controller.ruang;

import com.telu.pinjamruang.common.BaseViewController;
import com.telu.pinjamruang.dao.ruang.RuanganDAO;
import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.model.ruang.Ruangan;
import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * [INHERITANCE] RuanganController extends BaseViewController extends HttpServlet
 * [POLYMORPHISM] Override doGet() dan doPost() dari HttpServlet
 */
@WebServlet("/ruangan")
public class RuanganController extends BaseViewController {

    public RuanganController() {
        super("/WEB-INF/views/ruang/ruangan.jsp");
    }

    /** [POLYMORPHISM] Override doGet — tampilkan daftar ruangan */
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

        // [OBJECT] Instantiasi RuanganDAO
        RuanganDAO ruanganDAO = new RuanganDAO();

        if ("SSC".equals(user.getRole()) || "LOGAM_TUS".equals(user.getRole())) {
            request.setAttribute("ruanganList", ruanganDAO.findAll());
            request.setAttribute("isAdmin", true);
        } else {
            request.setAttribute("ruanganList", ruanganDAO.findAllAktif());
            request.setAttribute("isAdmin", false);
        }

        request.getRequestDispatcher("/WEB-INF/views/ruang/ruangan.jsp").forward(request, response);
    }

    /** [POLYMORPHISM] Override doPost — proses tambah/ubah/hapus ruangan */
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
            // [OBJECT] Instantiasi Ruangan dengan constructor default + setter
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
