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
    <jsp:include page="_mastertag.jsp"/>
    <jsp:include page="_banners.jsp"/>

<%--    &lt;%&ndash;    top product&ndash;%&gt;--%>
<%--    <div class="ps-product-list ps-clothings">--%>
<%--        <div class="ps-container">--%>

<%--            <div class="ps-section__header">--%>
<%--                <div class="ps-block--countdown-deal">--%>
<%--                    <div class="ps-block__right">--%>
<%--                        <figure>--%>
<%--                            <figcaption>محصولات برتر</figcaption>--%>
<%--                        </figure>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <c:set var="carouselProducts" value="${topProducts}" scope="request"/>--%>
<%--            <jsp:include page="../../components/carousel-products.jsp"/>--%>

<%--        </div>--%>
<%--    </div>--%>

<%--    &lt;%&ndash;    top product&ndash;%&gt;--%>

<%--    <c:forEach items="${categories}" var="c">--%>
<%--        <c:if test="${not empty productByCategory[c.name]}">--%>
<%--            <div class="ps-product-list ps-clothings">--%>
<%--                <div class="ps-container">--%>
<%--                    <div class="ps-section__header">--%>
<%--                        <h3>${c.name}</h3>--%>
<%--                        <ul class="ps-section__links">--%>
<%--                            <li><a--%>
<%--                                    href="${pageContext.servletContext.contextPath}/product?category=${c.id}">بیشتر--%>
<%--                                ...</a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>

<%--                    <c:set var="carouselProducts" value="${productByCategory[c.name]}" scope="request"/>--%>
<%--                    <jsp:include page="../../components/carousel-products.jsp"/>--%>


<%--                </div>--%>
<%--            </div>--%>
<%--        </c:if>--%>
<%--    </c:forEach>--%>
<%--    <c:if test="${not empty viewlist}">--%>
<%--        <div class="ps-page--product">--%>
<%--            <div class="ps-container">--%>

<%--                <div class="ps-section__header">--%>
<%--                    <h3>مشاهدات اخیر</h3>--%>
<%--                </div>--%>

<%--                <c:set var="carouselProducts" value="${viewlist}" scope="request"/>--%>
<%--                <jsp:include page="../../components/carousel-products.jsp"/>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--    </c:if>--%>


<%--    <jsp:include page="_site-features.jsp"/>--%>
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

