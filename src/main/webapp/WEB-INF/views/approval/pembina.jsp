<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/WEB-INF/views/fragments/layout-start.jsp">
  <jsp:param name="pageTitle" value="Dashboard Approval" />
</jsp:include>
<jsp:include page="/WEB-INF/views/fragments/nav.jsp" />

<main class="app-main">
  <div class="card">
    <h1>Dashboard Approval <span class="badge">Aria — modul4_approval</span></h1>
    <p>Dashboard persetujuan per role (PEMBINA, SSC, LOGAM_TUS).</p>
    <div class="placeholder">
      MVC: <code>ApprovalDashboardController</code> → view ini.
      API ping: <a href="${pageContext.request.contextPath}/api/approval/ping">/api/approval/ping</a>
    </div>
  </div>
</main>

<jsp:include page="/WEB-INF/views/fragments/layout-end.jsp" />
