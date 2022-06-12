<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../../common/head.jsp">
        <jsp:param name="pageTitle" value="notrika | baseSettings" />
        <jsp:param name="admintheme" value="true" />
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
</body>
<jsp:include page="../../components/script.jsp">
    <jsp:param name="admintheme" value="true"/>
    <jsp:param name="bootstrap" value="true"/>
    <jsp:param name="jstree" value="true"/>
    <jsp:param name="sweetalert2" value="true"/>
</jsp:include>
</html>
