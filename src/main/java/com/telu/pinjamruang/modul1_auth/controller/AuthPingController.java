package com.telu.pinjamruang.modul1_auth.controller;

import com.telu.pinjamruang.common.controller.BasePingController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "AuthPingController", urlPatterns = {"/api/auth/ping"})
public class AuthPingController extends BasePingController {

    @Override
    protected String getModule() {
        return "auth";
    }

    @Override
    protected String getOwner() {
        return "Gibran";
    }

    @Override
    protected String getMessage() {
        return "API modul autentikasi siap";
    }
}
