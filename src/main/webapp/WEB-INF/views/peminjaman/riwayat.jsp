<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/fragments/layout-start.jsp">
  <jsp:param name="pageTitle" value="Riwayat Peminjaman" />
</jsp:include>
<jsp:include page="/WEB-INF/views/fragments/nav.jsp" />

<main class="app-main">
  <div class="card">
    <h1>Riwayat Peminjaman <span class="badge">Brian — modul3_peminjaman</span></h1>
    <p>Daftar riwayat pengajuan peminjaman.</p>
    <div class="placeholder">
      MVC: <code>PeminjamanRiwayatController</code> → view ini.
    </div>
  </div>
</main>

<jsp:include page="/WEB-INF/views/fragments/layout-end.jsp" />
