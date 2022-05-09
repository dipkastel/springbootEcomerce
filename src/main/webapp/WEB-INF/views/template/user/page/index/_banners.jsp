<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="ps-home-banner ps-home-banner--1">
    <div class="ps-container" style="margin-top: 10px">
        <div class="ps-section__left" >
            <div class="ps-carousel--nav-inside owl-slider"
                 data-owl-auto="true" data-owl-loop="true" data-owl-speed="5000"
                 data-owl-gap="0" data-owl-nav="true" data-owl-dots="true"
                 data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1"
                 data-owl-item-md="1" data-owl-item-lg="1" data-owl-duration="1000"
                 data-owl-mousedrag="on" data-owl-animate-in="fadeIn"
                 data-owl-animate-out="fadeOut" style="width: 2500px">

                <c:forEach items="${listBanner}" var="b">
                    <a href="${b.url}">
                        <img class="ps-banner bg--cover"
                             src="/banner/display/${b.id}"
                             style="background-repeat: no-repeat; background-position: center center;">
                        </img>
                    </a>
                </c:forEach>
            </div>
        </div>

    </div>
</div>
