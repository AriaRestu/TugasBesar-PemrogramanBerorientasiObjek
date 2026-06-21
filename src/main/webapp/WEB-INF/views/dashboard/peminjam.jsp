<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<div class="container">

    <h1>Dashboard Peminjam</h1>

    <div class="dashboard-grid">

        <div class="card">
            <h3>Ajukan Peminjaman</h3>
            <p>Mengajukan peminjaman ruangan atau logistik.</p>
            <a href="#" class="btn btn-primary">Buka</a>
        </div>

        <div class="card">
            <h3>Riwayat Pengajuan</h3>
            <p>Melihat seluruh pengajuan yang pernah dibuat.</p>
            <a href="#" class="btn btn-primary">Buka</a>
        </div>

        <div class="card">
            <h3>Notifikasi</h3>
            <p>Melihat informasi terbaru terkait pengajuan.</p>
            <a href="#" class="btn btn-primary">Buka</a>
        </div>

    </div>

</div>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>