package com.telu.pinjamruang.modul3_peminjaman.controller;

import com.telu.pinjamruang.common.controller.BaseViewController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "PeminjamanFormController", urlPatterns = {"/peminjaman/form"})
public class PeminjamanFormController extends BaseViewController {

    public PeminjamanFormController() {
        super("/WEB-INF/views/peminjaman/form.jsp");
    }
}
