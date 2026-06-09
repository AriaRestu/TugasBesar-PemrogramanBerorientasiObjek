package com.telu.pinjamruang.controller;

import com.telu.pinjamruang.common.controller.BaseViewController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends BaseViewController {

    public HomeController() {
        super("/WEB-INF/views/home.jsp");
    }
}
