<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page import="java.util.List"%>
<%@ page import="com.notrika.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../common/head.jsp">
        <jsp:param name="pageTitle" value="notrika | baseSettings" />
        <jsp:param name="admintheme" value="true" />
        <jsp:param name="dataTable" value="false" />
        <jsp:param name="icheck" value="false" />
        <jsp:param name="JQVMap" value="false" />
        <jsp:param name="jsgrid" value="false" />
        <jsp:param name="daterangePicker" value="false" />
        <jsp:param name="summernote" value="false" />
    </jsp:include>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<jsp:include page="../common/loading.jsp"></jsp:include>
		<jsp:include page="../components/nav-bar.jsp"></jsp:include>
		<jsp:include page="../components/side-bar.jsp"></jsp:include>
		<div class="content-wrapper" style="min-height: 59.3646px;">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0 text-dark">User Manager : Detail User</h1>
						</div>
					</div>
				</div>
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<section class="content">
						<div class="container-fluid">
							<!-- SHOW ERRORS FORM -->
							<!-- END SHOW ERRORS FORM -->
							<div class="card card-info card-outline">

								<form id="editUser"
									action="${pageContext.servletContext.contextPath}/admin/user/saveUpdate"
									method="post">

									<input type="hidden" id="id" name="id" value="${userDetail.id}">

									<div class="card-body">
										<div class="form-group row" style="">
											<label for="name"
												class="col-sm-2 col-form-label text-sm-right required">UserName</label>
											<div class="col-xs-12 col-sm-8">
												<input type="text" id="username" name="username"
													value="${userDetail.phoneNumber}"
													class="form-control form-control-sm" disabled>
											</div>
										</div>
										<div class="form-group row" style="">
											<label for="email"
												class="col-sm-2 col-form-label text-sm-right required">Email</label>
											<div class="col-xs-12 col-sm-8">
												<input type="text" id="email" name="email"
													value="${userDetail.email}"
													class="form-control form-control-sm" disabled>
											</div>
										</div>
										<div class="form-group row">
											<label for="status"
												class="col-sm-2 col-form-label text-sm-right">Status</label>
											<div class="col-xs-12 col-sm-8">
												<select id="enabled" name="enabled"
													class="custom-select custom-select-sm">
															<option >${userDetail.enabled ? "Active" :"InActive"}</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label for="role"
												class="col-sm-2 col-form-label text-sm-right">Role</label>
											<div class="col-xs-12 col-sm-8">
												<select id="role" name="role"
													class="custom-select custom-select-sm">
															<option >${fn:substring(userDetail.role, 5, fn:length(userDetail.role))}</option>
												</select>
											</div>
										</div>
									</div>
									<div class="card-footer">
										<div class="col-12 col-sm-8 offset-sm-2">
											<a class="btn btn-sm btn-danger mr-1"
												href="${pageContext.servletContext.contextPath}/admin/user">Comback
												Home</a>
										</div>
									</div>
								</form>
							</div>
						</div>
					</section>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<jsp:include page="../components/footer.jsp"></jsp:include>
	</div>
	<!-- ./wrapper -->
	<jsp:include page="../components/script.jsp">
    <jsp:param name="admintheme" value="true" />
    <jsp:param name="bootstrap" value="true" />
    <jsp:param name="dataTable" value="false" />
    <jsp:param name="Sparkline" value="false" />
    <jsp:param name="JQVMap" value="false" />
    <jsp:param name="KnobChart" value="false" />
    <jsp:param name="jsgrid" value="false" />
    <jsp:param name="daterangePicker" value="false" />
    <jsp:param name="summernote" value="false" />
</jsp:include>
</body>
</html>
