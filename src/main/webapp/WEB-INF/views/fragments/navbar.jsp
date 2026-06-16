<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<nav class="app-nav">

    <a href="${ctx}/home">
        Dashboard
    </a>

    <a href="${ctx}/ruangan">
        Ruangan
    </a>

    <a href="${ctx}/pengajuan">
        Pengajuan
    </a>

    <a href="${ctx}/notifikasi">
        Notifikasi
    </a>

</nav>