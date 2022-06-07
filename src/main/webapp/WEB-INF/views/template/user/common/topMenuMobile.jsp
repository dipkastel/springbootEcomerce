
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<div class="header header--mobile" data-sticky="true">
    <div class="header__top">
        <div class="header__left">
            <p>به فروشگاه بایچه خوش آمدید</p>
        </div>
        <div class="header__right">
            <ul class="navigation__extra">
                <li><a>فروش در بایچه</a></li>
                <li><a>پیگیری سفارشات</a></li>
                <li>
                    <div class="ps-dropdown"><a>تومان</a>
                        <ul class="ps-dropdown-menu">
                            <li><a>تومان</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <div class="ps-dropdown language"><a><img
                            src="${pageContext.servletContext.contextPath}/img/flag/fa.png" alt="">فارسی</a>
                        <ul class="ps-dropdown-menu">
                            <li><a><img src="${pageContext.servletContext.contextPath}/img/flag/fa.png" alt="">
                                فارسی</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="navigation--mobile">
        <div class="navigation__left"><a class="ps-logo" href="/">
            <%--            <img src="${pageContext.servletContext.contextPath}/img/logo_light.png" alt="">--%>
            <img src="${pageContext.servletContext.contextPath}/img/Angry-Nerds-2.png" alt="">

        </a></div>
        <div class="navigation__right">
            <div class="header__actions">
                <div class="ps-cart--mini appendFooter"><a class="header__extra"><i class="icon-bag2"></i><span><i
                        id="cartItemCount-2">0</i></span></a>
                    <div class="ps-cart__content" id="cart-content-2" style="display: none">
                        <div class="ps-cart__items">
                            <div class="ps-product--cart-mobile">
                                <div class="ps-product__thumbnail"><a><img
                                        src="${pageContext.servletContext.contextPath}/img/products/clothing/7.jpg"
                                        alt=""></a></div>
                                <div class="ps-product__content"><a class="ps-product__remove"><i
                                        class="icon-cross"></i></a><a href="product-default.html">--</a>
                                    <p><strong>فروشنده:</strong> --</p><small>--</small>
                                </div>
                            </div>
                            <div class="ps-product--cart-mobile">
                                <div class="ps-product__thumbnail"><a><img
                                        src="${pageContext.servletContext.contextPath}/img/products/clothing/5.jpg"
                                        alt=""></a></div>
                                <div class="ps-product__content"><a class="ps-product__remove"><i
                                        class="icon-cross"></i></a><a href="product-default.html">--</a>
                                    <p><strong>فروشنده:</strong> --</p><small>--</small>
                                </div>
                            </div>
                        </div>
                        <div class="ps-cart__footer">
                            <h3>مجموع:<strong>--</strong>تومان</h3>
                            <figure>
                                <c:choose>
                                    <c:when test="${user !=null}">
                                        <a class="ps-btn"
                                           href="${pageContext.servletContext.contextPath}/customer/product/checkout-page">سبد
                                            خرید</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="ps-btn" href="${pageContext.servletContext.contextPath}/cart">سبد
                                            خرید</a>
                                    </c:otherwise>
                                </c:choose>
                                <a class="ps-btn"
                                   href="${pageContext.servletContext.contextPath}/customer/product/checkout">صورت
                                    حساب</a></figure>
                        </div>
                    </div>
                </div>
                <div class="ps-block--user-header">
                    <div class="ps-block__left"><i class="icon-user"></i></div>
                    <c:choose>
                        <c:when test="${user !=null }">
                            <c:choose>
                                <c:when test="${user.role  == 'ROLE_USER' }">
                                    <div class="ps-block__right"><a
                                            href="${pageContext.servletContext.contextPath}/customer/info">${user.username}</a>
                                    </div>

                                </c:when>
                                <c:otherwise>
                                    <div class="ps-block__right"><a
                                            href="${pageContext.servletContext.contextPath}/admin">${user.username}</a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <div class="ps-block__right"><a
                                    href="${pageContext.servletContext.contextPath}/login">ورود</a><a
                                    href="${pageContext.servletContext.contextPath}/register">ثبت نام</a></div>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
    </div>
    <div class="ps-search--mobile">
        <form class="ps-form--search-mobile" action="/" method="get">
            <div class="form-group--nest">
                <input class="form-control" type="text" placeholder="جستجو ...">
                <button><i class="icon-magnifier"></i></button>
            </div>
        </form>
    </div>
</div>
