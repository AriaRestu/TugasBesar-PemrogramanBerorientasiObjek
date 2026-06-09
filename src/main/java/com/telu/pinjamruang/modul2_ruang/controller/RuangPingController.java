package com.telu.pinjamruang.modul2_ruang.controller;

import com.telu.pinjamruang.common.controller.BasePingController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "RuangPingController", urlPatterns = {"/api/ruang/ping"})
public class RuangPingController extends BasePingController {

    @Override
    protected String getModule() {
        return "ruang";
    }

    @Override
    protected String getOwner() {
        return "Andra";
    }

    @Override
    protected String getMessage() {
        return "API modul ruang & jadwal siap";
    }
}
