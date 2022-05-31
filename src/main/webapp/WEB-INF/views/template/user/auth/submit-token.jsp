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

            <form class="ps-form--account ps-tab-root" action="${pageContext.servletContext.contextPath}/forgot-password/submit-token" method="post" modelAttribute="token">
                <ul class="ps-tab-list">
                    <li class="active"><a href="#sign-in">بازنشانی کلمه عبور</a></li>
                </ul>
                <div class="ps-tabs">
                    <div class="ps-tab active" id="sign-in">
                        <div class="ps-form__content">
                            <h5>کلمه عبور خود را تغییر دهید</h5>
                            <div class="form-group">
                                <input class="form-control" type="text" placeholder="کلمه عبور جدید" name="resetToken">
                            </div>

                            <div class="form-group submtit">
                                <button class="ps-btn ps-btn--fullwidth">ثبت</button>
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

