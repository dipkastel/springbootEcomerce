<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content="">
<title>${param.pageTitle}</title>

<c:choose><c:when test="${param.clientTheme =='true'}">
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,600,700&amp;amp;subset=latin-ext"
          rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/fonts/persian/iransansweb/style.css">
</c:when></c:choose>
<c:choose><c:when test="${param.icons =='true'}">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/fonts/Linearicons/Linearicons/Font/demo-files/demo.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
</c:when></c:choose>
<c:choose><c:when test="${param.bootstrap =='true'}">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
</c:when></c:choose>
<c:choose><c:when test="${param.carousel =='true'}">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/plugins/owl-carousel/assets/owl.carousel.min.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/plugins/owl-carousel/assets/owl.theme.default.min.css">
</c:when></c:choose>
<c:choose><c:when test="${param.slick =='true'}">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/slick/slick/slick.css">
</c:when></c:choose>
<c:choose><c:when test="${param.nouislider =='true'}">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/nouislider/nouislider.min.css">
</c:when></c:choose>
<c:choose><c:when test="${param.lightgallery =='true'}">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/plugins/lightGallery-master/dist/css/lightgallery.min.css">
</c:when></c:choose>
<c:choose><c:when test="${param.select2 =='true'}">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/select2/dist/css/select2.min.css">
</c:when></c:choose>
<c:choose><c:when test="${param.pagination =='true'}">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/pagination.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/PagingStyle.css">
</c:when></c:choose>
<c:choose><c:when test="${param.clientTheme =='true'}">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/media-min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/media-max.css">
</c:when></c:choose>
<c:choose><c:when test="${param.favicon =='true'}">
    <link rel="shortcut icon" type="image/png" href="${pageContext.servletContext.contextPath}/img/favicon.png">
</c:when></c:choose>
