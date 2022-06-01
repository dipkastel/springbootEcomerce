<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../common/head.jsp">
        <jsp:param name="pageTitle" value="notrika | baseSettings" />
        <jsp:param name="admintheme" value="true" />
        <jsp:param name="jsgrid" value="true" />
    </jsp:include>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<jsp:include page="../common/loading.jsp"></jsp:include>
		<jsp:include page="../components/nav-bar.jsp"></jsp:include>
		<jsp:include page="../components/side-bar.jsp"></jsp:include>
		<div class="content-wrapper" style="min-height: 1299.69px;">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-12">
							<h1 class="text-center">Product Manager</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<!-- /.card -->
							<div class="card">
								<div class="card-header">
										<a
												href="${pageContext.servletContext.contextPath}/admin/product/new"
												class="btn btn-success">Add product</a>
								</div>
								<!-- /.card-header -->
								<div class="card-body">

									<div id="jsGridProducts"></div>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<jsp:include page="../components/footer.jsp"></jsp:include>
		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
	<jsp:include page="../components/script.jsp">
    <jsp:param name="admintheme" value="true" />
    <jsp:param name="bootstrap" value="true" />
    <jsp:param name="jsgrid" value="true" />
</jsp:include>
	<jsp:include page="js/jsgrid.jsp"></jsp:include>


</body>
</html>
