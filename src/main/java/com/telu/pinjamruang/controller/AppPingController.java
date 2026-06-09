package com.telu.pinjamruang.controller;

import com.telu.pinjamruang.common.controller.BasePingController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "AppPingController", urlPatterns = {"/api/ping"})
public class AppPingController extends BasePingController {

    @Override
    protected String getModule() {
        return "app";
    }

    @Override
    protected String getOwner() {
        return "tim";
    }

    @Override
    protected String getMessage() {
        return "API aplikasi Pinjam Ruang Tel-U siap";
    }
}
