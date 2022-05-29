
<head>
    <jsp:include page="../common/head.jsp">
        <jsp:param name="pageTitle" value="notrika | baseSettings" />
        <jsp:param name="admintheme" value="true" />
        <jsp:param name="dataTable" value="false" />
        <jsp:param name="icheck" value="false" />
        <jsp:param name="JQVMap" value="false" />
        <jsp:param name="jsgrid" value="false" />
        <jsp:param name="daterangePicker" value="false" />
        <jsp:param name="summernote" value="false" />
    </jsp:include>
</head>
<%@ page contentType="text/html; charset=UTF-8" %>

<body>
<%--<jsp:include page="../components/header.jsp"></jsp:include>--%>
<%--<jsp:include page="../components/sidebar.jsp"></jsp:include>--%>
<div class="ps-page--comming-soon">
    <div class="container">
        <div class="ps-page__header">
            <h1 class="text-danger">اجازه انجام عملیات صادر نشده است</h1>

        </div>
        <div class="ps-page__content"><img src="${pageContext.servletContext.contextPath}/img/coming-soon.jpg" alt="">
            <figure>
                <figcaption>صفحه را مجددا بارگذاری نمایید در صورتی که مشکل حل نشد با ما تماس بگیرید</figcaption>
            </figure>
        </div>
    </div>
</div>
<%--<jsp:include page="../components/footer.jsp"></jsp:include>--%>
</body>

