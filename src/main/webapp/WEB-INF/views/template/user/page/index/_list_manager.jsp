<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${mainListItem.listType == 'NORMAL_PRODUCTS'}">

        <div class="ps-product-list ps-clothings">
            <div class="ps-section__header">
                <h3>${mainListItem.listName}</h3>
                <ul class="ps-section__links">
                    <li><a
                            href="${mainListItem.linkMore}">بیشتر
                        ...</a></li>
                </ul>
            </div>
            <div class="ps-container">
                <div class="ps-section__content">

                    <jsp:include page="../../components/carousel.jsp">
                        <jsp:param name="dataOwlAuto" value="true"/>
                        <jsp:param name="dataOwlLoop" value="true"/>
                        <jsp:param name="dataOwlSpeed" value="10000"/>
                        <jsp:param name="dataOwlNav" value="true"/>
                        <jsp:param name="dataOwlDots" value="false"/>
                        <jsp:param name="dataOwlGap" value="0"/>
                        <jsp:param name="dataOwlItem" value="6"/>
                        <jsp:param name="dataOwlItemXs" value="2"/>
                        <jsp:param name="dataOwlItemSm" value="2"/>
                        <jsp:param name="dataOwlItemMd" value="3"/>
                        <jsp:param name="dataOwlItemLg" value="3"/>
                        <jsp:param name="dataOwlItemXl" value="6"/>
                        <jsp:param name="dataOwlDuration" value="500"/>
                        <jsp:param name="dataOwlMousedrag" value="on"/>
                        <jsp:param name="owlClass" value="ps-carousel--nav owl-slider"/>
                    </jsp:include>
                </div>

            </div>
        </div>
    </c:when>
    <c:when test="${mainListItem.listType == 'SPECIAL_PRODUCTS'}">

        <div class="ps-product-list ps-special container-fluid">
            <div class="row">
                <div class="col-2 spacial-image">
                    <img src="${pageContext.servletContext.contextPath}/img/special.png">
                </div>
                <div class="col-10">

                    <div class="ps-section__content">
                        <jsp:include page="../../components/carousel.jsp">
                            <jsp:param name="dataOwlAuto" value="true"/>
                            <jsp:param name="dataOwlLoop" value="true"/>
                            <jsp:param name="dataOwlSpeed" value="6000"/>
                            <jsp:param name="dataOwlNav" value="false"/>
                            <jsp:param name="dataOwlDots" value="false"/>
                            <jsp:param name="dataOwlGap" value="0"/>
                            <jsp:param name="dataOwlItem" value="5"/>
                            <jsp:param name="dataOwlItemXs" value="2"/>
                            <jsp:param name="dataOwlItemSm" value="2"/>
                            <jsp:param name="dataOwlItemMd" value="3"/>
                            <jsp:param name="dataOwlItemLg" value="3"/>
                            <jsp:param name="dataOwlItemXl" value="5"/>
                            <jsp:param name="dataOwlDuration" value="500"/>
                            <jsp:param name="dataOwlMousedrag" value="on"/>
                            <jsp:param name="owlClass" value="ps-carousel--nav owl-slider"/>
                        </jsp:include>
                    </div>

                </div>
            </div>
        </div>
    </c:when>
    <c:when test="${mainListItem.listType == 'SUPER_CAT'}">

        <div class="container">
            <jsp:include page="../../components/carousel.jsp">
                <jsp:param name="dataOwlAuto" value="true"/>
                <jsp:param name="dataOwlLoop" value="true"/>
                <jsp:param name="dataOwlSpeed" value="3000"/>
                <jsp:param name="dataOwlNav" value="false"/>
                <jsp:param name="dataOwlDots" value="false"/>
                <jsp:param name="dataOwlGap" value="0"/>
                <jsp:param name="dataOwlItem" value="11"/>
                <jsp:param name="dataOwlItemXs" value="3"/>
                <jsp:param name="dataOwlItemSm" value="4"/>
                <jsp:param name="dataOwlItemMd" value="6"/>
                <jsp:param name="dataOwlItemLg" value="8"/>
                <jsp:param name="dataOwlItemXl" value="11"/>
                <jsp:param name="dataOwlDuration" value="500"/>
                <jsp:param name="dataOwlMousedrag" value="on"/>
                <jsp:param name="owlClass" value="ps-carousel--nav owl-slider suppercat-box"/>
            </jsp:include>

        </div>

    </c:when>
    <c:when test="${mainListItem.listType == 'BANNER_LIST'}">
        <div class="ps-home-banner ps-home-banner--1">
            <div class="ps-container" style="margin-top: 10px">
                <div class="ps-section__left">


                    <jsp:include page="../../components/carousel.jsp">
                        <jsp:param name="dataOwlAuto" value="true"/>
                        <jsp:param name="dataOwlLoop" value="true"/>
                        <jsp:param name="dataOwlSpeed" value="5000"/>
                        <jsp:param name="dataOwlNav" value="true"/>
                        <jsp:param name="dataOwlDots" value="true"/>
                        <jsp:param name="dataOwlGap" value="0"/>
                        <jsp:param name="dataOwlItem" value="1"/>
                        <jsp:param name="dataOwlItemXs" value="1"/>
                        <jsp:param name="dataOwlItemSm" value="1"/>
                        <jsp:param name="dataOwlItemMd" value="1"/>
                        <jsp:param name="dataOwlItemLg" value="1"/>
                        <jsp:param name="dataOwlItemXl" value="1"/>
                        <jsp:param name="dataOwlDuration" value="1000"/>
                        <jsp:param name="dataOwlMousedrag" value="on"/>
                        <jsp:param name="dataOwlAnimateIn" value="fadeIn"/>
                        <jsp:param name="dataOwlAnimateOut" value="fadeOut"/>
                        <jsp:param name="owlClass" value="ps-carousel--nav-inside owl-slider"/>
                    </jsp:include>

                </div>

            </div>
        </div>

    </c:when>
    <c:when test="${mainListItem.listType == 'BANNERS_WIDGET'}">
        <div class="container-fluid">
            <div class="row">

                <jsp:include page="../../components/carousel.jsp">
                    <jsp:param name="dataOwlAuto" value="true"/>
                    <jsp:param name="dataOwlLoop" value="true"/>
                    <jsp:param name="dataOwlSpeed" value="5000"/>
                    <jsp:param name="dataOwlNav" value="true"/>
                    <jsp:param name="dataOwlDots" value="true"/>
                    <jsp:param name="dataOwlGap" value="0"/>
                    <jsp:param name="dataOwlItem" value="1"/>
                    <jsp:param name="dataOwlItemXs" value="1"/>
                    <jsp:param name="dataOwlItemSm" value="1"/>
                    <jsp:param name="dataOwlItemMd" value="1"/>
                    <jsp:param name="dataOwlItemLg" value="1"/>
                    <jsp:param name="dataOwlItemXl" value="1"/>
                    <jsp:param name="dataOwlDuration" value="1000"/>
                    <jsp:param name="dataOwlMousedrag" value="on"/>
                    <jsp:param name="dataOwlAnimateIn" value="fadeIn"/>
                    <jsp:param name="dataOwlAnimateOut" value="fadeOut"/>
                    <jsp:param name="owlClass" value="ps-carousel--nav-inside owl-slider"/>
                </jsp:include>

            </div>
        </div>
    </c:when>
    <c:when test="${mainListItem.listType == 'SITE_FEATURES'}">
        <jsp:include page="_site-features.jsp"/>
    </c:when>
    <c:when test="${mainListItem.listType == 'SPECIAL_OFFERS'}">

        <div class="ps-product-list ps-special-offers container-fluid">
            <div class="row">
                <div class="col-2 col-xs-5 spacial-image">
                    <img src="${pageContext.servletContext.contextPath}/img/special_offer.png">
                </div>
                <div class="col-10 col-xs-7">

                    <div class="ps-section__content">
                        <jsp:include page="../../components/carousel.jsp">
                            <jsp:param name="dataOwlAuto" value="true"/>
                            <jsp:param name="dataOwlLoop" value="true"/>
                            <jsp:param name="dataOwlSpeed" value="6000"/>
                            <jsp:param name="dataOwlNav" value="false"/>
                            <jsp:param name="dataOwlDots" value="false"/>
                            <jsp:param name="dataOwlGap" value="0"/>
                            <jsp:param name="dataOwlItem" value="5"/>
                            <jsp:param name="dataOwlItemXs" value="1"/>
                            <jsp:param name="dataOwlItemSm" value="2"/>
                            <jsp:param name="dataOwlItemMd" value="3"/>
                            <jsp:param name="dataOwlItemLg" value="3"/>
                            <jsp:param name="dataOwlItemXl" value="5"/>
                            <jsp:param name="dataOwlDuration" value="500"/>
                            <jsp:param name="dataOwlMousedrag" value="on"/>
                            <jsp:param name="owlClass" value="ps-carousel--nav owl-slider"/>
                        </jsp:include>
                    </div>

                </div>
            </div>
        </div>
    </c:when>
    <c:when test="${mainListItem.listType == 'MULTIPLE_BANNER_RIGHT'}">

        <div class="container-fluid">
            <div class="banner-box">
                <div class="row ">


                        <div class="col-8 col-xs-12">
                            <a href="${mainListItem.widgets[0].url}">
                                <img src="${pageContext.request.contextPath}/image/display/${mainListItem.widgets[0].image.id}"
                                     class="thriple-same">
                            </a>
                        </div>
                        <div class="col-4 col-xs-12">
                            <a href="${mainListItem.widgets[1].url}">
                                <img src="${pageContext.request.contextPath}/image/display/${mainListItem.widgets[1].image.id}"
                                     class="thriple-same">
                            </a>
                        </div>
                </div>
            </div>
        </div>
    </c:when>
    <c:when test="${mainListItem.listType == 'MULTIPLE_BANNER_LEFT'}">
        <div class="container-fluid">
            <div class="banner-box">
                <div class="row ">


                    <div class="col-4 col-xs-12">
                        <a href="${mainListItem.widgets[0].url}">
                            <img src="${pageContext.request.contextPath}/image/display/${mainListItem.widgets[0].image.id}"
                                 class="thriple-same">
                        </a>
                    </div>
                    <div class="col-8 col-xs-12">
                        <a href="${mainListItem.widgets[1].url}">
                            <img src="${pageContext.request.contextPath}/image/display/${mainListItem.widgets[1].image.id}"
                                 class="thriple-same">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </c:when>
    <c:when test="${mainListItem.listType == 'MULTIPLE_BANNER_SAME'}">
        <div class="container-fluid">
            <div class="banner-box">
                <div class="row ">


                    <c:forEach items="${mainListItem.widgets}" var="w">
                        <div class="col-6 col-xs-12">
                            <a href="${w.url}">
                                <img src="${pageContext.request.contextPath}/image/display/${w.image.id}"
                                     class="thriple-same">
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </c:when>
    <c:when test="${mainListItem.listType == 'THRIPLE_BANNER_SAME'}">
        <div class="container-fluid">
            <div class="banner-box">
                <div class="row ">


                    <c:forEach items="${mainListItem.widgets}" var="w">
                        <div class="col-4 col-xs-12">
                            <a href="${w.url}">
                                <img src="${pageContext.request.contextPath}/image/display/${w.image.id}"
                                     class="thriple-same">
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise></c:otherwise>
</c:choose>
