package com.telu.pinjamruang.controller;

import com.telu.pinjamruang.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@WebServlet("/db-test")
public class DBTestController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        try (
                Connection connection =
                        DBConnection.getConnection();

                PrintWriter out =
                        response.getWriter()
        ) {

            out.println("<h1>Database Connected Successfully</h1>");

            out.println("<p>");
            out.println(connection.getCatalog());
            out.println("</p>");

        } catch (Exception e) {

            response.getWriter().println(
                    "<h1>Database Connection Failed</h1>"
            );

            response.getWriter().println(
                    e.getMessage()
            );
        }
    }
}