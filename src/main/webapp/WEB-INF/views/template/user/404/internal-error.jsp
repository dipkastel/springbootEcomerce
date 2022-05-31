
<jsp:include page="../components/head.jsp"/>
<%@ page contentType="text/html; charset=UTF-8" %>

<body>
<%--<jsp:include page="../components/header.jsp"></jsp:include>--%>
<%--<jsp:include page="../components/sidebar.jsp"></jsp:include>--%>
<div class="ps-page--comming-soon">
    <div class="container">
        <div class="ps-page__header">
            <h1 class="text-danger">خطایی رخ داده است.</h1>

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

