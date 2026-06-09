package com.telu.pinjamruang.modul3_peminjaman.controller;

import com.telu.pinjamruang.common.controller.BaseViewController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "PeminjamanRiwayatController", urlPatterns = {"/peminjaman/riwayat"})
public class PeminjamanRiwayatController extends BaseViewController {

    public PeminjamanRiwayatController() {
        super("/WEB-INF/views/peminjaman/riwayat.jsp");
    }
}
