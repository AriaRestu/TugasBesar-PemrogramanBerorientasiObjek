<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard Logam TUS</title>
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
.cards { display:grid; grid-template-columns:repeat(3,1fr); gap:14px; }
.card { background:white; border-radius:16px; padding:20px; border:1px solid #f0f0f0; display:flex; align-items:center; gap:16px; }
.card-icon { width:46px; height:46px; border-radius:12px; display:flex; align-items:center; justify-content:center; flex-shrink:0; font-size:22px; }
.card-icon.red { background:#ffeaed; color:#C8102E; }
.card-icon.yellow { background:#fef9e7; color:#d97706; }
.card-icon.green { background:#eaf7f0; color:#16a34a; }
.card-label { font-size:12px; color:#888; margin-bottom:4px; }
.card-num { font-size:32px; font-weight:700; color:#1a1a1a; line-height:1; }
.table-box { background:white; border-radius:16px; padding:22px 24px; border:1px solid #f0f0f0; }
.table-header { display:flex; justify-content:space-between; align-items:center; margin-bottom:18px; }
.table-header h2 { font-size:16px; font-weight:700; color:#1a1a1a; }
table { width:100%; border-collapse:collapse; }
th { padding:12px 14px; text-align:left; font-size:12px; font-weight:600; color:#888; border-bottom:1px solid #f0f0f0; background:#fafafa; }
td { padding:14px 14px; border-bottom:1px solid #f5f5f5; font-size:13px; color:#333; }
tr:last-child td { border-bottom:none; }
.badge { display:inline-block; padding:5px 14px; border-radius:20px; font-size:12px; font-weight:600; }
.badge.pending { background:#fef9e7; color:#b45309; }
.badge.approve { background:#eaf7f0; color:#15803d; }
.badge.reject { background:#ffeaed; color:#b91c1c; }
.btn-success { background:#16a34a; color:white; border:none; padding:7px 14px; border-radius:8px; cursor:pointer; font-size:12px; text-decoration:none; display:inline-block; }
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
        <div style="display:flex;align-items:center;gap:14px;">
            <a href="${pageContext.request.contextPath}/notifikasi" class="notif-btn">
                <i class="fa-solid fa-bell"></i>
                <c:if test="${unreadCount > 0}"><span class="notif-count">${unreadCount}</span></c:if>
            </a>
            <div class="user-area">
                <div class="user-avatar">${fn:substring(sessionScope.user.nama, 0, 1)}</div>
                <div>
                    <div class="user-name">${sessionScope.user.nama}</div>
                    <div class="user-role">${sessionScope.user.role}</div>
                </div>
            </div>
        </div>
    </div>

    <div class="inner">
        <div class="hero">
            <div class="hero-text">
                <h1>Halo, ${sessionScope.user.nama}! 👋</h1>
                <p>Selamat datang di Peminjaman Ruang TEL-U. Berikut pengajuan yang menunggu persetujuan akhir Anda.</p>
            </div>
        </div>

        <div class="cards">
            <div class="card">
                <div class="card-icon yellow"><i class="fa-solid fa-clock"></i></div>
                <div>
                    <div class="card-label">Menunggu Persetujuan</div>
                    <div class="card-num">${pengajuanList.size()}</div>
                </div>
            </div>
            <div class="card">
                <div class="card-icon red"><i class="fa-solid fa-bell"></i></div>
                <div>
                    <div class="card-label">Notifikasi Belum Dibaca</div>
                    <div class="card-num">${unreadCount}</div>
                </div>
            </div>
        </div>

        <div class="table-box">
            <div class="table-header">
                <h2>Pengajuan Menunggu Persetujuan Akhir</h2>
                <a href="${pageContext.request.contextPath}/approval/logamtus" class="btn-success">
                    <i class="fa-solid fa-stamp"></i> Proses Semua
                </a>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>No Tiket</th>
                        <th>Peminjam</th>
                        <th>Ruangan</th>
                        <th>Tanggal Pinjam</th>
                        <th>Keperluan</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty pengajuanList}">
                            <tr><td colspan="6" style="text-align:center;padding:40px;color:#aaa;">Tidak ada pengajuan yang menunggu persetujuan.</td></tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="p" items="${pengajuanList}">
                                <tr>
                                    <td><strong>${p.noTiket}</strong></td>
                                    <td>${p.namaUser}</td>
                                    <td>${not empty p.namaRuangan ? p.namaRuangan : '-'}</td>
                                    <td><fmt:formatDate value="${p.tanggalPinjam}" pattern="dd/MM/yyyy"/></td>
                                    <td>${p.keperluan}</td>
                                    <td><span class="badge pending">MENUNGGU LOGAM TUS</span></td>
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
