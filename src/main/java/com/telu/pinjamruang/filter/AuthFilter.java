package com.telu.pinjamruang.filter;

import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Filter keamanan — cek session untuk semua URL kecuali public routes.
 * Jika belum login dan mengakses protected URL, redirect ke /login.
 */
@WebFilter("/*")
public class AuthFilter implements Filter {

    /** URL yang boleh diakses tanpa login */
    private static final List<String> PUBLIC_PATHS = Arrays.asList(
            "/login",
            "/logout",
            "/ping",
            "/db-test",
            "/assets/",
            "/css/",
            "/js/"
    );

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String contextPath = request.getContextPath();
        String uri = request.getRequestURI();
        // Strip context path to get the servlet path
        String path = uri.substring(contextPath.length());

        // Izinkan akses ke public paths
        for (String publicPath : PUBLIC_PATHS) {
            if (path.startsWith(publicPath)) {
                chain.doFilter(req, res);
                return;
            }
        }

        // Cek session / cookie
        User user = SessionUtil.getLoggedInUser(request, response);
        if (user == null) {
            response.sendRedirect(contextPath + "/login");
            return;
        }

        chain.doFilter(req, res);
    }
}
