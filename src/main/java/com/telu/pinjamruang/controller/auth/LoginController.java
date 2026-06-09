package com.telu.pinjamruang.controller.auth;

import com.telu.pinjamruang.common.BaseViewController;

import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "LoginController", urlPatterns = {"/login", "/logout"})
public class LoginController extends BaseViewController {

    public LoginController() {
        super("/WEB-INF/views/auth/login.jsp");
    }
}
