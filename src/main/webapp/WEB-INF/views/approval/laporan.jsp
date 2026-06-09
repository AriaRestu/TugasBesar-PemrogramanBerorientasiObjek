<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/fragments/layout-start.jsp">
  <jsp:param name="pageTitle" value="Laporan" />
</jsp:include>
<jsp:include page="/WEB-INF/views/fragments/nav.jsp" />

<main class="app-main">
  <div class="card">
    <h1>Laporan <span class="badge">Aria — modul4_approval</span></h1>
    <p>Laporan peminjaman ruang.</p>
    <div class="placeholder">
      MVC: <code>ApprovalLaporanController</code> → view ini.
    </div>
  </div>
</main>

<jsp:include page="/WEB-INF/views/fragments/layout-end.jsp" />
