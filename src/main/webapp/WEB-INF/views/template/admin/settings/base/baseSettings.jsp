<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../../common/head.jsp">
    <jsp:param name="pageTitle" value="notrika | baseSettings" />
    <jsp:param name="admintheme" value="true" />
    <jsp:param name="dataTable" value="false" />
    <jsp:param name="icheck" value="false" />
    <jsp:param name="JQVMap" value="false" />
    <jsp:param name="jsgrid" value="false" />
    <jsp:param name="DaterangePicker" value="false" />
    <jsp:param name="summernote" value="false" />
</jsp:include>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <jsp:include page="../../common/loading.jsp"></jsp:include>
    <jsp:include page="../../components/nav-bar.jsp"></jsp:include>
    <jsp:include page="../../components/side-bar.jsp"></jsp:include>
    <div class="content-wrapper" style="min-height: 1299.69px;">


    </div>
    <jsp:include page="../../components/footer.jsp"></jsp:include>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<jsp:include page="../../components/script.jsp"></jsp:include>
</body>
</html>
