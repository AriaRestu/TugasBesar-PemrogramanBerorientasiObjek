package com.telu.pinjamruang.modul2_ruang.controller;

import com.telu.pinjamruang.common.controller.BaseViewController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "RuangListController", urlPatterns = {"/ruang/list"})
public class RuangListController extends BaseViewController {

    public RuangListController() {
        super("/WEB-INF/views/ruang/list.jsp");
    }
}
