<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="fa">
<head>

    <jsp:include page="../common/header.jsp">
        <jsp:param name="pageTitle" value="notrika | internal-error"/>
        <jsp:param name="clientTheme" value="true"/>
        <jsp:param name="bootstrap" value="true"/>
        <jsp:param name="favicon" value="true"/>
    </jsp:include>
</head>
<jsp:include page="css/css.jsp"/>

<body>
<div class="ps-page--404">
    <div class="container">
        <div class="ps-section__content"><img src="${pageContext.servletContext.contextPath}/img/404.jpg" alt="">
            <h3>متاسفانه! صفحه یافت نشد</h3>
            <p>ما نتوانستیم آن چه به دنبالش بودید را بیابیم شاید جستجو در <a href="/"> صفحه اصلی </a> کمک کننده باشد</p>
<%--            <form class="ps-form--widget-search" action="do_action" method="get">--%>
<%--                <input class="form-control" type="text" placeholder="Search...">--%>
<%--                <button><i class="icon-magnifier"></i></button>--%>
<%--            </form>--%>
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
