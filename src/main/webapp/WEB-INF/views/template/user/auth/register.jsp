<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

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

<body>
<jsp:include page="../components/header.jsp"></jsp:include>
<jsp:include page="../components/sidebar.jsp"></jsp:include>

<div class="ps-page--my-account">
    <div class="ps-breadcrumb">
        <div class="container">
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
                    <li class="active"><a href="#sign-in">ثبت نام</a></li>
                </ul>
                <div class="ps-tabs">
                    <div class="ps-tab active" id="sign-in">
                        <div class="ps-form__content">
                            <h5>ثبت حساب جدید</h5>
                            <form action="${pageContext.servletContext.contextPath}/register" method="post" modelAttribute="user" id="frm">
                                <div class="form-group">
                                    <input class="form-control" type="text" placeholder="نام کاربری" name="username" id="uname">
                                    <span id="uname-error" class="error invalid-feedback"></span>
                                </div>
                                <div class="form-group form-forgot">
                                    <input class="form-control" type="password" placeholder="رمز عبور" name="password" id="pass">
                                    <span id="pass-error" class="error invalid-feedback"></span>
                                </div>

                                <div class="form-group form-forgot">
                                    <input class="form-control" type="password" placeholder="تکرار رمز"  id="confirm">
                                    <span id="confirm-error" class="error invalid-feedback"></span>
                                </div>

                                <div class="form-group form-forgot">
                                    <input class="form-control" type="email" placeholder="ایمیل" name="email" id="email">
                                    <span id="email-error" class="error invalid-feedback"></span>

                                </div>
                            </form>
                            <div class="form-group submtit">
                                <button class="ps-btn ps-btn--fullwidth" id="btnRegister">ثبت نام</button>
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
    function IsEmail(email) {
        var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if(!regex.test(email)) {
            return false;
        }else{
            return true;
        }
    }

    $('#btnRegister')
        .on(
            'click',
            function () {
                let uname = $('#uname');
                let unameError = $('#uname-error');
                let pass = $('#pass');
                let passError = $('#pass-error');
                let email = $('#email');
                let emailError = $('#email-error');
                let confirmPass = $('#confirm');
                let confirmPassError = $('#confirm-error');
                let hasSubmit = [];

                if (confirmPass.val().length >250) {
                    hasSubmit.push(1);
                    confirmPass.addClass(
                        'form-control is-invalid');
                    confirmPassError.html(
                        'کلمه عبور طولانی است');
                }
                if (email.val().length >250) {
                    hasSubmit.push(1);
                    email.addClass(
                        'form-control is-invalid');
                    emailError.html(
                        'ایمیل طولانی است');
                }
                if (pass.val().length >250) {
                    hasSubmit.push(1);
                    pass.addClass(
                        'form-control is-invalid');
                    passError.html(
                        'کلمه عبور طولانی است');
                }
                if (uname.val().length >250) {
                    hasSubmit.push(1);
                    uname.addClass(
                        'form-control is-invalid');
                    unameError.html(
                        'نام کاریری طولانی است');
                }

                if (uname.val().length === 0) {
                    hasSubmit.push(1);
                    uname.addClass(
                        'form-control is-invalid');
                    unameError.html(
                        'نام کاریری لازم است');
                }

                if (pass.val().length === 0) {
                    hasSubmit.push(1);
                    pass.addClass(
                        'form-control is-invalid');
                    passError.html(
                        'کلمه عبور لازم است');
                }

                if(IsEmail(email.val())==false){
                    hasSubmit.push(1);
                    email.addClass(
                        'form-control is-invalid');
                    emailError.html(
                        'ایمیل صحیح نیست');
                }


                if (email.val().length === 0) {
                    hasSubmit.push(1);
                    email.addClass(
                        'form-control is-invalid');
                    emailError.html(
                        'ایمیل لازم است');
                }

                if (confirmPass.val().length === 0) {
                    hasSubmit.push(1);
                    confirmPass.addClass(
                        'form-control is-invalid');
                    confirmPassError.html(
                        'کلمه عبور لازم است');
                }

                if (confirmPass.val() !== pass.val()) {
                    hasSubmit.push(1);
                    confirmPass.addClass(
                        'form-control is-invalid');
                    confirmPassError.html(
                        'تکرار کلمه عبور متفاوت است');
                }


                if (hasSubmit.length === 0) {
                    $('#frm').submit();
                }

            });
</script>

</body>

