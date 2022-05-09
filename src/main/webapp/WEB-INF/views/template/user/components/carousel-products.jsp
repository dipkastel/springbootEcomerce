<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="ps-section__content">
    <div class="ps-carousel--nav owl-slider" data-owl-auto="true"
         data-owl-loop="true" data-owl-speed="6000" data-owl-gap="0"
         data-owl-nav="true" data-owl-dots="true" data-owl-item="6"
         data-owl-item-xs="2" data-owl-item-sm="2" data-owl-item-md="3"
         data-owl-item-lg="3" data-owl-item-xl="6"
         data-owl-duration="500" data-owl-mousedrag="on">

        <c:forEach items="${carouselProducts}" var="p">
            <div class="ps-product">
                <div class="ps-product__thumbnail">
                    <a href="/product/detail?id=${p.id}"
                       onclick="addProductToViewList(${p.id})"><img
                            src="${pageContext.request.contextPath}/product/display/0&${p.id}"
                            alt="" style="width: 218px; height: 218px"></a>

                    <c:choose>
                        <c:when test="${p.enabled}">
                            <ul class="ps-product__actions">
                                <li class="toCart" value="${p.id}"><a
                                        data-toggle="tooltip" data-placement="top"
                                        title="اضافه به سبد خرید"><i class="icon-bag2"></i></a></li>
                                <li><a data-placement="top" title="نمایش سریع"
                                       data-toggle="modal"
                                       data-target="#product-quickview-${p.id}"><i
                                        class="icon-eye"></i></a></li>
                                <li><a data-toggle="tooltip" data-placement="top"
                                       title="اضافه به خرید بعدی" onclick="addToWishList(${p.id})"><i
                                        class="icon-heart"></i></a></li>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <div class="ps-product__badge out-stock">اتمام موجودی</div>
                        </c:otherwise>
                    </c:choose>

                </div>
                <div class="ps-product__container">

                    <div class="ps-product__content">
                        <a class="ps-product__title"
                           href="/product/detail?id=${p.id}"
                           onclick="addProductToViewList(${p.id})">${p.productName}</a>
                        <div class="ps-product__rating">
                            <c:set var="mapAvgStarByCategoryProduct"
                                   value="${mapAvgStarByCategory[c.name]}"></c:set>
                            <c:set var="avgCategory"
                                   value="${mapAvgStarByCategoryProduct[p.id]}"></c:set>
                            <select class="ps-rating" data-read-only="true">
                                <c:choose>
                                    <c:when test="${avgCategory != null}">
                                        <option
                                            ${(avgCategory==0 || avgCategory> 0) && avgCategory < 1
                                                    ? "selected" : "" }
                                                value="0">0</option>
                                        <option
                                            ${(avgCategory==1 || avgCategory> 1) && avgCategory < 2
                                                    ? "selected" : "" }
                                                value="1">1</option>
                                        <option
                                            ${(avgCategory==2 || avgCategory> 2) && avgCategory < 3
                                                    ? "selected" : "" }
                                                value="2">2</option>
                                        <option
                                            ${(avgCategory==3 || avgCategory> 3) && avgCategory < 4
                                                    ? "selected" : "" }
                                                value="3">3</option>
                                        <option
                                            ${(avgCategory==4 || avgCategory> 4) && avgCategory < 5
                                                    ? "selected" : "" }
                                                value="4">4</option>
                                        <option
                                            ${avgCategory==5 || avgCategory> 5 ? "selected" :
                                                    ""}
                                                value="5">5</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="0">0</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                            <c:set var="mapReviewByCategoryProduct"
                                   value="${mapReviewByCategory[c.name]}"></c:set>
                            <c:set var="r" value="${mapReviewByCategoryProduct[p.id]}"></c:set>
                            <span>(${r} نظر)</span>

                        </div>
                        <p class="ps-product__price sale">
                            <fmt:formatNumber type="number" value="${p.price}" />
                            تومان
                        </p>
                    </div>
                    <div class="ps-product__content hover">
                        <a class="ps-product__title"
                           href="${pageContext.servletContext.contextPath}/product/detail?id=${p.id}"
                           onclick="addProductToViewList(${p.id})">${p.productName}</a>
                        <p class="ps-product__price sale">
                            <fmt:formatNumber type="number" value="${p.price}" />
                            تومان
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>



    </div>
</div>
