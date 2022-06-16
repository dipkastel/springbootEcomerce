<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../common/head.jsp">
        <jsp:param name="pageTitle" value="notrika | baseSettings"/>
        <jsp:param name="admintheme" value="true"/>
    </jsp:include>
    <jsp:include page="css/css.jsp"/>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <jsp:include page="../common/loading.jsp"></jsp:include>
    <jsp:include page="../components/nav-bar.jsp"></jsp:include>
    <jsp:include page="../components/side-bar.jsp"></jsp:include>
    <div class="content-wrapper" style="min-height: 1299.69px;">


        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>پیام ها</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">chat</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-3">
                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <div class="card-tools">
                                <div class="input-group input-group-sm">
                                    <input type="text" class="form-control" placeholder="Search Mail">
                                    <div class="input-group-append">
                                        <div class="btn btn-primary">
                                            <i class="fas fa-search"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-tools -->
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body card-comments  p-0">
                            <c:forEach var="l" items="${LastMessages }">
                            <div class="card-comment user-chat-item <c:if test = '${l.unread}'>unread</c:if>">
                                <!-- User image -->
                                <img class="img-circle img-sm" src="../dist/img/avatar5.png" alt="User Image">

                                <div class="comment-text">
                                    <span class="username">
                                      ${l.user.phoneNumber}
                                      <span class="text-muted float-right">${l.user.createdDate}</span>
                                    </span><!-- /.username -->
                                        ${fn:substring(l.message, 0, 25)}
                                    <span title="3 New Messages" class="badge bg-primary float-right">3</span>
                                </div>
                                <div class="chat-tools">
                                    <button type="button" class="btn btn-outline-primary btn-sm"><i
                                            class="far fa-comments"></i> chat
                                    </button>
                                    <button type="button" class="btn btn-outline-primary btn-sm"><i
                                            class="fas fa-share"></i> Share
                                    </button>
                                    <button type="button" class="btn btn-outline-primary btn-sm"><i
                                            class="far fa-thumbs-up"></i> Like
                                    </button>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer p-0">

                        </div>
                    </div>
                    <!-- /.card -->
                </div>


                <div class="col-md-9">
                    <!-- DIRECT CHAT PRIMARY -->
                    <div class="card card-primary card-outline direct-chat direct-chat-primary">
                        <div class="card-header">
                            <h3 class="card-title">ابراهیم حنیف</h3>

                            <div class="card-tools">
                                <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" title="Contacts"
                                        data-widget="chat-pane-toggle">
                                    <i class="fas fa-comments"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-card-widget="remove">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="messageBox" class="direct-chat-messages">

                                <div class="direct-chat-msg right">
                                    <!-- /.direct-chat-infos -->
                                    <img class="direct-chat-img" src="../dist/img/user3-128x128.jpg"
                                         alt="Message User Image">
                                    <!-- /.direct-chat-img -->
                                    <div class="direct-chat-text">
                                        You better believe it!
                                    </div>
                                    <div class="direct-chat-infos clearfix">
                                        <span class="direct-chat-timestamp float-left">23 Jan 2:05 pm</span>
                                    </div>
                                    <!-- /.direct-chat-text -->
                                </div>
                            </div>

                            <div class="direct-chat-contacts">
                                <ul class="contacts-list">
                                    <li>
                                        <a href="#">
                                            <img class="contacts-list-img" src="../dist/img/user1-128x128.jpg"
                                                 alt="User Avatar">

                                            <div class="contacts-list-info">
                          <span class="contacts-list-name">
                            Count Dracula
                            <small class="contacts-list-date float-right">2/28/2015</small>
                          </span>
                                                <span class="contacts-list-msg">How have you been? I was...</span>
                                            </div>
                                            <!-- /.contacts-list-info -->
                                        </a>
                                    </li>
                                    <!-- End Contact Item -->
                                </ul>
                                <!-- /.contatcts-list -->
                            </div>

                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer">
                            <form action="#" method="post">
                                <div class="input-group">
                                    <input type="text" id="message" name="message" placeholder="Type Message ..."
                                           class="form-control">
                                    <span class="input-group-append">
                      <button type="submit" class="btn btn-primary">Send</button>
                    </span>
                                </div>
                            </form>
                        </div>
                        <!-- /.card-footer-->
                    </div>
                    <!--/.direct-chat -->
                </div>
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
        <div id="chat-item" class="hidden">
            <div class="direct-chat-msg">
                <!-- /.direct-chat-infos -->
                <img class="direct-chat-img" src="../dist/img/user1-128x128.jpg" alt="Message User Image">
                <!-- /.direct-chat-img -->
                <div class="direct-chat-text">

                </div>
                <div class="direct-chat-infos clearfix">
                    <span class="direct-chat-timestamp float-right">

                    </span>
                </div>
                <!-- /.direct-chat-text -->
            </div>
        </div>

    </div>
    <jsp:include page="../components/footer.jsp"></jsp:include>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
</body>
<jsp:include page="../components/script.jsp">
    <jsp:param name="admintheme" value="true"/>
    <jsp:param name="bootstrap" value="true"/>
    <jsp:param name="jstree" value="true"/>
    <jsp:param name="sweetalert2" value="true"/>
</jsp:include>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<jsp:include page="js/js.jsp"/>
</html>
