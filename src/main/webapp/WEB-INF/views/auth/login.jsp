<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Sistem Pinjam Ruang & Logistik</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${ctx}/assets/css/app.css">
</head>

<body class="login-body">

    <div class="login-bg-top"></div>
    <div class="login-bg-bottom"></div>

    <div class="login-content">
        <div class="login-header-logo">
            <div class="logo-container">
                <img src="${ctx}/assets/images/pngegg.png" alt="Telkom University Logo" style="max-height: 60px; width: auto; object-fit: contain;">
                <div class="logo-text">
                    <div>Telkom</div>
                    <div style="font-weight: 600;">University</div>
                    <div style="color: black; font-weight: 600;">Surabaya</div>
                </div>
            </div>
            <h1>Sistem Peminjaman Ruangan</h1>
        </div>

        <div class="login-card-ui">
            <h2>Login Ke Akun Anda</h2>

            <c:if test="${not empty error}">
                <div class="error-alert">
                    ${error}
                </div>
            </c:if>

            <form action="${ctx}/login" method="post">
                <div class="form-group-ui">
                    <i class="fa-regular fa-envelope input-icon"></i>
                    <input id="email" name="email" type="email" placeholder="nama@telu.ac.id" required>
                </div>

                <div class="form-group-ui">
                    <i class="fa-solid fa-lock input-icon"></i>
                    <input id="password" name="password" type="password" placeholder="Masukkan password" required>
                    <i class="fa-regular fa-eye-slash input-icon-right" onclick="togglePassword()"></i>
                </div>

                <div class="form-group-ui">
                    <i class="fa-solid fa-user-tag input-icon"></i>
                    <select id="role" name="role" required>
                        <option value="PEMINJAM">PEMINJAM</option>
                        <option value="PEMBINA">PEMBINA</option>
                        <option value="SSC">SSC</option>
                        <option value="LOGAM_TUS">LOGAM TUS</option>
                    </select>
                    <i class="fa-solid fa-chevron-down input-icon-right" style="cursor: default; pointer-events: none;"></i>
                </div>


                <button class="btn-login" type="submit">LOGIN</button>
            </form>

            <div class="login-footer-text">
                Belum punya akun? <a href="https://wa.me/+628816739272">Hubungi Admin Kampus.</a>
            </div>
        </div>
    </div>

    <div class="login-bottom-bar">
        © 2026 Telkom University Surabaya - All rights reserved.
    </div>

    <script>
        function togglePassword() {
            const pwd = document.getElementById('password');
            const icon = document.querySelector('.input-icon-right');
            if (pwd.type === 'password') {
                pwd.type = 'text';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            } else {
                pwd.type = 'password';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            }
        }
    </script>
</body>
</html>