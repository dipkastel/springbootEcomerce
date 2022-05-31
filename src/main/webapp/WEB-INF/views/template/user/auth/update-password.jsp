<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="../components/head.jsp"/>

<body>
<jsp:include page="../components/header.jsp"></jsp:include>
<jsp:include page="../components/sidebar.jsp"></jsp:include>

<div class="ps-page--my-account">
    <div class="ps-breadcrumb">
        <div class="container">
<%--            <jsp:include page="../message/message.jsp"></jsp:include>--%>
            <ul class="breadcrumb">
                <li><a href="index.html">بایچه</a></li>
                <li>حساب من</li>
            </ul>
        </div>
    </div>
    <div class="ps-my-account">
        <div class="container">

            <div class="ps-form--account ps-tab-root" >
                <ul class="ps-tab-list">
                    <li class="active"><a href="#sign-in">بازنشانی کلمه عبور</a></li>
                </ul>
                <div class="ps-tabs">
                    <div class="ps-tab active" id="sign-in">
                        <div class="ps-form__content">
                            <h5>کلمه عبور جدید</h5>
                            <form action="${pageContext.servletContext.contextPath}/forgot-password/update-password"  method="post" modelAttribute="forgotUser" id="frm">
                                <div class="form-group">
                                    <input type="hidden" name="id" value="${forgotUser.id}" />
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="password" placeholder="کلمه عبور جدید" name="password" id="new">
                                    <span id="new-error" class="error invalid-feedback"></span>

                                </div>

                                <div class="form-group">
                                    <label>تکرار کلمه عبور</label>
                                    <input class="form-control" type="password" placeholder="تکرار کلمه عبور" id="confirm" >
                                    <span id="confirm-error" class="error invalid-feedback"></span>
                                </div>
                            </form>

                            <div class="form-group submtit">
                                <button class="ps-btn ps-btn--fullwidth" id="btnSubmit">ثبت</button>
                            </div>
                        </div>
                        <div class="ps-form__footer">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="../components/footer.jsp"></jsp:include>
<script>
    $('#btnSubmit')
        .on(
            'click',
            function () {
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
                if (newPass.val().length === 0) {
                    hasSubmit.push(1);
                    newPass.addClass(
                        'form-control is-invalid');
                    newPassError.html(
                        'کلمه عبور لازم است');
                }

                if (confirm.val().length === 0) {
                    hasSubmit.push(1);
                    confirm.addClass(
                        'form-control is-invalid');
                    confirmError.html(
                        'کلمه عبور لازم است');
                }

                if (confirm.val() !== newPass.val()) {
                    hasSubmit.push(1);
                    confirm.addClass(
                        'form-control is-invalid');
                    confirmError.html(
                        'تکرار کلمه عبور متفاوت است');
                }


                if (hasSubmit.length === 0) {
                    $('#frm').submit();
                }

            });
</script>

</body>

