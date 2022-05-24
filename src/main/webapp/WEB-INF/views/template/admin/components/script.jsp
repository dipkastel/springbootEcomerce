<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
	$.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables -->
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/datatables/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/jszip/jszip.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/pdfmake/pdfmake.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/pdfmake/vfs_fonts.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-buttons/js/buttons.html5.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-buttons/js/buttons.print.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- Sparkline -->
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/jqvmap/jquery.vmap.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/moment/moment.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/summernote/summernote-bs4.min.js"></script>
<!-- Summernote -->

<script src="${pageContext.servletContext.contextPath}/plugins-admin/jsgrid/jsgrid.min.js"></script>
<!-- overlayScrollbars -->
<script
	src="${pageContext.servletContext.contextPath}/plugins-admin/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script
	src="${pageContext.servletContext.contextPath}/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.servletContext.contextPath}/dist/js/demo.js"></script>
<script>
	let path = $(location).attr('pathname');
	let element = $('a[href="'+path+'"]')
	let data = element.parent().parent().parent();
	if (data.attr("class").includes("mt-2")){
		element.addClass('active');
		element.parent().addClass('active');
	}else{
		data.addClass('nav-item menu-is-opening menu-open');
		data.find('a:first').addClass('active');
		element.addClass('active');
	}
</script>
    <jsp:include page="../../user/message/message.jsp"></jsp:include>

