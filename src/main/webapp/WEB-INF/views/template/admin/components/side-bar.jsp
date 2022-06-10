<%@ page contentType="text/html; charset=UTF-8" %>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
        <img src="${pageContext.servletContext.contextPath}/img/Angry-Nerds-2.png" alt="AdminLTE Logo"
             class="brand-image" style="opacity: .8">
        <span class="brand-text font-weight-light">&nbsp;</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="${pageContext.servletContext.contextPath}/dist/img/user2-160x160.jpg"
                     class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a class="d-block">${user.phoneNumber}</a>
            </div>
        </div>

        <!-- SidebarSearch Form -->
        <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item ">
                    <a href="${pageContext.servletContext.contextPath}/admin" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>پیشخوان</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.servletContext.contextPath}/admin/order" class="nav-link">
                        <i class="fa fa-shopping-cart nav-icon"></i>
                        <p>سفارشات</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link ">
                        <i class="nav-icon fas fa-edit"></i>
                        <p>
                            نمایش
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="${pageContext.servletContext.contextPath}/admin/banner"
                               class="nav-link">
                                <i class="nav-icon far fa-image"></i>
                                <p>بنر ها</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.servletContext.contextPath}/admin/menu"
                               class="nav-link">
                                <i class="nav-icon far fa-list-alt"></i>
                                <p>منو اصلی</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.servletContext.contextPath}/admin/widget"
                               class="nav-link">
                                <i class="nav-icon far fa-clock"></i>
                                <p>ویجت ها</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li  class="nav-item ">
                    <a  class="nav-link ">
                        <i class="nav-icon fas fa-table"></i>
                        <p>
                            مدیریت
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">

                        <li class="nav-item">
                            <a  href="${pageContext.servletContext.contextPath}/admin/brand"
                               class="nav-link">
                                <i class="fa fa-filter  nav-icon"></i>
                                <p>برند ها</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.servletContext.contextPath}/admin/category"
                               class="nav-link">
                                <i class="fa fa-filter  nav-icon"></i>
                                <p>دسته بندی ها</p>
                            </a>
                        </li>
<%--                        <li class="nav-item">--%>
<%--                            <a  href="${pageContext.servletContext.contextPath}/admin/type"--%>
<%--                               class="nav-link">--%>
<%--                                <i class="fa fa-filter  nav-icon"></i>--%>
<%--                                <p>نوع ها</p>--%>
<%--                            </a>--%>
<%--                        </li>--%>
                        <li class="nav-item">
                            <a  href="${pageContext.servletContext.contextPath}/admin/user"
                               class="nav-link">
                                <%--                                <i class="far fa-circle nav-icon"></i>--%>
                                <i class="fa fa-users nav-icon"></i>
                                <p>کاربران</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a  href="${pageContext.servletContext.contextPath}/admin/product"
                               class="nav-link">
                                <i class="nav-icon fas fa-book"></i>
                                <p>محصولات</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="${pageContext.servletContext.contextPath}/admin/sms"
                               class="nav-link">
                                <i class="fa fa-credit-card nav-icon"></i>
                                <p>پیامک ها</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.servletContext.contextPath}/admin/tag"
                               class="nav-link">
                                <i class="fa fa-credit-card nav-icon"></i>
                                <p>برچسب ها</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="${pageContext.servletContext.contextPath}/admin/reviews"
                               class="nav-link">
                                <i class="fa fa-credit-card nav-icon"></i>
                                <p>دیدگاه ها</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.servletContext.contextPath}/admin/contact"
                               class="nav-link">
                                <i class="fa fa-credit-card nav-icon"></i>
                                <p>تماس ها</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.servletContext.contextPath}/admin/location"
                               class="nav-link">
                                <i class="fa fa-credit-card nav-icon"></i>
                                <p>شهر ها</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.servletContext.contextPath}/admin/coupen"
                               class="nav-link">
                                <i class="fa fa-credit-card nav-icon"></i>
                                <p>کوپن ها</p>
                            </a>
                        </li>

<%--                        <li class="nav-item">--%>
<%--                            <a href="${pageContext.servletContext.contextPath}/admin/payment"--%>
<%--                               class="nav-link">--%>
<%--                                <i class="fa fa-credit-card nav-icon"></i>--%>
<%--                                <p>پرداخت ها</p>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a href="${pageContext.servletContext.contextPath}/admin/contact"--%>
<%--                               class="nav-link">--%>
<%--                                <i class="fa fa-address-book nav-icon"></i>--%>
<%--                                <p>Contact</p>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item">--%>
<%--                            <a href="${pageContext.servletContext.contextPath}/admin/subscriber"--%>
<%--                               class="nav-link">--%>
<%--                                <i class="fa fa-envelope-open nav-icon"></i>--%>
<%--                                <p>Subscriber</p>--%>
<%--                            </a>--%>
<%--                        </li>--%>
                    </ul>
                </li>


                <li class="nav-item ">
                    <a class="nav-link ">
                        <i class="nav-icon fa fa-wrench"></i>
                        <p>
                            تنظیمات
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="${pageContext.servletContext.contextPath}/admin/baseSettings"
                               class="nav-link">
                                <i class="nav-icon fa fa-wrench"></i>
                                <p>پایه</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.servletContext.contextPath}/admin/getwaySettings"
                               class="nav-link">
                                <i class="nav-icon fa fa-wrench"></i>
                                <p>درگاه ها</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.servletContext.contextPath}/admin/smsSettings"
                               class="nav-link">
                                <i class="nav-icon fa fa-wrench"></i>
                                <p>sms</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.servletContext.contextPath}/admin/themeSettings"
                               class="nav-link">
                                <i class="nav-icon fa fa-wrench"></i>
                                <p>قالب</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.servletContext.contextPath}/admin/import"
                               class="nav-link">
                                <i class="nav-icon fa fa-wrench"></i>
                                <p>بارگیری</p>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->


</aside>
