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
                        <div id="card_test_connection" class="card card-outline card-primary">
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
                        <div  class="col-md-6" >
                            <div id="card_import_tags" class="card card-primary" hidden>
                                <div class="card-header">
                                    <h3 class="card-title">import tags</h3>
                                </div>
                                <!-- /.card-header -->
                                <div id="card_import_tags_body" class="card-body">
                                    ورود تگ ها
                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer">
                                    <button id="btn-import-tags" class="btn btn-primary">import</button>
                                </div>
                            </div>
                            <div id="card_import_category" class="card card-primary" hidden>
                                <div class="card-header">
                                    <h3 class="card-title">import categories</h3>
                                </div>
                                <!-- /.card-header -->
                                <div id="card_import_category_body" class="card-body">
                                    ورود دسته بندی ها
                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer">
                                    <button id="btn-import-catogories" class="btn btn-primary">import</button>
                                </div>
                            </div>
                        </div>
                        <div  class="col-md-6" >

                            <!-- general form elements -->
                            <div id="card_import_product" class="card card-primary" hidden>
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
                                    </div>
                                    <!-- /.card-body -->

                                    <div class="card-footer">
                                        <button id="btn-import-products" class="btn btn-primary">import</button>
                                    </div>
                            </div>
                            <!-- /.card -->
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
                $("#card_test_connection").removeClass("card-outline card-primary");
                $("#card_test_connection").addClass("bg-success");
                $("#test_connection_body").html("");
                for (var item in data.environment) {

                    $("#test_connection_body").append("<p>" + item + " : " + data.environment[item] + "</p>");

                }
                $("#card_import_product").removeAttr("hidden")
                $("#card_import_tags").removeAttr("hidden")
                $("#card_import_category").removeAttr("hidden")

            })
            .fail(function (jqXHR, textStatus, errorThrown) {

                $("#card_test_connection").removeClass("card-outline card-primary");
                $("#card_test_connection").addClass("bg-danger");
                $("#test_connection_body").append("<p>" + "خطا در دریافت اطلاعات از وبسایت" + "</p>");
            });
    });
    $('#btn-import-tags').on('click', function () {
        $.get("/admin/import/tags/all")
            .done(function (data) {
                $("#card_import_tags").removeClass("card-primary");
                $("#card_import_tags").addClass("bg-success");
                $("#card_import_tags_body").html("");

            })
            .fail(function (jqXHR, textStatus, errorThrown) {

                $("#card_import_tags").removeClass("card-outline card-primary");
                $("#card_import_tags").addClass("bg-danger");
                $("#card_import_tags_body").append("<p>" + "خطا در دریافت اطلاعات از وبسایت" + "</p>");
            });

        var sse = new EventSource('/admin/import/progress');
        sse.onmessage = function (evt) {
            var progress = JSON.parse(evt.data)
            if(!progress.complete){
                $("#card_import_tags_body").html(progress.opration);
                $("#card_import_tags_body").append("برای"+progress.productCount+"تگ اعمال شد"+"</br>");
            }
        };
    });
    $('#btn-import-catogories').on('click', function () {
        $.get("/admin/import/category/all")
            .done(function (data) {
                $("#card_import_category").removeClass("card-primary");
                $("#card_import_category").addClass("bg-success");
                $("#card_import_category_body").html("");

            })
            .fail(function (jqXHR, textStatus, errorThrown) {

                $("#card_import_category").removeClass("card-outline card-primary");
                $("#card_import_category").addClass("bg-danger");
                $("#card_import_category_body").append("<p>" + "خطا در دریافت اطلاعات از وبسایت" + "</p>");
            });

        var sse = new EventSource('/admin/import/progress');
        sse.onmessage = function (evt) {
            var progress = JSON.parse(evt.data)
            if(!progress.complete){
                $("#card_import_category_body").html(progress.opration);
                $("#card_import_category_body").append("برای"+progress.productCount+"دسته بندی اعمال شد"+"</br>");
            }
        };
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

        xhr('/admin/import/products/all')
            .then(function(success){
                console.log("success srb"+success)
            });
    })
</script>
</body>
</html>
