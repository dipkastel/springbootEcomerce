<%@ page contentType="text/html; charset=UTF-8" %>
<div class="chat">
    <div id="chat" class="">
        <i class="icon icon-bubbles "></i>
    </div>
    <div id="chatBox" class="chat-box hidden">

        <div class="card card-warning direct-chat direct-chat-warning shadow">
            <div class="card-header">
                <div class="card-tools">
                    <a id="btn_close_chat">
                        <i class="icon icon-cross2"></i>
                    </a>
                </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <!-- Conversations are loaded here -->
                <div id="message_Box" class="direct-chat-messages">

                </div>
                <!--/.direct-chat-messages-->

            </div>
            <!-- /.card-body -->
            <div class="card-footer">
                    <div class="input-group">
                        <input type="text" name="message" placeholder="Type Message ..." class="form-control" id="message">
                        <span class="input-group-append">
                      <button id="btn-chat-send" class="btn btn-warning">Send</button>
                    </span>
                    </div>
            </div>
            <!-- /.card-footer-->
        </div>

    </div>
    <div class="sample_box">
        <div class="left_item">
            <div id="chat-item" class="direct-chat-msg">
                <!-- /.direct-chat-infos -->
                <img class="direct-chat-img" src="../dist/img/user1-128x128.jpg" alt="Message User Image">
                <!-- /.direct-chat-img -->
                <div class="direct-chat-text">

                </div>
                <!-- /.direct-chat-text -->
                <div class="direct-chat-infos clearfix">
                    <span class="direct-chat-name float-left">

                    </span>
                    <span class="direct-chat-timestamp float-right">

                    </span>
                </div>
            </div>
        </div>
        <div class="right_item">
            <div id="my-chat-item" class="direct-chat-msg right">
                <div class="ps-block__left direct-chat-img "><i class="icon-user"></i></div>
                <div class="direct-chat-text">
                </div>
                <div class="direct-chat-infos clearfix">
                    <span class="direct-chat-name float-right">
                    </span>
                    <span class="direct-chat-timestamp float-left">
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
