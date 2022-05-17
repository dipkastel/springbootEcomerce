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
                    <div class="col-md-3">
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
                    <div class="row col-md-9" >
                        <div id="div_import_product" class="col-md-6" hidden>

                            <!-- general form elements -->
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">import All products from Api</h3>
                                </div>
                                <!-- /.card-header -->
                                    <div class="card-body">

                                        <div class="form-text">
                                            <p>
                                                This operation may take a long time.
                                            </p>
                                            <p id="ProductImportOpration"></p>
                                            <p id="ProductImportDetails"></p>
                                        </div>
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="CheckDeleteAllProducts">
                                            <label class="form-check-label" for="CheckDeleteAllProducts">delete All Products</label>
                                        </div>
                                    </div>
                                    <!-- /.card-body -->

                                    <div class="card-footer">
                                        <button id="btn-import-products" class="btn btn-primary">import</button>
                                    </div>
                            </div>
                            <!-- /.card -->
                        </div>
                        <div id="div_import_tags" class="col-md-6" hidden>
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
                        </div>
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
                $("#test_connection_body").append("<p>" + "خطا در دریافت اطلاعات از وبسایت" + "</p>");
            });
    });
    $('#btn-import-products').on('click',function(){


        var xhr = function(url) {
            return new Promise(function(resolve, reject) {
                var xmhr = new XMLHttpRequest();
                xmhr.open("GET", url, true);
                xmhr.send();
            });
        };

        var sse = new EventSource('/admin/import/progress');
        sse.onmessage = function (evt) {
            var progress = JSON.parse(evt.data)
            if(!progress.complete){
                $("#ProductImportOpration").html(progress.opration);
                $("#ProductImportDetails").prepend("برای"+progress.productCount+"محصول اعمال شد"+"</br>");
            }
        };
        $('#btn-import-products').prop('disabled', true);
        $('#CheckDeleteAllProducts').prop('disabled', true);

        xhr('/admin/import/products/all?deleteAll='+$('#CheckDeleteAllProducts').is(':checked'))
            .then(function(success){
                console.log("success srb"+success)
            });
    })
</script>
</body>
</html>
