<%@ page contentType="text/html; charset=UTF-8" %>
<script>
     $("#tagtable").jsGrid({
        height: "auto",
        width: "100%",
        sorting: true,
        paging: true,
        autoload: true,
        heading: true,
        loadMessage: "صبر کنید",
        pageSize: 10,
        pageIndex: 1,
        pageLoading: true,
         onItemDeleting: function(args) {

         },
        controller: {
            loadData: function (filter) {
                var deferred = $.Deferred();
                $.get("/api/tag/all?page=" + filter.pageIndex + "&&per_page=" + filter.pageSize)
                    .done(function (_data) {
                        var data = _data.data
                        var count = _data.count
                        deferred.resolve({
                            data: data,
                            itemsCount: count
                        });
                    })
                    .fail(function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR)
                    });
                return deferred.promise();
            },
        },
        fields: [
            {name: "id", type: "text", width: 40},
            {name: "name", type: "text", width: 150},
            {
                name: "slug", type: "text", itemTemplate: function (value) {
                    if (value.length > 0)
                        return decodeURI(value);
                    else return ""
                }, width: 150
            },
            {name: "description", type: "text", width: 300},
            {type: "checkbox", title: "master", name: "masterTag", width: 50},
            {
                type: "control", itemTemplate: function (value, item,grid,a) {
                    return $("<button>").text("edit").addClass("btn btn-primary").click(function (arg) {
                        window.location.href = "${pageContext.servletContext.contextPath}/admin/tag/edit?id="+item.id;
                    });
                }, width: 60
            },
            { name: "image", type: "text", width: 60,itemTemplate: function(value) {
                    if(value)
                        return "<img src='data:image/image/png;base64,"+value.image+"' height='60' width='60'/>";
                    else return ""
            }},
            {
                type: "control", itemTemplate: function (value, item) {
                    return $("<button>").text("delete").addClass("btn btn-danger").click(function (arg) {
                        $("#modal_delete_bady").html("آیا حذف "+item.name+" را تایید می کنید")
                        $("#modal-delete").modal();
                        $("#submit_modal_delete").click(function (data) {
                            $.get("/api/tag/delete?id=" + item.id)
                                .done(function (_data) {
                                    $("#modal-delete").modal('hide');
                                    $("#tagtable").jsGrid().refresh
                                })
                                .fail(function (jqXHR, textStatus, errorThrown) {
                                    console.log(jqXHR)
                                });
                        })
                    });
                }, width: 60
            }
        ]
    });
</script>
