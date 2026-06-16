<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<div class="container">

    <h1>Approval Logam TUS</h1>

    <div class="card">

        <table class="table">

            <thead>
            <tr>
                <th>No Tiket</th>
                <th>Kegiatan</th>
                <th>Ruangan</th>
                <th>Tanggal</th>
                <th>Aksi</th>
            </tr>
            </thead>

            <tbody>

            <tr>
                <td>TKT-001</td>
                <td>Seminar Teknologi</td>
                <td>Aula Utama</td>
                <td>20/06/2025</td>

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