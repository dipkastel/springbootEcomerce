<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="../../components/head.jsp"/>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bloomStyle.css">

<body>
<%--    header    --%>
<jsp:include page="../../components/header.jsp"/>
<%--    sidebar mobile    --%>
<jsp:include page="../../components/sidebar.jsp"/>

<div class="fix-offset"></div>
<div id="homepage-1">
    <c:forEach items="${MainList}" var="m">
        <c:set var="mainListItem" value="${m}" scope="request"/>
        <jsp:include page="_list_manager.jsp"/>
    </c:forEach>
</div>
<jsp:include page="../../components/footer.jsp"/>

<script>
    function addToWishList(id) {
        const data = null;
        const xhr = new XMLHttpRequest();
        xhr.addEventListener("readystatechange", function () {
            if (this.readyState === this.DONE) {
                if (this.responseText === "successful") {
                    msg("Add to wishlist sucessful!");
                } else if (this.responseText === "failed") {
                    msg("You can only add 1 time!");
                }
                initData();
            }
        });
        xhr
            .open(
                "GET",
                "${pageContext.servletContext.contextPath}/api/wish-list/addProductToWishList?id_product="
                + id);
        xhr.setRequestHeader('Content-type', 'application/json');
        xhr.send(data);
    }

    function addProductToViewList(id) {
        const data = null;
        const xhr = new XMLHttpRequest();
        xhr.addEventListener("readystatechange", function () {
        });
        xhr
            .open(
                "GET",
                "${pageContext.servletContext.contextPath}/api/wish-list/addProductToViewList?id_product="
                + id);
        xhr.setRequestHeader('Content-type', 'application/json');
        xhr.send(data);
    }
</script>
</body>

