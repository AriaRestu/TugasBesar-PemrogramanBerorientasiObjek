package com.telu.pinjamruang.controller.auth;

import com.telu.pinjamruang.common.BaseViewController;
import com.telu.pinjamruang.dao.auth.UserDAO;
import com.telu.pinjamruang.exception.AuthException;
import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * [INHERITANCE] LoginController extends BaseViewController extends HttpServlet
 * [POLYMORPHISM] Override doGet() dan doPost()
 * [EXCEPTION]   Gunakan AuthException untuk validasi login gagal
 */
@WebServlet("/login")
public class LoginController extends BaseViewController {

    public LoginController() {
        super("/WEB-INF/views/auth/login.jsp");
    }

    /** [POLYMORPHISM] Override doGet — tampilkan halaman login */
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedInUser(request, response);
        if (user != null) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
    }

    /** [POLYMORPHISM] Override doPost — proses autentikasi */
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String selectedRole = request.getParameter("role");
        String rememberMe = request.getParameter("remember");

        try {
            // [OBJECT] Instantiasi UserDAO
            UserDAO userDAO = new UserDAO();
            User user = userDAO.login(email, password);

            if (user == null) {
                // [EXCEPTION] Lempar AuthException jika login gagal
                throw new AuthException("Email atau password salah");
            }

            if (!user.getRole().equals(selectedRole)) {
                throw new AuthException("Role tidak sesuai dengan akun ini");
            }

            boolean remember = "on".equals(rememberMe) || "true".equals(rememberMe);
            SessionUtil.createLoginSession(request, response, user, remember);
            response.sendRedirect(request.getContextPath() + "/dashboard");

        } catch (AuthException e) {
            // Tangkap AuthException dan kirim pesan error ke view
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
        }
    }
}
