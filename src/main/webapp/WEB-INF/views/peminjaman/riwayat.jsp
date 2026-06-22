<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Riwayat Pengajuan - TEL-U</title>
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
.inner { padding:20px 24px; display:flex; flex-direction:column; gap:18px; flex:1; }
.page-hdr { display:flex; justify-content:space-between; align-items:flex-end; }
.page-title { font-size:22px; font-weight:700; color:#1a1a1a; }
.page-sub { font-size:13px; color:#888; }
.btn-primary { display:inline-flex; align-items:center; gap:8px; background:#C8102E; color:white; border:none; border-radius:10px; padding:11px 20px; font-size:13px; font-weight:600; cursor:pointer; text-decoration:none; }
.btn-primary:hover { background:#A5001F; }
.filter-bar { display:flex; gap:12px; flex-wrap:wrap; background:white; padding:16px 20px; border-radius:12px; border:1px solid #f0f0f0; }
.filter-bar select, .filter-bar input { padding:9px 13px; border:1px solid #e5e7eb; border-radius:9px; font-size:13px; background:white; outline:none; }
.filter-bar input[type=text] { flex:1; min-width:200px; }
.btn-filter { background:#C8102E; color:white; border:none; padding:9px 18px; border-radius:9px; font-size:13px; cursor:pointer; }
.table-box { background:white; border-radius:16px; padding:22px 24px; border:1px solid #f0f0f0; }
table { width:100%; border-collapse:collapse; }
th { padding:12px 14px; text-align:left; font-size:12px; font-weight:600; color:#888; border-bottom:1px solid #f0f0f0; background:#fafafa; }
td { padding:14px 14px; border-bottom:1px solid #f5f5f5; font-size:13px; color:#333; }
tr:last-child td { border-bottom:none; }
.badge { display:inline-block; padding:5px 14px; border-radius:20px; font-size:12px; font-weight:600; }
.badge.pending { background:#fef9e7; color:#b45309; }
.badge.approve { background:#eaf7f0; color:#15803d; }
.badge.reject { background:#ffeaed; color:#b91c1c; }
.empty-state { text-align:center; padding:40px; color:#aaa; font-size:14px; }
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
                <div class="page-title">Riwayat Peminjaman</div>
                <div class="page-sub">Semua pengajuan peminjaman ruangan kamu</div>
            </div>
            <a href="${pageContext.request.contextPath}/pengajuan" class="btn-primary">
                <i class="fa-solid fa-plus"></i> Buat Pengajuan
            </a>
        </div>

        <%-- Filter form (GET) --%>
        <form method="get" action="${pageContext.request.contextPath}/riwayat">
            <div class="filter-bar">
                <select name="status">
                    <option value="">Semua Status</option>
                    <option value="MENUNGGU_PEMBINA" ${param.status == 'MENUNGGU_PEMBINA' ? 'selected' : ''}>Menunggu Pembina</option>
                    <option value="MENUNGGU_SSC" ${param.status == 'MENUNGGU_SSC' ? 'selected' : ''}>Menunggu SSC</option>
                    <option value="MENUNGGU_LOGAM_TUS" ${param.status == 'MENUNGGU_LOGAM_TUS' ? 'selected' : ''}>Menunggu Logam TUS</option>
                    <option value="DISETUJUI" ${param.status == 'DISETUJUI' ? 'selected' : ''}>Disetujui</option>
                    <option value="DITOLAK" ${param.status == 'DITOLAK' ? 'selected' : ''}>Ditolak</option>
                </select>
                <input type="text" name="keyword" value="${param.keyword}" placeholder="🔍 Cari ruangan atau keperluan..."/>
                <button type="submit" class="btn-filter"><i class="fa-solid fa-magnifying-glass"></i> Filter</button>
            </div>
        </form>

        <div class="table-box">
            <table>
                <thead>
                    <tr>
                        <th>No Tiket</th>
                        <th>Ruangan</th>
                        <th>Keperluan</th>
                        <th>Tanggal Pinjam</th>
                        <th>Waktu</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty pengajuanList}">
                            <tr><td colspan="6" class="empty-state">Tidak ada pengajuan yang ditemukan.</td></tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="p" items="${pengajuanList}">
                                <tr>
                                    <td><strong>${p.noTiket}</strong></td>
                                    <td>${not empty p.namaRuangan ? p.namaRuangan : '-'}</td>
                                    <td>${p.keperluan}</td>
                                    <td><fmt:formatDate value="${p.tanggalPinjam}" pattern="dd/MM/yyyy"/></td>
                                    <td>${p.waktuMulai} - ${p.waktuSelesai}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${p.status == 'DISETUJUI'}"><span class="badge approve">Disetujui</span></c:when>
                                            <c:when test="${p.status == 'DITOLAK'}"><span class="badge reject">Ditolak</span></c:when>
                                            <c:otherwise><span class="badge pending">${p.status}</span></c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>

            <%-- Paginasi --%>
            <c:if test="${totalPages > 1}">
                <div style="display:flex;justify-content:center;align-items:center;gap:6px;margin-top:20px;flex-wrap:wrap;">
                    <c:forEach begin="1" end="${totalPages}" var="p">
                        <a href="?status=${param.status}&keyword=${param.keyword}&page=${p}"
                           style="padding:6px 12px;border-radius:8px;border:1px solid #e5e7eb;font-size:13px;text-decoration:none;
                                  background:${p == page ? '#C8102E' : 'white'};color:${p == page ? 'white' : '#333'};">${p}</a>
                    </c:forEach>
                </div>
            </c:if>
        </div>
    </div>
</div>

</body>
</html>
