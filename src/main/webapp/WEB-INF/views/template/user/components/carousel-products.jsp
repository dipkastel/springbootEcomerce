<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="${param.owlClass}" data-owl-auto="${param.dataOwlAuto}"
     data-owl-loop="${param.dataOwlLoop}"
     data-owl-speed="${param.dataOwlSpeed}"
     data-owl-gap="${param.dataOwlGap}"
     data-owl-nav="${param.dataOwlNav}"
     data-owl-dots="${param.dataOwlDots}"
     data-owl-item="${param.dataOwlItem}"
     data-owl-item-xs="${param.dataOwlItemXs}"
     data-owl-item-sm="${param.dataOwlItemSm}"
     data-owl-item-md="${param.dataOwlItemMd}"
     data-owl-item-lg="${param.dataOwlItemLg}"
     data-owl-item-xl="${param.dataOwlItemXl}"
     data-owl-duration="${param.dataOwlDuration}"
     data-owl-animate-in="${param.dataOwlAnimateIn}"
     data-owl-animate-out="${param.dataOwlAnimateOut}"
     data-owl-mousedrag="${param.dataOwlMousedrag}">

    <c:choose>
        <c:when test="${mainListItem.products.size()>0}">
            <c:forEach items="${mainListItem.products}" var="p">
                <div class="ps-product">
                    <div class="ps-product__thumbnail">
                        <a href="/product/nkp-${p.id}/${p.slug}"
                           onclick="addProductToViewList(${p.id})">
                            <img src="${pageContext.request.contextPath}/image/display/${p.images[0].id}"
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
        </c:when>
        <c:when test="${mainListItem.banners.size()>0}">

            <c:forEach items="${mainListItem.banners}" var="b">
                <a href="${b.url}">
                    <img class="ps-banner bg--cover"
                         src="/banner/display/${b.id}"
                         style="background-repeat: no-repeat; background-position: center center;">

                </a>
            </c:forEach>

        </c:when>
        <c:when test="${mainListItem.widgets.size()>0}">

            <c:forEach items="${mainListItem.widgets}" var="p">

                <c:choose>
                    <c:when test="${mainListItem.listType=='SUPER_CAT'}">

                        <div class="mi_mastertag_box">
                            <div class="ps-product__thumbnail">
                                <a href="/section/detail/${p.url}">
                                    <img src="${pageContext.request.contextPath}/image/display/${p.image.id}"
                                         class="mi_circle_image">

                                    <small>${p.name}</small>
                                </a>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/image/display/${p.image.id}"
                             class="banner-full">

                    </c:otherwise>
                </c:choose>

            </c:forEach>

        </c:when>
        <c:otherwise>undefined</c:otherwise>
    </c:choose>


</div>
