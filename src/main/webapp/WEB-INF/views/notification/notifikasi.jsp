<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<div class="container">

    <h1>Notifikasi</h1>

    <div class="card">

        <table class="table">

            <thead>
            <tr>
                <th>Tanggal</th>
                <th>Pesan</th>
                <th>Status</th>
            </tr>
            </thead>

            <tbody>

            <tr>
                <td>18/06/2025 09:00</td>
                <td>
                    Pengajuan TKT-001 berhasil dibuat dan
                    menunggu persetujuan Pembina.
                </td>
                <td>
                    <span class="badge badge-info">
                        Baru
                    </span>
                </td>
            </tr>

            <tr>
                <td>18/06/2025 10:15</td>
                <td>
                    Pengajuan TKT-001 telah disetujui oleh Pembina.
                </td>
                <td>
                    <span class="badge badge-success">
                        Dibaca
                    </span>
                </td>
            </tr>

            <tr>
                <td>18/06/2025 13:20</td>
                <td>
                    Pengajuan TKT-001 diteruskan ke Logam TUS.
                </td>
                <td>
                    <span class="badge badge-success">
                        Dibaca
                    </span>
                </td>
            </tr>

            </tbody>

        </table>

    </div>

</div>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>