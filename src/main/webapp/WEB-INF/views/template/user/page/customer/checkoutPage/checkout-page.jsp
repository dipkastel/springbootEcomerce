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

                <div class="col-lg-8" >
                    <div class="ps-section__right">
                        <div class="ps-section--account-setting">
                            <div class="ps-section__content ">
                                <div class="ps-form--account" style="max-width: 100%" >
                                    <ul class="ps-tab-list">
                                        <li class="${cartItems !=null ?'active':''}"><a href="#sign-in">صورت حساب</a></li>
                                        <li class="${cartItems !=null ?'':'active'}"><a href="#register">سفارشات</a></li>
                                    </ul>
                                    <div class="ps-tabs">
                                        <div class="ps-tab ${cartItems !=null ?'active':''}" id="sign-in">
                                            <div class="ps-form__content">
                                                    <div class="table-responsive">
                                                        <table class="table ps-table--shopping-cart ps-table--responsive">
                                                            <thead>
                                                            <tr>
                                                                <th>نام محصول</th>
                                                                <th>قیمت</th>
                                                                <th>تعداد</th>
                                                                <th>مجموع</th>
                                                                <th></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="tblShoppingCart">
                                                            <c:choose>
                                                                <c:when test="${cartItems !=null}">
                                                                    <c:forEach items="${cartItems}" var="item">
                                                                        <tr>
                                                                            <td data-label="Product">
                                                                                <div class="ps-product--cart">
                                                                                    <div class="ps-product__thumbnail"><a href="${pageContext.servletContext.contextPath}/product/detail?id=${item.product.id}" onclick="addProductToViewList(${item.product.id})"><img src="${pageContext.request.contextPath}/product/display/0&${item.product.id}" alt=""></a></div>
                                                                                    <div class="ps-product__content"><a href="${pageContext.servletContext.contextPath}/product/detail?id=${item.product.id}" onclick="addProductToViewList(${item.product.id})">${item.product.productName}</a>
                                                                                        <p>فروشنده:<strong> بایچه</strong></p>
                                                                                    </div>
                                                                                </div>
                                                                            </td>
                                                                            <td class="price text-center" data-label="Price">${item.product.price}تومان</td>
                                                                            <td data-label="Quantity" class="text-center">
                                                                                <div class="form-group--number">
                                                                                    <button class="up" value="${item.product.id}">+</button>
                                                                                    <button class="down" value="${item.product.id}">-</button>
                                                                                    <input class="form-control itemQty-${item.product.id}"   type="text" placeholder="1" value="${item.sellingQuantity}" readonly>
                                                                                </div>
                                                                                <span style="color: red" class="invalid-${item.product.id}"></span>
                                                                            </td>
                                                                            <td data-label="Total" class="text-center totalPriceItem-${item.product.id}">
                                                                                <fmt:formatNumber type="number" value="${item.totalPrice}"/>
                                                                                تومان
                                                                            </td>
                                                                            <td data-label="Actions"><a class="removeCartProduct" value="${item.product.id}"><i class="icon-cross"></i></a></td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <tr>
                                                                        <td colspan="5" class="text-center"><h1>محصولی انتخاب نشده!!!</h1></td>
                                                                    </tr>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            </tbody>
                                                            <c:if test="${cartItems !=null}">
                                                                <tfoot style="border-bottom: 1px solid #dee2e6">
                                                                <tr class="text-center">
                                                                    <td colspan="3"><h3>مجموع</h3></td>
                                                                    <td colspan="2"><h3 class="totalPriceCart"> <fmt:formatNumber type="number" value="${total}"/>تومان</h3></td>
                                                                </tr>
                                                                </tfoot>
                                                            </c:if>

                                                        </table>
                                                    </div>
                                                    <div class="ps-section__cart-actions" style="display: flex;justify-content: space-between;">
                                                        <c:if test="${cartItems !=null}">
                                                            <a class="ps-btn" href="${pageContext.servletContext.contextPath}/product"><i class="icon-arrow-right"></i> ادامه خرید</a>
                                                            <a class="ps-btn ps-btn--outline hide-1"  style="display: none"><i class="icon-sync"></i> بروز رسانی</a>
                    <%--                                        <a class="ps-btn hide-2 checkout" href="${pageContext.servletContext.contextPath}/customer/product/checkout" >Check out <i class="icon-arrow-right"></i></a>--%>
                                                            <a class="ps-btn hide-2 checkout" onclick="checkout()" >صورت حساب <i class="icon-arrow-left"></i></a>
                                                        </c:if>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="ps-tab ${cartItems !=null ?'':'active'}" id="register">
                                            <div class="ps-form__content">
<%--                                                <h5>Register An Account</h5>--%>
<%--                                                <div class="form-group">--%>
<%--                                                    <input class="form-control" type="text" placeholder="Username or email address">--%>
<%--                                                </div>--%>
<%--                                                <div class="form-group">--%>
<%--                                                    <input class="form-control" type="text" placeholder="Password">--%>
<%--                                                </div>--%>
<%--                                                <div class="ps-form__decs">--%>
<%--                                                    <div class="ps-radio">--%>
<%--                                                        <input class="form-control" type="radio" id="user-type-1" name="user-type">--%>
<%--                                                        <label for="user-type-1">I am a customer</label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="ps-radio">--%>
<%--                                                        <input class="form-control" type="radio" id="user-type-2" name="user-type">--%>
<%--                                                        <label for="user-type-2">I am a vendor</label>--%>
<%--                                                    </div>--%>
<%--                                                    <p>Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our<a href="#">privacy policy.</a></p>--%>
<%--                                                </div>--%>
<%--                                                <div class="form-group submit">--%>
<%--                                                    <button class="ps-btn ps-btn--fullwidth">Register</button>--%>
<%--                                                </div>--%>
                                                    <div class="table-responsive" >
                                                        <table class="table ps-table ps-table--invoices" >
                                                            <thead>
                                                            <tr>
                                                                <th class="text-center">شماره سفارش</th>
                                                                <th class="text-center">جزئیات</th>
                                                                <th class="text-center">تاریخ سفارش</th>
                                                                <th class="text-center">مبلغ</th>
                                                                <th class="text-center">وضعیت</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody class="data-container" id="listPage">

                                                            <c:choose>
                                                                <c:when test="${not empty customerOrders || customerOrders !=null}">
                                                                    <c:forEach items="${customerOrders}" var="order">
                                                                        <tr>
                                                                            <td><a href="${pageContext.servletContext.contextPath}/customer/order/detail?id=${order.id}">NO.0${order.id}</a></td>
                                                                            <td>
                                                                                <c:forEach items="${order.cartItems}" var="items" varStatus="loop">
                                                                                    <a href="${pageContext.servletContext.contextPath}/product/detail?id=${items.product.id}">${items.product.productName}</a>
                                                                                    <c:if test="${not loop.last}">,&nbsp</c:if>
                                                                                </c:forEach>
                                                                            </td>
                                                                            <td><fmt:formatDate value='${order.orderDate}'  type='date' pattern='dd/MM/yyyy'/></td>
                                                                            <td>$ <fmt:formatNumber type="number" value="${order.totalPrice}"/></td>
                                                                                ${order.status ? "  <td class='ps-tag ps-tag--in-stock ' style='color: #669900'>Success</td>" :" <td class='ps-tag ps-tag--in-stock text-danger'>Cancel</td>"}


                                                                        </tr>

                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <tr>
                                                                        <td colspan="5" class="text-center"><h1>سفارشی برای نمایش وجود ندارد !</h1></td>
                                                                    </tr>
                                                                </c:otherwise>
                                                            </c:choose>


                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div id="paging" class="text-center" style="margin-top: 50px">
                                                    </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>







<%--                                check out page--%>
<%--                                <div class="table-responsive">--%>
<%--                                    <table class="table ps-table--shopping-cart ps-table--responsive">--%>
<%--                                        <thead>--%>
<%--                                        <tr>--%>
<%--                                            <th>Product name</th>--%>
<%--                                            <th>PRICE</th>--%>
<%--                                            <th>QUANTITY</th>--%>
<%--                                            <th>TOTAL</th>--%>
<%--                                            <th></th>--%>
<%--                                        </tr>--%>
<%--                                        </thead>--%>
<%--                                        <tbody id="tblShoppingCart">--%>
<%--                                        <c:choose>--%>
<%--                                            <c:when test="${cartItems !=null}">--%>
<%--                                                <c:forEach items="${cartItems}" var="item">--%>
<%--                                                    <tr>--%>
<%--                                                        <td data-label="Product">--%>
<%--                                                            <div class="ps-product--cart">--%>
<%--                                                                <div class="ps-product__thumbnail"><a href="${pageContext.servletContext.contextPath}/product/detail?id=${item.product.id}" onclick="addProductToViewList(${item.product.id})"><img src="${pageContext.request.contextPath}/product/display/0&${item.product.id}" alt=""></a></div>--%>
<%--                                                                <div class="ps-product__content"><a href="${pageContext.servletContext.contextPath}/product/detail?id=${item.product.id}" onclick="addProductToViewList(${item.product.id})">${item.product.productName}</a>--%>
<%--                                                                    <p>Sold By:<strong> ANGRY NERDS</strong></p>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </td>--%>
<%--                                                        <td class="price text-center" data-label="Price">$${item.product.price}</td>--%>
<%--                                                        <td data-label="Quantity" class="text-center">--%>
<%--                                                            <div class="form-group--number">--%>
<%--                                                                <button class="up" value="${item.product.id}">+</button>--%>
<%--                                                                <button class="down" value="${item.product.id}">-</button>--%>
<%--                                                                <input class="form-control itemQty-${item.product.id}"   type="text" placeholder="1" value="${item.sellingQuantity}" readonly>--%>
<%--                                                            </div>--%>
<%--                                                            <span style="color: red" class="invalid-${item.product.id}"></span>--%>
<%--                                                        </td>--%>
<%--                                                        <td data-label="Total" class="text-center totalPriceItem-${item.product.id}">--%>
<%--                                                            $--%>
<%--                                                            <fmt:formatNumber type="number" value="${item.totalPrice}"/>--%>
<%--                                                        </td>--%>
<%--                                                        <td data-label="Actions"><a class="removeCartProduct" value="${item.product.id}"><i class="icon-cross"></i></a></td>--%>
<%--                                                    </tr>--%>
<%--                                                </c:forEach>--%>
<%--                                            </c:when>--%>
<%--                                            <c:otherwise>--%>
<%--                                                <tr>--%>
<%--                                                    <td colspan="5" class="text-center"><h1>No Product Added !!!</h1></td>--%>
<%--                                                </tr>--%>
<%--                                            </c:otherwise>--%>
<%--                                        </c:choose>--%>
<%--                                        </tbody>--%>
<%--                                        <c:if test="${cartItems !=null}">--%>
<%--                                            <tfoot style="border-bottom: 1px solid #dee2e6">--%>
<%--                                            <tr class="text-center">--%>
<%--                                                <td colspan="3"><h3>SUBTOTAL</h3></td>--%>
<%--                                                <td colspan="2"><h3 class="totalPriceCart">$ <fmt:formatNumber type="number" value="${total}"/></h3></td>--%>
<%--                                            </tr>--%>
<%--                                            </tfoot>--%>
<%--                                        </c:if>--%>

<%--                                    </table>--%>
<%--                                </div>--%>
<%--                                <div class="ps-section__cart-actions" style="display: flex;justify-content: space-between;">--%>
<%--                                    <c:if test="${cartItems !=null}">--%>
<%--                                        <a class="ps-btn" href="${pageContext.servletContext.contextPath}/product"><i class="icon-arrow-left"></i> Back to Shop</a>--%>
<%--                                        <a class="ps-btn ps-btn--outline hide-1"  style="display: none"><i class="icon-sync"></i> Update cart</a>--%>
<%--&lt;%&ndash;                                        <a class="ps-btn hide-2 checkout" href="${pageContext.servletContext.contextPath}/customer/product/checkout" >Check out <i class="icon-arrow-right"></i></a>&ndash;%&gt;--%>
<%--                                        <a class="ps-btn hide-2 checkout" onclick="checkout()" >Check out <i class="icon-arrow-right"></i></a>--%>
<%--                                    </c:if>--%>
<%--                                </div>--%>
    <%--                                check out page--%>

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

