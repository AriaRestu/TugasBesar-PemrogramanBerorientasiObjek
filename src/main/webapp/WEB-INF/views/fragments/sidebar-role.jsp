<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%-- 
    Sidebar fragment — include dengan:
    <jsp:include page="/WEB-INF/views/fragments/sidebar-role.jsp">
        <jsp:param name="active" value="dashboard|approval|f03|notifikasi"/>
    </jsp:include>
--%>
<style>
@media (max-width: 768px) {
    .sidebar { transform: translateX(-100%); transition: transform .25s ease; }
    .sidebar.open { transform: translateX(0); }
    .sidebar-overlay { display: none; position: fixed; inset: 0; background: rgba(0,0,0,.4); z-index: 99; }
    .sidebar-overlay.open { display: block; }
    .content { margin-left: 0 !important; }
    .hamburger { display: flex !important; }
}
.hamburger {
    display: none;
    align-items: center;
    justify-content: center;
    width: 36px; height: 36px;
    border: 1px solid #eee; border-radius: 10px;
    background: white; cursor: pointer; font-size: 18px; color: #555;
    margin-right: 12px;
}
</style>

<div class="sidebar-overlay" id="sidebarOverlay" onclick="closeSidebar()"></div>

<div class="sidebar" id="appSidebar">
    <div class="sb-logo">
        <div class="sb-logo-row">
            <div class="sb-logo-icon">
                <img src="${pageContext.request.contextPath}/assets/images/pngegg.png" alt="Logo" style="width:28px;height:28px;object-fit:contain;"/>
            </div>
            <h1>Telkom University Surabaya</h1>
        </div>
    </div>

    <div class="sb-section">Menu</div>

    <ul class="menu">
        <%-- Dashboard --%>
        <a href="${pageContext.request.contextPath}/dashboard" class="menu-anchor">
            <li class="${param.active == 'dashboard' ? 'active' : ''}">
                <i class="fa-solid fa-house"></i> Dashboard
            </li>
        </a>

        <%-- Menu per role --%>
        <c:choose>
            <c:when test="${sessionScope.user.role == 'PEMINJAM'}">
                <a href="${pageContext.request.contextPath}/pengajuan" class="menu-anchor">
                    <li class="${param.active == 'pengajuan' ? 'active' : ''}">
                        <i class="fa-solid fa-calendar-plus"></i> Buat Pengajuan
                    </li>
                </a>
                <a href="${pageContext.request.contextPath}/riwayat" class="menu-anchor">
                    <li class="${param.active == 'riwayat' ? 'active' : ''}">
                        <i class="fa-solid fa-clock-rotate-left"></i> Riwayat Pengajuan
                    </li>
                </a>
            </c:when>

            <c:when test="${sessionScope.user.role == 'PEMBINA'}">
                <a href="${pageContext.request.contextPath}/approval/pembina" class="menu-anchor">
                    <li class="${param.active == 'approval' ? 'active' : ''}">
                        <i class="fa-solid fa-calendar-check"></i> Verifikasi Pengajuan
                    </li>
                </a>
            </c:when>

            <c:when test="${sessionScope.user.role == 'SSC'}">
                <a href="${pageContext.request.contextPath}/approval/ssc" class="menu-anchor">
                    <li class="${param.active == 'approval' ? 'active' : ''}">
                        <i class="fa-solid fa-calendar-check"></i> Verifikasi Pengajuan
                    </li>
                </a>
                <a href="${pageContext.request.contextPath}/f03" class="menu-anchor">
                    <li class="${param.active == 'f03' ? 'active' : ''}">
                        <i class="fa-solid fa-file-pdf"></i> Generate F03
                    </li>
                </a>
            </c:when>

            <c:when test="${sessionScope.user.role == 'LOGAM_TUS'}">
                <a href="${pageContext.request.contextPath}/approval/logamtus" class="menu-anchor">
                    <li class="${param.active == 'approval' ? 'active' : ''}">
                        <i class="fa-solid fa-stamp"></i> Approval Akhir
                    </li>
                </a>
            </c:when>
        </c:choose>

        <%-- Notifikasi (semua role) --%>
        <a href="${pageContext.request.contextPath}/notifikasi" class="menu-anchor">
            <li class="${param.active == 'notifikasi' ? 'active' : ''}">
                <i class="fa-solid fa-bell"></i> Notifikasi
                <c:if test="${unreadCount > 0}">
                    <span class="sb-badge">${unreadCount}</span>
                </c:if>
            </li>
        </a>
    </ul>

    <div class="sb-bottom">
        <ul class="menu">
            <a href="${pageContext.request.contextPath}/logout" class="menu-anchor">
                <li><i class="fa-solid fa-right-from-bracket"></i> Logout</li>
            </a>
        </ul>
        <p class="sb-copyright">© 2026 Telkom University Surabaya</p>
    </div>
</div>

<script>
function openSidebar() {
    document.getElementById('appSidebar').classList.add('open');
    document.getElementById('sidebarOverlay').classList.add('open');
}
function closeSidebar() {
    document.getElementById('appSidebar').classList.remove('open');
    document.getElementById('sidebarOverlay').classList.remove('open');
}
// Inject hamburger button ke dalam .navbar setelah halaman load
document.addEventListener('DOMContentLoaded', function() {
    var navbar = document.querySelector('.navbar');
    if (!navbar) return;
    var btn = document.createElement('button');
    btn.className = 'hamburger';
    btn.innerHTML = '<i class="fa-solid fa-bars"></i>';
    btn.onclick = openSidebar;
    navbar.insertBefore(btn, navbar.firstChild);
});
</script>
