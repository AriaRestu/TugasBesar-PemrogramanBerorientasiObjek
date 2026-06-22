<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Peminjaman - TEL-U</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>
* { margin:0; padding:0; box-sizing:border-box; font-family:'Inter','Segoe UI',Arial,sans-serif; }
body { background:#f4f6f9; display:flex; min-height:100vh; }
.sidebar { position:fixed; top:0; left:0; width:240px; height:100vh; background:linear-gradient(180deg,#B20824 0%,#C8102E 55%,#99001A 100%); display:flex; flex-direction:column; z-index:100; }
.sb-logo { padding:18px 16px 16px; border-bottom:1px solid rgba(255,255,255,.15); display:flex; align-items:center; gap:12px; }
.sb-logo-icon { width:42px; height:42px; background:white; border-radius:10px; display:flex; align-items:center; justify-content:center; flex-shrink:0; }
.sb-logo-icon svg { width:26px; height:26px; }
.sb-logo-text h1 { font-size:13px; font-weight:700; color:white; line-height:1.3; }
.sb-section { padding:16px 18px 6px; font-size:9px; letter-spacing:1.8px; color:rgba(255,255,255,.45); text-transform:uppercase; }
.menu { list-style:none; padding:0 10px; }
.menu li a { display:flex; align-items:center; gap:12px; padding:11px 13px; border-radius:10px; font-size:13px; color:rgba(255,255,255,.82); text-decoration:none; margin-bottom:3px; transition:background .2s; }
.menu li a:hover { background:rgba(255,255,255,.12); }
.menu li a.active { background:rgba(255,255,255,.2); color:white; font-weight:700; }
.menu li a i { font-size:16px; width:20px; text-align:center; }
.sb-badge { margin-left:auto; background:rgba(255,255,255,.25); font-size:10px; padding:2px 7px; border-radius:10px; color:white; font-weight:700; }
.sb-bottom { margin-top:auto; padding:12px 10px; border-top:1px solid rgba(255,255,255,.12); }
.sb-bottom .menu { padding:0; margin-bottom:8px; }
.sb-copyright { font-size:9.5px; color:rgba(255,255,255,.3); padding:4px 13px; line-height:1.6; }
.content { margin-left:240px; flex:1; display:flex; flex-direction:column; min-height:100vh; }
.navbar { background:white; padding:12px 28px; display:flex; justify-content:space-between; align-items:center; border-bottom:1px solid #f0f0f0; position:sticky; top:0; z-index:50; }
.nb-left { display:flex; align-items:center; gap:14px; }
.nb-menu-btn { font-size:19px; color:#999; cursor:pointer; }
.nb-brand { font-size:15px; font-weight:700; color:#C8102E; }
.nb-sub   { font-size:10.5px; color:#bbb; margin-top:1px; }
.nb-right { display:flex; align-items:center; gap:14px; }
.user-area { display:flex; align-items:center; gap:10px; cursor:pointer; }
.user-avatar { width:36px; height:36px; border-radius:50%; background:#f5c0c8; display:flex; align-items:center; justify-content:center; font-size:12px; font-weight:700; color:#7b0013; }
.user-name { font-size:13px; font-weight:700; color:#222; }
.user-role { font-size:10.5px; color:#aaa; margin-top:1px; }
.user-area > i { font-size:12px; color:#ccc; }
.inner { padding:24px 28px; display:flex; flex-direction:column; gap:20px; flex:1; }
.page-title { font-size:22px; font-weight:700; color:#1a1a1a; margin-bottom:4px; }
.page-sub   { font-size:13px; color:#aaa; }
.box { background:white; border-radius:16px; padding:28px 32px; border:1px solid #f0f0f0; }
.form-group { margin-bottom:20px; }
.form-group label { display:block; font-size:13px; font-weight:600; color:#444; margin-bottom:7px; }
.form-group input, .form-group select, .form-group textarea {
    width:100%; padding:11px 14px; border:1.5px solid #e5e7eb; border-radius:9px;
    font-size:13px; color:#333; outline:none; transition:border .2s; background:white;
}
.form-group input:focus, .form-group select:focus, .form-group textarea:focus { border-color:#C8102E; }
.form-row { display:grid; grid-template-columns:1fr 1fr; gap:20px; }
.form-row-3 { display:grid; grid-template-columns:1fr 1fr 1fr; gap:20px; }
.btn-primary { display:inline-flex; align-items:center; gap:8px; background:#C8102E; color:white; border:none; border-radius:10px; padding:12px 24px; font-size:13.5px; font-weight:700; cursor:pointer; transition:background .2s; }
.btn-primary:hover { background:#A5001F; }
.btn-secondary { display:inline-flex; align-items:center; gap:8px; background:white; color:#666; border:1.5px solid #e5e7eb; border-radius:10px; padding:12px 24px; font-size:13.5px; font-weight:600; cursor:pointer; text-decoration:none; }
.btn-secondary:hover { background:#f9f9f9; }
.form-footer { display:flex; gap:12px; justify-content:flex-end; margin-top:8px; padding-top:20px; border-top:1px solid #f5f5f5; }
.alert-info { padding:14px 18px; background:#e0f2fe; color:#0369a1; border-radius:10px; font-size:13px; margin-bottom:20px; display:flex; align-items:center; gap:10px; }
.page-footer { text-align:center; padding:16px; font-size:12px; color:#bbb; border-top:1px solid #f0f0f0; background:white; }
</style>
</head>
<body>

<div class="sidebar">
    <div class="sb-logo">
        <div class="sb-logo-icon">
            <svg viewBox="0 0 26 26" fill="none">
                <rect x="2" y="3" width="22" height="5.5" rx="1.5" fill="#C8102E"/>
                <rect x="10" y="8.5" width="6" height="15" rx="1.5" fill="#C8102E"/>
                <rect x="2" y="20.5" width="22" height="2.5" rx="1.2" fill="#C8102E" opacity=".3"/>
            </svg>
        </div>
        <div class="sb-logo-text"><h1>Telkom University<br>Surabaya</h1></div>
    </div>
    <div class="sb-section">Menu</div>
    <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/dashboard"><i class="fa-solid fa-house"></i> Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/peminjaman" class="active"><i class="fa-solid fa-calendar-plus"></i> Peminjaman</a></li>
        <li><a href="${pageContext.request.contextPath}/riwayat"><i class="fa-solid fa-file-lines"></i> Riwayat <span class="sb-badge">2</span></a></li>
        <li><a href="${pageContext.request.contextPath}/notifikasi"><i class="fa-solid fa-bell"></i> Notifikasi <span class="sb-badge">3</span></a></li>
    </ul>
    <div class="sb-bottom">
        <ul class="menu"><li><a href="${pageContext.request.contextPath}/logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li></ul>
        <p class="sb-copyright">&#169; 2026 Telkom University Surabaya</p>
    </div>
</div>

<div class="content">
    <div class="navbar">
        <div class="nb-left">
            <i class="fa-solid fa-bars nb-menu-btn"></i>
            <div>
                <div class="nb-brand">Peminjaman Ruang TEL-U</div>
                <div class="nb-sub">Sistem Peminjaman Ruangan</div>
            </div>
        </div>
        <div class="nb-right">
            <div class="user-area">
                <div class="user-avatar">BA</div>
                <div><div class="user-name">Username</div><div class="user-role">Peminjam</div></div>
                <i class="fa-solid fa-chevron-down"></i>
            </div>
        </div>
    </div>

    <div class="inner">
        <div>
            <div class="page-title">Ajukan Peminjaman</div>
            <div class="page-sub">Isi formulir berikut untuk mengajukan peminjaman ruangan</div>
        </div>

        <div class="box">
            <div class="alert-info">
                <i class="fa-solid fa-circle-info"></i>
                Pengajuan akan diproses oleh admin dalam 1x24 jam kerja.
            </div>

            <form action="${pageContext.request.contextPath}/peminjaman" method="post">
                <div class="form-group">
                    <label><i class="fa-solid fa-door-open" style="color:#C8102E;margin-right:6px"></i>Pilih Ruangan</label>
                    <select name="ruangan" required>
                        <option value="">-- Pilih Ruangan --</option>
                        <option>Lab Komputer 301</option>
                        <option>Lab Komputer 302</option>
                        <option>Aula Utama</option>
                        <option>Ruang Rapat A</option>
                        <option>Ruang Rapat B</option>
                        <option>Lab Jaringan</option>
                        <option>Ruang Kelas 401</option>
                    </select>
                </div>

                <div class="form-group">
                    <label><i class="fa-solid fa-pen" style="color:#C8102E;margin-right:6px"></i>Nama Kegiatan</label>
                    <input type="text" name="kegiatan" placeholder="Contoh: Praktikum PBO, Seminar Teknologi..." required/>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label><i class="fa-solid fa-calendar" style="color:#C8102E;margin-right:6px"></i>Tanggal Penggunaan</label>
                        <input type="date" name="tanggal" required/>
                    </div>
                    <div class="form-group">
                        <label><i class="fa-solid fa-users" style="color:#C8102E;margin-right:6px"></i>Jumlah Peserta</label>
                        <input type="number" name="peserta" placeholder="Contoh: 30" min="1" required/>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label><i class="fa-solid fa-clock" style="color:#C8102E;margin-right:6px"></i>Jam Mulai</label>
                        <input type="time" name="jam_mulai" required/>
                    </div>
                    <div class="form-group">
                        <label><i class="fa-solid fa-clock" style="color:#C8102E;margin-right:6px"></i>Jam Selesai</label>
                        <input type="time" name="jam_selesai" required/>
                    </div>
                </div>

                <div class="form-group">
                    <label><i class="fa-solid fa-align-left" style="color:#C8102E;margin-right:6px"></i>Keterangan Tambahan</label>
                    <textarea name="keterangan" rows="4" placeholder="Tuliskan keterangan tambahan jika ada..."></textarea>
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

    <div class="page-footer">Peminjaman Ruang TEL-U &copy; 2026 &mdash; Telkom University Surabaya</div>
</div>

</body>
</html>
