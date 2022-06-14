
<%@ page contentType="text/html; charset=UTF-8" %>
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
