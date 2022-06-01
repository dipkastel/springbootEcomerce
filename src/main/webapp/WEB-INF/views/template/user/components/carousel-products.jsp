<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                       onclick="addProductToViewList(${p.id})">
                        <img src="${pageContext.request.contextPath}/product/display/0&${p.id}"
                             alt="" style="width: 218px; height: 218px"></a>
                    <c:choose>
                        <c:when test="${p.stockQuantity>0}">
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
                           onclick="addProductToViewList(${p.id})">${p.name}</a>

                        <c:choose>
                        <c:when test="${p.stockQuantity>0}">
                        <p class="ps-product__price sale">

                            <c:choose>
                                <c:when test="${p.salePrice==0}">

                                    <fmt:formatNumber type="number" value="${p.regularPrice}"/>
                                    تومان
                                </c:when>
                                <c:otherwise>

                                    <del>
                                        <fmt:formatNumber type="number" value="${p.regularPrice}"/>
                                        تومان
                                    </del>
                                    <fmt:formatNumber type="number" value="${p.price}"/>
                                    تومان
                                </c:otherwise>
                            </c:choose>
                        </p>

                        </c:when>
                            <c:otherwise></c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </c:forEach>


    </div>
</div>
