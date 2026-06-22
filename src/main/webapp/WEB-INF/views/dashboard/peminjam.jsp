<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard - Peminjam</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>
* { margin:0; padding:0; box-sizing:border-box; font-family:'Inter',sans-serif; }
body { background:#f4f6f9; display:flex; min-height:100vh; }
.sidebar { position:fixed; top:0; left:0; width:240px; height:100vh; background:linear-gradient(180deg,#B20824,#C8102E,#99001A); color:white; display:flex; flex-direction:column; z-index:100; }
.sb-logo { padding:20px 18px 16px; border-bottom:1px solid rgba(255,255,255,.15); }
.sb-logo-row { display:flex; align-items:center; gap:10px; }
.sb-logo-icon { width:36px; height:36px; background:white; border-radius:8px; display:flex; align-items:center; justify-content:center; flex-shrink:0; }
.sb-logo-icon svg, .sb-logo-icon img { width:22px; height:22px; }
.sb-logo h1 { font-size:14px; font-weight:600; color:white; }
.sb-section { padding:16px 18px 6px; font-size:10px; letter-spacing:1.5px; color:rgba(255,255,255,.5); text-transform:uppercase; }
.menu { list-style:none; padding:0 10px; }
.menu li { display:flex; align-items:center; gap:12px; padding:11px 12px; border-radius:10px; cursor:pointer; font-size:13px; color:rgba(255,255,255,.85); margin-bottom:2px; transition:background .2s; }
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
.notif-btn { position:relative; width:36px; height:36px; border:1px solid #eee; border-radius:10px; display:flex; align-items:center; justify-content:center; cursor:pointer; background:white; text-decoration:none; }
.notif-btn i { font-size:17px; color:#666; }
.notif-count { position:absolute; top:-6px; right:-6px; width:18px; height:18px; background:#C8102E; border-radius:50%; font-size:10px; color:white; display:flex; align-items:center; justify-content:center; font-weight:700; border:2px solid white; }
.user-area { display:flex; align-items:center; gap:10px; }
.user-avatar { width:34px; height:34px; border-radius:50%; background:#f1c0c7; display:flex; align-items:center; justify-content:center; font-size:12px; font-weight:700; color:#7b0013; }
.user-name { font-size:13px; font-weight:600; color:#222; }
.user-role { font-size:11px; color:#999; }
.inner { padding:20px 24px; display:flex; flex-direction:column; gap:18px; flex:1; }
.hero { background:white; border-radius:16px; padding:28px 32px; display:flex; justify-content:space-between; align-items:center; border:1px solid #f0f0f0; }
.hero-text h1 { font-size:24px; font-weight:700; color:#1a1a1a; margin-bottom:8px; }
.hero-text p { font-size:14px; color:#666; line-height:1.7; max-width:380px; }
.btn-ajukan { margin-top:16px; display:inline-flex; align-items:center; gap:8px; background:#C8102E; color:white; border:none; border-radius:10px; padding:11px 20px; font-size:13px; font-weight:600; cursor:pointer; text-decoration:none; }
.btn-ajukan:hover { background:#A5001F; }
.cards { display:grid; grid-template-columns:repeat(4,1fr); gap:14px; }
.card { background:white; border-radius:16px; padding:20px; border:1px solid #f0f0f0; display:flex; align-items:center; gap:16px; }
.card-icon { width:46px; height:46px; border-radius:12px; display:flex; align-items:center; justify-content:center; flex-shrink:0; font-size:22px; }
.card-icon.red { background:#ffeaed; color:#C8102E; }
.card-icon.yellow { background:#fef9e7; color:#d97706; }
.card-icon.green { background:#eaf7f0; color:#16a34a; }
.card-icon.gray { background:#f4f4f4; color:#6b7280; }
.card-label { font-size:12px; color:#888; margin-bottom:4px; }
.card-num { font-size:32px; font-weight:700; color:#1a1a1a; line-height:1; }
.table-box { background:white; border-radius:16px; padding:22px 24px; border:1px solid #f0f0f0; }
.table-header { display:flex; justify-content:space-between; align-items:center; margin-bottom:18px; }
.table-header h2 { font-size:16px; font-weight:700; color:#1a1a1a; }
.lihat-btn { display:inline-flex; align-items:center; gap:6px; font-size:13px; color:#C8102E; background:none; border:none; cursor:pointer; font-weight:600; text-decoration:none; }
table { width:100%; border-collapse:collapse; }
th { padding:12px 14px; text-align:left; font-size:12px; font-weight:600; color:#888; border-bottom:1px solid #f0f0f0; background:#fafafa; }
td { padding:14px 14px; border-bottom:1px solid #f5f5f5; font-size:13px; color:#333; }
tr:last-child td { border-bottom:none; }
.badge { display:inline-block; padding:5px 14px; border-radius:20px; font-size:12px; font-weight:600; }
.badge.pending { background:#fef9e7; color:#b45309; }
.badge.approve { background:#eaf7f0; color:#15803d; }
.badge.reject { background:#ffeaed; color:#b91c1c; }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/fragments/sidebar-role.jsp">
    <jsp:param name="active" value="dashboard"/>
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
        <div class="hero">
            <div class="hero-text">
                <h1>Halo, ${sessionScope.user.nama}! 👋</h1>
                <p>Selamat datang di Peminjaman Ruang TEL-U. Kelola peminjaman ruangan kampus dengan mudah.</p>
                <a href="${pageContext.request.contextPath}/pengajuan" class="btn-ajukan">
                    <i class="fa-solid fa-plus"></i> Ajukan Peminjaman
                </a>
            </div>
        </div>

        <%-- Stat cards --%>
        <c:set var="total" value="0"/>
        <c:set var="pending" value="0"/>
        <c:set var="disetujui" value="0"/>
        <c:set var="ditolak" value="0"/>
        <c:forEach var="p" items="${pengajuanList}">
            <c:set var="total" value="${total + 1}"/>
            <c:choose>
                <c:when test="${p.status == 'DISETUJUI'}"><c:set var="disetujui" value="${disetujui + 1}"/></c:when>
                <c:when test="${p.status == 'DITOLAK'}"><c:set var="ditolak" value="${ditolak + 1}"/></c:when>
                <c:otherwise><c:set var="pending" value="${pending + 1}"/></c:otherwise>
            </c:choose>
        </c:forEach>

        <div class="cards">
            <div class="card">
                <div class="card-icon red"><i class="fa-solid fa-file-circle-plus"></i></div>
                <div><div class="card-label">Total Pengajuan</div><div class="card-num">${total}</div></div>
            </div>
            <div class="card">
                <div class="card-icon yellow"><i class="fa-solid fa-clock"></i></div>
                <div><div class="card-label">Pending</div><div class="card-num">${pending}</div></div>
            </div>
            <div class="card">
                <div class="card-icon green"><i class="fa-solid fa-circle-check"></i></div>
                <div><div class="card-label">Disetujui</div><div class="card-num">${disetujui}</div></div>
            </div>
            <div class="card">
                <div class="card-icon gray"><i class="fa-solid fa-circle-xmark"></i></div>
                <div><div class="card-label">Ditolak</div><div class="card-num">${ditolak}</div></div>
            </div>
        </div>

        <div class="table-box">
            <div class="table-header">
                <h2>Pengajuan Terbaru</h2>
                <a href="${pageContext.request.contextPath}/riwayat" class="lihat-btn">Lihat Semua &nbsp;<i class="fa-solid fa-arrow-right"></i></a>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>No Tiket</th>
                        <th>Ruangan</th>
                        <th>Keperluan</th>
                        <th>Tanggal Pinjam</th>
                        <th>Status</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty pengajuanList}">
                            <tr><td colspan="6" style="text-align:center;padding:40px;color:#aaa;">Belum ada pengajuan.</td></tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="p" items="${pengajuanList}" begin="0" end="4">
                                <tr>
                                    <td><strong>${p.noTiket}</strong></td>
                                    <td>${not empty p.namaRuangan ? p.namaRuangan : '-'}</td>
                                    <td>${p.keperluan}</td>
                                    <td><fmt:formatDate value="${p.tanggalPinjam}" pattern="dd/MM/yyyy"/></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${p.status == 'DISETUJUI'}"><span class="badge approve">Disetujui</span></c:when>
                                            <c:when test="${p.status == 'DITOLAK'}"><span class="badge reject">Ditolak</span></c:when>
                                            <c:otherwise><span class="badge pending">${p.status}</span></c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/detail-pengajuan?id=${p.id}"
                                           style="display:inline-flex;align-items:center;gap:6px;font-size:12px;font-weight:600;color:#C8102E;text-decoration:none;padding:5px 12px;border:1.5px solid #C8102E;border-radius:8px;">
                                            <i class="fa-solid fa-eye"></i> Detail
                                        </a>
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

</body>
</html>
