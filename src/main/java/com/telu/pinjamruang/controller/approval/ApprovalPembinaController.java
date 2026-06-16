package com.telu.pinjamruang.controller.approval;

import com.telu.pinjamruang.common.BaseViewController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "ApprovalDashboardController", urlPatterns = {"/approval/dashboard"})
public class ApprovalDashboardController extends BaseViewController {

    public ApprovalDashboardController() {
        super("/WEB-INF/views/approval/dashboard.jsp");
    }
}
