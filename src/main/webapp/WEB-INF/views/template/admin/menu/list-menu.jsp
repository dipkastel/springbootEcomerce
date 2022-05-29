<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../common/head.jsp">
        <jsp:param name="pageTitle" value="notrika | baseSettings"/>
        <jsp:param name="admintheme" value="true"/>
        <jsp:param name="jstree" value="true"/>
    </jsp:include>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <jsp:include page="../common/loading.jsp"></jsp:include>
    <jsp:include page="../components/nav-bar.jsp">
        <jsp:param name="controlSidebar" value="true"/>
    </jsp:include>
    <jsp:include page="../components/side-bar.jsp"></jsp:include>
    <div class="content-wrapper" style="min-height: 1299.69px;">


        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1 class="text-center">menu Manager</h1>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-6">
                        <div id="jstree-card" class="card card-outline card-primary">
                            <div class="card-header">
                                <input type="button" id="add_default" value="add menu">
                                <div class="card-tools">
                                    <input type="button" id="clear_search" value="clear">
                                    <input type="button" id="search" value="search">
                                    <input type="text" id="text" value="">
                                </div>
                                <!-- /.card-tools -->

                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div id="jstree"></div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>
                    <div class="col-6">
                        <div id="item-card" class="card card-outline card-primary" style="display: none;">
                            <div class="card-header">
                                <h3 class="card-title">Primary Outline</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <button type="button" class="btn btn-tool" data-card-widget="remove"><i
                                            class="fas fa-times"></i>
                                    </button>
                                </div>
                                <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                The body of the card
                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->


    </div>
    <jsp:include page="../components/footer.jsp"></jsp:include>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">

    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<jsp:include page="../components/script.jsp">
    <jsp:param name="admintheme" value="true"/>
    <jsp:param name="bootstrap" value="true"/>
    <jsp:param name="jstree" value="true"/>
</jsp:include>
<script>
    $(function () {
        initJsTree();
    });

    function getjsTreeItem(_data) {
        var result = [];
        _data.forEach(function (item) {
            result.push(
                {
                    "id": item.id,
                    "text": item.name,
                    "children": getjsTreeItem(item.subMenu),
                    "type":item.id%2===0?"hasan":"default1"
                });
        })
        return result;
    }

    function initJsTree() {
        $('#jstree')
            .jstree({
                'core': {
                    'data': function (obj, callback) {

                        $.get("/api/menu/all")
                            .done(function (data) {
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

                        return operation === 'rename_node';
                    },
                    'multiple': false,
                    'themes': {
                        "icons": true
                    }
                },
                "types": {
                    "max_children" : -2,
                    "max_depth" : -2,
                    "start_drag" : true,
                    "move_node" : true,
                    "delete_node" : true,
                    "remove" : true,

                    "default1": {
                        "icon": "/static/img/Angry-Nerds-1.png",
                        "valid_children" : [ "default1" ],
                        "plugins": [
                            "checkbox"
                        ],
                        "max_children" : -2,
                        "max_depth" : -2,
                        "start_drag" : true,
                        "move_node" : true,
                        "delete_node" : true,
                        "remove" : true,
                    },
                    "hasan": {
                        "icon": "/static/img/marker.png",
                        "valid_children" : [ "default1" ],
                        "plugins": [
                            "checkbox"
                        ],
                        "max_children" : -2,
                        "max_depth" : -2,
                        "start_drag" : true,
                        "move_node" : true,
                        "delete_node" : true,
                        "remove" : true,
                    }
                },
                "plugins": [
                    "contextmenu", "search", "dnd", "sort", "unique", "changed",
                    "state", "types", "wholerow", "massload","dnd"
                ]
            })
            .bind("move_node.jstree", function (e, data) {
                console.log(e);
                console.log(data);
            });


        //     .jstree({
        //     "types": {
        //         "#": {
        //             "max_children": 1,
        //             "max_depth": 4,
        //             "valid_children": ["root"]
        //         },
        //         "root": {
        //             "valid_children": ["default"]
        //         },
        //         "default": {
        //             "icon": "/static/img/marker.png",
        //             "valid_children": ["default", "file"]
        //         }
        //     },
        //     "plugins" : [
        //         "contextmenu", "dnd", "search",
        //         "state", "types", "wholerow"
        //     ]
        // });
        // $('#jstree').on("changed.jstree", function (e, data) {
        //     console.log(data.selected);
        //     $("#item-card").show()
        // });
    }

    //
    // function getData() {
    //     $.get("/api/menu/all")
    //         .done(function (_data) {
    //
    //             $("#jstree").html(getSubmenus(_data, true))
    //             initJsTree();
    //         })
    //         .fail(function (jqXHR, textStatus, errorThrown) {
    //             console.log(jqXHR);
    //         });
    // }
    //
    // function getSubmenus(data, ActiveStatus) {
    //     var result = "<ul>";
    //     for (var i = 0; i < data.length; i++) {
    //         var item = data[i];
    //         var subMenus = ""
    //         if (item.subMenu.length > 0) {
    //             subMenus = getSubmenus(item.subMenu, ActiveStatus)
    //         }
    //         result += '<li id="' + item.id + '">' + item.name + subMenus + '</li>';
    //         // if (item.active === ActiveStatus) {
    //         // }
    //
    //     }
    //     result += "</ul>"
    //     return result
    // }
</script>
</body>
</html>
