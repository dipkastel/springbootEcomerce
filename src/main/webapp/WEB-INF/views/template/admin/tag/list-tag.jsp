<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
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
    <!-- Preloader -->

    <jsp:include page="../common/loading.jsp"></jsp:include>
    <jsp:include page="../components/nav-bar.jsp"></jsp:include>
    <jsp:include page="../components/side-bar.jsp"></jsp:include>
    <div class="content-wrapper" style="min-height: 1299.69px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1 class="text-center">مدیریت برچسب ها</h1>
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
                                        href="${pageContext.servletContext.contextPath}/admin/tag/new"
                                        class="btn btn-success">افزودن</a>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div id="tagtable"></div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>

            <div class="modal fade" id="modal-delete">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header danger">
                            <h4 class="modal-title">حذف</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div id="modal_delete_bady" class="modal-body">

                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button id="submit_modal_delete" type="button" class="btn btn-danger">confirm delete</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
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
    <jsp:param name="dataTable" value="false" />
    <jsp:param name="Sparkline" value="false" />
    <jsp:param name="JQVMap" value="false" />
    <jsp:param name="KnobChart" value="false" />
    <jsp:param name="jsgrid" value="false" />
    <jsp:param name="daterangePicker" value="false" />
    <jsp:param name="summernote" value="false" />
</jsp:include>
<jsp:include page="js/jsgrid.jsp"></jsp:include>
</body>
</html>
