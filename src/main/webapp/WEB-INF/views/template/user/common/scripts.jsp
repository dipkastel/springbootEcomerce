<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose><c:when test="${param.jquery =='true'}">
    <script src="${pageContext.servletContext.contextPath}/plugins/jquery.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.nouislider =='true'}">
<script src="${pageContext.servletContext.contextPath}/plugins/nouislider/nouislider.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.popper =='true'}">
<script src="${pageContext.servletContext.contextPath}/plugins/popper.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.carousel =='true'}">
<script src="${pageContext.servletContext.contextPath}/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/owlCarouselConfig.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.bootstrap =='true'}">
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.imagesloaded =='true'}">
<script src="${pageContext.servletContext.contextPath}/plugins/imagesloaded.pkgd.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/masonry.pkgd.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/isotope.pkgd.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.matchHeight =='true'}">
<script src="${pageContext.servletContext.contextPath}/plugins/jquery.matchHeight-min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.slick =='true'}">
<script src="${pageContext.servletContext.contextPath}/plugins/slick/slick/slick.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/plugins/slick-animation.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.barrating =='true'}">
<script src="${pageContext.servletContext.contextPath}/plugins/jquery-bar-rating/dist/jquery.barrating.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.lightgallery =='true'}">
<script src="${pageContext.servletContext.contextPath}/plugins/lightGallery-master/dist/js/lightgallery-all.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.sidebar =='true'}">
<script src="${pageContext.servletContext.contextPath}/plugins/sticky-sidebar/dist/sticky-sidebar.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.select2 =='true'}">
<script src="${pageContext.servletContext.contextPath}/plugins/select2/dist/js/select2.full.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.gmap3 =='true'}">
<script src="${pageContext.servletContext.contextPath}/plugins/gmap3.min.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.main =='true'}">
<script src="${pageContext.servletContext.contextPath}/js/main.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.backToTop =='true'}">
<script src="${pageContext.servletContext.contextPath}/js/backToTop.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.loader =='true'}">
<script src="${pageContext.servletContext.contextPath}/js/loader.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.message =='true'}">
<script src="${pageContext.servletContext.contextPath}/js/message.js"></script>
</c:when></c:choose>
<c:choose><c:when test="${param.quickView =='true'}">
<script src="${pageContext.servletContext.contextPath}/js/quickview.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/modalInit.js"></script>
</c:when></c:choose>