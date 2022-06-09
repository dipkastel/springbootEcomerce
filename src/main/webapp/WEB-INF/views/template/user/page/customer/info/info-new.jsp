<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="fa">
<head>

    <jsp:include page="../../../common/header.jsp">
        <jsp:param name="pageTitle" value="notrika | baseSettings"/>
        <jsp:param name="clientTheme" value="true"/>
        <jsp:param name="icons" value="true"/>
        <jsp:param name="bootstrap" value="true"/>
        <jsp:param name="carousel" value="true"/>
        <jsp:param name="favicon" value="true"/>
        <jsp:param name="lightgallery" value="true"/>
    </jsp:include>
</head>
<jsp:include page="../css/css.jsp"/>

<body>
<jsp:include page="../../../common/loader.jsp"/>
<jsp:include page="../../../common/topMenu.jsp"/>

<div class="fix-offset"></div>
<main class="ps-page--my-account">
    <section class="ps-section--account">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <%--                    side bar--%>
                    <jsp:include page="../../user/customer-sidebar.jsp"></jsp:include>
                    <%--                    side bar--%>

                </div>
                <div class="col-lg-8">
                    <div class="ps-section__right">
                        <div class="ps-form--account-setting">
                            <div class="ps-form__header">
                                <h3>ثبت اطلاعات کاربری</h3>
                            </div>
                            <br>
                            <form class="ps-form__content" action="${pageContext.servletContext.contextPath}/customer/info/new"
                            method="post" id="frm"
                            >
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>نام</label>
                                            <input class="form-control" type="text" placeholder="نام"
                                                   name="firstName" id="fname">
                                            <span id="fname-error" class="error invalid-feedback"></span>

                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>نام خانوادگی</label>
                                            <input class="form-control" type="text" placeholder="نام خانوادگی"
                                                name="lastName" id="lname" >
                                            <span id="lname-error" class="error invalid-feedback"></span>

                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>ایمیل</label>
                                            <input class="form-control" type="text" placeholder="ایمیل"
                                                  name="email" id="email">
                                            <span id="email-error" class="error invalid-feedback"></span>

                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>کد ملی</label>
                                            <input class="form-control" type="text" placeholder="کد ملی"
                                                   name="nationalCode" id="nationalCode">
                                            <span id="nationalCode-error" class="error invalid-feedback"></span>

                                        </div>
                                    </div>
                                </div>

                            </form>
                            <div class="form-group submit">
                                <button class="ps-btn" id="btnSave" >ثبت</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<jsp:include page="../../../common/footer.jsp"/>
<jsp:include page="../../../common/backToTop.jsp"/>
</body>

<jsp:include page="../../../common/scripts.jsp">
    <jsp:param name="jquery" value="true"/>
    <jsp:param name="carousel" value="true"/>
    <jsp:param name="bootstrap" value="true"/>
    <jsp:param name="backToTop" value="true"/>
    <jsp:param name="loader" value="true"/>
    <jsp:param name="quickView" value="true"/>
    <jsp:param name="tabs" value="true"/>
    <jsp:param name="lightgallery" value="true"/>
</jsp:include>
<jsp:include page="../js/js.jsp"/>
</html>

