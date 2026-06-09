<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/fragments/layout-start.jsp">
  <jsp:param name="pageTitle" value="Beranda" />
</jsp:include>
<jsp:include page="/WEB-INF/views/fragments/nav.jsp" />

<main class="app-main">
  <div class="card">
    <h1>Beranda <span class="badge">Gibran — modul1_auth</span></h1>
    <p>Selamat datang di aplikasi Pinjam Ruang Tel-U.</p>
    <div class="placeholder">
      MVC: <code>HomeController</code> → view ini.
      API ping: <a href="${pageContext.request.contextPath}/api/ping">/api/ping</a>
    </div>
  </div>
</main>

<jsp:include page="/WEB-INF/views/fragments/layout-end.jsp" />
