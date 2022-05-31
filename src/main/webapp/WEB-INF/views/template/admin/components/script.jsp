<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose><c:when test="${param.admintheme =='true'}">
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/jquery/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/jquery-ui/jquery-ui.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.bootstrap =='true'}">
    <script>
        $.widget.bridge('uibutton', $.ui.button)
    </script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/bootstrap/js/bootstrap.bundle.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.dataTable =='true'}">
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-buttons/js/dataTables.buttons.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/jszip/jszip.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/pdfmake/pdfmake.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/pdfmake/vfs_fonts.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-buttons/js/buttons.html5.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-buttons/js/buttons.print.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-buttons/js/buttons.colVis.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.Sparkline =='true'}">
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/sparklines/sparkline.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.JQVMap =='true'}">
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/jqvmap/jquery.vmap.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/jqvmap/maps/jquery.vmap.usa.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.KnobChart =='true'}">
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/jquery-knob/jquery.knob.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.jsgrid =='true'}">
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/jsgrid/jsgrid.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.daterangePicker =='true'}">
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/moment/moment.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/daterangepicker/daterangepicker.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.Summernote =='true'}">
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/summernote/summernote-bs4.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.Chart =='true'}">
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/chart.js/Chart.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.jstree =='true'}">
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/vakata-jstree/dist/jstree.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.sweetalert2 =='true'}">
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/sweetalert2/sweetalert2.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.admintheme =='true'}">
    <script src="${pageContext.servletContext.contextPath}/plugins-admin/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/dist/js/adminlte.js"></script>
<%--    <script src="${pageContext.servletContext.contextPath}/dist/js/demo.js"></script>--%>
    <script src="${pageContext.servletContext.contextPath}/dist/js/sidemenu.js"></script>
</c:when></c:choose>
<jsp:include page="../../user/message/message.jsp"></jsp:include>


