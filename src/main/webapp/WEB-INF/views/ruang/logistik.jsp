<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<div class="container">

    <h1>Daftar Logistik</h1>

    <div class="card">

        <table class="table">

            <thead>
            <tr>
                <th>Nama Logistik</th>
                <th>Kategori</th>
                <th>Jumlah Tersedia</th>
                <th>Aksi</th>
            </tr>
            </thead>

            <tbody>

            <tr>
                <td>Proyektor</td>
                <td>Elektronik</td>
                <td>10</td>
                <td>
                    <a href="#" class="btn btn-primary">
                        Detail
                    </a>
                </td>
            </tr>

            <tr>
                <td>Sound System</td>
                <td>Audio</td>
                <td>5</td>
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