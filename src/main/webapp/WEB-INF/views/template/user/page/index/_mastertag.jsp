<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
    <div class="ps-carousel--nav owl-slider" data-owl-auto="true"
         data-owl-loop="true" data-owl-speed="3000" data-owl-gap="0"
         data-owl-nav="false" data-owl-dots="false" data-owl-item="11"
         data-owl-item-xs="3" data-owl-item-sm="4" data-owl-item-md="6"
         data-owl-item-lg="8" data-owl-item-xl="11"
         data-owl-duration="500" data-owl-mousedrag="on">
        ${masterTags}
        <c:forEach items="${masterTags}" var="p">
            <div class="mi_mastertag_box">
                <div class="ps-product__thumbnail">
                    <a href="/section/detail/${p.slug}">
                        <img src="${pageContext.request.contextPath}/image/display/${p.image.id}" class="mi_circle_image">

                        <small>${p.tagName}</small>
                    </a>

                </div>
            </div>
        </c:forEach>



    </div>
</div>
