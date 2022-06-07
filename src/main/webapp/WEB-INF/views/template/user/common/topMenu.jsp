
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<div class="header header--1 fixed-top" data-sticky="true">
    <div class="header__top ">
        <div class="ps-container">
            <div class="header__left">
                <div class="menu--product-categories">
                    <div class="menu__toggle"><i class="icon-menu"></i><span> دسته بندی محصولات</span></div>
                    <div class="menu__content">
                        <%--                        product category--%>
                        <ul class="menu--dropdown">

                            <c:forEach items="${menu}" var="c">
                                <li class="menu-item-has-children has-mega-menu"><a
                                        href="${pageContext.servletContext.contextPath}${c.url}">${c.name}</a>
                                    <div class="mega-menu">
                                        <div class="mega-menu__column">
                                            <ul class="mega-menu__list">
                                                <c:forEach items="${c.subMenu}" var="t">
                                                    <li class="subsub-menu">
                                                        <a href="${pageContext.servletContext.contextPath}${t.url}">${t.name}</a>

                                                        <div class="sub-mega-menu">
                                                            <div class="mega-menu__column">
                                                                <ul class="mega-menu__list">
                                                                    <c:forEach items="${t.subMenu}" var="e">
                                                                        <li>
                                                                            <a href="${pageContext.servletContext.contextPath}${e.url}">${e.name}</a>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>

                                    </div>
                                </li>

                            </c:forEach>
                        </ul>
                        <%--                        product category--%>

                    </div>
                    <%--                </div><a class="ps-logo" href="index.html"><img src="${pageContext.servletContext.contextPath}/img/logo_light.png" alt=""></a></div>--%>
                </div>
                <a class="ps-logo" href="${pageContext.servletContext.contextPath}/"><img
                        src="${pageContext.servletContext.contextPath}/img/Angry-Nerds-2.png" alt=""></a></div>

            <div class="header__center">
                <form class="ps-form--quick-search" action="${pageContext.servletContext.contextPath}/product"
                      method="post">
                    <div class="form-group--icon"><i class="icon-chevron-down"></i>
                        <select class="form-control categorySearch" style="width: 150px" name="category">
                            <option value="" selected="selected">همه دسته ها</option>
                            <c:forEach items="${categories}" var="c">
                                <option value="${c.id}">${c.name}</option>
                            </c:forEach>

                        </select>
                    </div>
                    <input class="form-control" type="text" placeholder="جستجو ..." id="input-search" name="keyword"
                           maxlength="20">
                    <%--                    <button>Search</button>--%>
                    <div class="ps-panel--search-result">
                        <div class="ps-panel__content tableSearch">
                        </div>
                    </div>
                </form>
            </div>
            <div class="header__right">
                <div class="header__actions">
                    <a class="header__extra" style="display: none"><i class="icon-chart-bars"></i><span><i>0</i></span></a>
                    <a class="header__extra"
                       href="${pageContext.servletContext.contextPath}/product/wishlist"><i
                            class="icon-heart"></i><span><i id="countWish">0</i></span></a>
                    <div class="ps-cart--mini"><a class="header__extra"><i class="icon-bag2"></i><span><i
                            id="cartItemCount-1">0</i></span></a>
                        <div class="ps-cart__content" id="cart-content-1" style="display: none">
                            <div class="ps-cart__items">
                                <div class="ps-product--cart-mobile">
                                    <div class="ps-product__thumbnail"><a><img
                                            src="${pageContext.servletContext.contextPath}/img/products/clothing/7.jpg"
                                            alt=""></a></div>
                                    <div class="ps-product__content"><a class="ps-product__remove"><i
                                            class="icon-cross "></i></a><a href="product-default.html">--</a>
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
                                <h3>مجموع:<strong>0</strong>تومان</h3>
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

                                <ul class="navigation__extra">
                                    <li>
                                        <div class="ps-dropdown language">
                                            <div class="ps-block__right"><a
                                                    <c:choose>
                                                        <c:when test="${user.role  == 'ROLE_USER' }">
                                                            href="${pageContext.servletContext.contextPath}/customer"
                                                        </c:when>
                                                        <c:otherwise>
                                                            href="${pageContext.servletContext.contextPath}/admin"
                                                        </c:otherwise>
                                                    </c:choose>

                                            >${user.username}</a></div>
                                            <ul class="ps-dropdown-menu">
                                                <c:choose>
                                                    <c:when test="${user.role  == 'ROLE_USER' }">
                                                        <li>
                                                            <a href="${pageContext.servletContext.contextPath}/customer/info">حساب
                                                                کاربری</a></li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li><a href="${pageContext.servletContext.contextPath}/admin">مدیریت</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <li><a href="${pageContext.servletContext.contextPath}/logout">خروج</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </c:when>

                            <c:otherwise>
                                <div class="ps-block__right"><a href="${pageContext.servletContext.contextPath}/login">ورود</a><a
                                        href="${pageContext.servletContext.contextPath}/register">ثبت نام</a></div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <nav class="navigation ">
        <div class="ps-container">
            <div class="navigation__right">
                <ul class="menu">

                    <c:forEach items="${menu}" var="c">

                        <li>

                            <div class="menu--product-categories">
                                <div class="menu__toggle"><span> ${c.name}</span></div>
                                <div class="menu__content">
                                        <%--                        product category--%>

                                    <ul class="menu--dropdown">
                                        <c:forEach items="${c.subMenu}" var="d">
                                            <li class="menu-item-has-children has-mega-menu">
                                                <a href="${pageContext.servletContext.contextPath}/product?category=${d.id}">
                                                        ${d.name}
                                                </a>
                                                <div class="mega-menu">
                                                    <div class="mega-menu__column">
                                                        <ul class="mega-menu__list">
                                                            <c:forEach items="${d.subMenu}" var="t">
                                                                <li>
                                                                    <a href="${pageContext.servletContext.contextPath}/product?category=${d.id}&type=${t.id}">${t.name}</a>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </li>

                                        </c:forEach>
                                    </ul>
                                        <%--                        product category--%>

                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <ul class="navigation__extra">
                    <li><a href="${pageContext.servletContext.contextPath}/product">فروش در بایچه</a></li>
                    <li><a href="${pageContext.servletContext.contextPath}/customer/product/checkout-page">پیگیری
                        سفارشات</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
