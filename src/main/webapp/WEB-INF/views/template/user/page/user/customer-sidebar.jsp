<%@ page contentType="text/html; charset=UTF-8" %>
<div class="ps-section__left">
    <aside class="ps-widget--account-dashboard">
        <div class="ps-widget__header"><i class="icon-user"></i>
            <figure>
                <figcaption>${customer.firstName} ${customer.lastName} </figcaption>
                <p><a >${user.phoneNumber}</a></p>
            </figure>
        </div>
        <div class="ps-widget__content">
            <ul>
                <li class="${pageContext.request.requestURI.contains("/customer/info") ?"active":""}"><a href="${pageContext.servletContext.contextPath}/customer/info"><i class="icon-user"></i> اطلاعات حساب کاربری</a></li>
                <li class="${pageContext.request.requestURI.contains("/customer/wallet") ?"active":""}"><a href="${pageContext.servletContext.contextPath}/customer/wallet" ><i class="icon-wallet"></i>  کیف پول <span>تومان 10000</span> </a></li>
                <li class="${pageContext.request.requestURI.contains("/customer/checkout") ?"active":""}"><a href="${pageContext.servletContext.contextPath}/customer/checkout-page" ><i class="icon-credit-card"></i> صورت حساب </a></li>
                <li class="${pageContext.request.requestURI.contains("/customer/address") ?"active":""}"><a href="${pageContext.servletContext.contextPath}/customer/address" ><i class="icon-map2"></i> آدرس ها </a></li>
                <li class="${pageContext.request.requestURI.contains("/customer/invoice") ?"active":""}"><a href="${pageContext.servletContext.contextPath}/customer/order" style="display: none"><i class="icon-papers"></i> سفارشات</a></li>
                <li class="${pageContext.request.requestURI.contains("/customer/wishlist") ?"active":""}"><a href="${pageContext.servletContext.contextPath}/customer/wishlist"><i class="icon-heart"></i> خرید بعدی</a></li>
                <li ><a href="${pageContext.servletContext.contextPath}/logout"><i class="icon-power-switch"></i>خروج</a></li>
            </ul>
        </div>
    </aside>
</div>
