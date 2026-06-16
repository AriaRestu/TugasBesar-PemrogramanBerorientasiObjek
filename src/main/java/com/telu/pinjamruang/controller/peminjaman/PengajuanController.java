package com.telu.pinjamruang.controller.peminjaman;

import com.telu.pinjamruang.common.BaseViewController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "PeminjamanFormController", urlPatterns = {"/peminjaman/form"})
public class PeminjamanFormController extends BaseViewController {

    public PeminjamanFormController() {
        super("/WEB-INF/views/peminjaman/form.jsp");
    }
}
