package com.telu.pinjamruang.modul4_approval.controller;

import com.telu.pinjamruang.common.controller.BaseViewController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "ApprovalLaporanController", urlPatterns = {"/approval/laporan"})
public class ApprovalLaporanController extends BaseViewController {

    public ApprovalLaporanController() {
        super("/WEB-INF/views/approval/laporan.jsp");
    }
}
