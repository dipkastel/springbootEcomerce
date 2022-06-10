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
                        <div class="ps-section--account-setting">
                            <div class="ps-section__content">

                                <div class="table-responsive">
                                    <table class="table ps-table--whishlist ps-table--responsive">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th>نام محصول</th>
                                            <th>قیمت</th>
                                            <th>وضعیت</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody id="wishProductTable">
                                        <c:choose>
                                            <c:when test="${not empty wishlist}">
                                                <c:forEach var="product" items="${wishlist}">
                                                    <tr>
                                                        <td data-label="Remove"><a
                                                                onClick="removeFromWishList(${product.id})"><i
                                                                class="icon-cross"></i></a></td>
                                                        <td data-label="Product">
                                                            <div class="ps-product--cart">
                                                                <div class="ps-product__thumbnail">
                                                                    <a
                                                                            href="${pageContext.servletContext.contextPath}/product/detail?id=${product.id}"><img
                                                                            src="${pageContext.request.contextPath}/product/display/0&${product.id}"
                                                                            alt="" width="100px" height="100px"
                                                                            onclick="addProductToViewList(${product.id})"></a>
                                                                </div>
                                                                <div class="ps-product__content">
                                                                    <a
                                                                            href="${pageContext.servletContext.contextPath}/product/detail?id=${product.id}"
                                                                            onclick="addProductToViewList(${product.id})">${product.productName }</a>
                                                                    <p>
                                                                        فروشنده:<strong> بایچه</strong>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td class="price text-center" data-label="Price">${product.price}تومان</td>
                                                        <td data-label="Status" class="text-center"><span
                                                                class="ps-tag ps-tag--in-stock ">${product.enabled ?"موجود":""}</span></td>
                                                        <td data-label="action"><a class="ps-btn"
                                                                                   onclick="addItemToCart(${product.id})">افزودن به سبد خرید</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td colspan="5" class="text-center"><h1>محصولی وجود ندارد!</h1></td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                        </tbody>
                                    </table>
                                </div>
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



