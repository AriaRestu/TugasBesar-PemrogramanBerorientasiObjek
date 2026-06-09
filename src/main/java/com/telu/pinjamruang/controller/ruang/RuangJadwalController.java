package com.telu.pinjamruang.controller.ruang;

import com.telu.pinjamruang.common.BaseViewController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "RuangJadwalController", urlPatterns = {"/ruang/jadwal"})
public class RuangJadwalController extends BaseViewController {

    public RuangJadwalController() {
        super("/WEB-INF/views/ruang/jadwal.jsp");
    }
}
