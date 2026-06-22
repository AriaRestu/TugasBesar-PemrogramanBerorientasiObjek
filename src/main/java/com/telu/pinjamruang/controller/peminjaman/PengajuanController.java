package com.telu.pinjamruang.controller.peminjaman;

import com.telu.pinjamruang.dao.peminjaman.PengajuanDAO;
import com.telu.pinjamruang.dao.peminjaman.PengajuanLogistikDAO;
import com.telu.pinjamruang.dao.ruang.LogistikDAO;
import com.telu.pinjamruang.dao.ruang.RuanganDAO;
import com.telu.pinjamruang.dao.notification.NotifikasiDAO;
import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.model.peminjaman.Pengajuan;
import com.telu.pinjamruang.model.peminjaman.PengajuanLogistik;
import com.telu.pinjamruang.model.notification.Notifikasi;
import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

@WebServlet("/pengajuan")
public class PengajuanController extends HttpServlet {

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

        // Siapkan data ruangan & logistik untuk form
        RuanganDAO ruanganDAO = new RuanganDAO();
        LogistikDAO logistikDAO = new LogistikDAO();

        request.setAttribute("ruanganList", ruanganDAO.findAllAktif());
        request.setAttribute("logistikList", logistikDAO.findAllAktif());

        request.getRequestDispatcher(
                "/WEB-INF/views/peminjaman/create.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request, response);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        PengajuanDAO pengajuanDAO = new PengajuanDAO();

        // Ambil data dari form
        Pengajuan p = new Pengajuan();
        p.setUserId(user.getId());
        p.setNoTiket(pengajuanDAO.generateNoTiket());

        String jenisPengajuan = request.getParameter("jenis_pengajuan");
        p.setJenisPengajuan(jenisPengajuan != null ? jenisPengajuan : "RUANGAN");

        String ruanganIdStr = request.getParameter("ruangan_id");
        if (ruanganIdStr != null && !ruanganIdStr.isEmpty()) {
            p.setRuanganId(Integer.parseInt(ruanganIdStr));
        }

        p.setTanggalPinjam(Date.valueOf(request.getParameter("tanggal_pinjam")));
        p.setWaktuMulai(Time.valueOf(request.getParameter("waktu_mulai") + ":00"));
        p.setWaktuSelesai(Time.valueOf(request.getParameter("waktu_selesai") + ":00"));
        p.setKeperluan(request.getParameter("keperluan"));
        p.setCatatan(request.getParameter("catatan"));
        p.setStatus("MENUNGGU_PEMBINA");

        // Cek ketersediaan ruangan
        if (p.getRuanganId() != null) {
            RuanganDAO ruanganDAO = new RuanganDAO();
            boolean available = ruanganDAO.isAvailable(
                    p.getRuanganId(),
                    request.getParameter("tanggal_pinjam"),
                    request.getParameter("waktu_mulai"),
                    request.getParameter("waktu_selesai"));

            if (!available) {
                request.setAttribute("error", "Ruangan tidak tersedia pada waktu yang dipilih");
                doGet(request, response);
                return;
            }
        }

        // Simpan pengajuan
        int pengajuanId = pengajuanDAO.insert(p);

        if (pengajuanId > 0) {
            // Simpan logistik yang diminta (jika ada)
            String[] logistikIds = request.getParameterValues("logistik_id");
            String[] logistikJumlah = request.getParameterValues("logistik_jumlah");

            if (logistikIds != null) {
                PengajuanLogistikDAO plDAO = new PengajuanLogistikDAO();
                for (int i = 0; i < logistikIds.length; i++) {
                    if (logistikIds[i] != null && !logistikIds[i].isEmpty()) {
                        PengajuanLogistik pl = new PengajuanLogistik();
                        pl.setPengajuanId(pengajuanId);
                        pl.setLogistikId(Integer.parseInt(logistikIds[i]));
                        pl.setJumlah(logistikJumlah != null && i < logistikJumlah.length
                                ? Integer.parseInt(logistikJumlah[i]) : 1);
                        plDAO.insert(pl);
                    }
                }
            }

            // Kirim notifikasi ke pembina
            NotifikasiDAO notifDAO = new NotifikasiDAO();
            Notifikasi notif = new Notifikasi();
            notif.setPesan("Pengajuan baru #" + p.getNoTiket() + " dari " + user.getNama() + " menunggu persetujuan Anda.");
            notif.setTipe("PENGAJUAN_BARU");
            notif.setPengajuanId(pengajuanId);
            notif.setLink(request.getContextPath() + "/detail-pengajuan?id=" + pengajuanId);

            // Kirim ke semua pembina
            com.telu.pinjamruang.dao.auth.UserDAO userDAO = new com.telu.pinjamruang.dao.auth.UserDAO();
            for (User pembina : userDAO.findByRole("PEMBINA")) {
                notif.setUserId(pembina.getId());
                notifDAO.insert(notif);
            }

            response.sendRedirect(request.getContextPath()
                    + "/detail-pengajuan?id=" + pengajuanId + "&success=true");
        } else {
            request.setAttribute("error", "Gagal membuat pengajuan. Silakan coba lagi.");
            doGet(request, response);
        }
    }
}