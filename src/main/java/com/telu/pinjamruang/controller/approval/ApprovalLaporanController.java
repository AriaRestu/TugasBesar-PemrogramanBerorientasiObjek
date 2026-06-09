package com.telu.pinjamruang.controller.approval;

import com.telu.pinjamruang.common.BaseViewController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "ApprovalLaporanController", urlPatterns = {"/approval/laporan"})
public class ApprovalLaporanController extends BaseViewController {

    public ApprovalLaporanController() {
        super("/WEB-INF/views/approval/laporan.jsp");
    }
}
