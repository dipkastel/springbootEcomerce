<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal fade product-quickview-open" id="product-quickview-${p.id}" tabindex="-1" role="dialog" aria-labelledby="product-quickview-${p.id}" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content"><span class="modal-close" data-dismiss="modal"><i class="icon-cross2"></i></span>
            <article class="ps-product--detail ps-product--fullwidth ps-product--quickview">
                <div class="ps-product__header">
                    <div class="ps-product__thumbnail" data-vertical="false">
                        <div class="ps-product__images" data-arrow="true">
                            <div class="item"><img src="${pageContext.request.contextPath}/product/display/0&${p.id}" alt="" style="width: 404px;height: 404px"></div>
                            <div class="item"><img src="${pageContext.request.contextPath}/product/display/1&${p.id}" alt="" style="width: 404px;height: 404px"></div>
                            <div class="item"><img src="${pageContext.request.contextPath}/product/display/2&${p.id}" alt="" style="width: 404px;height: 404px"></div>
                            <div class="item"><img src="${pageContext.request.contextPath}/product/display/3&${p.id}" alt="" style="width: 404px;height: 404px"></div>
                        </div>
                    </div>
                    <div class="ps-product__info">
                        <h1>${p.productName}</h1>
                        <div class="ps-product__meta">
                            <p>برند: <a href="${pageContext.servletContext.contextPath}/product/detail?id=${p.id}">${p.brand.name}</a></p>
                            <div class="ps-product__rating">
                                <select class="ps-rating" data-read-only="true">
                                    <option value="1">1</option>
                                    <option value="1">2</option>
                                    <option value="1">3</option>
                                    <option value="1">4</option>
                                    <option value="2">5</option>
                                </select><span>(1 نظر)</span>
                            </div>
                        </div>
                        <h4 class="ps-product__price">
                            <fmt:formatNumber type="number" value="${p.price}" /> تومان</h4>
                        <div class="ps-product__desc">
                            <p>فروشنده:<a href="${pageContext.servletContext.contextPath}/product/detail?id=${p.id}"><strong> بایچه</strong></a></p>
                            <div class="ps-list--dot">
                                ${p.shortDescription}
                            </div>
                        </div>
                        <div class="ps-product__shopping"><a class="ps-btn ps-btn--black toCart"  value="${p.id}">افزودن به سبد خرید</a><a class="ps-btn buyNow" value="${p.id}">خرید</a>
                        </div>
                    </div>
                </div>
            </article>
        </div>
    </div>
</div>
