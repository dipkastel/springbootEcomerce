<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../common/head.jsp">
        <jsp:param name="pageTitle" value="notrika | baseSettings" />
        <jsp:param name="admintheme" value="true" />
        <jsp:param name="dataTable" value="false" />
        <jsp:param name="icheck" value="false" />
        <jsp:param name="JQVMap" value="false" />
        <jsp:param name="jsgrid" value="false" />
        <jsp:param name="daterangePicker" value="false" />
        <jsp:param name="summernote" value="false" />
    </jsp:include>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <!-- Preloader -->

    <jsp:include page="../common/loading.jsp"></jsp:include>
    <jsp:include page="../components/nav-bar.jsp"></jsp:include>
    <jsp:include page="../components/side-bar.jsp"></jsp:include>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" style="min-height: 1342.88px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Edit tag Form</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a
                                    href="${pageContext.servletContext.contextPath}/admin">Home</a></li>
                            <li class="breadcrumb-item active">Edit tag Form</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-12">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">tag Form</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form id="frmType"
                                  action="${pageContext.servletContext.contextPath}/admin/tag/update"
                                  method="post">

								<div class="card-body">
                                    <input type="hidden" id="id"
                                           name="id" value="${tag.id }">
									<div class="form-group">
										<label for="name">Name</label>
										<input type="text" class="form-control" id="name" name="name" value="${tag.name}" placeholder="Enter name" maxlength="20">
										<span id="name-error" class="error invalid-feedback"></span>
									</div>
									<div class="form-group">
										<label for="slug">slug</label>
										<input type="text" class="form-control" id="slug" name="slug" value="${tag.slug}" placeholder="AutoGenerate" readonly="readonly" >
									</div>
									<div class="form-check" >
										<input type="checkbox" name="MasterTag" ${tag.masterTag?'checked':''} class="form-check-input" id="chk_mastertag">
										<label class="form-check-label" for="chk_mastertag">mastertag</label>
									</div>
									<div id="div_description" class="form-group" hidden>
										<label for="name">description</label>
										<input type="text" class="form-control" id="description"  name="description" value="${tag.description}" placeholder="Enter description" maxlength="200">
										<span id="description-error" class="error invalid-feedback"></span>
									</div>
									<div id="div_image" class="form-group" hidden>
										<label for="name">image</label>
										<input type="file" class="form-control" id="image" name="image" placeholder="Enter image" >
										<span id="image-error" class="error invalid-feedback"></span>
									</div>
								</div>
                                <!-- /.card-body -->
                            </form>
                            <div class="card-footer">
                                <button id="btnType" type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                        <!-- /.card -->

                        <!-- general form elements -->

                        <!-- /.card -->

                        <!-- Input addon -->

                        <!-- /.card -->
                        <!-- Horizontal Form -->

                        <!-- /.card -->

                    </div>
                    <!--/.col (left) -->
                    <!-- right column -->

                    <!--/.col (right) -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <jsp:include page="../components/footer.jsp"></jsp:include>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<jsp:include page="../components/script.jsp">
    <jsp:param name="admintheme" value="true" />
    <jsp:param name="bootstrap" value="true" />
    <jsp:param name="dataTable" value="false" />
    <jsp:param name="Sparkline" value="false" />
    <jsp:param name="JQVMap" value="false" />
    <jsp:param name="KnobChart" value="false" />
    <jsp:param name="jsgrid" value="false" />
    <jsp:param name="daterangePicker" value="false" />
    <jsp:param name="summernote" value="false" />
</jsp:include>
<script>
    $('#name').change(function (param){
        console.log(param)
        $('#slug').val(encodeURI(param.target.value))
    });
    $("#chk_mastertag").on('change',function (data) {
        if(data.target.checked){
            $("#div_description").removeAttr('hidden');
            $("#div_image").removeAttr('hidden');

        }else{

            $("#div_description").attr('hidden',"");
            $("#div_image").attr('hidden',"");

        }
    })
    $('#btnType').on('click', function () {
        let name = $('#name');
        let hasSubmit = [];
        if (name.val().length === 0) {
            hasSubmit.push(1);
            $('#name').addClass('form-control is-invalid');
            $('#name-error').html('Please enter name!');
        } else {
            $('#name').removeClass('form-control is-invalid');
            $('#name').addClass('form-control is-valid');
            $('#name-error').html('');
        }
        if (hasSubmit.length === 0) {
            $('#frmType').submit();
        }
    });
</script>
</body>
</html>
