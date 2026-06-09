package com.telu.pinjamruang.modul4_approval.controller;

import com.telu.pinjamruang.common.controller.BasePingController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "ApprovalPingController", urlPatterns = {"/api/approval/ping"})
public class ApprovalPingController extends BasePingController {

    @Override
    protected String getModule() {
        return "approval";
    }

    @Override
    protected String getOwner() {
        return "Aria";
    }

    @Override
    protected String getMessage() {
        return "API modul approval siap";
    }
}
