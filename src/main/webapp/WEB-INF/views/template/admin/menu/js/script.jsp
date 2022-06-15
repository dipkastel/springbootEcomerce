<%@ page contentType="text/html; charset=UTF-8" %>
<script>
    $(function () {
        initJsTree();
        var list = [];

        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000
        });

        function getjsTreeItem(_data) {
            var result = [];
            _data.forEach(function (item) {
                list.push(item)
                result.push(
                    {
                        "id": item.id,
                        "text": item.name,
                        "children": getjsTreeItem(item.subMenu),
                        "type": item.parent_id === null ? "mf" : "file"
                    });
            })
            return result;
        }
        function initJsTree() {
            $('#jstree')
                .jstree({
                    "check_callback": true,
                    'core': {
                        'data': function (obj, callback) {

                            $.get("/api/menu/all")
                                .done(function (data) {
                                    list = [];
                                    callback.call(this, getjsTreeItem(data));
                                })
                                .fail(function (jqXHR, textStatus, errorThrown) {
                                    console.log(jqXHR);
                                });
                        },
                        'strings': {
                            'Loading ...': 'صبر کنید ...'
                        },
                        'check_callback': function (operation, node, node_parent, node_position, more) {
                            switch (operation) {
                                case "move_node": {
                                    if (more.core) {
                                    }
                                    return true;
                                }
                                case "create_node": {
                                    $("#add-parent-id").val(node_parent.id);
                                    $("#item-add").collapse("show")
                                    return false;
                                }
                                case "delete_node": {
                                    return false;
                                }
                                default:
                                    return true;
                            }
                        },
                        'multiple': false,
                        'themes': {
                            "icons": true
                        }
                    },
                    "sort": function (id1, id2) {
                        var p1 = list.filter(p => p.id.toString() === id1)[0].periority;
                        var p2 = list.filter(p => p.id.toString() === id2)[0].periority
                        var result = (p1 > p2) ? 1 : -1
                        return result
                    },
                    "types": {
                        "mf": {
                            "icon": "fa fa-share-square icon-state-warning icon-lg",
                        },
                        "file": {
                            "icon": "/static/img/point.png",
                        },
                        "default": {
                            "icon": "/static/img/point.png",
                        },


                    },
                    "contextmenu": {
                        "select_node": false,
                        "items": {
                            "create_node": {
                                "_disabled": false,
                                "label": "add item",
                                "separator_before": true,
                                'action' : function (operation) {
                                    $("#add-parent-id").val(operation.reference[0].id.split("_")[0]);
                                    $("#item-add").collapse("show")
                                }
                            }
                        }
                    },

                    "plugins": [
                        "contextmenu", "search", "dnd", "changed",
                        "state", "types", "sort",
                    ]
                })
                .bind("select_node.jstree", function (event, data) {
                    $("#item-update").collapse("show");
                    var item = list.filter(p => p.id.toString() === data.node.id)[0]
                    $("#update-id").val(item.id);
                    $("#update-parent-id").val(item.parent_id);
                    $("#update-periority").val(item.periority);
                    $("#update-active").val(item.active);
                    $("#update-name").val(item.name);
                    $("#update-url").val(item.url);
                    console.log(item);
                })
                .bind("copy.jstree", function (parent, node, mode) {
                    Toast.fire({
                        icon: 'error',
                        title: 'عملکرد در دسترس نیست.'
                    });
                    $("#jstree").jstree(true).refresh();
                })
                .bind("paste.jstree", function (parent, node, mode) {

                    Toast.fire({
                        icon: 'error',
                        title: 'عملکرد در دسترس نیست.'
                    });
                    $("#jstree").jstree(true).refresh();
                })
                .bind("cut.jstree", function (parent, node, mode) {

                    Toast.fire({
                        icon: 'error',
                        title: 'عملکرد در دسترس نیست.'
                    });
                    $("#jstree").jstree(true).refresh();
                })
                .bind("rename_node.jstree", function (parent, node, mode) {

                    Toast.fire({
                        icon: 'error',
                        title: 'عملکرد در دسترس نیست.'
                    });
                    $("#jstree").jstree(true).refresh();
                })
                .bind("move_node.jstree", function (parent, node, mode) {

                    Toast.fire({
                        icon: 'error',
                        title: 'عملکرد در دسترس نیست.'
                    });
                    $("#jstree").jstree(true).refresh();
                })
                .bind("delete_node.jstree", function (parent, node, mode) {

                    Toast.fire({
                        icon: 'error',
                        title: 'عملکرد در دسترس نیست.'
                    });
                    $("#jstree").jstree(true).refresh();
                })
        }

        $("#btn_submit_add").click(function (e) {
            let leadDetails = {
                name: $("#add-name").val(),
                url: $("#add-url").val(),
                Parent_id: $("#add-parent-id").val(),
                periority: 0,
                active: true
            };
            $.ajax({
                url: "${pageContext.servletContext.contextPath}/api/menu/add",
                data: JSON.stringify(leadDetails),
                type: "POST",
                contentType: "application/json",
                dataType: "text",
                success: function (response) {
                    $("#add-parent-id").val("");
                    $("#add-name").val("");
                    $("#add-url").val("");
                    $("#jstree").jstree(true).refresh();
                    $("#item-add").collapse("hide")
                },
                error: function (response) {
                    console.log('fail.');
                }
            });
        })
        $("#btn_submit_delete").click(function (e) {
            $.ajax({
                url: "${pageContext.servletContext.contextPath}/api/menu/delete?id=" + $("#update-id").val(),
                type: 'DELETE',
                success: function (data) {
                    $("#jstree").jstree(true).refresh();
                    $("#item-update").collapse("hide")
                },
                error: function (jqXhr, textStatus, errorMessage) {
                    console.log(e);
                }
            });
        })

        $("#btn_submit_update").click(function (e) {

            let leadDetails = {
                id: $("#update-id").val(),
                name: $("#update-name").val(),
                url: $("#update-url").val(),
                Parent_id: $("#update-parent-id").val(),
                periority: 0,
                active: true
            };
            $.ajax({
                url: "${pageContext.servletContext.contextPath}/api/menu/update",
                data: JSON.stringify(leadDetails),
                type: "POST",
                contentType: "application/json",
                dataType: "text",
                success: function (response) {
                    $("#jstree").jstree(true).refresh();
                    $("#add-parent-id").val("");
                    $("#add-name").val("");
                    $("#add-url").val("");
                    $("#jstree").jstree(true).refresh();
                    $("#item-add").collapse("hide")
                },
                error: function (response) {
                    console.log(response);
                }
            });

        })

        $(".btn-add-tiggle").click(function (e) {
            $("#add-parent-id").val("");
            $("#item-add").collapse("toggle");
        })

    });
</script>
