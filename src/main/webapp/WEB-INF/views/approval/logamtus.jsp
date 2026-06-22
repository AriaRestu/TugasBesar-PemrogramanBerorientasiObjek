<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Approval Logam TUS</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>
* { margin:0; padding:0; box-sizing:border-box; font-family:'Inter',sans-serif; }
body { background:#f4f6f9; display:flex; min-height:100vh; }
.sidebar { position:fixed; top:0; left:0; width:240px; height:100vh; background:linear-gradient(180deg,#B20824,#C8102E,#99001A); color:white; display:flex; flex-direction:column; z-index:100; }
.sb-logo { padding:20px 18px 16px; border-bottom:1px solid rgba(255,255,255,.15); }
.sb-logo-row { display:flex; align-items:center; gap:10px; }
.sb-logo-icon { width:36px; height:36px; background:white; border-radius:8px; display:flex; align-items:center; justify-content:center; flex-shrink:0; }
.sb-logo-icon svg { width:22px; height:22px; }
.sb-logo h1 { font-size:14px; font-weight:600; color:white; }
.sb-section { padding:16px 18px 6px; font-size:10px; letter-spacing:1.5px; color:rgba(255,255,255,.5); text-transform:uppercase; }
.menu { list-style:none; padding:0 10px; }
.menu li { display:flex; align-items:center; gap:12px; padding:11px 12px; border-radius:10px; cursor:pointer; font-size:13px; color:rgba(255,255,255,.85); margin-bottom:2px; transition:background .2s; }
.menu li:hover { background:rgba(255,255,255,.12); }
.menu li.active { background:rgba(255,255,255,.2); color:white; font-weight:600; }
.menu li i { font-size:16px; width:20px; text-align:center; }
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
.inner { padding:20px 24px; display:flex; flex-direction:column; gap:18px; flex:1; }
.table-box { background:white; border-radius:16px; padding:22px 24px; border:1px solid #f0f0f0; }
.table-header { display:flex; justify-content:space-between; align-items:center; margin-bottom:18px; }
.table-header h2 { font-size:16px; font-weight:700; color:#1a1a1a; }
table { width:100%; border-collapse:collapse; }
th { padding:12px 14px; text-align:left; font-size:12px; font-weight:600; color:#888; border-bottom:1px solid #f0f0f0; background:#fafafa; }
td { padding:16px 14px; border-bottom:1px solid #f5f5f5; font-size:13px; color:#333; }
tr:last-child td { border-bottom:none; }
.badge { display:inline-block; padding:5px 14px; border-radius:20px; font-size:12px; font-weight:600; }
.badge.pending { background:#fef9e7; color:#b45309; }
.badge.approve { background:#eaf7f0; color:#15803d; }
.badge.reject  { background:#ffeaed; color:#b91c1c; }
.btn-success { background:#16a34a; color:white; border:none; padding:8px 14px; border-radius:8px; cursor:pointer; font-size:12px; }
.btn-danger  { background:#c8102e; color:white; border:none; padding:8px 14px; border-radius:8px; cursor:pointer; font-size:12px; margin-left:6px; }
.btn-success:hover { background:#15803d; }
.btn-danger:hover  { background:#a10d26; }
.empty-state { text-align:center; padding:40px; color:#aaa; font-size:14px; }
/* Modal */
.modal-overlay { display:none; position:fixed; inset:0; background:rgba(0,0,0,.4); z-index:200; align-items:center; justify-content:center; }
.modal-overlay.show { display:flex; }
.modal { background:white; border-radius:16px; padding:28px; width:420px; }
.modal h3 { margin-bottom:16px; font-size:16px; color:#1a1a1a; }
.modal textarea { width:100%; border:1px solid #e0e0e0; border-radius:8px; padding:10px; font-size:13px; resize:vertical; min-height:80px; }
.modal-actions { display:flex; gap:10px; margin-top:16px; justify-content:flex-end; }
.btn-cancel { background:#f0f0f0; color:#555; border:none; padding:9px 18px; border-radius:8px; cursor:pointer; }
</style>
</head>
<body>

<div class="sidebar">
    <div class="sb-logo">
        <div class="sb-logo-row">
            <div class="sb-logo-icon">
                <svg viewBox="0 0 24 24" fill="none"><path d="M3 9.5L12 3L21 9.5V20C21 20.55 20.55 21 20 21H15V15H9V21H4C3.45 21 3 20.55 3 20V9.5Z" fill="#C8102E"/><rect x="9" y="15" width="6" height="6" fill="#99001A"/></svg>
            </div>
            <h1>Telkom University Surabaya</h1>
        </div>
    </div>
    <div class="sb-section">Menu</div>
    <ul class="menu">
        <a href="${pageContext.request.contextPath}/dashboard" class="menu-anchor"><li><i class="fa-solid fa-house"></i> Dashboard</li></a>
        <a href="${pageContext.request.contextPath}/approval/logamtus" class="menu-anchor"><li class="active"><i class="fa-solid fa-stamp"></i> Approval Logam TUS</li></a>
        <a href="${pageContext.request.contextPath}/notifikasi" class="menu-anchor"><li><i class="fa-solid fa-bell"></i> Notifikasi</li></a>
    </ul>
    <div class="sb-bottom">
        <ul class="menu">
            <a href="${pageContext.request.contextPath}/logout" class="menu-anchor"><li><i class="fa-solid fa-right-from-bracket"></i> Logout</li></a>
        </ul>
        <p class="sb-copyright">© 2026 Telkom University Surabaya</p>
    </div>
</div>

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
        <c:if test="${not empty param.success}">
            <div style="background:#eaf7f0;color:#15803d;padding:12px 18px;border-radius:10px;font-size:13px;">
                Tindakan berhasil disimpan.
            </div>
        </c:if>

        <div class="table-box">
            <div class="table-header">
                <h2>Persetujuan Akhir — Logam TUS</h2>
                <span style="font-size:13px;color:#888;">${pendingList.size()} menunggu</span>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>No Tiket</th>
                        <th>Peminjam</th>
                        <th>Ruangan</th>
                        <th>Tanggal Pinjam</th>
                        <th>Keperluan</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty pendingList}">
                            <tr><td colspan="6" class="empty-state">Tidak ada pengajuan yang menunggu persetujuan.</td></tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="p" items="${pendingList}">
                                <tr>
                                    <td><strong>${p.noTiket}</strong></td>
                                    <td>${p.namaUser}</td>
                                    <td>${not empty p.namaRuangan ? p.namaRuangan : '-'}</td>
                                    <td><fmt:formatDate value="${p.tanggalPinjam}" pattern="dd/MM/yyyy"/></td>
                                    <td>${p.keperluan}</td>
                                    <td>
                                        <button class="btn-success"
                                                onclick="openModal(${p.id}, 'setujui')">
                                            <i class="fa-solid fa-check"></i> Setujui
                                        </button>
                                        <button class="btn-danger"
                                                onclick="openModal(${p.id}, 'tolak')">
                                            <i class="fa-solid fa-xmark"></i> Tolak
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal Konfirmasi -->
<div class="modal-overlay" id="modalOverlay">
    <div class="modal">
        <h3 id="modalTitle">Konfirmasi</h3>
        <form method="post" action="${pageContext.request.contextPath}/approval/logamtus">
            <input type="hidden" name="pengajuan_id" id="modalPengajuanId"/>
            <input type="hidden" name="action" id="modalAction"/>
            <label style="font-size:13px;color:#555;display:block;margin-bottom:6px;">Catatan (opsional):</label>
            <textarea name="catatan" placeholder="Tambahkan catatan..."></textarea>
            <div class="modal-actions">
                <button type="button" class="btn-cancel" onclick="closeModal()">Batal</button>
                <button type="submit" id="modalSubmit" class="btn-success">Konfirmasi</button>
            </div>
        </form>
    </div>
</div>

<script>
function openModal(id, action) {
    document.getElementById('modalPengajuanId').value = id;
    document.getElementById('modalAction').value = action;
    const isSetujui = action === 'setujui';
    document.getElementById('modalTitle').textContent = isSetujui ? 'Setujui Pengajuan' : 'Tolak Pengajuan';
    const btn = document.getElementById('modalSubmit');
    btn.textContent = isSetujui ? 'Setujui' : 'Tolak';
    btn.className = isSetujui ? 'btn-success' : 'btn-danger';
    document.getElementById('modalOverlay').classList.add('show');
}
function closeModal() {
    document.getElementById('modalOverlay').classList.remove('show');
}
</script>
</body>
</html>