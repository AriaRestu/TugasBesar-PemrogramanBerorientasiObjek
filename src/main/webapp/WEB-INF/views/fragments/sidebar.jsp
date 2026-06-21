<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<aside class="sidebar">

    <ul>

        <li>
            <a href="${ctx}/home">
                Dashboard
            </a>
        </li>

        <li>
            <a href="${ctx}/ruangan">
                Daftar Ruangan
            </a>
        </li>

        <li>
            <a href="${ctx}/logistik">
                Daftar Logistik
            </a>
        </li>

        <li>
            <a href="${ctx}/pengajuan">
                Pengajuan
            </a>
        </li>

        <li>
            <a href="${ctx}/riwayat">
                Riwayat Pengajuan
            </a>
        </li>

        <li>
            <a href="${ctx}/notifikasi">
                Notifikasi
            </a>
        </li>

        <li>
            <a href="${ctx}/logout">
                Logout
            </a>
        </li>

    </ul>

</aside>