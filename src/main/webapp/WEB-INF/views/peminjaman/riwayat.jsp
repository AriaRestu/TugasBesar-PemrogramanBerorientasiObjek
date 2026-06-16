<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<div class="container">

    <h1>Riwayat Pengajuan</h1>

    <div class="card">

        <table class="table">

            <thead>
            <tr>
                <th>No Tiket</th>
                <th>Kegiatan</th>
                <th>Tanggal</th>
                <th>Status</th>
                <th>Aksi</th>
            </tr>
            </thead>

            <tbody>

            <tr>
                <td>TKT-001</td>
                <td>Seminar AI</td>
                <td>20/06/2025</td>
                <td>MENUNGGU_SSC</td>
                <td>
                    <a href="#" class="btn btn-primary">
                        Detail
                    </a>
                </td>
            </tr>

            <tr>
                <td>TKT-002</td>
                <td>Workshop UI/UX</td>
                <td>25/06/2025</td>
                <td>DISETUJUI</td>
                <td>
                    <a href="#" class="btn btn-primary">
                        Detail
                    </a>
                </td>
            </tr>

            </tbody>

        </table>

    </div>

</div>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>