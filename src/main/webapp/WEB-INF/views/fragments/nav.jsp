<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="path" value="${pageContext.request.servletPath}" />

<header class="app-header">
  <a class="app-brand" href="${ctx}/home">Pinjam Ruang Tel-U</a>

  <nav class="app-nav">
    <a href="${ctx}/home" class="${path == '/home' ? 'active' : ''}">Beranda</a>

    <details>
      <summary>Ruang</summary>
      <ul>
        <li><a href="${ctx}/ruang/list" class="${path == '/ruang/list' ? 'active' : ''}">Daftar Ruang</a></li>
        <li><a href="${ctx}/ruang/jadwal" class="${path == '/ruang/jadwal' ? 'active' : ''}">Jadwal</a></li>
      </ul>
    </details>

    <details>
      <summary>Peminjaman</summary>
      <ul>
        <li><a href="${ctx}/peminjaman/form" class="${path == '/peminjaman/form' ? 'active' : ''}">Ajukan Peminjaman</a></li>
        <li><a href="${ctx}/peminjaman/riwayat" class="${path == '/peminjaman/riwayat' ? 'active' : ''}">Riwayat</a></li>
      </ul>
    </details>

    <details>
      <summary>Approval</summary>
      <ul>
        <li><a href="${ctx}/approval/dashboard" class="${path == '/approval/dashboard' ? 'active' : ''}">Dashboard</a></li>
        <li><a href="${ctx}/approval/laporan" class="${path == '/approval/laporan' ? 'active' : ''}">Laporan</a></li>
      </ul>
    </details>

    <a href="${ctx}/logout">Logout</a>
  </nav>
</header>
