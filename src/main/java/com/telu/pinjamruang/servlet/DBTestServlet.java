package com.telu.pinjamruang.servlet;

import com.telu.pinjamruang.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DBTestServlet", urlPatterns = {"/db-test"})
public class DBTestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html><html><head><title>DB Test</title></head><body>");
            out.println("<h1>Koneksi Database: db_pinjamruangtelu</h1>");

            try (Connection conn = DBConnection.getConnection()) {
                DatabaseMetaData meta = conn.getMetaData();
                out.println("<p style='color:green'>Berhasil terhubung ke <strong>"
                        + meta.getURL() + "</strong></p>");
                out.println("<h2>Daftar Tabel</h2><ul>");

                List<String> tables = listTables(meta);
                if (tables.isEmpty()) {
                    out.println("<li><em>Belum ada tabel di database.</em></li>");
                } else {
                    for (String table : tables) {
                        out.println("<li>" + table + "</li>");
                    }
                }
                out.println("</ul>");
            } catch (SQLException e) {
                out.println("<p style='color:red'>Gagal koneksi: " + e.getMessage() + "</p>");
                out.println("<p>Pastikan <code>src/main/resources/db.properties</code> sudah dibuat "
                        + "dari <code>db.properties.example</code>.</p>");
            }

            out.println("</body></html>");
        }
    }

    private List<String> listTables(DatabaseMetaData meta) throws SQLException {
        List<String> tables = new ArrayList<>();
        try (ResultSet rs = meta.getTables(null, null, "%", new String[]{"TABLE"})) {
            while (rs.next()) {
                tables.add(rs.getString("TABLE_NAME"));
            }
        }
        return tables;
    }
}
