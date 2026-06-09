package com.telu.pinjamruang.common.api;

import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.Instant;

public final class ApiResponse {

    private ApiResponse() {
    }

    public static void writePing(HttpServletResponse response, String module, String owner, String message)
            throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String json = "{"
                + "\"status\":\"ok\","
                + "\"module\":\"" + escape(module) + "\","
                + "\"owner\":\"" + escape(owner) + "\","
                + "\"message\":\"" + escape(message) + "\","
                + "\"timestamp\":\"" + Instant.now() + "\""
                + "}";

        try (PrintWriter out = response.getWriter()) {
            out.write(json);
        }
    }

    private static String escape(String value) {
        return value
                .replace("\\", "\\\\")
                .replace("\"", "\\\"");
    }
}
