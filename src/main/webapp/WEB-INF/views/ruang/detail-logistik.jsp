<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<div class="container">

    <h1>Detail Logistik</h1>

    <div class="card">

        <p><strong>Nama Logistik :</strong> Proyektor</p>

        <p><strong>Kategori :</strong> Elektronik</p>

        <p><strong>Jumlah Tersedia :</strong> 10 Unit</p>

        <p><strong>Deskripsi :</strong></p>

        <p>
            Digunakan untuk presentasi, seminar,
            dan kegiatan akademik lainnya.
        </p>

        <br>

        <a href="#" class="btn btn-primary">
            Ajukan Peminjaman
        </a>

    </div>

</div>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>