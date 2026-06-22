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
        <li class="active">
            <i class="fa-solid fa-house"></i>
            Dashboard
        </li>
        <a href="${pageContext.request.contextPath}/approval/logamtus"
           class="menu-anchor">
            
            <li>
                <i class="fa-solid fa-calendar-plus"></i>
                Approval Akhir
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
                <div class="user-avatar">LT</div>
                <div>
                    <div class="user-name">Logam TUS</div>
                    <div class="user-role">Logam TUS</div>
                </div>
                <i class="fa-solid fa-chevron-down"></i>
            </div>
        </div>
    </div>

    <div class="inner">

        <!-- HERO -->
        <div class="hero">
            <div class="hero-text">
                <h1>Halo, Admin Logam TUS! &#x1F44B;</h1>
                <p>
                    Selamat datang di Peminjaman Ruang TEL-U.
                    Kelola peminjaman ruangan kampus
                    dengan mudah dan efisien.
                </p>
            </div>

            <div class="hero-illus">
                <!-- Campus building illustration -->
                <svg width="200" height="150" viewBox="0 0 200 150" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <!-- Sky / clouds -->
                    <ellipse cx="50" cy="20" rx="28" ry="10" fill="#e8eef5"/>
                    <ellipse cx="70" cy="16" rx="20" ry="8" fill="#f0f4f8"/>
                    <ellipse cx="155" cy="18" rx="22" ry="9" fill="#e8eef5"/>
                    <ellipse cx="172" cy="14" rx="16" ry="7" fill="#f0f4f8"/>

                    <!-- Building body -->
                    <rect x="30" y="42" width="140" height="95" rx="4" fill="#f8d7da"/>
                    <!-- Roof line -->
                    <rect x="30" y="42" width="140" height="14" rx="3" fill="#C8102E"/>

                    <!-- Flag pole -->
                    <rect x="97" y="18" width="3" height="26" fill="#C8102E"/>
                    <polygon points="100,18 100,28 114,23" fill="#C8102E"/>

                    <!-- Windows row 1 -->
                    <rect x="42"  y="65" width="22" height="18" rx="3" fill="#b0c8e8"/>
                    <rect x="74"  y="65" width="22" height="18" rx="3" fill="#b0c8e8"/>
                    <rect x="106" y="65" width="22" height="18" rx="3" fill="#b0c8e8"/>
                    <rect x="138" y="65" width="22" height="18" rx="3" fill="#b0c8e8"/>

                    <!-- Windows row 2 -->
                    <rect x="42"  y="92" width="22" height="18" rx="3" fill="#b0c8e8"/>
                    <rect x="74"  y="92" width="22" height="18" rx="3" fill="#b0c8e8"/>
                    <rect x="138" y="92" width="22" height="18" rx="3" fill="#b0c8e8"/>

                    <!-- Main entrance door -->
                    <rect x="82" y="98" width="36" height="39" rx="3" fill="#C8102E" opacity=".75"/>
                    <rect x="86" y="101" width="13" height="22" rx="2" fill="#fff" opacity=".3"/>
                    <rect x="101" y="101" width="13" height="22" rx="2" fill="#fff" opacity=".3"/>

                    <!-- Door arch detail -->
                    <ellipse cx="100" cy="98" rx="18" ry="6" fill="#C8102E" opacity=".6"/>

                    <!-- Columns -->
                    <rect x="14"  y="75" width="14" height="62" rx="3" fill="#ddd"/>
                    <rect x="172" y="75" width="14" height="62" rx="3" fill="#ddd"/>

                    <!-- Ground / grass -->
                    <ellipse cx="28"  cy="135" rx="18" ry="7" fill="#c8e6c9"/>
                    <ellipse cx="172" cy="135" rx="18" ry="7" fill="#c8e6c9"/>

                    <!-- Trees left -->
                    <rect x="5" y="90" width="5" height="46" fill="#8B6914"/>
                    <ellipse cx="7" cy="85" rx="13" ry="16" fill="#4CAF50"/>

                    <!-- Trees right -->
                    <rect x="188" y="90" width="5" height="46" fill="#8B6914"/>
                    <ellipse cx="190" cy="85" rx="13" ry="16" fill="#388E3C"/>

                    <!-- Telkom logo on building -->
                    <rect x="80" y="46" width="38" height="12" rx="2" fill="white" opacity=".9"/>
                    <text x="99" y="55" text-anchor="middle" font-size="7" fill="#C8102E" font-weight="700" font-family="Inter, sans-serif">Telkom</text>
                </svg>
            </div>
        </div>


    </div><!-- /inner -->

</div><!-- /content -->

</body>
</html>
