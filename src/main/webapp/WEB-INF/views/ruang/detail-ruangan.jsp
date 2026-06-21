<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<div class="container">

    <h1>Detail Ruangan</h1>

    <div class="card">

        <p><strong>Nama Ruangan :</strong> Aula Utama</p>

        <p><strong>Jenis :</strong> Auditorium</p>

        <p><strong>Kapasitas :</strong> 300 Orang</p>

        <p><strong>Lokasi :</strong> Gedung A</p>

        <p><strong>Deskripsi :</strong></p>

        <p>
            Ruangan dapat digunakan untuk seminar,
            workshop dan kegiatan akademik.
        </p>

        <br>

        <a href="#" class="btn btn-primary">
            Ajukan Peminjaman
        </a>

    </div>

</div>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>