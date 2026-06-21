<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<div class="container">

    <h1>Detail Pengajuan</h1>

    <div class="card">

        <p>
            <strong>No Tiket :</strong>
            TKT-2025001
        </p>

        <p>
            <strong>Jenis Pengajuan :</strong>
            Ruangan + Logistik
        </p>

        <p>
            <strong>Nama Kegiatan :</strong>
            Seminar Teknologi
        </p>

        <p>
            <strong>Tanggal :</strong>
            20 Juni 2025
        </p>

        <p>
            <strong>Waktu :</strong>
            08:00 - 12:00
        </p>

        <p>
            <strong>Status :</strong>
            MENUNGGU_PEMBINA
        </p>

        <p>
            <strong>Catatan :</strong>
            -
        </p>

    </div>

</div>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>