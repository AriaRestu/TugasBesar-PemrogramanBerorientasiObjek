<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Pengajuan - TEL-U</title>
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
.page-hdr { display:flex; justify-content:space-between; align-items:flex-end; }
.page-title { font-size:22px; font-weight:700; color:#1a1a1a; }
.page-sub { font-size:13px; color:#aaa; }
.box { background:white; border-radius:16px; padding:28px 32px; border:1px solid #f0f0f0; }
.detail-row { display:flex; padding:14px 0; border-bottom:1px solid #f5f5f5; font-size:13px; }
.detail-row:last-child { border-bottom:none; }
.detail-label { width:180px; flex-shrink:0; color:#888; font-weight:600; }
.detail-value { color:#333; }
.badge { display:inline-block; padding:5px 14px; border-radius:20px; font-size:12px; font-weight:600; }
.badge.pending { background:#fef9e7; color:#b45309; }
.badge.approve { background:#eaf7f0; color:#15803d; }
.badge.reject  { background:#ffeaed; color:#b91c1c; }
.btn-secondary { display:inline-flex; align-items:center; gap:8px; background:white; color:#666; border:1.5px solid #e5e7eb; border-radius:10px; padding:10px 20px; font-size:13px; font-weight:600; text-decoration:none; cursor:pointer; }
.btn-secondary:hover { background:#f9f9f9; }
.btn-download { display:inline-flex; align-items:center; gap:8px; background:#15803d; color:white; border:none; border-radius:10px; padding:10px 20px; font-size:13px; font-weight:600; text-decoration:none; cursor:pointer; }
.btn-download:hover { background:#166534; }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/fragments/sidebar-role.jsp">
    <jsp:param name="active" value="riwayat"/>
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
        <div class="page-hdr">
            <div>
                <div class="page-title">Detail Pengajuan</div>
                <div class="page-sub">Informasi lengkap peminjaman ruangan</div>
            </div>
            <div style="display:flex;gap:10px;align-items:center;">
                <%-- Tombol cetak tiket F03 — hanya muncul jika status DISETUJUI dan F03 sudah diterbitkan --%>
                <c:if test="${pengajuan.status == 'DISETUJUI' and not empty f03}">
                    <a href="${pageContext.request.contextPath}/f03?download=${f03.id}"
                       class="btn-download" target="_blank">
                        <i class="fa-solid fa-file-pdf"></i> Cetak Tiket Persetujuan
                    </a>
                </c:if>
                <a href="${pageContext.request.contextPath}/riwayat" class="btn-secondary">
                    <i class="fa-solid fa-arrow-left"></i> Kembali
                </a>
            </div>
        </div>

        <div class="box">
            <div class="detail-row">
                <span class="detail-label"><i class="fa-solid fa-ticket" style="color:#C8102E;margin-right:8px"></i>No Tiket</span>
                <span class="detail-value"><strong>${pengajuan.noTiket}</strong></span>
            </div>
            <div class="detail-row">
                <span class="detail-label"><i class="fa-solid fa-layer-group" style="color:#C8102E;margin-right:8px"></i>Jenis Pengajuan</span>
                <span class="detail-value">${pengajuan.jenisPengajuan}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label"><i class="fa-solid fa-building" style="color:#C8102E;margin-right:8px"></i>Ruangan</span>
                <span class="detail-value">${not empty pengajuan.namaRuangan ? pengajuan.namaRuangan : '-'}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label"><i class="fa-solid fa-pen" style="color:#C8102E;margin-right:8px"></i>Keperluan</span>
                <span class="detail-value">${pengajuan.keperluan}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label"><i class="fa-solid fa-calendar" style="color:#C8102E;margin-right:8px"></i>Tanggal Pinjam</span>
                <span class="detail-value"><fmt:formatDate value="${pengajuan.tanggalPinjam}" pattern="dd MMMM yyyy"/></span>
            </div>
            <div class="detail-row">
                <span class="detail-label"><i class="fa-solid fa-clock" style="color:#C8102E;margin-right:8px"></i>Waktu</span>
                <span class="detail-value">${pengajuan.waktuMulai} - ${pengajuan.waktuSelesai}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label"><i class="fa-solid fa-circle-check" style="color:#C8102E;margin-right:8px"></i>Status</span>
                <span class="detail-value">
                    <c:choose>
                        <c:when test="${pengajuan.status == 'DISETUJUI'}"><span class="badge approve">Disetujui</span></c:when>
                        <c:when test="${pengajuan.status == 'DITOLAK'}"><span class="badge reject">Ditolak</span></c:when>
                        <c:otherwise><span class="badge pending">${pengajuan.status}</span></c:otherwise>
                    </c:choose>
                </span>
            </div>
            <div class="detail-row">
                <span class="detail-label"><i class="fa-solid fa-align-left" style="color:#C8102E;margin-right:8px"></i>Catatan</span>
                <span class="detail-value">${not empty pengajuan.catatan ? pengajuan.catatan : '-'}</span>
            </div>
        </div>
    </div>
</div>

</body>
</html>
