<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="${pageContext.servletContext.contextPath}/" class="nav-link msg">مشاهده وبسایت</a>
        </li>
        <%--        <li class="nav-item d-none d-sm-inline-block">--%>
        <%--            <a href="${pageContext.servletContext.contextPath}/admin" class="nav-link navAdmin">مدیریت</a>--%>
        <%--        </li>--%>

        <%--        <li class="nav-item d-none d-sm-inline-block">--%>
        <%--            <a href="${pageContext.servletContext.contextPath}/admin/contact" class="nav-link navContact">تماس ها</a>--%>
        <%--        </li>--%>
        <%--        <li class="nav-item d-none d-sm-inline-block">--%>
        <%--            <a href="${pageContext.servletContext.contextPath}/admin/subscriber" class="nav-link navSubcriber">Subcribers</a>--%>
        <%--        </li>--%>

        <li class="nav-item d-none d-sm-inline-block">
            <a href="${pageContext.servletContext.contextPath}/logout" class="nav-link">Logout</a>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <!-- Navbar Search -->
        <li class="nav-item">
            <a class="nav-link" data-widget="navbar-search" role="button">
                <i class="fas fa-search"></i>
            </a>
            <div class="navbar-search-block">
                <form class="form-inline">
                    <div class="input-group input-group-sm">
                        <input class="form-control form-control-navbar" type="search" placeholder="Search"
                               aria-label="Search">
                        <div class="input-group-append">
                            <button class="btn btn-navbar" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                            <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </li>

        <!-- Messages Dropdown Menu -->
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown">
                <i class="far fa-comments"></i>
                <span class="badge badge-danger navbar-badge">3</span>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <c:forEach items="${messages}" var="m">
                    <a class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="${pageContext.servletContext.contextPath}/dist/img/user1-128x128.jpg"
                                 alt="User Avatar" class="img-size-50 mr-3 img-circle">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    ${m.client}
                                    <c:if test="${m.status!='read'&&m.sender!='admin'}">
                                        <span class="float-right text-sm text-danger">
                                            <i class="fas fa-star"></i>
                                        </span>
                                    </c:if>
                                </h3>
                                <p class="text-sm">
                                       <small> ${m.sender}:</small>
                                </p>
                                <p class="text-sm">
                                        ${m.message}
                                </p>
                                <p class="text-sm text-muted "><i class="far fa-clock mr-1"></i>
                                    <small class="toPersianDate">${m.createdDate}</small>
                                </p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                </c:forEach>
                <a href="/admin/message" class="dropdown-item dropdown-footer">See All Messages</a>
            </div>
        </li>
        <!-- Notifications Dropdown Menu -->
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown">
                <i class="far fa-bell"></i>
                <span class="badge badge-warning navbar-badge">15</span>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <span class="dropdown-item dropdown-header">15 Notifications</span>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item">
                    <i class="fas fa-envelope mr-2"></i> 4 new messages
                    <span class="float-right text-muted text-sm">3 mins</span>
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item">
                    <i class="fas fa-users mr-2"></i> 8 friend requests
                    <span class="float-right text-muted text-sm">12 hours</span>
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item">
                    <i class="fas fa-file mr-2"></i> 3 new reports
                    <span class="float-right text-muted text-sm">2 days</span>
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item dropdown-footer">See All Notifications</a>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-widget="fullscreen" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
            </a>
        </li>
        <c:choose><c:when test="${param.controlSidebar =='true'}">
            <li class="nav-item">
                <a class="nav-link" data-widget="control-sidebar" data-slide="true" role="button">
                    <i class="fas fa-th-large"></i>
                </a>
            </li>
        </c:when></c:choose>
    </ul>
</nav>
<!-- /.navbar -->


