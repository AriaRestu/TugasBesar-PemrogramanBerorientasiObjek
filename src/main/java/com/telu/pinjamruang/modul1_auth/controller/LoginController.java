package com.telu.pinjamruang.modul1_auth.controller;

import com.telu.pinjamruang.common.controller.BaseViewController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "LoginController", urlPatterns = {"/login", "/logout"})
public class LoginController extends BaseViewController {

    public LoginController() {
        super("/WEB-INF/views/auth/login.jsp");
    }
}
