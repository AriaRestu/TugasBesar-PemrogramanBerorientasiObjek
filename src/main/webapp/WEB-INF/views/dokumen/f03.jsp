<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Telkom University Surabaya</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Inter', sans-serif;
}

body {
    background: #f4f6f9;
    display: flex;
    min-height: 100vh;
}

.table-box{
    background:#fff;
    border-radius:16px;
    padding:24px;
    box-shadow:0 3px 10px rgba(0,0,0,.05);
}

.table-header{
    margin-bottom:20px;
}

.table-header h2{
    color:#7f1d1d;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    text-align:left;
    padding:16px;
    border-bottom:2px solid #eee;
}

td{
    padding:16px;
    border-bottom:1px solid #eee;
}

.btn-red{
    background:#c8102e;
    color:#fff;
    border:none;
    padding:10px 18px;
    border-radius:10px;
    cursor:pointer;
}

.btn-red:hover{
    background:#a10d26;
}

/* ===========================
   SIDEBAR
=========================== */
.sidebar {
    position: fixed;
    top: 0;
    left: 0;
    width: 240px;
    height: 100vh;
    background: linear-gradient(180deg, #B20824, #C8102E, #99001A);
    color: white;
    display: flex;
    flex-direction: column;
    z-index: 100;
}

.sb-logo {
    padding: 20px 18px 16px;
    border-bottom: 1px solid rgba(255,255,255,.15);
}

.sb-logo-row {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 4px;
}

.sb-logo-icon {
    width: 36px;
    height: 36px;
    background: white;
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
}

.sb-logo-icon svg {
    width: 22px;
    height: 22px;
}

.sb-logo h1 {
    font-size: 14px;
    font-weight: 600;
    color: white;
    line-height: 1.3;
}

.sb-logo p {
    font-size: 11px;
    color: rgba(255,255,255,.7);
    margin-left: 46px;
}

.sb-section {
    padding: 16px 18px 6px;
    font-size: 10px;
    letter-spacing: 1.5px;
    color: rgba(255,255,255,.5);
    text-transform: uppercase;
}

.menu {
    list-style: none;
    padding: 0 10px;
}

.menu li {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 11px 12px;
    border-radius: 10px;
    cursor: pointer;
    font-size: 13px;
    color: rgba(255,255,255,.85);
    margin-bottom: 2px;
    transition: background .2s;
    position: relative;
}

.menu li:hover {
    background: rgba(255,255,255,.12);
}

.menu li.active {
    background: rgba(255,255,255,.2);
    color: white;
    font-weight: 600;
}

.menu li i {
    font-size: 16px;
    width: 20px;
    text-align: center;
}

.sb-badge {
    margin-left: auto;
    background: rgba(255,255,255,.25);
    font-size: 10px;
    padding: 2px 7px;
    border-radius: 10px;
    color: white;
    font-weight: 600;
}

.sb-bottom {
    margin-top: auto;
    padding: 12px 10px;
    border-top: 1px solid rgba(255,255,255,.12);
}

.sb-bottom .menu {
    padding: 0;
    margin-bottom: 10px;
}

.sb-copyright {
    font-size: 10px;
    color: rgba(255,255,255,.35);
    padding: 4px 12px;
    line-height: 1.5;
}

/* ===========================
   MAIN CONTENT
=========================== */
.content {
    margin-left: 240px;
    flex: 1;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

/* ===========================
   NAVBAR
=========================== */
.navbar {
    background: white;
    padding: 12px 24px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #f0f0f0;
    position: sticky;
    top: 0;
    z-index: 50;
}

.nb-left {
    display: flex;
    align-items: center;
    gap: 14px;
}

.nb-menu-btn {
    font-size: 20px;
    color: #888;
    cursor: pointer;
}

.nb-brand {
    font-size: 15px;
    font-weight: 700;
    color: #C8102E;
}

.nb-sub {
    font-size: 11px;
    color: #999;
}

.nb-right {
    display: flex;
    align-items: center;
    gap: 14px;
}

.notif-btn {
    position: relative;
    width: 36px;
    height: 36px;
    border: 1px solid #eee;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    background: white;
}

.notif-btn i {
    font-size: 17px;
    color: #666;
}

.notif-count {
    position: absolute;
    top: -6px;
    right: -6px;
    width: 18px;
    height: 18px;
    background: #C8102E;
    border-radius: 50%;
    font-size: 10px;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 700;
    border: 2px solid white;
}

.user-area {
    display: flex;
    align-items: center;
    gap: 10px;
    cursor: pointer;
}

.user-avatar {
    width: 34px;
    height: 34px;
    border-radius: 50%;
    background: #f1c0c7;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 12px;
    font-weight: 700;
    color: #7b0013;
}

.user-name {
    font-size: 13px;
    font-weight: 600;
    color: #222;
}

.user-role {
    font-size: 11px;
    color: #999;
}

.user-area i {
    font-size: 13px;
    color: #aaa;
}

/* ===========================
   INNER CONTENT
=========================== */
.inner {
    padding: 20px 24px;
    display: flex;
    flex-direction: column;
    gap: 18px;
    flex: 1;
}

/* ===========================
   HERO
=========================== */
.hero {
    background: white;
    border-radius: 16px;
    padding: 28px 32px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border: 1px solid #f0f0f0;
    overflow: hidden;
}

.hero-text h1 {
    font-size: 26px;
    font-weight: 700;
    color: #1a1a1a;
    margin-bottom: 10px;
}

.hero-text p {
    font-size: 14px;
    color: #666;
    line-height: 1.7;
    max-width: 380px;
}

.hero-illus {
    flex-shrink: 0;
}

/* ===========================
   STAT CARDS
=========================== */
.cards {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 14px;
}

.card {
    background: white;
    border-radius: 16px;
    padding: 20px;
    border: 1px solid #f0f0f0;
    display: flex;
    align-items: center;
    gap: 16px;
}

.card-icon {
    width: 46px;
    height: 46px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    font-size: 22px;
}

.card-icon.red   { background: #ffeaed; color: #C8102E; }
.card-icon.yellow{ background: #fef9e7; color: #d97706; }
.card-icon.green { background: #eaf7f0; color: #16a34a; }
.card-icon.gray  { background: #f4f4f4; color: #6b7280; }


.card-label {
    font-size: 12px;
    color: #888;
    margin-bottom: 4px;
}

.card-num {
    font-size: 32px;
    font-weight: 700;
    color: #1a1a1a;
    line-height: 1;
}

.card-sub {
    font-size: 11px;
    color: #aaa;
    margin-top: 4px;
}

/* ===========================
   TABLE BOX
=========================== */
.table-box {
    background: white;
    border-radius: 16px;
    padding: 22px 24px;
    border: 1px solid #f0f0f0;
}

.table-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 18px;
}

.table-header h2 {
    font-size: 16px;
    font-weight: 700;
    color: #1a1a1a;
}

.lihat-btn {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    font-size: 13px;
    color: #C8102E;
    background: none;
    border: none;
    cursor: pointer;
    font-weight: 600;
}

table {
    width: 100%;
    border-collapse: collapse;
}

thead {
    background: #fafafa;
    border-radius: 8px;
}

th {
    padding: 12px 14px;
    text-align: left;
    font-size: 12px;
    font-weight: 600;
    color: #888;
    border-bottom: 1px solid #f0f0f0;
}

td {
    padding: 16px 14px;
    border-bottom: 1px solid #f5f5f5;
    font-size: 13px;
    color: #333;
}

tr:last-child td {
    border-bottom: none;
}

.td-no {
    color: #aaa;
    font-weight: 500;
}

.badge {
    display: inline-block;
    padding: 5px 14px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
}

.badge.pending { background: #fef9e7; color: #b45309; }
.badge.approve { background: #eaf7f0; color: #15803d; }
.badge.reject  { background: #ffeaed; color: #b91c1c; }

.action-btn {
    background: none;
    border: none;
    cursor: pointer;
    color: #bbb;
    font-size: 18px;
    padding: 4px 6px;
    border-radius: 6px;
    transition: background .2s, color .2s;
}

.action-btn:hover {
    background: #f5f5f5;
    color: #555;
}

/* ===========================
   FOOTER
=========================== */
.footer {
    position: absolute;
    
    bottom: 0;
    text-align: center;
    padding: 20px;
    font-size: 12px;
    color: #aaa;
}
</style>
</head>

<body>

<!-- ===========================
     SIDEBAR
=========================== -->
<div class="sidebar">

    <div class="sb-logo">
        <div class="sb-logo-row">
            <div class="sb-logo-icon">
                <!-- Telkom-style icon -->
                <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M3 9.5L12 3L21 9.5V20C21 20.55 20.55 21 20 21H15V15H9V21H4C3.45 21 3 20.55 3 20V9.5Z" fill="#C8102E"/>
                    <rect x="9" y="15" width="6" height="6" fill="#99001A"/>
                </svg>
            </div>
            <h1>Telkom University Surabaya</h1>
        </div>
    </div>

    <div class="sb-section">Menu</div>

    <ul class="menu">

        <a href="${pageContext.request.contextPath}/dashboard"
           class="menu-anchor">
        
            <li>
                <i class="fa-solid fa-house"></i>
                Dashboard
            </li>
        
        </a>

        <a href="${pageContext.request.contextPath}/approval/ssc"
           class="menu-anchor">
            
            <li>
                <i class="fa-solid fa-calendar-plus"></i>
                Verifikasi Pengajuan
            </li>
        
        </a>

        <a href="${pageContext.request.contextPath}/f03"
           class="menu-anchor">
        
            <li class="active">
                <i class="fa-solid fa-file-lines"></i>
                Generate F03
            </li>
        
        </a>
        
    </ul>

    <div class="sb-bottom">
        <ul class="menu">
            <li>
                <i class="fa-solid fa-right-from-bracket"></i>
                Logout
            </li>
        </ul>
        <p class="sb-copyright">© 2026 Telkom University Surabaya</p>
    </div>

</div>


<!-- ===========================
     MAIN CONTENT
=========================== -->
<div class="content">

    <!-- NAVBAR -->
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
                <div class="user-avatar">SC</div>
                <div>
                    <div class="user-name">SSC</div>
                    <div class="user-role">SSC</div>
                </div>
                <i class="fa-solid fa-chevron-down"></i>
            </div>
        </div>
    </div>

<div class="inner">

    <div class="table-box">

        <div class="table-header">

            <h2>Generate Dokumen F03</h2>

        </div>

        <table>

            <thead>

            <tr>
                <th>No Tiket</th>
                <th>Kegiatan</th>
                <th>Peminjam</th>
                <th>Ruangan</th>
                <th>Status</th>
                <th>Generate</th>
            </tr>

            </thead>

            <tbody>

            <tr>

                <td>TKT-004</td>

                <td>Peminjam Demo</td>

                <td>Festival Mahasiswa</td>

                <td>

                    <span class="badge approve">
                        DISETUJUI LOGAM TUS
                    </span>

                </td>

                <td>

                    <button class="btn-red">
                        Generate F03
                    </button>

                </td>

            </tr>

            <tr>

                <td>TKT-005</td>

                <td>Peminjam Demo</td>

                <td>Seminar Nasional</td>

                <td>

                    <span class="badge approve">
                        DISETUJUI LOGAM TUS
                    </span>

                </td>

                <td>

                    <button class="btn-red">
                        Generate F03
                    </button>

                </td>

            </tr>

            </tbody>

        </table>

    </div>

</div>

</div><!-- /content -->

</body>
</html>
