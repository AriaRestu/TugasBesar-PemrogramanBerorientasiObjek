<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buat Pengajuan - TEL-U</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>
* { margin:0; padding:0; box-sizing:border-box; font-family:'Inter',sans-serif; }
body { background:#f4f6f9; display:flex; min-height:100vh; }
.sidebar { position:fixed; top:0; left:0; width:240px; height:100vh; background:linear-gradient(180deg,#B20824,#C8102E,#99001A); display:flex; flex-direction:column; z-index:100; }
.sb-logo { padding:20px 18px 16px; border-bottom:1px solid rgba(255,255,255,.15); }
.sb-logo-row { display:flex; align-items:center; gap:10px; }
.sb-logo-icon { width:36px; height:36px; background:white; border-radius:8px; display:flex; align-items:center; justify-content:center; flex-shrink:0; }
.sb-logo-icon svg, .sb-logo-icon img { width:22px; height:22px; }
.sb-logo h1 { font-size:14px; font-weight:600; color:white; }
.sb-section { padding:16px 18px 6px; font-size:10px; letter-spacing:1.5px; color:rgba(255,255,255,.5); text-transform:uppercase; }
.menu { list-style:none; padding:0 10px; }
.menu li { display:flex; align-items:center; gap:12px; padding:11px 12px; border-radius:10px; font-size:13px; color:rgba(255,255,255,.85); margin-bottom:2px; transition:background .2s; }
.menu li:hover { background:rgba(255,255,255,.12); }
.menu li.active { background:rgba(255,255,255,.2); color:white; font-weight:600; }
.menu li i { font-size:16px; width:20px; text-align:center; }
.sb-badge { margin-left:auto; background:rgba(255,255,255,.25); font-size:10px; padding:2px 7px; border-radius:10px; color:white; font-weight:600; }
.sb-bottom { margin-top:auto; padding:12px 10px; border-top:1px solid rgba(255,255,255,.12); }
.sb-copyright { font-size:10px; color:rgba(255,255,255,.35); padding:4px 12px; }
.menu-anchor { text-decoration:none; color:inherit; display:block; }
.content { margin-left:240px; flex:1; display:flex; flex-direction:column; }
.navbar { background:white; padding:12px 24px; display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #f0f0f0; position:sticky; top:0; z-index:50; }
.nb-brand { font-size:15px; font-weight:700; color:#C8102E; }
.nb-sub { font-size:11px; color:#999; }
.user-area { display:flex; align-items:center; gap:10px; }
.user-avatar { width:34px; height:34px; border-radius:50%; background:#f1c0c7; display:flex; align-items:center; justify-content:center; font-size:12px; font-weight:700; color:#7b0013; }
.user-name { font-size:13px; font-weight:600; color:#222; }
.user-role { font-size:11px; color:#999; }
.inner { padding:24px 28px; display:flex; flex-direction:column; gap:20px; flex:1; }
.page-title { font-size:22px; font-weight:700; color:#1a1a1a; }
.page-sub { font-size:13px; color:#aaa; }
.box { background:white; border-radius:16px; padding:28px 32px; border:1px solid #f0f0f0; }
.form-group { margin-bottom:20px; }
.form-group label { display:block; font-size:13px; font-weight:600; color:#444; margin-bottom:7px; }
.form-group input, .form-group select, .form-group textarea { width:100%; padding:11px 14px; border:1.5px solid #e5e7eb; border-radius:9px; font-size:13px; color:#333; outline:none; transition:border .2s; background:white; }
.form-group input:focus, .form-group select:focus, .form-group textarea:focus { border-color:#C8102E; }
.form-row { display:grid; grid-template-columns:1fr 1fr; gap:20px; }
.btn-primary { display:inline-flex; align-items:center; gap:8px; background:#C8102E; color:white; border:none; border-radius:10px; padding:12px 24px; font-size:13px; font-weight:700; cursor:pointer; }
.btn-primary:hover { background:#A5001F; }
.btn-secondary { display:inline-flex; align-items:center; gap:8px; background:white; color:#666; border:1.5px solid #e5e7eb; border-radius:10px; padding:12px 24px; font-size:13px; font-weight:600; text-decoration:none; }
.form-footer { display:flex; gap:12px; justify-content:flex-end; margin-top:8px; padding-top:20px; border-top:1px solid #f5f5f5; }
.alert-error { padding:12px 16px; background:#ffeaed; color:#b91c1c; border-radius:10px; font-size:13px; margin-bottom:20px; }
.alert-info { padding:12px 16px; background:#e0f2fe; color:#0369a1; border-radius:10px; font-size:13px; margin-bottom:20px; }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/fragments/sidebar-role.jsp">
    <jsp:param name="active" value="pengajuan"/>
</jsp:include>

<div class="content">
    <div class="navbar">
        <div>
            <div class="nb-brand">Peminjaman Ruang TEL-U</div>
            <div class="nb-sub">Sistem Peminjaman Ruangan</div>
        </div>
        <div class="user-area">
            <div class="user-avatar">${fn:substring(sessionScope.user.nama, 0, 1)}</div>
            <div>
                <div class="user-name">${sessionScope.user.nama}</div>
                <div class="user-role">${sessionScope.user.role}</div>
            </div>
        </div>
    </div>

    <div class="inner">
        <div>
            <div class="page-title">Ajukan Peminjaman</div>
            <div class="page-sub">Isi formulir berikut untuk mengajukan peminjaman ruangan</div>
        </div>

        <div class="box">
            <c:if test="${not empty error}">
                <div class="alert-error"><i class="fa-solid fa-circle-exclamation"></i> ${error}</div>
            </c:if>
            <div class="alert-info"><i class="fa-solid fa-circle-info"></i> Pengajuan akan diproses bertahap: Pembina → SSC → Logam TUS.</div>

            <form action="${pageContext.request.contextPath}/pengajuan" method="post">

                <div class="form-group">
                    <label><i class="fa-solid fa-door-open" style="color:#C8102E;margin-right:6px"></i>Jenis Pengajuan</label>
                    <select name="jenis_pengajuan" required>
                        <option value="RUANGAN">Ruangan</option>
                        <option value="LOGISTIK">Logistik</option>
                        <option value="RUANGAN_LOGISTIK">Ruangan + Logistik</option>
                    </select>
                </div>

                <div class="form-group">
                    <label><i class="fa-solid fa-building" style="color:#C8102E;margin-right:6px"></i>Pilih Ruangan</label>
                    <select name="ruangan_id">
                        <option value="">-- Pilih Ruangan (opsional) --</option>
                        <c:forEach var="r" items="${ruanganList}">
                            <option value="${r.id}">${r.namaRuangan} (${r.jenis}, Kap. ${r.kapasitas})</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label><i class="fa-solid fa-user-tie" style="color:#C8102E;margin-right:6px"></i>Pilih Pembina</label>
                    <select name="pembina_id" required>
                        <option value="">-- Pilih Pembina --</option>
                        <c:forEach var="pb" items="${pembinaList}">
                            <option value="${pb.id}">${pb.nama}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label><i class="fa-solid fa-pen" style="color:#C8102E;margin-right:6px"></i>Keperluan / Nama Kegiatan</label>
                    <input type="text" name="keperluan" placeholder="Contoh: Seminar Teknologi, Praktikum PBO..." required/>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label><i class="fa-solid fa-calendar" style="color:#C8102E;margin-right:6px"></i>Tanggal Pinjam</label>
                        <input type="date" name="tanggal_pinjam" required/>
                    </div>
                    <div class="form-group">
                        <label><i class="fa-solid fa-clock" style="color:#C8102E;margin-right:6px"></i>Waktu Mulai</label>
                        <input type="time" name="waktu_mulai" required/>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label><i class="fa-solid fa-clock" style="color:#C8102E;margin-right:6px"></i>Waktu Selesai</label>
                        <input type="time" name="waktu_selesai" required/>
                    </div>
                </div>

                <div class="form-group">
                    <label><i class="fa-solid fa-align-left" style="color:#C8102E;margin-right:6px"></i>Catatan Tambahan</label>
                    <textarea name="catatan" rows="3" placeholder="Keterangan tambahan jika ada..."></textarea>
                </div>

                <div class="form-footer">
                    <a href="${pageContext.request.contextPath}/dashboard" class="btn-secondary">
                        <i class="fa-solid fa-xmark"></i> Batal
                    </a>
                    <button type="submit" class="btn-primary">
                        <i class="fa-solid fa-paper-plane"></i> Kirim Pengajuan
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
