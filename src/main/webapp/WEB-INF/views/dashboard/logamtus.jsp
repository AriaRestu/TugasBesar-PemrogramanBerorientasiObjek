<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<div class="container">

    <h1>Dashboard Logam TUS</h1>

    <div class="dashboard-grid">

        <div class="card">
            <h3>Approval Akhir</h3>
            <p>Memberikan keputusan akhir terhadap pengajuan.</p>
            <a href="#" class="btn btn-primary">Buka</a>
        </div>

        <div class="card">
            <h3>Kelola Ruangan</h3>
            <p>Melihat dan mengelola data ruangan.</p>
            <a href="#" class="btn btn-primary">Buka</a>
        </div>

        <div class="card">
            <h3>Kelola Logistik</h3>
            <p>Melihat dan mengelola data logistik.</p>
            <a href="#" class="btn btn-primary">Buka</a>
        </div>

    </div>

</div>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>