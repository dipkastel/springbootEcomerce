<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="fa">
<head>

    <jsp:include page="../common/header.jsp">
        <jsp:param name="pageTitle" value="notrika | method-denied"/>
        <jsp:param name="clientTheme" value="true"/>
        <jsp:param name="bootstrap" value="true"/>
        <jsp:param name="favicon" value="true"/>
    </jsp:include>
</head>
<jsp:include page="css/css.jsp"/>

<body>

<div class="ps-page--comming-soon">
    <div class="container">
        <div class="ps-page__header">
            <h1 class="text-danger">اجازه انجام عملیات صادر نشده است</h1>

        </div>
        <div class="ps-page__content"><img src="${pageContext.servletContext.contextPath}/img/coming-soon.jpg" alt="">
            <figure>
                <figcaption>صفحه را مجددا بارگذاری نمایید در صورتی که مشکل حل نشد با ما تماس بگیرید</figcaption>
            </figure>
        </div>
    </div>
</div>
</body>
<jsp:include page="../common/scripts.jsp">
    <jsp:param name="jquery" value="true"/>
    <jsp:param name="bootstrap" value="true"/>
</jsp:include>
<jsp:include page="js/js.jsp"/>

</html>
