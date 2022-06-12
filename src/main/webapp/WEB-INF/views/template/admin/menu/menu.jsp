<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../common/head.jsp">
        <jsp:param name="pageTitle" value="notrika | baseSettings"/>
        <jsp:param name="admintheme" value="true"/>
        <jsp:param name="jstree" value="true"/>
        <jsp:param name="sweetalert2" value="true"/>
    </jsp:include>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <jsp:include page="../common/loading.jsp"></jsp:include>
    <jsp:include page="../components/nav-bar.jsp">
        <jsp:param name="controlSidebar" value="true"/>
    </jsp:include>
    <jsp:include page="../components/side-bar.jsp"></jsp:include>
    <div class="content-wrapper" style="min-height: 1299.69px;">


        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1 class="text-center">menu Manager</h1>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-6">
                        <div id="jstree-card" class="card card-outline card-primary">
                            <div class="card-header">

                                <button type="button" class="btn btn-tool btn-add-tiggle">
                                    <i class="fas fa-plus"></i>
                                </button>
                                <div class="card-tools">

                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                                <!-- /.card-tools -->

                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div id="jstree"></div>
                            </div>
                            <!-- /.card-body -->

                            <div class="card-footer">

                                <div class="input-group">
                                    <input type="text" placeholder="search"
                                           class="form-control">
                                    <span class="input-group-append">
                                        <button class="btn btn-primary">Search</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">

                        <div id="item-update" class="collapse">
                            <div class="card card-outline card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">update node</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-toggle="collapse"
                                                data-target="#item-update" aria-controls="item-update"><i
                                                class="fas fa-times"></i>
                                        </button>
                                    </div>
                                    <!-- /.card-tools -->
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <input type="text" class="form-control" id="update-id"
                                           maxlength="20" hidden>
                                    <input type="text" class="form-control" id="update-parent-id"
                                           maxlength="20" hidden>
                                    <input type="text" class="form-control" id="update-active"
                                           maxlength="20" hidden>
                                    <input type="text" class="form-control" id="update-periority"
                                           maxlength="20" hidden>
                                    <div class="form-group">
                                        <label for="update-name">Name</label>
                                        <input type="text" class="form-control" id="update-name"
                                               placeholder="Enter name" maxlength="20">
                                        <span id="update-name-error" class="error invalid-feedback"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="update-url">url</label>
                                        <input type="text" class="form-control" id="update-url"
                                               placeholder="Enter url" maxlength="20">
                                        <span id="update-url-error" class="error invalid-feedback"></span>
                                    </div>
                                    <button id="btn_submit_update" type="button" class="btn btn-primary">update
                                    </button>
                                    <button id="btn_submit_delete" type="button" class="btn btn-danger">delete
                                    </button>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>
                        <div id="item-add" class="collapse">
                            <div class="card card-outline card-primary ">
                                <div class="card-header">
                                    <h3 class="card-title">add node</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool btn-add-tiggle"><i
                                                class="fas fa-times"></i>
                                        </button>
                                    </div>
                                    <!-- /.card-tools -->
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <input type="text" class="form-control" id="add-parent-id"
                                           maxlength="20" hidden>
                                    <div class="form-group">
                                        <label for="add-name">Name</label>
                                        <input type="text" class="form-control" id="add-name"
                                               placeholder="Enter name" maxlength="20">
                                        <span id="add-name-error" class="error invalid-feedback"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="add-url">url</label>
                                        <input type="text" class="form-control" id="add-url"
                                               placeholder="Enter url" maxlength="20">
                                        <span id="add-url-error" class="error invalid-feedback"></span>
                                    </div>
                                    <button id="btn_submit_add" type="button" class="btn btn-primary">add
                                    </button>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>
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

    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
</body>
<jsp:include page="../components/script.jsp">
    <jsp:param name="admintheme" value="true"/>
    <jsp:param name="bootstrap" value="true"/>
    <jsp:param name="jstree" value="true"/>
    <jsp:param name="sweetalert2" value="true"/>
</jsp:include>
<jsp:include page="js/script.jsp"/>
</html>
