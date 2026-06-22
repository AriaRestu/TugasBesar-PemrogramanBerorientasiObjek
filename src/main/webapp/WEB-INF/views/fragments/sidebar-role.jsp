<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%-- 
    Sidebar fragment — include dengan:
    <jsp:include page="/WEB-INF/views/fragments/sidebar-role.jsp">
        <jsp:param name="active" value="dashboard|approval|f03|notifikasi"/>
    </jsp:include>
--%>
<div class="sidebar">
    <div class="sb-logo">
        <div class="sb-logo-row">
            <div class="sb-logo-icon">
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
