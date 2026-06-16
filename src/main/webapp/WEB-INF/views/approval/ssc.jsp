<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<div class="container">

    <h1>Verifikasi SSC</h1>

    <div class="card">

        <table class="table">

            <thead>
            <tr>
                <th>No Tiket</th>
                <th>Kegiatan</th>
                <th>Peminjam</th>
                <th>Status</th>
                <th>Aksi</th>
            </tr>
            </thead>

            <tbody>

            <tr>
                <td>TKT-001</td>
                <td>Seminar Teknologi</td>
                <td>Mahasiswa A</td>
                <td>DISETUJUI PEMBINA</td>

                <td>
                    <button class="btn btn-primary">
                        Teruskan ke Logam TUS
                    </button>
                </td>
            </tr>

            </tbody>

        </table>

    </div>

</div>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>