<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../../components/head.jsp"></jsp:include>

<body>
<jsp:include page="../../components/header.jsp"></jsp:include>
<jsp:include page="../../components/sidebar.jsp"></jsp:include>
<br><br><br><br><br><br>
<main class="ps-page--my-account">
    <section class="ps-section--account">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <%--                    side bar--%>
                    <jsp:include page="../customer-sidebar.jsp"></jsp:include>
                    <%--                    side bar--%>

                </div>
                <div class="col-lg-8">
                    <div class="ps-section__right">
                        <div class="ps-form--account-setting">
                            <div class="ps-form__header">
                                <h3>ویرایش اطلاعات کاربری</h3>
                            </div>
                            <br>
                            <form class="ps-form__content" action="${pageContext.servletContext.contextPath}/customer/info/update"
                            method="post" id="frm"
                            >
                                <div class="row">
                                    <input type="hidden" name="id" value="${customerInfo.id}">
                                    <input type="hidden" name="user" value="${customerInfo.user.id}">

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>نام</label>
                                            <input class="form-control" type="text" placeholder="نام"
                                                   value="${customerInfo.firstName}" name="firstName" id="fname">
                                            <span id="fname-error" class="error invalid-feedback"></span>

                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>نام خانوادگی</label>
                                            <input class="form-control" type="text" placeholder="نام خانوادگی"
                                                   value="${customerInfo.lastName}" name="lastName" id="lname" >
                                            <span id="lname-error" class="error invalid-feedback"></span>

                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>تلفن همراه</label>
                                            <input class="form-control" type="text" placeholder="تلفن همراه"
                                                   value="${customerInfo.phone}" name="phone" id="phone">
                                            <span id="phone-error" class="error invalid-feedback"></span>

                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>آدرس</label>
                                            <input class="form-control" type="text" placeholder="آدرس"
                                                   value="${customerInfo.address}" name="address" id="address">
                                            <span id="address-error" class="error invalid-feedback"></span>

                                        </div>
                                    </div>
                                </div>

                            </form>

                            <div class="form-group submit">
                                <button class="ps-btn" id="btnSave">ذخیره</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<jsp:include page="../../components/footer.jsp"></jsp:include>
<script>
    function IsPhone(phone) {
        var regex =   /^09(1[0-9]|3[1-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}$/;
        if(!regex.test(phone)) {
            return false;
        }else{
            return true;
        }
    }

    $('#btnSave')
        .on(
            'click',
            function () {
                let fname = $('#fname');
                let fnameError = $('#fname-error');
                let lname = $('#lname');
                let lnameError = $('#lname-error');

                let phone = $('#phone');
                let phoneError = $('#phone-error');
                let address = $('#address');
                let addressError = $('#address-error');

                let hasSubmit = [];


                if (address.val().length > 250) {
                    hasSubmit.push(1);
                    address.addClass(
                        'form-control is-invalid');
                    addressError.html(
                        'آدرس طولانی است!');
                }
                if (phone.val().length > 250) {
                    hasSubmit.push(1);
                    phone.addClass(
                        'form-control is-invalid');
                    phoneError.html(
                        'تلفن همراه طولانی است!');
                }
                if (lname.val().length > 250) {
                    hasSubmit.push(1);
                    lname.addClass(
                        'form-control is-invalid');
                    lnameError.html(
                        'نام خانوادگی طولانی است!');
                }
                if (fname.val().length > 250) {
                    hasSubmit.push(1);
                    fname.addClass(
                        'form-control is-invalid');
                    fnameError.html(
                        'نام طولانی است!');
                }

                if (fname.val().length === 0) {
                    hasSubmit.push(1);
                    fname.addClass(
                        'form-control is-invalid');
                    fnameError.html(
                        'نام الزامی است!');
                }

                if (lname.val().length === 0) {
                    hasSubmit.push(1);
                    lname.addClass(
                        'form-control is-invalid');
                    lnameError.html(
                        'نام خانوادگی الزامی است!');
                }

                if(IsPhone(phone.val())==false){
                    hasSubmit.push(1);
                    phone.addClass(
                        'form-control is-invalid');
                    phoneError.html(
                        'تلفن همراه صحیح نیست!');
                }


                if (address.val().length === 0) {
                    hasSubmit.push(1);
                    address.addClass(
                        'form-control is-invalid');
                    addressError.html(
                        'آدرس الزامی است!');
                }



                if (hasSubmit.length === 0) {
                    $('#frm').submit();
                }

            });
</script>
</body>
