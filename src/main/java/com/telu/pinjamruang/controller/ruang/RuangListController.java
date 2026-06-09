package com.telu.pinjamruang.controller.ruang;

import com.telu.pinjamruang.common.BaseViewController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "RuangListController", urlPatterns = {"/ruang/list"})
public class RuangListController extends BaseViewController {

    public RuangListController() {
        super("/WEB-INF/views/ruang/list.jsp");
    }
}
