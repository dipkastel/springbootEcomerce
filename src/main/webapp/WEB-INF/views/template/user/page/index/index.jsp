<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="fa">
<head>

    <jsp:include page="../../common/header.jsp">
        <jsp:param name="pageTitle" value="notrika | baseSettings"/>
        <jsp:param name="clientTheme" value="true"/>
        <jsp:param name="icons" value="true"/>
        <jsp:param name="bootstrap" value="true"/>
        <jsp:param name="carousel" value="true"/>
        <jsp:param name="favicon" value="true"/>
    </jsp:include>
</head>
<jsp:include page="css/css.jsp"/>

<body>

<jsp:include page="../../common/loader.jsp"/>
<jsp:include page="../../common/topMenu.jsp"/>
<jsp:include page="../../common/topMenuMobile.jsp"/>
<jsp:include page="../../common/sidebar.jsp"/>

<div class="fix-offset"></div>
<div id="homepage-1">
    <c:forEach items="${MainList}" var="m">
        <c:set var="mainListItem" value="${m}" scope="request"/>
        <jsp:include page="_list_manager.jsp"/>
    </c:forEach>
</div>
<jsp:include page="../../components/product-quick-view-modal.jsp" />
</body>
<jsp:include page="../../common/newsLetter.jsp"/>
<jsp:include page="../../common/footer.jsp"/>
<jsp:include page="../../common/backToTop.jsp"/>
<jsp:include page="../../common/chat.jsp"/>
<jsp:include page="../../common/scripts.jsp">
    <jsp:param name="jquery" value="true"/>
    <jsp:param name="carousel" value="true"/>
    <jsp:param name="bootstrap" value="true"/>
    <jsp:param name="backToTop" value="true"/>
    <jsp:param name="chat" value="true"/>
    <jsp:param name="loader" value="true"/>
    <jsp:param name="quickView" value="true"/>
    <jsp:param name="cardFunctions" value="true"/>
</jsp:include>
<jsp:include page="js/js.jsp"/>

</html>
