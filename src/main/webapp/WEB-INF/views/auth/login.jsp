<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Pinjam Ruang Tel-U</title>

    <link rel="stylesheet" href="${ctx}/assets/css/app.css">
</head>

<body class="login-page">

<div class="card login-card">

    <div class="login-header">
        <h1>PINJAM RUANG TEL-U</h1>
        <p>
            Sistem Peminjaman Ruangan dan Logistik
            Telkom University
        </p>
    </div>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">
            ${error}
        </div>
    </c:if>

    <form action="${ctx}/login" method="post">

        <div class="form-group">
            <label for="email">Email</label>

            <input
                    id="email"
                    name="email"
                    type="email"
                    placeholder="nama@telu.ac.id"
                    required>
        </div>

        <div class="form-group">
            <label for="password">Password</label>

            <input
                    id="password"
                    name="password"
                    type="password"
                    placeholder="Masukkan password"
                    required>
        </div>

        <!-- sementara untuk demo -->
        <div class="form-group">
            <label for="role">Role</label>

            <select id="role" name="role">
                <option value="PEMINJAM">PEMINJAM</option>
                <option value="PEMBINA">PEMBINA</option>
                <option value="SSC">SSC</option>
                <option value="LOGAM_TUS">LOGAM TUS</option>
            </select>
        </div>

        <button
                class="btn btn-primary btn-block"
                type="submit">
            Masuk
        </button>

    </form>

    <div class="login-footer">
        <p>
            Sistem Peminjaman Ruangan & Logistik
        </p>

        <small>
            Telkom University © 2026
        </small>
    </div>

</div>

</body>
</html>