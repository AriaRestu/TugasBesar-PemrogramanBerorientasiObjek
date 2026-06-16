// package com.telu.pinjamruang.controller.auth;

// import com.telu.pinjamruang.common.BaseViewController;

// import jakarta.servlet.annotation.WebServlet;

// @WebServlet(name = "LoginController", urlPatterns = {"/login", "/logout"})
// public class LoginController extends BaseViewController {

//     public LoginController() {
//         super("/WEB-INF/views/auth/login.jsp");
//     }
// }

package com.telu.pinjamruang.controller.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher(
                "/WEB-INF/views/auth/login.jsp")
                .forward(request, response);
    }
}