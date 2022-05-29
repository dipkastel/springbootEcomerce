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

            <form class="ps-form--account ps-tab-root" action="${pageContext.servletContext.contextPath}/forgot-password" method="post" modelAttribute="forgotUser">
<%--                <jsp:include page="../message/message.jsp"></jsp:include>--%>

                <ul class="ps-tab-list">
                    <li class="active"><a href="#sign-in">فراموشی کلمه عبور</a></li>
                </ul>
                <div class="ps-tabs">
                    <div class="ps-tab active" id="sign-in">
                        <div class="ps-form__content">
                            <h5>تغییر کلمه عبور</h5>
                            <div class="form-group">
                                <input class="form-control" type="text" placeholder="نام کاربری" name="username">
                            </div>
                            <div class="form-group form-forgot">
                                <input class="form-control" type="email" placeholder="ایمیل" name="email">
                            </div>
                            <div class="form-group submtit">
                                <button class="ps-btn ps-btn--fullwidth">ارسال</button>
                            </div>
                        </div>
                        <div class="ps-form__footer">
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
<jsp:include page="../components/footer.jsp"></jsp:include>
</body>

