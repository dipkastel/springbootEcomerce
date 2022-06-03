<script
        src="${pageContext.servletContext.contextPath}/plugins-admin/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<script>
    $(function () {
        bsCustomFileInput.init();
    });
</script>
<script>
    $(function () {

        $('.btn_open_add_modal').click(function () {
            $("#addType").val(this.attributes["data-type"].value)
            $("#modal-add-wedgit").modal();
        });
        $('#btn_add_widget').click(function () {
            var data = new FormData($('#formAddWidget')[0]);
            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: "/api/widget/add",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function (_data) {
                    $('#formAddWidget')[0].reset();
                    $("#modal-add-wedgit").modal("hide");
                    getAndSetDataForType(data.get("type"));
                },
                error: function (e) {
                    console.log("ERROR : ", e);
                }
            });
        });
        $('#btn_update_widget').click(function () {
            var data = new FormData($('#FormUpdateWidget')[0]);
            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: "/api/widget/update",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function (_data) {
                    console.log(_data);
                    $('#FormUpdateWidget')[0].reset();
                    $("#modal-update-wedgit").modal("hide");
                    getAndSetDataForType(data.get("type"));

                },
                error: function (e) {
                    console.log("ERROR : ", e);
                }
            });
        });

        function setDeleteListenerBanners(id) {
            $('.btn_delete'+id).click(function (item) {
                var bannerId = $(item.target).attr("datasrc");
                var type = $(item.target).attr("data-type");
                $.ajax({
                    url: "${pageContext.servletContext.contextPath}/api/widget/delete?id=" + bannerId,
                    type: 'DELETE',
                    success: function (data) {
                        getAndSetDataForType(type);
                    },
                    error: function (jqXhr, textStatus, errorMessage) {
                        console.log(e);
                    }
                });
            });
        }

        function setEditListenerBanners(id) {

            $('.btn_edit'+id).click(function (item) {
                var bannerId = $(item.target).attr("datasrc");
                var type = $(item.target).attr("data-type");
                $.get("${pageContext.servletContext.contextPath}/api/widget/get?id=" + bannerId)
                    .done(function (data) {
                        console.log(data);
                        $("#updateType").val(type)
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

        function getAndSetDataForType(type) {
            $.get("/api/widget/allbytype?type=" + type)
                .done(function (data) {
                    $("#" + type + "_tbody").html("");
                    data.forEach(function (banner) {
                        $("#" + type + "_tbody").append(
                            $("<tr>")
                                .append($("<td>")
                                    .html(banner.id)
                                )
                                .append($("<td>")
                                    .html(banner.name)
                                )
                                .append($("<td>")
                                    .html("<img src='data:image/image/png;base64," + banner.image.image + "' height='50' />")
                                )
                                .append($("<td>")
                                    .html(
                                        "<div class='row'>" +
                                        "<input type='button' value='edit' class='btn btn-primary col-6 btn_edit"+banner.id+"' data-type='" + type + "'  datasrc='" + banner.id + "' />" +
                                        "<input type='button' value='delete' class='btn btn-danger col-6 btn_delete"+banner.id+"' data-type='" + type + "' datasrc='" + banner.id + "' />" +
                                        "</div>"
                                    )
                                )
                        );
                        setDeleteListenerBanners(banner.id);
                        setEditListenerBanners(banner.id);
                    })

                })
                .fail(function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR);
                });
        }


        $(".widgetData").each(function (data) {
            var type = this.id
            getAndSetDataForType(type)
        })
    });
</script>
