<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="../components/head.jsp"/>

<body>
<jsp:include page="../components/header.jsp"></jsp:include>
<jsp:include page="../components/sidebar.jsp"></jsp:include>
<br><br><br><br><br><br>
<main class="ps-page--my-account">
    <section class="ps-section--account">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <%--                    side bar--%>
                    <jsp:include page="../page/user/customer-sidebar.jsp"></jsp:include>
                    <%--                    side bar--%>

                </div>
                <div class="col-lg-8">
                    <div class="ps-section__right">
                        <div class="ps-form--account-setting">
                            <div class="ps-form__header">
                                <h3>تغییر کلمه عبور</h3>
                            </div>
                            <br>
                            <form action="${pageContext.servletContext.contextPath}/customer/password" method="post" id="frmPassword">
                                <div class="ps-form__content">
                                    <div class="row" >
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label>کلمه عبور فعلی</label>
                                                <input class="form-control" type="password" placeholder="کلمه عبور فعلی" name="oldPassword" id="old">
                                                <span id="old-error" class="error invalid-feedback"></span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>کلمه عبور جدید</label>
                                                <input class="form-control" type="password" placeholder="کلمه عبور جدید" name="newPassword" id="new">
                                                <span id="new-error" class="error invalid-feedback"></span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label>تکرار کلمه عبور جدید</label>
                                                <input class="form-control" type="password" placeholder="تکرار کلمه عبور جدید" id="confirm" >
                                                <span id="confirm-error" class="error invalid-feedback"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </form>
                            <div class="form-group submit">
                                <button class="ps-btn" id="btnUpdate">به روز رسانی</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<jsp:include page="../components/footer.jsp"></jsp:include>
<script>
    $('#btnUpdate')
        .on(
            'click',
            function () {
                let old = $('#old');
                let oldError = $('#old-error');
                let newPass = $('#new');
                let newPassError = $('#new-error');
                let confirm = $('#confirm');
                let confirmError = $('#confirm-error');
                let hasSubmit = [];

                if (confirm.val().length > 250) {
                    hasSubmit.push(1);
                    confirm.addClass(
                        'form-control is-invalid');
                    confirmError.html(
                        'کلمه عبور طولانی است');
                }
                if (newPass.val().length > 250) {
                    hasSubmit.push(1);
                    newPass.addClass(
                        'form-control is-invalid');
                    newPassError.html(
                        'کلمه عبور طولانی است');
                }
                if (old.val().length > 250) {
                    hasSubmit.push(1);
                    old.addClass(
                        'form-control is-invalid');
                    oldError.html(
                        'کلمه عبور طولانی است');
                }




                if (old.val().length === 0) {
                    hasSubmit.push(1);
                    old.addClass(
                        'form-control is-invalid');
                    oldError.html(
                        'کلمه عبور فعلی را وارد نمایید');
                }



                if (newPass.val().length === 0) {
                    hasSubmit.push(1);
                    newPass.addClass(
                        'form-control is-invalid');
                    newPassError.html(
                        'کلمه عبور جدید را وارد کنید');
                }

                if (confirm.val().length === 0) {
                    hasSubmit.push(1);
                    confirm.addClass(
                        'form-control is-invalid');
                    confirmError.html(
                        'تکرار کلمه عبور را وارد نمایید');
                }

                if (confirm.val() !== newPass.val()) {
                    hasSubmit.push(1);
                    confirm.addClass(
                        'form-control is-invalid');
                    confirmError.html(
                        'تکرار کلمه عبور متفاوت است');
                }


                if (hasSubmit.length === 0) {
                    $('#frmPassword').submit();
                }

            });
</script>

</body>

