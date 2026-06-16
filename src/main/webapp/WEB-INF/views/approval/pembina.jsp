<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<div class="container">

    <h1>Approval Pembina</h1>

    <div class="card">

        <table class="table">

            <thead>
            <tr>
                <th>No Tiket</th>
                <th>Nama Kegiatan</th>
                <th>Tanggal</th>
                <th>Peminjam</th>
                <th>Aksi</th>
            </tr>
            </thead>

            <tbody>

            <tr>
                <td>TKT-001</td>
                <td>Seminar Teknologi</td>
                <td>20/06/2025</td>
                <td>Mahasiswa A</td>

                <td>
                    <button class="btn btn-success">
                        Setujui
                    </button>

                    <button class="btn btn-danger">
                        Tolak
                    </button>
                </td>
            </tr>

            </tbody>

        </table>

    </div>

</div>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>