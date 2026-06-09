package com.telu.pinjamruang.controller.ruang;

import com.telu.pinjamruang.common.BasePingController;

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
