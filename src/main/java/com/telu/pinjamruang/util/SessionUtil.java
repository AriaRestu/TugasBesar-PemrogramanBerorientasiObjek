package com.telu.pinjamruang.util;

import com.telu.pinjamruang.dao.auth.UserDAO;
import com.telu.pinjamruang.model.auth.User;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Utilitas session & cookie untuk autentikasi.
 * - Menyimpan user di session
 * - Menyimpan token (userId) di cookie agar tetap login setelah browser ditutup
 * - Memulihkan session dari cookie jika session expired
 */
public class SessionUtil {

    private static final String SESSION_USER_KEY = "user";
    private static final String COOKIE_USER_ID = "pinjamruang_uid";
    private static final String COOKIE_AUTH_TOKEN = "pinjamruang_token";
    private static final int COOKIE_MAX_AGE = 7 * 24 * 60 * 60; // 7 hari

    private SessionUtil() {
    }

    /**
     * Simpan user ke session dan set cookie remember-me.
     */
    public static void createLoginSession(
            HttpServletRequest request,
            HttpServletResponse response,
            User user,
            boolean rememberMe) {

        // Simpan di session
        HttpSession session = request.getSession(true);
        session.setAttribute(SESSION_USER_KEY, user);

        // Simpan di cookie jika remember me
        if (rememberMe) {
            String token = HashUtil.hashPassword(
                    user.getId() + "-" + user.getEmail() + "-pinjamruang-secret");

            Cookie uidCookie = new Cookie(COOKIE_USER_ID, String.valueOf(user.getId()));
            uidCookie.setMaxAge(COOKIE_MAX_AGE);
            uidCookie.setPath("/");
            uidCookie.setHttpOnly(true);

            Cookie tokenCookie = new Cookie(COOKIE_AUTH_TOKEN, token);
            tokenCookie.setMaxAge(COOKIE_MAX_AGE);
            tokenCookie.setPath("/");
            tokenCookie.setHttpOnly(true);

            response.addCookie(uidCookie);
            response.addCookie(tokenCookie);
        }
    }

    /**
     * Ambil user dari session. Jika session kosong, coba pulihkan dari cookie.
     * Return null jika tidak ada user sama sekali.
     */
    public static User getLoggedInUser(
            HttpServletRequest request,
            HttpServletResponse response) {

        // 1. Cek session dulu
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute(SESSION_USER_KEY);
            if (user != null) {
                return user;
            }
        }

        // 2. Session kosong — coba pulihkan dari cookie
        String userIdStr = getCookieValue(request, COOKIE_USER_ID);
        String token = getCookieValue(request, COOKIE_AUTH_TOKEN);

        if (userIdStr != null && token != null) {
            try {
                int userId = Integer.parseInt(userIdStr);
                UserDAO userDAO = new UserDAO();
                User user = userDAO.findById(userId);

                if (user != null) {
                    // Validasi token
                    String expectedToken = HashUtil.hashPassword(
                            user.getId() + "-" + user.getEmail() + "-pinjamruang-secret");

                    if (expectedToken.equals(token)) {
                        // Token valid — pulihkan session
                        session = request.getSession(true);
                        session.setAttribute(SESSION_USER_KEY, user);
                        return user;
                    }
                }
            } catch (NumberFormatException e) {
                // Cookie corrupted — abaikan
            }
        }

        return null;
    }

    /**
     * Hapus session dan cookie (logout).
     */
    public static void destroySession(
            HttpServletRequest request,
            HttpServletResponse response) {

        // Hapus session
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Hapus cookie
        Cookie uidCookie = new Cookie(COOKIE_USER_ID, "");
        uidCookie.setMaxAge(0);
        uidCookie.setPath("/");
        uidCookie.setHttpOnly(true);

        Cookie tokenCookie = new Cookie(COOKIE_AUTH_TOKEN, "");
        tokenCookie.setMaxAge(0);
        tokenCookie.setPath("/");
        tokenCookie.setHttpOnly(true);

        response.addCookie(uidCookie);
        response.addCookie(tokenCookie);
    }

    /**
     * Helper — ambil value cookie berdasarkan nama.
     */
    private static String getCookieValue(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (name.equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }
}
