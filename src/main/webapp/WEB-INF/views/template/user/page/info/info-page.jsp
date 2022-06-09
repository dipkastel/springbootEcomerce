
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
                    <jsp:include page="../user/customer-sidebar.jsp"></jsp:include>
                    <%--                    side bar--%>

                </div>
                <div class="col-lg-8">
                    <div class="ps-section__right">
                        <div class="ps-form--account-setting">
                            <div class="ps-form__header">
                                <h3> اطلاعات کاربری</h3>
                            </div>
                            <br>
                            <div class="ps-form__content">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>نام</label>
                                            <input class="form-control" type="text" placeholder="نام" value="${customerInfo.firstName}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>نام خانوادگی</label>
                                            <input class="form-control" type="text" placeholder="نام خانوادگی" value="${customerInfo.lastName}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>تلفن همراه</label>
                                            <input class="form-control" type="text" placeholder="تلفن همراه" value="${customerInfo.phone}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>آدرس</label>
                                            <input class="form-control" type="text" placeholder="آدرس" value="${customerInfo.address}" readonly>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group submit">
                                <a class="ps-btn" href="${pageContext.servletContext.contextPath}/customer/info/update?id=${customerInfo.id}">ویرایش</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<jsp:include page="../../components/footer.jsp"></jsp:include>
</body>

