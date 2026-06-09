<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="id">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Login — Pinjam Ruang Tel-U</title>
  <link rel="stylesheet" href="${ctx}/assets/css/app.css" />
</head>
<body class="login-page">
  <div class="card login-card">
    <h1>Login</h1>
    <p>Masuk ke sistem peminjaman ruang Telkom University.</p>

    <form action="${ctx}/home" method="get" style="margin-top: 1.25rem;">
      <div class="form-group">
        <label for="email">Email</label>
        <input id="email" name="email" type="email" placeholder="nama@telu.ac.id" />
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input id="password" name="password" type="password" placeholder="Password" />
      </div>

      <div class="form-group">
        <label for="role">Role (placeholder)</label>
        <select id="role" name="role">
          <option value="PEMINJAM">PEMINJAM</option>
          <option value="PEMBINA">PEMBINA</option>
          <option value="SSC">SSC</option>
          <option value="LOGAM_TUS">LOGAM_TUS</option>
        </select>
      </div>

      <button class="btn btn-primary btn-block" type="submit">Masuk</button>
    </form>

    <p class="placeholder" style="margin-top: 1rem;">
      MVC: <code>LoginController</code> → view ini. Belum ada validasi login.
    </p>
  </div>
</body>
</html>
