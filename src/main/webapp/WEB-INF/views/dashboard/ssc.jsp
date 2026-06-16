<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<div class="container">

    <h1>Dashboard SSC</h1>

    <div class="dashboard-grid">

        <div class="card">
            <h3>Verifikasi Pengajuan</h3>
            <p>Memeriksa pengajuan dari pembina.</p>
            <a href="#" class="btn btn-primary">Buka</a>
        </div>

        <div class="card">
            <h3>Generate F03</h3>
            <p>Menerbitkan surat F03 setelah disetujui.</p>
            <a href="#" class="btn btn-primary">Buka</a>
        </div>

        <div class="card">
            <h3>Notifikasi</h3>
            <p>Melihat notifikasi terbaru.</p>
            <a href="#" class="btn btn-primary">Buka</a>
        </div>

    </div>

</div>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>