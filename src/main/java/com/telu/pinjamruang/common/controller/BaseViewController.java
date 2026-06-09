package com.telu.pinjamruang.common.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public abstract class BaseViewController extends HttpServlet {

    private final String viewPath;

    protected BaseViewController(String viewPath) {
        this.viewPath = viewPath;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(viewPath).forward(request, response);
    }
}
