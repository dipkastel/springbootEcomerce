<script>
    (function ($) {

        var chatClient = null;
        var selectedClient = ${user.id};


        $("#btn_send_message").on('click', function (e) {
            e.preventDefault();
            sendName($("#message").val());
        });

        function connect() {
            var socket = new SockJS('/ChatEndPoint');
            chatClient = Stomp.over(socket);
            chatClient.connect({}, function (frame) {
                chatClient.subscribe('/chat/siteChat/admin', function (greeting) {
                    item = JSON.parse(greeting.body);
                    if(item.message)
                        onRecivedMessage(item);
                    if(item.url)
                        onRecivedVisitor(item);
                });
            });

            refreshList();
        }

        function refreshList(){

            $.get("/api/messages/getLatestList")
                .done(function (_data) {
                    $("#messagesList").html("");
                    _data.forEach(function (_item){
                        addMessageListItem(_item)
                    })
                })
                .fail(function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR)
                });
        }

        function disconnect() {
            if (chatClient !== null) {
                chatClient.disconnect();
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
                        onRecivedMessage(item);
                    })
                    $("#messageBox").animate({ scrollTop: $("#messageBox").prop("scrollHeight") }, 100);
                })
                .fail(function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR)
                });
        }

        function DeliverSend(message){
            chatClient.send("/app/siteChatDelivery/"+selectedClient, {}, JSON.stringify(message));
        }
        function ReadSend(message){
            chatClient.send("/app/siteChatRead/"+selectedClient, {},JSON.stringify(message));
        }

        function sendName(message) {
            var mymessage = {'message': message,
                'sender':'admin',
                'reciver':selectedClient,
                'client':selectedClient

            }
            var data = JSON.stringify(mymessage)
            chatClient.send("/app/siteChat/" + selectedClient, {}, data);
            $("#message").val("");
        }

        function onRecivedMessage(data) {
            if($("#"+data.id)[0]){
                console.log("is delivery")
                $("#"+data.id).find(".direct-chat-timestamp").append('<i class="far fa-check-circle float-left"></i>');
                return;
            }
            if(selectedClient===data.reciver){
                var item = $("#hidden-box .msg_item_right").clone()
                item.attr("id",data.id);
                item.find(".direct-chat-text").html(data.message)
                var dt = new Date(data.createdDate);
                item.find(".direct-chat-timestamp").html( dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds())
                $("#messageBox").append(item)
                $("#messageBox").animate({ scrollTop: $("#messageBox").prop("scrollHeight") }, 100);

            }
            if(selectedClient===data.sender){
                var item = $("#hidden-box .msg_item_left").clone()
                item.attr("id",data.id);
                item.find(".direct-chat-text").html(data.message)
                var dt = new Date(data.createdDate);
                item.find(".direct-chat-timestamp").html( dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds())
                $("#messageBox").append(item)
                $("#messageBox").animate({ scrollTop: $("#messageBox").prop("scrollHeight") }, 100);
                DeliverSend(data);
            }
            var chatListItem = $("#"+data.client)
            if(chatListItem[0]){

                $("#"+data.client).find(".message-text").html(data.message);
                var dt = new Date(data.createdDate);
                $("#"+data.client).find(".text-muted").html( dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds())
            }else{
                addMessageListItem(data)
            }
            console.log(data);
        }
        function onRecivedVisitor(data) {
            var visitorListItem = $("#v"+data.userUniq)
            if(visitorListItem[0]){
                visitorListItem.find(".message-text").html(data.message);
                var dt = new Date(data.createdDate);
                visitorListItem.find(".text-muted").html( dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds())
            }else{
                addVisitorListItem(data)
            }
            console.log(data);
        }
        function addMessageListItem(data){
            var item = $("#hidden-box .user-chat-item").clone()
            item.attr("id",data.client)
            if(data.unread)
                item.addClass("unread");
            item.find(".username").prepend(data.client);

            var dt = new Date(data.createdDate);
            item.find(".text-muted").html( dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds());
            item.find(".btnchat").on('click', function (e) {
                e.preventDefault();
                onUserSelect(data.client)
            });
            item.find(".message-text").html(data.message);
            if(data.status!=="Read")
                item.find(".user_message").append('<span title="3 New Messages" class="badge bg-primary float-right">3</span>');

            $("#messagesList").prepend(item);
        }


        function addVisitorListItem(data){
            var item = $("#hidden-box .user-chat-item").clone()
            item.attr("id","v"+data.userUniq)
            item.find(".username").prepend(data.userUniq);

            var dt = new Date(data.createdDate);
            item.find(".text-muted").html( dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds());
            item.find(".message-text").html(data.url);

            $("#visitorList").prepend(item);
        }


        $(function () {
            $("#message-card").hide()
            connect()
        });
    })(jQuery);

</script>
