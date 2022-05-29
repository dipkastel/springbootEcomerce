<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${param.pageTitle}</title>
<c:choose><c:when test="${param.admintheme =='true'}">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins-admin/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
</c:when></c:choose>
<c:choose><c:when test="${param.dataTable =='true'}">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins-admin/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins-admin/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins-admin/datatables-buttons/css/buttons.bootstrap4.min.css">
</c:when></c:choose>
<c:choose><c:when test="${param.icheck =='true'}">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins-admin/icheck-bootstrap/icheck-bootstrap.min.css">
</c:when></c:choose>
<c:choose><c:when test="${param.JQVMap =='true'}">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins-admin/jqvmap/jqvmap.min.css">
</c:when></c:choose>
<c:choose><c:when test="${param.jsgrid =='true'}">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins-admin/jsgrid/jsgrid.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins-admin/jsgrid/jsgrid-theme.min.css">
</c:when></c:choose>
<c:choose><c:when test="${param.daterangePicker =='true'}">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins-admin/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins-admin/daterangepicker/daterangepicker.css">
</c:when></c:choose>
<c:choose><c:when test="${param.summernote =='true'}">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins-admin/summernote/summernote-bs4.min.css">
    <link rel="shortcut icon" type="image/png" href="${pageContext.servletContext.contextPath}/img/favicon.png">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins-admin/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
</c:when></c:choose>
<c:choose><c:when test="${param.admintheme =='true'}">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins-admin/overlayScrollbars/css/OverlayScrollbars.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/dist/css/adminlte.min.css">
</c:when></c:choose>
