package com.telu.pinjamruang.controller.peminjaman;

import com.telu.pinjamruang.common.BaseViewController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "PeminjamanRiwayatController", urlPatterns = {"/peminjaman/riwayat"})
public class PeminjamanRiwayatController extends BaseViewController {

    public PeminjamanRiwayatController() {
        super("/WEB-INF/views/peminjaman/riwayat.jsp");
    }
}
