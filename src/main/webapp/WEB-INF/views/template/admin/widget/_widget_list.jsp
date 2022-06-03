<%@ page contentType="text/html; charset=UTF-8" %>

<div class="card card-outline card-primary">
    <div class="card-header">
        <h3 class="card-title">${param.pageName}</h3>

        <div class="card-tools">

            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                <i class="fas fa-minus"></i>
            </button>
        </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <div class="widgetData" id="${param.pageName}"></div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th style="width: 10px">#</th>
                <th>name</th>
                <th style="width: 180px">image</th>
                <th style="width: 180px">actions</th>
            </tr>
            </thead>
            <tbody id="${param.pageName}_tbody">

            </tbody>
        </table>
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
        <button type="button" class="btn bg-gradient-primary btn-sm btn_open_add_modal" data-type="${param.pageName}"  >add
            item
        </button>
    </div>
</div>

<script>


</script>
