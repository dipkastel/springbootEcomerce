<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="fa">
<head>

    <jsp:include page="../common/header.jsp">
        <jsp:param name="pageTitle" value="notrika | baseSettings"/>
        <jsp:param name="clientTheme" value="true"/>
        <jsp:param name="icons" value="true"/>
        <jsp:param name="bootstrap" value="true"/>
        <jsp:param name="carousel" value="true"/>
        <jsp:param name="favicon" value="true"/>
        <jsp:param name="lightgallery" value="true"/>
    </jsp:include>
</head>
<jsp:include page="css/css.jsp"/>

<body>
<jsp:include page="../common/loader.jsp"/>
<jsp:include page="../common/topMenu.jsp"/>

<div class="fix-offset"></div>
<div class="ps-page--my-account">
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

<jsp:include page="../common/newsLetter.jsp"/>
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="../common/backToTop.jsp"/>
</body>

<jsp:include page="../common/scripts.jsp">
    <jsp:param name="jquery" value="true"/>
    <jsp:param name="carousel" value="true"/>
    <jsp:param name="bootstrap" value="true"/>
    <jsp:param name="backToTop" value="true"/>
    <jsp:param name="loader" value="true"/>
    <jsp:param name="quickView" value="true"/>
    <jsp:param name="tabs" value="true"/>
    <jsp:param name="lightgallery" value="true"/>
</jsp:include>
<jsp:include page="js/js.jsp"/>
</html>
