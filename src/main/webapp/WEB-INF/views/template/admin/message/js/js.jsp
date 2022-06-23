<script>
    (function ($) {

        var stompClient = null;
        var selectedClient = ${user.id};


        $("#btn_send_message").on('click', function (e) {
            e.preventDefault();
            sendName($("#message").val());
        });

        function connect() {
            var socket = new SockJS('/ChatEndPoint');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function (frame) {
                stompClient.subscribe('/chat/siteChat/admin', function (greeting) {
                    onRecived(JSON.parse(greeting.body));
                });
            });

            refreshList();
        }

        function refreshList(){

            $.get("/api/messages/getLatestList")
                .done(function (_data) {
                    $("#messagesList").html("");
                    _data.forEach(function (_item){
                        var item = $("#hidden-box .user-chat-item").clone()
                        item.attr("id",_item.reciver)
                        if(_item.unread)
                            item.addClass("unread");
                        item.find(".username").prepend(_item.sender);

                        var dt = new Date(_item.createdDate);
                        item.find(".text-muted").html( dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds());
                        item.find(".btnchat").on('click', function (e) {
                            e.preventDefault();
                            onUserSelect(_item.sender)
                        });
                        item.find(".message-text").html(_item.message);
                        if(_item.status!=="Read")
                        item.find(".user_message").append('<span title="3 New Messages" class="badge bg-primary float-right">3</span>');

                        $("#messagesList").append(item);
                    })
                })
                .fail(function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR)
                });
        }

        function disconnect() {
            if (stompClient !== null) {
                stompClient.disconnect();
            }
        }
        function onUserSelect(user) {
            selectedClient=user;
            $("#message-card").show(300)
            $("#message-card .card-title").html(selectedClient)
            getHistory(selectedClient);
        }
        function getHistory(user){

            $.get("/api/messages/ChatHistory?id="+user)
                .done(function (_data) {
                    $("#messageBox").html("");
                    _data.forEach(function (item) {
                        onRecived(item);
                    })
                    $("#messageBox").animate({ scrollTop: $("#messageBox").prop("scrollHeight") }, 100);
                })
                .fail(function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR)
                });
        }

        function sendName(message) {
            var mymessage = {'message': message,
                'sender':'admin',
                'reciver':selectedClient}
            var data = JSON.stringify(mymessage)
            stompClient.send("/app/siteChat/" + selectedClient, {}, data);
            $("#message").val("");
        }

        function onRecived(data) {
            if(selectedClient===data.reciver){
                var item = $("#hidden-box .msg_item_right").clone()
                item.find(".direct-chat-text").html(data.message)
                var dt = new Date(data.createdDate);
                item.find(".direct-chat-timestamp").html( dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds())
                $("#messageBox").append(item)
                $("#messageBox").animate({ scrollTop: $("#messageBox").prop("scrollHeight") }, 100);
            }
            if(selectedClient===data.sender){
                var item = $("#hidden-box .msg_item_left").clone()
                item.find(".direct-chat-text").html(data.message)
                var dt = new Date(data.createdDate);
                item.find(".direct-chat-timestamp").html( dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds())
                $("#messageBox").append(item)
                $("#messageBox").animate({ scrollTop: $("#messageBox").prop("scrollHeight") }, 100);
            }
            $("#"+data.sender).find(".message-text").html(data.message);

            var dt = new Date(data.createdDate);
            $("#"+data.sender).find(".text-muted .float-right").html( dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds())
            console.log(data);
        }

        $(function () {
            $("#message-card").hide()
            connect()
        });
    })(jQuery);

</script>
