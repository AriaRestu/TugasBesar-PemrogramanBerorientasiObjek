package com.telu.pinjamruang.controller.peminjaman;

import com.telu.pinjamruang.common.BasePingController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "PeminjamanPingController", urlPatterns = {"/api/peminjaman/ping"})
public class PeminjamanPingController extends BasePingController {

    @Override
    protected String getModule() {
        return "peminjaman";
    }

    @Override
    protected String getOwner() {
        return "Brian";
    }

    @Override
    protected String getMessage() {
        return "API modul peminjaman siap";
    }
}
