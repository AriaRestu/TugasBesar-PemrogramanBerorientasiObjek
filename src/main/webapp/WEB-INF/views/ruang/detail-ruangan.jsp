<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/fragments/layout-start.jsp">
  <jsp:param name="pageTitle" value="Daftar Ruang" />
</jsp:include>
<jsp:include page="/WEB-INF/views/fragments/nav.jsp" />

<main class="app-main">
  <div class="card">
    <h1>Daftar Ruang <span class="badge">Andra — modul2_ruang</span></h1>
    <p>Halaman daftar ruang yang tersedia untuk dipinjam.</p>
    <div class="placeholder">
      MVC: <code>RuangListController</code> → view ini.
      API ping: <a href="${pageContext.request.contextPath}/api/ruang/ping">/api/ruang/ping</a>
    </div>
  </div>
</main>

<jsp:include page="/WEB-INF/views/fragments/layout-end.jsp" />
