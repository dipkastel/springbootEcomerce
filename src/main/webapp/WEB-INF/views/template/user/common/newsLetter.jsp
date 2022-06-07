<%@ page contentType="text/html; charset=UTF-8" %>
<div class="ps-newsletter" >
    <div class="ps-container">
        <div class="ps-form--newsletter"  >
            <div class="row">
                <div class="col-xl-5 col-lg-12 col-md-12 col-sm-12 col-12 ">
                    <div class="ps-form__left">
                        <h3>خبر نامه</h3>
                        <p>برای اطلاع از محصولات ، جشنواره ها ، تخفیف ها و... عضو شوید</p>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-12 col-md-12 col-sm-12 col-12 ">
                    <div class="ps-form__right">
                        <form action="${pageContext.servletContext.contextPath}/subcriber" method="post" id="frmsubcriber" class="mb-3">
                            <div class="ps-form__content">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>نام</label>
                                            <input class="form-control" type="text" placeholder="نام" name="firstName" id="fnameSub" maxlength="250" required>
                                            <%--											<span id="fname-errorSub" class="error invalid-feedback"></span>--%>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>نام خانوادگی</label>
                                            <input class="form-control" type="text" placeholder="نام خانوادگی" name="lastName" id="lnameSub" maxlength="250" required>
                                            <%--											<span id="lname-errorSub" class="error invalid-feedback"></span>--%>

                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <label>ایمیل</label>
                                        <div class="form-group--nest">
                                            <input class="form-control" type="email" placeholder="ایمیل" name="email" id="emailSub" maxlength="250" required>
                                            <%--											<span id="email-errorSub" class="error invalid-feedback"></span>--%>
                                            <button class="ps-btn" id="btnSubcribe">عضویت</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
