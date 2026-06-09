package com.telu.pinjamruang.common.controller;

import com.telu.pinjamruang.common.api.ApiResponse;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public abstract class BasePingController extends HttpServlet {

    protected abstract String getModule();

    protected abstract String getOwner();

    protected abstract String getMessage();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ApiResponse.writePing(response, getModule(), getOwner(), getMessage());
    }
}
