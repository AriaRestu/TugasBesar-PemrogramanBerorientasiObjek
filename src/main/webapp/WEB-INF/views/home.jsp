<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<div class="container">

    <div class="card">

        <h1>Selamat Datang</h1>

        <p>
            Sistem Peminjaman Ruangan dan Logistik
            Telkom University.
        </p>

        <p>
            Melalui sistem ini pengguna dapat:
        </p>

        <ul>
            <li>Mengajukan peminjaman ruangan.</li>
            <li>Mengajukan peminjaman logistik.</li>
            <li>Memantau status pengajuan.</li>
            <li>Menerima notifikasi proses approval.</li>
            <li>Mengunduh surat F03 setelah disetujui.</li>
        </ul>

    </div>

    <div class="dashboard-grid">

        <div class="card">
            <h3>Daftar Ruangan</h3>
            <p>
                Lihat ruangan yang tersedia untuk dipinjam.
            </p>

            <a href="${pageContext.request.contextPath}/ruangan"
               class="btn btn-primary">
                Lihat Ruangan
            </a>
        </div>

        <div class="card">
            <h3>Daftar Logistik</h3>
            <p>
                Lihat logistik yang tersedia untuk dipinjam.
            </p>

            <a href="${pageContext.request.contextPath}/logistik"
               class="btn btn-primary">
                Lihat Logistik
            </a>
        </div>

        <div class="card">
            <h3>Pengajuan</h3>
            <p>
                Buat pengajuan peminjaman baru.
            </p>

            <a href="${pageContext.request.contextPath}/pengajuan"
               class="btn btn-primary">
                Ajukan Sekarang
            </a>
        </div>

    </div>

</div>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>