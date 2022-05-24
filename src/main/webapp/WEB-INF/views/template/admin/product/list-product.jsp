<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../components/head.jsp"></jsp:include>
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
<%--									<div id="example1_wrapper"--%>
<%--										class="dataTables_wrapper dt-bootstrap4">--%>
<%--										<div class="row">--%>

<%--											<div class="col-sm-12">--%>
<%--												<table id="example1"--%>
<%--													class="table table-bordered table-striped dataTable dtr-inline"--%>
<%--													role="grid" aria-describedby="example1_info">--%>
<%--													<thead>--%>
<%--														<tr role="row">--%>
<%--															<th class="sorting text-center" tabindex="0" aria-controls="example1"--%>
<%--																rowspan="1" colspan="1">Id</th>--%>
<%--															<th class="sorting text-center" tabindex="0" aria-controls="example1"--%>
<%--																rowspan="1" colspan="1">Name</th>--%>
<%--															<th class="sorting text-center" tabindex="0" aria-controls="example1"--%>
<%--																rowspan="1" colspan="1">Price</th>--%>
<%--															<th class="sorting text-center" tabindex="0" aria-controls="example1"--%>
<%--																rowspan="1" colspan="1">Stock quantity</th>--%>
<%--															<th class="sorting text-center" tabindex="0" aria-controls="example1"--%>
<%--																rowspan="1" colspan="1">Date update</th>--%>
<%--															<th class="sorting text-center" tabindex="0" aria-controls="example1"--%>
<%--																rowspan="1" colspan="1">Brand</th>--%>
<%--															<th class="sorting text-center" tabindex="0" aria-controls="example1"--%>
<%--																rowspan="1" colspan="1">Category</th>--%>
<%--															<th class="sorting text-center" tabindex="0" aria-controls="example1"--%>
<%--																rowspan="1" colspan="1">Type</th>--%>
<%--															<th class="sorting text-center" tabindex="0" aria-controls="example1"--%>
<%--																rowspan="1" colspan="1">Action</th>--%>
<%--														</tr>--%>
<%--													</thead>--%>
<%--													<tbody>--%>
<%--														<c:forEach var="product" items="${list }">--%>
<%--															<tr>--%>
<%--																<td>${product.id }</td>--%>
<%--																<td>--%>
<%--																	<a href="${pageContext.request.contextPath}/admin/product/detail?id=${product.id}">${product.name }</a>--%>
<%--																</td>--%>
<%--																<td class="text-center">--%>
<%--&lt;%&ndash;																		<a&ndash;%&gt;--%>
<%--&lt;%&ndash;																				class="my-btn-state rounded-circle btn btn-sm btn-success">&ndash;%&gt;--%>
<%--&lt;%&ndash;																			<i class="fas fa-check"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;																		</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;																		<a&ndash;%&gt;--%>
<%--&lt;%&ndash;																				class="my-btn-state rounded-circle btn btn-sm btn-danger">&ndash;%&gt;--%>
<%--&lt;%&ndash;																			<i class="fas fa-minus"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;																		</a>&ndash;%&gt;--%>
<%--																</td>--%>
<%--																<td>${product.price }</td>--%>
<%--																<td>${product.stockQuantity }</td>--%>
<%--																<td><fmt:formatDate value='${product.updated }'  type='date' pattern='dd/MM/yyyy'/></td>--%>
<%--&lt;%&ndash;																<td>${product.brand.name }</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;																<td>${product.category.name }</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;																<td>${product.type.name }</td>&ndash;%&gt;--%>
<%--																<td class="project-actions text-center">--%>
<%--&lt;%&ndash;																	<a&ndash;%&gt;--%>
<%--&lt;%&ndash;																	class="btn btn-primary btn-sm"&ndash;%&gt;--%>
<%--&lt;%&ndash;																	href="${pageContext.request.contextPath}/admin/product/detail?id=${product.id}"><i&ndash;%&gt;--%>
<%--&lt;%&ndash;																		class="fas fa-folder"></i>View</a> &ndash;%&gt;--%>
<%--																	<a--%>
<%--																	class="btn btn-info btn-sm"--%>
<%--																	href="${pageContext.request.contextPath}/admin/product/edit?id=${product.id}"><i--%>
<%--																		class="fas fa-pencil-alt"></i>Edit</a></td>--%>
<%--															</tr>--%>
<%--														</c:forEach>--%>
<%--													</tbody>--%>
<%--													<tfoot>--%>
<%--													</tfoot>--%>
<%--												</table>--%>
<%--											</div>--%>
<%--										</div>--%>
<%--									</div>--%>
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
	<jsp:include page="../components/script.jsp"></jsp:include>
	<jsp:include page="js/jsgrid.jsp"></jsp:include>


</body>
</html>
