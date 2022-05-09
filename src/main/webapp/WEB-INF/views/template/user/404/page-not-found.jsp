
<jsp:include page="../components/head.jsp"></jsp:include>
<%@ page contentType="text/html; charset=UTF-8" %>

<body >

<%--<jsp:include page="../components/header.jsp"></jsp:include>--%>
<%--<jsp:include page="../components/sidebar.jsp"></jsp:include>--%>

<div class="ps-page--404">
    <div class="container">
        <div class="ps-section__content"><img src="${pageContext.servletContext.contextPath}/img/404.jpg" alt="">
            <h3>متاسفانه! صفحه یافت نشد</h3>
            <p>ما نتوانستیم آن چه به دنبالش بودید را بیابیم شاید جستجو در <a href="/"> صفحه اصلی </a> کمک کننده باشد</p>
<%--            <form class="ps-form--widget-search" action="do_action" method="get">--%>
<%--                <input class="form-control" type="text" placeholder="Search...">--%>
<%--                <button><i class="icon-magnifier"></i></button>--%>
<%--            </form>--%>
        </div>
    </div>
</div>
<%--<jsp:include page="../components/footer.jsp"></jsp:include>--%>
</body>

