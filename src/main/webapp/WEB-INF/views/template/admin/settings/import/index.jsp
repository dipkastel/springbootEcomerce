<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../components/head.jsp"></jsp:include>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <jsp:include page="../../common/loading.jsp"></jsp:include>
    <jsp:include page="../../components/nav-bar.jsp"></jsp:include>
    <jsp:include page="../../components/side-bar.jsp"></jsp:include>
    <div class="content-wrapper" style="min-height: 1299.69px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1 class="text-center">بارگیری اطلاعات از وبسایت قبلی</h1>
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
                        <div class="card collapsed-card">

                            <div class="card-header">
                                <h3 class="card-title">مشخصات api</h3>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <button type="button" class="btn btn-tool" data-card-widget="remove">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">

                                <form id="frmSetConnection"
                                      action="${pageContext.servletContext.contextPath}/admin/import/SetConnection"
                                      method="post">

                                    <div class="row">
                                        <div id="col1" class="col-md-6">
                                            <div class="form-group">
                                                <label for="siteUrl">site Url</label>
                                                <input type="text"
                                                       class="form-control" id="siteUrl" name="siteUrl"
                                                       value="${apiSiteUrl.svalue}"
                                                       placeholder="http://xxx.com" maxlength="50"> <span
                                                    id="siteUrl-error" class="error invalid-feedback"></span>
                                            </div>
                                            <div class="form-group">
                                                <label for="consumerKey">consumer Key</label>
                                                <input type="text"
                                                       class="form-control" id="consumerKey" name="consumerKey"
                                                       value="${apiConsumerKey.svalue}"
                                                       placeholder="ck_***" maxlength="50"> <span
                                                    id="consumerKey-error" class="error invalid-feedback"></span>
                                            </div>
                                            <div class="form-group">
                                                <label for="consumerPassword">consumer password</label>
                                                <input type="text"
                                                       class="form-control" id="consumerPassword"
                                                       name="consumerPassword" value="${apiConsumerPassword.svalue}"
                                                       placeholder="ck_***" maxlength="50"> <span
                                                    id="consumerPassword-error" class="error invalid-feedback"></span>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                            </div>
                            <div class="card-footer">
                                <button id="btnSetConnection" type="submit"
                                        class="btn btn-primary">ثبت
                                </button>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
                <h5 class="mb-2">ورود اطلاعات</h5>

                <div class="row">
                    <div class="col-md-3" >
                        <div id="test_connection" class="card card-outline card-primary">
                            <div class="card-header">
                                <h3 class="card-title">test connection</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div id="test_connection_body" class="card-body">
                                <p class="text-right">
                                    درستی اتصال به وبسایت مرجع را ابتدا باید چک کنید
                                </p>

                                <button id="testConnection" type="submit"
                                        class="btn btn-primary">test
                                </button>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <div id="div_import_product" class="col-md-3" hidden>
                        <div class="card card-outline card-primary">
                            <div class="card-header">
                                <h3 class="card-title">import products</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                The body of the card
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                    <div id="div_import_tags" class="col-md-3" hidden>

                        <div class="card card-outline card-primary">
                            <div class="card-header">
                                <h3 class="card-title">import tags</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                ورود تگ ها
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                    <div id="div_import_categories" class="col-md-3" hidden>
                        <div class="card card-outline card-primary">
                            <div class="card-header">
                                <h3 class="card-title">import categories</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                The body of the card
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
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
<script>
    $('#btnSetConnection').on('click', function () {
        $('#frmSetConnection').submit();
    });
    $('#testConnection').on('click', function () {
        $.get("/admin/import/TestConnection")
            .done(function (data) {
                $("#test_connection").removeClass("card-outline card-primary");
                $("#test_connection").addClass("bg-success");
                $("#test_connection_body").html("");
                for (var item in data.environment) {

                    $("#test_connection_body").append("<p>" + item + " : " + data.environment[item] + "</p>");

                }
                $("#div_import_product").removeAttr("hidden")
                $("#div_import_tags").removeAttr("hidden")
                $("#div_import_categories").removeAttr("hidden")

            })
            .fail(function (jqXHR, textStatus, errorThrown) {

                $("#test_connection").removeClass("card-outline card-primary");
                $("#test_connection").addClass("bg-danger");
                $("#test_connection_body").append("<p>"+"خطا در دریافت اطلاعات از وبسایت"+"</p>");
            });
    });
</script>
</body>
</html>
