<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../common/head.jsp">
        <jsp:param name="pageTitle" value="notrika | widgets"/>
        <jsp:param name="admintheme" value="true"/>
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
                        <h1 class="text-center">widget Manager</h1>
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
                        <div class="card card-outline card-primary">
                            <div class="card-header">
                                <h3 class="card-title">super category</h3>

                                <div class="card-tools">

                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th style="width: 10px">#</th>
                                        <th>name</th>
                                        <th style="width: 60px">image</th>
                                        <th style="width: 180px">actions</th>
                                    </tr>
                                    </thead>
                                    <tbody id="super_cat_tbody">

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer">
                                <button type="button" class="btn bg-gradient-primary btn-sm" id="btn_open_add_modal">add
                                    item
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <section class="add">
            <div class="modal fade" id="modal-add-wedgit">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Modal Add</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">

                                <form method="POST" enctype="multipart/form-data" id="fileUploadForm"
                                      action="/api/widget/add">
                                    <input type="text" class="form-control" id="addType" placeholder="" name="type"
                                           hidden>
                                    <div class="form-group">
                                        <label for="addName">Name</label>
                                        <input type="text" class="form-control" id="addName" placeholder="name"
                                               name="name">
                                    </div>
                                    <label for="InputFile">Image</label>
                                    <div class="input-group">
                                        <div class="custom-file">
                                            <input type="file" accept="image/jpeg,image/png" class="custom-file-input"
                                                   id="InputFile" name="file">
                                            <label class="custom-file-label" for="InputFile">Choose
                                                file</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="InputUrl">url</label>
                                        <input type="text" class="form-control" id="InputUrl" placeholder="http://..."
                                               name="url">
                                    </div>
                                    <div id="img-successful" style="color: green;"></div>
                                    <div id="img-error" style="color: red;"></div>
                                </form>
                            </div>

                        </div>
                        <div class="modal-footer justify-content-between">
                            <button id="btn_add_widget" type="button" class="btn btn-primary">add</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </section>
        <section class="update">
            <div class="modal fade" id="modal-update-wedgit">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Modal update</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">

                                <form method="POST" enctype="multipart/form-data" id="FormUpdateSuperCat"
                                      action="/api/widget/update">
                                    <p>برای آپدیت حتما تصویر را دوباره وارد کنید</p>
                                    <input type="text" class="form-control" id="updateType" placeholder="" name="type"
                                           hidden>
                                    <input type="text" class="form-control" id="updateId" placeholder="" name="id"
                                           hidden>
                                    <div class="form-group">
                                        <label for="updateName">Name</label>
                                        <input type="text" class="form-control" id="updateName" placeholder="name"
                                               name="name">
                                    </div>
                                    <label for="updateInputFile">Image</label>
                                    <div class="input-group">
                                        <div class="custom-file">
                                            <input type="file" accept="image/jpeg,image/png" class="custom-file-input"
                                                   id="updateInputFile" name="file">
                                            <label class="custom-file-label" for="updateInputFile">Choose
                                                file</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="updateInputUrl">url</label>
                                        <input type="text" class="form-control" id="updateInputUrl"
                                               placeholder="http://..."
                                               name="url">
                                    </div>
                                </form>
                            </div>

                        </div>
                        <div class="modal-footer justify-content-between">
                            <button id="btn_update_widget" type="button" class="btn btn-primary">update</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
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
<jsp:include page="../components/script.jsp">
    <jsp:param name="admintheme" value="true"/>
    <jsp:param name="bootstrap" value="true"/>
</jsp:include>
<jsp:include page="js/script.jsp"/>
</body>
</html>
