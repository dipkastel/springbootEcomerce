
<script
        src="${pageContext.servletContext.contextPath}/plugins-admin/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<script>
    $(function () {
        bsCustomFileInput.init();
    });
</script>
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

        function refreshBanenrs() {
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

        $('#btn_open_add_modal_banner').click(function () {
            $("#addType").val("BANNER")
            $("#modal-add-wedgit").modal();
        });

        setDeleteListener();
    });
</script>
