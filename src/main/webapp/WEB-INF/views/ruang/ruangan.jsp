<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/fragments/layout-start.jsp">
  <jsp:param name="pageTitle" value="Jadwal Ruang" />
</jsp:include>
<jsp:include page="/WEB-INF/views/fragments/nav.jsp" />

<main class="app-main">
  <div class="card">
    <h1>Jadwal Ruang <span class="badge">Andra — modul2_ruang</span></h1>
    <p>Halaman cek ketersediaan jadwal ruang.</p>
    <div class="placeholder">
      MVC: <code>RuangJadwalController</code> → view ini.
    </div>
  </div>
</main>

<jsp:include page="/WEB-INF/views/fragments/layout-end.jsp" />
