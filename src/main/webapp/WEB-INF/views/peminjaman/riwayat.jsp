<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Riwayat - TEL-U</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Inter',sans-serif;
}

body{
    background:#f4f6f9;
    display:flex;
    min-height:100vh;
}


/* ===========================
   SIDEBAR
=========================== */

.sidebar{
    position:fixed;
    top:0;
    left:0;
    width:240px;
    height:100vh;
    background:linear-gradient(180deg,#B20824,#C8102E,#99001A);
    color:white;
    display:flex;
    flex-direction:column;
    z-index:100;
}


.sb-logo{
    padding:20px 18px 16px;
    border-bottom:1px solid rgba(255,255,255,.15);
}


.sb-logo-row{
    display:flex;
    align-items:center;
    gap:10px;
    margin-bottom:4px;
}


.sb-logo-icon{
    width:36px;
    height:36px;
    background:white;
    border-radius:8px;
    display:flex;
    align-items:center;
    justify-content:center;
    flex-shrink:0;
}


.sb-logo h1{
    font-size:14px;
    font-weight:600;
    color:white;
    line-height:1.3;
}


.sb-logo p{
    font-size:11px;
    color:rgba(255,255,255,.7);
    margin-left:46px;
}


.sb-section{
    padding:16px 18px 6px;
    font-size:10px;
    letter-spacing:1.5px;
    color:rgba(255,255,255,.5);
    text-transform:uppercase;
}


.menu{
    list-style:none;
    padding:0 10px;
}


.menu li{
    display:flex;
    align-items:center;
    gap:12px;
    padding:11px 12px;
    border-radius:10px;
    cursor:pointer;
    font-size:13px;
    color:rgba(255,255,255,.85);
    margin-bottom:2px;
    transition:background .2s;
}


.menu li:hover{
    background:rgba(255,255,255,.12);
}


.menu li.active{
    background:rgba(255,255,255,.2);
    color:white;
    font-weight:600;
}


.menu li i{
    font-size:16px;
    width:20px;
    text-align:center;
}


.sb-badge{
    margin-left:auto;
    background:rgba(255,255,255,.25);
    font-size:10px;
    padding:2px 7px;
    border-radius:10px;
    color:white;
    font-weight:600;
}


.sb-bottom{
    margin-top:auto;
    padding:12px 10px;
    border-top:1px solid rgba(255,255,255,.12);
}


.sb-bottom .menu{
    padding:0;
    margin-bottom:10px;
}


.sb-copyright{
    font-size:10px;
    color:rgba(255,255,255,.35);
    padding:4px 12px;
    line-height:1.5;
}

.menu{
    list-style:none;
    padding:0 10px;
}

.menu li{
    display:flex;
    align-items:center;

    padding:11px 12px;

    border-radius:10px;

    margin-bottom:2px;

    transition:.2s;
}


.menu li:hover{
    background:rgba(255,255,255,.12);
}


.menu li.active{
    background:rgba(255,255,255,.2);
}


.menu li a{

    width:100%;

    display:flex;
    align-items:center;

    gap:12px;

    color:rgba(255,255,255,.85);

    text-decoration:none;

}


.menu li a i{
    width:20px;
    text-align:center;
    font-size:16px;
}


.sb-badge{

    margin-left:auto;

    background:rgba(255,255,255,.25);

    font-size:10px;

    padding:2px 7px;

    border-radius:10px;

    color:white;

    font-weight:600;

}


/* ===========================
   CONTENT
=========================== */

.content{
    margin-left:240px;
    flex:1;
    display:flex;
    flex-direction:column;
    min-height:100vh;
}



/* ===========================
   NAVBAR
=========================== */

.navbar{
    background:white;
    padding:12px 24px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    border-bottom:1px solid #f0f0f0;
    position:sticky;
    top:0;
    z-index:50;
}


.nb-left{
    display:flex;
    align-items:center;
    gap:14px;
}


.nb-menu-btn{
    font-size:20px;
    color:#888;
    cursor:pointer;
}


.nb-brand{
    font-size:15px;
    font-weight:700;
    color:#C8102E;
}


.nb-sub{
    font-size:11px;
    color:#999;
}


.nb-right{
    display:flex;
    align-items:center;
    gap:14px;
}


.user-area{
    display:flex;
    align-items:center;
    gap:10px;
    cursor:pointer;
}


.user-avatar{
    width:34px;
    height:34px;
    border-radius:50%;
    background:#f1c0c7;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:12px;
    font-weight:700;
    color:#7b0013;
}


.user-name{
    font-size:13px;
    font-weight:600;
    color:#222;
}


.user-role{
    font-size:11px;
    color:#999;
}


.user-area i{
    font-size:13px;
    color:#aaa;
}



/* ===========================
   INNER
=========================== */

.inner{
    padding:20px 24px;
    display:flex;
    flex-direction:column;
    gap:18px;
    flex:1;
}


.page-hdr{
    display:flex;
    justify-content:space-between;
    align-items:flex-end;
}


.page-title{
    font-size:22px;
    font-weight:700;
    color:#1a1a1a;
}


.page-sub{
    font-size:13px;
    color:#888;
}


.btn-primary{
    display:inline-flex;
    align-items:center;
    gap:8px;
    background:#C8102E;
    color:white;
    border:none;
    border-radius:10px;
    padding:12px 22px;
    font-size:14px;
    font-weight:600;
    cursor:pointer;
    text-decoration:none;
}


.btn-primary:hover{
    background:#A5001F;
}


.filter-bar{
    display:flex;
    gap:12px;
    flex-wrap:wrap;
}


.filter-bar select,
.filter-bar input{
    padding:10px 14px;
    border:1px solid #e5e7eb;
    border-radius:10px;
    background:white;
    font-size:13px;
}



/* ===========================
   TABLE
=========================== */

.table-box{
    background:white;
    border-radius:16px;
    padding:22px 24px;
    border:1px solid #f0f0f0;
}


table{
    width:100%;
    border-collapse:collapse;
}


thead{
    background:#fafafa;
}


th{
    padding:12px 14px;
    text-align:left;
    font-size:12px;
    font-weight:600;
    color:#888;
    border-bottom:1px solid #f0f0f0;
}


td{
    padding:16px 14px;
    border-bottom:1px solid #f5f5f5;
    font-size:13px;
    color:#333;
}


.td-no{
    color:#aaa;
}


.badge{
    display:inline-block;
    padding:5px 14px;
    border-radius:20px;
    font-size:12px;
    font-weight:600;
}


.badge.pending{
    background:#fef9e7;
    color:#b45309;
}


.badge.approve{
    background:#eaf7f0;
    color:#15803d;
}


.badge.reject{
    background:#ffeaed;
    color:#b91c1c;
}


.action-btn{
    background:none;
    border:none;
    cursor:pointer;
    color:#bbb;
    font-size:18px;
}


.action-btn:hover{
    color:#555;
}



/* ===========================
   FOOTER
=========================== */

.footer{
    text-align:center;
    padding:20px;
    font-size:12px;
    color:#aaa;
}
</style>
</head>
<body>

<div class="sidebar">

    <div class="sb-logo">

        <div class="sb-logo-row">

            <div class="sb-logo-icon">

                <img src="${ctx}/assets/images/pngegg.png"
                     style="width:38px;height:38px;object-fit:contain;">

            </div>

            <h1>
                Telkom University
                <br>
                Surabaya
            </h1>

        </div>

    </div>



    <div class="sb-section">
        Menu
    </div>

    <ul class="menu">

        <!-- Dashboard -->
        <li>
            <a href="${pageContext.request.contextPath}/dashboard"
            class="menu-anchor">

                <i class="fa-solid fa-house"></i>
                Dashboard

            </a>
        </li>


        <!-- Peminjaman -->
        <li>
            <a href="${pageContext.request.contextPath}/peminjaman"
            class="menu-anchor">

                <i class="fa-solid fa-calendar-plus"></i>
                Peminjaman

            </a>
        </li>


        <!-- Riwayat -->
        <li>
            <a href="${pageContext.request.contextPath}/riwayat"
            class="menu-anchor active">

                <i class="fa-solid fa-file-lines"></i>

                Riwayat

                <span class="sb-badge">
                    4
                </span>

            </a>
        </li>



    </ul>


    <div class="sb-bottom">

        <ul class="menu">

            <li>

                <i class="fa-solid fa-right-from-bracket"></i>

                Logout

            </li>

        </ul>


        <p class="sb-copyright">

            © 2026 Telkom University Surabaya

        </p>

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
                <div>
                    <div class="user-name">Username</div>
                    <div class="user-role">Peminjam</div>
                </div>
                <i class="fa-solid fa-chevron-down"></i>
            </div>
        </div>
    </div>

    <div class="inner">
        <div class="page-hdr">
            <div>
                <div class="page-title">Riwayat Peminjaman</div>
                <div class="page-sub">Semua pengajuan peminjaman ruangan kamu</div>
            </div>
        </div>

        <div class="filter-bar">
            <select>
                <option>Semua Status</option>
                <option>Pending</option>
                <option>Disetujui</option>
                <option>Ditolak</option>
            </select>
            <input type="month" value="2026-06"/>
            <input type="text" placeholder="&#128269; Cari ruangan atau kegiatan..."/>
        </div>

        <div class="table-box">
            <table>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Ruangan</th>
                        <th>Kegiatan</th>
                        <th>Tanggal Pengajuan</th>
                        <th>Tanggal Penggunaan</th>
                        <th>Jam</th>
                        <th>Status</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="td-no">1</td>
                        <td>Lab Komputer 301</td>
                        <td>Praktikum PBO</td>
                        <td>20 Juni 2026</td>
                        <td>22 Juni 2026</td>
                        <td>08:00 - 10:00</td>
                        <td><span class="badge pending">Pending</span></td>
                        <td><button class="action-btn"><i class="fa-solid fa-ellipsis-vertical"></i></button></td>
                    </tr>
                    <tr>
                        <td class="td-no">2</td>
                        <td>Aula Utama</td>
                        <td>Seminar Teknologi</td>
                        <td>18 Juni 2026</td>
                        <td>21 Juni 2026</td>
                        <td>09:00 - 12:00</td>
                        <td><span class="badge approve">Disetujui</span></td>
                        <td><button class="action-btn"><i class="fa-solid fa-ellipsis-vertical"></i></button></td>
                    </tr>
                    <tr>
                        <td class="td-no">3</td>
                        <td>Ruang Rapat A</td>
                        <td>Rapat HMIF</td>
                        <td>17 Juni 2026</td>
                        <td>19 Juni 2026</td>
                        <td>13:00 - 15:00</td>
                        <td><span class="badge reject">Ditolak</span></td>
                        <td><button class="action-btn"><i class="fa-solid fa-ellipsis-vertical"></i></button></td>
                    </tr>
                    <tr>
                        <td class="td-no">4</td>
                        <td>Lab Jaringan</td>
                        <td>Workshop Cisco</td>
                        <td>12 Juni 2026</td>
                        <td>14 Juni 2026</td>
                        <td>10:00 - 13:00</td>
                        <td><span class="badge approve">Disetujui</span></td>
                        <td><button class="action-btn"><i class="fa-solid fa-ellipsis-vertical"></i></button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="footer">Peminjaman Ruang TEL-U &copy; 2026 &mdash; Telkom University Surabaya</div>
</div>

</body>
</html>
