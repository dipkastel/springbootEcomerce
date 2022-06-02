
<script>
    $(function () {

        function setDeleteListener() {
            $('.btn_delete_superCat').click(function (item) {
                var superCatId = $(item.target).attr("datasrc");
                $.ajax({
                    url: "${pageContext.servletContext.contextPath}/api/widget/delete?id=" + superCatId,
                    type: 'DELETE',
                    success: function (data) {
                        refreshSuperCat();
                    },
                    error: function (jqXhr, textStatus, errorMessage) {
                        console.log(e);
                    }
                });
            });
        }

        function setEditListener() {

            $('.btn_edit_superCat').click(function (item) {
                var superCatId = $(item.target).attr("datasrc");
                $.get("${pageContext.servletContext.contextPath}/api/widget/get?id=" + superCatId)
                    .done(function (data) {
                        console.log(data);

                        $("#updateType").val("SUPER_CAT")
                        $("#updateId").val(data.id)
                        $("#updateName").val(data.name)
                        $("#updateInputUrl").val(data.url)
                        $("#updateId").val(data.id)
                        $("#modal-update-wedgit").modal()
                    })
                    .fail(function (e) {
                        console.log(e);
                    })

            });
        }

        function refreshSuperCat() {
            $.get("/api/widget/all")
                .done(function (data) {
                    $("#super_cat_tbody").html("");
                    data.forEach(function (superCat) {
                        $("#super_cat_tbody").append(
                            $("<tr>")
                                .append($("<td>")
                                    .html(superCat.id)
                                )
                                .append($("<td>")
                                    .html(superCat.name)
                                )
                                .append($("<td>")
                                    .html("<img src='data:image/image/png;base64," + superCat.image.image + "' height='50' width='50'/>")
                                )
                                .append($("<td>")
                                    .html(
                                        "<div class='row'>" +
                                        "<input type='button' value='edit' class='btn btn-primary col-6 btn_edit_superCat'  datasrc='" + superCat.id + "' />" +
                                        "<input type='button' value='delete' class='btn btn-danger col-6 btn_delete_superCat' datasrc='" + superCat.id + "' />" +
                                        "</div>"
                                    )
                                )
                        );
                    })

                    setDeleteListener();
                    setEditListener();
                })
                .fail(function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR);
                });
        }

        $('#btn_open_add_modal').click(function () {
            $("#addType").val("SUPER_CAT")
            $("#modal-add-wedgit").modal();
        });

        $('#btn_add_widget').click(function () {
            var data = new FormData($('#fileUploadForm')[0]);
            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: "/api/widget/add",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function (data) {
                    $('#fileUploadForm')[0].reset();
                    $("#modal-add-wedgit").modal("hide");
                    refreshSuperCat();
                },
                error: function (e) {
                    console.log("ERROR : ", e);
                }
            });
        });
        $('#btn_update_widget').click(function () {
            var data = new FormData($('#FormUpdateSuperCat')[0]);
            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: "/api/widget/update",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function (data) {
                    $('#FormUpdateSuperCat')[0].reset();
                    $("#modal-update-wedgit").modal("hide");
                    refreshSuperCat();
                },
                error: function (e) {
                    console.log("ERROR : ", e);
                }
            });
        });
        refreshSuperCat();
    });
</script>
