<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../components/head.jsp"></jsp:include>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <!-- Preloader -->

    <jsp:include page="../common/loading.jsp"></jsp:include>
    <jsp:include page="../components/nav-bar.jsp"></jsp:include>
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
                    <div class="col-12">
                        <!-- /.card -->
                        <div class="card">
                            <div class="card-header">

                                <a href="#modal-add-menu" data-toggle="modal" data-target="#modal-add-menu"
                                   class="btn btn-success">Add menu Item</a>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">


                                <div id="nested" class="row">
                                    <div id="ActiveMenu" class="list-group col nested-sortable">

                                    </div>
                                    <div id="DeactiveMenu" class="list-group col nested-sortable">

                                    </div>
                                </div>


                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->


                        <div class="modal fade" id="modal-add-menu">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header danger">
                                        <h4 class="modal-title">Add menu item</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div id="modal_add_bady" class="modal-body">
                                        <div class="form-group">
                                            <label for="add-name">Name</label>
                                            <input type="text" class="form-control" id="add-name" name="name"
                                                   placeholder="Enter name" maxlength="20">
                                            <span id="add-name-error" class="error invalid-feedback"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="add-url">url</label>
                                            <input type="text" class="form-control" id="add-url" name="name"
                                                   placeholder="Enter url" maxlength="20">
                                            <span id="add-url-error" class="error invalid-feedback"></span>
                                        </div>
                                    </div>
                                    <div class="modal-footer justify-content-between">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                        <button id="submit_modal_add" type="button" class="btn btn-primary">add</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <div class="modal fade" id="modal-update-menu">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header danger">
                                        <h4 class="modal-title">Add menu item</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div id="modal_update_bady" class="modal-body">
                                        <input type="text" class="form-control" id="update-id" name="id"
                                               maxlength="20" hidden>
                                        <input type="text" class="form-control" id="update-parent-id" name="parent_id"
                                               maxlength="20" hidden>
                                        <input type="text" class="form-control" id="update-active" name="active"
                                               maxlength="20" hidden>
                                        <div class="form-group">
                                            <label for="add-name">Name</label>
                                            <input type="text" class="form-control" id="update-name" name="name"
                                                   placeholder="Enter name" maxlength="20">
                                            <span id="update-name-error" class="error invalid-feedback"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="add-url">url</label>
                                            <input type="text" class="form-control" id="update-url" name="name"
                                                   placeholder="Enter url" maxlength="20">
                                            <span id="update-url-error" class="error invalid-feedback"></span>
                                        </div>
                                    </div>
                                    <div class="modal-footer justify-content-between">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                        <button id="submit_modal_update" type="button" class="btn btn-primary">update
                                        </button>
                                        <button id="submit_modal_delete" type="button" class="btn btn-danger">delete
                                        </button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
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
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<jsp:include page="../components/script.jsp"></jsp:include>
<script
        src="${pageContext.servletContext.contextPath}/plugins-admin/sortable/Sortable.js"></script>
<%--	<script--%>
<%--			src="${pageContext.servletContext.contextPath}/plugins-admin/sortable/Sortable.js"></script>--%>
<%--	<script--%>
<%--			src="${pageContext.servletContext.contextPath}/plugins-admin/sortable/Sortable.js"></script>--%>

<%--	<script type="text/javascript" src="st/prettify/prettify.js"></script>--%>
<%--	<script type="text/javascript" src="st/prettify/run_prettify.js"></script>--%>

<script>
    getData();


    function toSortable() {
        var nestedSortables = [].slice.call(document.querySelectorAll('.nested-sortable'));

        // Loop through each nested sortable element
        for (var i = 0; i < nestedSortables.length; i++) {
            new Sortable(nestedSortables[i], {
                group: 'shared',
                animation: 150,
                fallbackOnBody: false,
                swapThreshold: 0.25,
                ghostClass: 'drag-ghost',
                setData: function (e) {
                },
                onUpdate: function (evt) {
                    console.log(evt);
                },
                onChange: function (evt) {
                    evt.newIndex;
                },
                onEnd: function (evt) {
                    updateItem(evt)
                }


            });
        }


    }

    function getData() {
        $.get("/api/menu/all")
            .done(function (_data) {
                $("#ActiveMenu").html(getSubmenus(_data, true))
                $("#DeactiveMenu").html(getSubmenus(_data, false))
                toSortable();
            })
            .fail(function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR);
            });
    }

    function getSubmenus(data, ActiveStatus) {
        var result = "";
        for (var i = 0; i < data.length; i++) {
            var item = data[i];
            var subMenus = ""
            if (item.subMenu.length > 0) {
                subMenus = getSubmenus(item.subMenu, ActiveStatus)
            }
            if (item.active === ActiveStatus) {
                if (item.active) {
                    result += '<div id="' + item.id + '" class="list-group-item nested-1" onclick="clickOnItem(' + item.id + ')">' + item.name + '<div class="list-group nested-sortable">' + subMenus + '</div></div>';
                } else {
                    result += '<div id="' + item.id + '" class="list-group-item nested-1" onclick="clickOnItem(' + item.id + ')">' + item.name + '</div>';
                }
            }

        }
        return result
    }

    function clickOnItem(item) {

        $.get("/api/menu/get?id=" + item)
            .done(function (_data) {
                $("#update-id").val(_data.id);
                $("#update-name").val(_data.name);
                $("#update-url").val(_data.url);
                $("#update-parent-id").val(_data.parent_id);
                $("#update-active").val(_data.active);
                $("#modal-update-menu").modal();
            })
            .fail(function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR);
            });
        console.log(item);
    }

    $("#submit_modal_add").click(function (e) {
        $.post("${pageContext.servletContext.contextPath}/api/menu/add",
            {
                name:$("#add-name").val(),
                url: $("#add-url").val()
            })
            .done(function (data) {
                getData();
                $("#add-name").val("");
                $("#add-url").val("");
                $("#modal-add-menu").modal('hide');

            }).fail(function (e) {
            console.log(e);
        })
    })
    $("#submit_modal_update").click(function (e) {

        $.post("${pageContext.servletContext.contextPath}/api/menu/update",
            {
                id:$("#update-id").val(),
                name:$("#update-name").val(),
                url: $("#update-url").val(),
                active: $("#update-active").val(),
                Parent_id: $("#update-parent-id").val()
            })
            .done(function (data) {
                getData();
                $("#modal-update-menu").modal('hide');
            }).fail(function (e) {
            console.log(e);
        })
    })
    $("#submit_modal_delete").click(function (e) {
        $.ajax( {
            url : "${pageContext.servletContext.contextPath}/api/menu/delete?id="+$("#update-id").val(),
            type : 'DELETE',
            success : function ( data ) {
                getData();
                $("#modal-update-menu").modal('hide');
            },
            error : function ( jqXhr, textStatus, errorMessage ) {
                console.log(e);
            }
        });
    })
    function updateItem(evt){

        $.get("/api/menu/get?id=" + evt.item.id)
            .done(function (_data) {
                if(evt.item.parentElement.id==="ActiveMenu"){
                    _data.parent_id = null
                    _data.active = true
                }else if(evt.item.parentElement.id==="DeactiveMenu"){
                    _data.parent_id = null
                    _data.active = false
                }else{
                    _data.parent_id = evt.item.parentElement.parentElement.id
                    _data.active = true
                }

                $.post("${pageContext.servletContext.contextPath}/api/menu/update",
                    _data)
                    .done(function (data) {
                        getData();
                    }).fail(function (e) {
                    console.log(e);
                })
            })
            .fail(function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR);
            });
        // console.log(evt);
        // var itemEl = evt.item;  // dragged HTMLElement
        // evt.to;    // target list
        // evt.from;  // previous list
        // evt.oldIndex;  // element's old index within old parent
        // evt.newIndex;  // element's new index within new parent
        // evt.oldDraggableIndex; // element's old index within old parent, only counting draggable elements
        // evt.newDraggableIndex; // element's new index within new parent, only counting draggable elements
        // evt.clone // the clone element
        // evt.pullMode;  // when item is in another sortable: `"clone"` if cloning, `true` if moving
    }
</script>
</body>
</html>
