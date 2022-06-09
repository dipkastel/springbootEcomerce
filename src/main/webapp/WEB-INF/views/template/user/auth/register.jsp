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
                                    <input class="form-control" type="text" placeholder="شماره تلفن همراه" name="phoneNumber" id="phone">
                                    <span id="phone-error" class="error invalid-feedback"></span>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="text" placeholder="نام و نام خانوادگی" name="userName" id="userName">
                                    <span id="userName-error" class="error invalid-feedback"></span>
                                </div>
                                <input class="form-control" type="text" name="refId" value="${refId}" hidden>
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
