<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<div class="container">

    <h1>Daftar Ruangan</h1>

    <div class="card">

        <table class="table">

            <thead>
            <tr>
                <th>Nama Ruangan</th>
                <th>Jenis</th>
                <th>Kapasitas</th>
                <th>Lokasi</th>
                <th>Aksi</th>
            </tr>
            </thead>

            <tbody>

            <!-- Dummy Data -->

            <tr>
                <td>Aula Utama</td>
                <td>Auditorium</td>
                <td>300</td>
                <td>Gedung A</td>
                <td>
                    <a href="#" class="btn btn-primary">
                        Detail
                    </a>
                </td>
            </tr>

            <tr>
                <td>Kelas A Lantai 1</td>
                <td>Kelas</td>
                <td>40</td>
                <td>Gedung D Lt.1</td>
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