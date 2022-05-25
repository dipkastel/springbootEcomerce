<%@ page contentType="text/html; charset=UTF-8" %>
<script>
        $("#jsGridProducts").jsGrid({
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
                loadData: function(filter) {
                    var deferred = $.Deferred();
                    $.get("/admin/product/products?page="+filter.pageIndex+"&&per_page="+filter.pageSize)
                        .done(function (_data) {
                            console.log(_data);

                            deferred.resolve({
                                data: _data,
                                itemsCount: 2000
                            });
                        })
                        .fail(function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR)
                        });
                    return deferred.promise();
                },
            },
            fields: [
                { name: "images", type: "text", width: 60,itemTemplate: function(value) {
                    if(value.length>0)
                        return "<img src='data:image/image/png;base64,"+value[0].image+"' height='60' width='60'/>";
                    else return ""
                    }},
                { name: "name", type: "text", width: 300 },
                { name: "brand.name", type: "text", width: 150 },
                { name: "stockQuantity", type: "text", width: 150 },
                { name: "price", type: "text", width: 150 }
            ]
        });

</script>
