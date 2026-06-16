<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/fragments/layout-start.jsp">
  <jsp:param name="pageTitle" value="Ajukan Peminjaman" />
</jsp:include>
<jsp:include page="/WEB-INF/views/fragments/nav.jsp" />

<main class="app-main">
  <div class="card">
    <h1>Ajukan Peminjaman <span class="badge">Brian — modul3_peminjaman</span></h1>
    <p>Form pengajuan peminjaman ruang.</p>
    <div class="placeholder">
      MVC: <code>PeminjamanFormController</code> → view ini.
      API ping: <a href="${pageContext.request.contextPath}/api/peminjaman/ping">/api/peminjaman/ping</a>
    </div>
  </div>
</main>

<jsp:include page="/WEB-INF/views/fragments/layout-end.jsp" />
