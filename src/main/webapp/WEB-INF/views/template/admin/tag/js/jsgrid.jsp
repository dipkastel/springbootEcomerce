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
        controller: {
            loadData: function (filter) {
                var deferred = $.Deferred();
                $.get("/api/tag/all?page=" + filter.pageIndex + "&&per_page=" + filter.pageSize)
                    .done(function (_data) {
                        console.log(_data);
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
        confirmDeleting: true,
        deleteConfirm:function(item) {
            return "آیا حذف تگ " + item.name + " را تایید می کنید؟"
        },
        onItemDeleting: function(args) {
            $.get("/api/tag/delete?id="+args.item.id)
                .done(function (_data) {
                    args.grid.refresh()
                })
                .fail(function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR)
                });
        },
        // onItemUpdating:function(args) {
        //     return redirect("/edit/"+args.item.id)
        // },
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
            {type:"checkbox",title: "master", name: "masterTag", width: 40},
            { type: "control" , itemTemplate: function (value, item) {
                        return $("<button>").text("edit").addClass("btn btn-primary").click(function (arg)
                        {
                            console.log(arg);
                        });
                },width: 60},
            { type: "control" , itemTemplate: function (value, item) {
                        return $("<button>").text("delete").addClass("btn btn-danger").click(function (arg)
                        {
                            console.log(arg);
                        });
                },width: 60}
        ]
    });

</script>
