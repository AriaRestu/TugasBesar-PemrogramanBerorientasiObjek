<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/fragments/header.jsp"/>
<jsp:include page="/WEB-INF/views/fragments/navbar.jsp"/>

<div class="container">

    <h1>Pengajuan Peminjaman</h1>

    <div class="card">

        <form action="#" method="post">

            <div class="form-group">
                <label>Jenis Pengajuan</label>

                <select name="jenisPengajuan">

                    <option value="RUANGAN">
                        Ruangan
                    </option>

                    <option value="LOGISTIK">
                        Logistik
                    </option>

                    <option value="RUANGAN_LOGISTIK">
                        Ruangan + Logistik
                    </option>

                </select>
            </div>

            <div class="form-group">
                <label>Nama Kegiatan</label>

                <input
                        type="text"
                        name="keperluan"
                        placeholder="Masukkan nama kegiatan">
            </div>

            <div class="form-group">
                <label>Ruangan</label>

                <select name="ruanganId">
                    <option>Pilih Ruangan</option>
                </select>
            </div>

            <div class="form-group">
                <label>Tanggal Peminjaman</label>

                <input
                        type="date"
                        name="tanggalPinjam">
            </div>

            <div class="form-group">
                <label>Waktu Mulai</label>

                <input
                        type="time"
                        name="waktuMulai">
            </div>

            <div class="form-group">
                <label>Waktu Selesai</label>

                <input
                        type="time"
                        name="waktuSelesai">
            </div>

            <div class="form-group">
                <label>Catatan</label>

                <textarea
                        name="catatan"
                        rows="4"></textarea>
            </div>

            <button
                    type="submit"
                    class="btn btn-primary">
                Ajukan Peminjaman
            </button>

        </form>

    </div>

</div>

<jsp:include page="/WEB-INF/views/fragments/footer.jsp"/>