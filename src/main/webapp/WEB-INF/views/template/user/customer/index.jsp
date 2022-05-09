
<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:include page="../components/head.jsp"></jsp:include>

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
                    <jsp:include page="customer-sidebar.jsp"></jsp:include>
                    <%--                    side bar--%>

                </div>
                <div class="col-lg-8">
                    <div class="ps-section__right">
                        <form class="ps-form--account-setting" action="index.html" method="get">
                            <div class="ps-form__header">
                                <h3> اطلاعات کاربری</h3>
                            </div>
                            <div class="ps-form__content">
                                <div class="form-group">
                                    <label>نام</label>
                                    <input class="form-control" type="text" placeholder="نام">
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>تلفن همراه</label>
                                            <input class="form-control" type="text" placeholder="تلفن همراه">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>ایمیل</label>
                                            <input class="form-control" type="text" placeholder="ایمیل">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>تاریخ تولد</label>
                                            <input class="form-control" type="text" placeholder="تاریخ تولد">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Gender</label>
                                            <select class="form-control">
                                                <option value="1">مرد</option>
                                                <option value="2">زن</option>
                                                <option value="3">دیگر</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group submit">
                                <button class="ps-btn">به روز رسانی</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<jsp:include page="../components/footer.jsp"></jsp:include>
</body>

