package com.telu.pinjamruang.modul4_approval.controller;

import com.telu.pinjamruang.common.controller.BaseViewController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "ApprovalDashboardController", urlPatterns = {"/approval/dashboard"})
public class ApprovalDashboardController extends BaseViewController {

    public ApprovalDashboardController() {
        super("/WEB-INF/views/approval/dashboard.jsp");
    }
}
