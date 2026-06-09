package com.telu.pinjamruang.modul2_ruang.controller;

import com.telu.pinjamruang.common.controller.BaseViewController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "RuangJadwalController", urlPatterns = {"/ruang/jadwal"})
public class RuangJadwalController extends BaseViewController {

    public RuangJadwalController() {
        super("/WEB-INF/views/ruang/jadwal.jsp");
    }
}
