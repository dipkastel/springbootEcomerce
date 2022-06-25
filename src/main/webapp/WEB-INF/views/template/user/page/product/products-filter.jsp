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
        <jsp:param name="lightgallery" value="true"/>
    </jsp:include>
</head>
<jsp:include page="css/css.jsp"/>

<body>
<jsp:include page="../../common/loader.jsp"/>
<jsp:include page="../../common/topMenu.jsp"/>
<jsp:include page="../../common/topMenuMobile.jsp"/>
<jsp:include page="../../common/sidebar.jsp"/>

<div class="fix-offset"></div>
<div class="ps-page--shop" id="shop-sidebar">
    <div class="container">
        <div class="ps-layout--shop">
            <div class="row">
                <div class="ps-layout__left col-3">
                    <aside class="widget widget_shop"  >
                        <div class="ps-form--widget-search">
                            <input class="form-control" type="text" placeholder="Search Brand" id="searchBrand">
                            <button><i class="icon-magnifier"></i></button>
                        </div>
                        <div id="filter">
                            <figure class="ps-custom-scrollbar" data-height="250" id="filterBrand">
                                <%--                        ${not empty param.success}--%>
                                <%--                        ${param.brand}--%>
                                <c:choose>
                                    <c:when test="${not empty brandByProduct }">
                                        <c:forEach var="b" items="${brandByProduct}">
                                            <div class="ps-checkbox">
                                                <input class="form-control" type="checkbox" id="brand-${b.id}"  name="brand" value="${b.id}" >
                                                <label for="brand-${b.id}">${b.name}</label>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="b" items="${brandsByCategory[categoryByProduct.name]}">
                                            <div class="ps-checkbox">
                                                <input class="form-control" type="checkbox" id="brand-${b.id}"  name="brand" value="${b.id}"
                                                    ${param.brand == b.id ?"checked":""}
                                                >
                                                <label for="brand-${b.id}" >${b.name}</label>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </figure>
                            <figure id="filterPart" >
                                <h4 class="widget-title">By Parts</h4>
                                <c:choose>
                                    <c:when test="${not empty typeByProduct }">
                                        <c:forEach var="t" items="${typeByProduct}">
                                            <div class="ps-checkbox">
                                                <input class="form-control" type="checkbox" id="type-${t}"  name="type" value="${t}">
                                                <label for="type-${t}">${t}</label>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="t" items="${typeByCategory[categoryByProduct.name]}">
                                            <div class="ps-checkbox">
                                                <input class="form-control" type="checkbox" id="type-${t.name}"  name="type" value="${t.name}"
                                                    ${param.type == t.id ?"checked":""}
                                                >
                                                <label for="type-${t.name}" >${t.name}</label>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>

                            </figure>
                        </div>
                        <hr>
                        <figure id="filterPrice">
                            <h4 class="widget-title">By Price</h4>
                            <%--                        <form action="" method="get" class="text-center">--%>
                            <div class="d-flex ml-4" style="align-items: center">
                                <input class="form-control" type="number" name="priceFrom" id="from" placeholder="From" style = "width: 100px" required>
                                <div style="height: 1px; width: 10px;    background: #bdbdbd;     margin: 0 .625rem;"></div>
                                <input  class="form-control" type="number" name="priceTo" id="to" placeholder="To" style = "width: 100px" required>
                            </div>
                            <button class="ps-btn mt-3 " style="padding: 10px 55px;margin-left: 40px" id="btnPrice">Apply</button>
                            <%--                        </form>--%>
                        </figure>
                        <figure>
                            <h4 class="widget-title">By Rating</h4>
                            <div class="ps-checkbox">
                                <input class="form-control" type="checkbox" id="review-1" name="review">
                                <label for="review-1"><span><i class="fa fa-star rate"></i><i class="fa fa-star rate"></i><i class="fa fa-star rate"></i><i class="fa fa-star rate"></i><i class="fa fa-star rate"></i></span><small>(13)</small></label>
                            </div>
                            <div class="ps-checkbox">
                                <input class="form-control" type="checkbox" id="review-2" name="review">
                                <label for="review-2"><span><i class="fa fa-star rate"></i><i class="fa fa-star rate"></i><i class="fa fa-star rate"></i><i class="fa fa-star rate"></i><i class="fa fa-star"></i></span><small>(13)</small></label>
                            </div>
                            <div class="ps-checkbox">
                                <input class="form-control" type="checkbox" id="review-3" name="review">
                                <label for="review-3"><span><i class="fa fa-star rate"></i><i class="fa fa-star rate"></i><i class="fa fa-star rate"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span><small>(5)</small></label>
                            </div>
                            <div class="ps-checkbox">
                                <input class="form-control" type="checkbox" id="review-4" name="review">
                                <label for="review-4"><span><i class="fa fa-star rate"></i><i class="fa fa-star rate"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span><small>(5)</small></label>
                            </div>
                            <div class="ps-checkbox">
                                <input class="form-control" type="checkbox" id="review-5" name="review">
                                <label for="review-5"><span><i class="fa fa-star rate"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span><small>(1)</small></label>
                            </div>
                        </figure>
                        <figure>
                            <h4 class="widget-title">By Color</h4>
                            <div class="ps-checkbox ps-checkbox--color color-1 ps-checkbox--inline">
                                <input class="form-control" type="checkbox" id="color-1" name="size">
                                <label for="color-1"></label>
                            </div>
                            <div class="ps-checkbox ps-checkbox--color color-2 ps-checkbox--inline">
                                <input class="form-control" type="checkbox" id="color-2" name="size">
                                <label for="color-2"></label>
                            </div>
                            <div class="ps-checkbox ps-checkbox--color color-3 ps-checkbox--inline">
                                <input class="form-control" type="checkbox" id="color-3" name="size">
                                <label for="color-3"></label>
                            </div>
                            <div class="ps-checkbox ps-checkbox--color color-4 ps-checkbox--inline">
                                <input class="form-control" type="checkbox" id="color-4" name="size">
                                <label for="color-4"></label>
                            </div>
                            <div class="ps-checkbox ps-checkbox--color color-5 ps-checkbox--inline">
                                <input class="form-control" type="checkbox" id="color-5" name="size">
                                <label for="color-5"></label>
                            </div>
                            <div class="ps-checkbox ps-checkbox--color color-6 ps-checkbox--inline">
                                <input class="form-control" type="checkbox" id="color-6" name="size">
                                <label for="color-6"></label>
                            </div>
                            <div class="ps-checkbox ps-checkbox--color color-7 ps-checkbox--inline">
                                <input class="form-control" type="checkbox" id="color-7" name="size">
                                <label for="color-7"></label>
                            </div>
                            <div class="ps-checkbox ps-checkbox--color color-8 ps-checkbox--inline">
                                <input class="form-control" type="checkbox" id="color-8" name="size">
                                <label for="color-8"></label>
                            </div>
                        </figure>
                    </aside>
                </div>
                <div class="ps-layout__right col-9">
                    <div class="ps-shopping ps-tab-root">
                        <div class="ps-shopping__header">
                            <div id="productTotal">
                                <p><strong> ${countProduct}</strong> Products found</p>
                            </div>

                            <div class="ps-shopping__actions">
                                <select  class="form-control" id="cbxFilter">
                                    <option value="select" selected disabled>Select</option>
                                    <option value="lowToHigh">Sort by price: low to high</option>
                                    <option value="highToLow">Sort by price: high to low</option>
                                </select>
                            </div>
                        </div>
                        <div class="ps-tabs">
                            <div class="ps-tab active" id="tab-1">
                                <div class="ps-shopping-product">
                                    <div class="row listPage" id="filteredProduct">
                                        <%--                                    <c:forEach var="i" begin="1" end="100">--%>
                                        <%--                                        <span>${i}</span>--%>
                                        <%--                                    </c:forEach>--%>
                                        <c:choose>
                                            <c:when test="${not empty products}">
                                                <c:forEach var="p" items="${products}">
                                                         <span class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-6 ">
                                                            <div class="ps-product">
                                                                <div class="ps-product__thumbnail"><a href="${pageContext.servletContext.contextPath}/product/detail?id=${p.id}" onclick="addProductToViewList(${p.id})"><img src="${pageContext.request.contextPath}/product/display/0&${p.id}" alt="" style="width: 156px;height: 156px"></a>
                                                                    <ul class="ps-product__actions">
                                                                        <li value="${p.id}" class="toCart"><a  data-toggle="tooltip" data-placement="top" title="Add To Cart" ><i class="icon-bag2"></i></a></li>
                                                                        <li><a  data-placement="top" title="Quick View" data-toggle="modal" data-target="#product-quickview-${p.id}"><i class="icon-eye"></i></a></li>
                                                                        <li><a  data-toggle="tooltip" data-placement="top" title="Add to Whishlist" onclick="addToWishList(${p.id})"><i class="icon-heart"></i></a></li>
                                                                    </ul>
                                                                </div>
                                                                <div class="ps-product__container">
                                                                    <div class="ps-product__content"><a class="ps-product__title" href="${pageContext.servletContext.contextPath}/product/detail?id=${p.id}" onclick="addProductToViewList(${p.id})">${p.name}</a>
                                                                        <p class="ps-product__price">${p.price}تومان</p>
                                                                    </div>
                                                                    <div class="ps-product__content hover"><a class="ps-product__title" href="${pageContext.servletContext.contextPath}/product/detail?id=${p.id}" onclick="addProductToViewList(${p.id})">${p.name}</a>
                                                                        <p class="ps-product__price">${p.price}تومان</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </span>

                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <div class='ps-section__content' style='width: 100%'><h1 style='text-align:center'>No product found !!!</h1></div>

                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <%--                            <div class="ps-pagination">--%>
                                <%--                                <ul class="pagination">--%>
                                <%--                                    <li class="active"><a >1</a></li>--%>
                                <%--                                    <li><a >2</a></li>--%>
                                <%--                                    <li><a >3</a></li>--%>
                                <%--                                    <li><a >Next Page<i class="icon-chevron-right"></i></a></li>--%>
                                <%--                                </ul>--%>
                                <%--                            </div>--%>
                                <div id="paging" class="text-center" style="margin-top: 50px"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="productPopup">

<%--    <c:forEach var="p" items="${allProducts}">--%>

<%--        <div class="modal fade product-quickview-open" id="product-quickview-${p.id}" tabindex="-1" role="dialog" aria-labelledby="product-quickview-${p.id}" aria-hidden="true">--%>
<%--            <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--                <div class="modal-content"><span class="modal-close" data-dismiss="modal"><i class="icon-cross2"></i></span>--%>
<%--                    <article class="ps-product--detail ps-product--fullwidth ps-product--quickview">--%>
<%--                        <div class="ps-product__header">--%>
<%--                            <div class="ps-product__thumbnail" data-vertical="false">--%>
<%--                                <div class="ps-product__images" data-arrow="true">--%>
<%--                                    <div class="item"><img src="${pageContext.request.contextPath}/product/display/0&${p.id}" alt="" style="width: 404px;height: 404px"></div>--%>
<%--                                    <div class="item"><img src="${pageContext.request.contextPath}/product/display/1&${p.id}" alt="" style="width: 404px;height: 404px"></div>--%>
<%--                                    <div class="item"><img src="${pageContext.request.contextPath}/product/display/2&${p.id}" alt="" style="width: 404px;height: 404px"></div>--%>
<%--                                    <div class="item"><img src="${pageContext.request.contextPath}/product/display/3&${p.id}" alt="" style="width: 404px;height: 404px"></div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="ps-product__info">--%>
<%--                                <h1>${p.productName}</h1>--%>
<%--                                <div class="ps-product__meta">--%>
<%--                                    <p>Brand: <a href="${pageContext.servletContext.contextPath}/product/detail?id=${p.id}">${p.brand.name}</a></p>--%>
<%--                                    <div class="ps-product__rating">--%>
<%--                                        <select class="ps-rating" data-read-only="true">--%>
<%--                                            <option value="1">1</option>--%>
<%--                                            <option value="1">2</option>--%>
<%--                                            <option value="1">3</option>--%>
<%--                                            <option value="1">4</option>--%>
<%--                                            <option value="2">5</option>--%>
<%--                                        </select><span>(1 review)</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <h4 class="ps-product__price">$${p.price}</h4>--%>
<%--                                <div class="ps-product__desc">--%>
<%--                                    <p>Sold By:<a href="${pageContext.servletContext.contextPath}/product/detail?id=${p.id}"><strong> Angry Nerds</strong></a></p>--%>
<%--                                    <div class="ps-list--dot">--%>
<%--                                            ${p.shortDescription}--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="ps-product__shopping"><a class="ps-btn ps-btn--black toCart"  value="${p.id}">Add to cart</a><a class="ps-btn buyNow" value="${p.id}">Buy Now</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </article>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--    </c:forEach>--%>

</div>


</body>

<jsp:include page="../../common/newsLetter.jsp"/>
<jsp:include page="../../common/footer.jsp"/>
<jsp:include page="../../common/backToTop.jsp"/>
<jsp:include page="../../common/scripts.jsp">
    <jsp:param name="jquery" value="true"/>
    <jsp:param name="carousel" value="true"/>
    <jsp:param name="bootstrap" value="true"/>
    <jsp:param name="backToTop" value="true"/>
    <jsp:param name="loader" value="true"/>
    <jsp:param name="quickView" value="true"/>
    <jsp:param name="tabs" value="true"/>
    <jsp:param name="lightgallery" value="true"/>
</jsp:include>
<jsp:include page="js/products-filter.jsp"/>
</html>

