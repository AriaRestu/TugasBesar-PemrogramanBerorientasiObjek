package com.telu.pinjamruang.controller;

import com.telu.pinjamruang.util.DBConnection;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/db-test")
public class DBTestController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        response.setContentType("text/html");

        try {

            Connection connection =
                    DBConnection.getConnection();

            response.getWriter().println(
                    "<h2>Database Connected Successfully</h2>");

            response.getWriter().println(
                    "<p>Database : "
                            + connection.getCatalog()
                            + "</p>");

            connection.close();

        } catch (Exception e) {

            response.getWriter().println(
                    "<h2>Database Connection Failed</h2>");

            response.getWriter().println(
                    "<pre>" + e.getMessage() + "</pre>");
        }
    }
}