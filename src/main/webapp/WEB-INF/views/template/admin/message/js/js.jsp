<script>
    (function ($) {
        var user = ${user.id}
        var stompClient = null;
        var ClientDestinationIdentifire = ${user.id};

        function setConnected(connected) {
        }

        function connect() {
            var socket = new SockJS('/ChatEndPoint');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function (frame) {
                setConnected(true);
                stompClient.subscribe('/chat/admin', function (greeting) {
                    showGreeting(JSON.parse(greeting.body));
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
                        item.attr("id",_item.customerUniq)
                        if(_item.unread)
                            item.addClass("unread");
                        item.find(".username").prepend(_item.customerUniq);
                        item.find(".text-muted").append(_item.createdDate);
                        item.find(".btnchat").on('click', function (e) {
                            e.preventDefault();
                            ClientDestinationIdentifire=_item.customerUniq
                            $("#message-card").show(300)
                            $("#message-card .card-title").html(_item.customerUniq)
                        });
                        item.find(".message-text").html(_item.message);
                        item.find(".comment-text").append('<span title="3 New Messages" class="badge bg-primary float-right">3</span>');

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
            setConnected(false);
            console.log("Disconnected");
        }

        function sendName() {
            var message = {'message': $("#message").val()}

            var data = JSON.stringify(message)
            stompClient.send("/app/toclient/" + ClientDestinationIdentifire, {}, data);



            var item = $("#hidden-box .msg_item_right").clone()
            item.find(".direct-chat-text").html(message.message)
            var dt = new Date();
            item.find(".direct-chat-timestamp").html( dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds())
            $("#messageBox").append(item)
            $("#messageBox").animate({ scrollTop: $("#messageBox").height() }, 100);

        }

        function showGreeting(data) {
            if($("#message-card .card-title").html()===data.customerUniq){
                var item = $("#hidden-box .msg_item_left").clone()
                item.find(".direct-chat-text").html(data.message)
                item.find(".direct-chat-timestamp").html(data.createdDate)
                $("#messageBox").append(item)
                $("#messageBox").animate({ scrollTop: $("#messageBox").height() }, 100);
            }else{
            }
            $("#"+data.customerUniq).find(".message-text").html(data.message);
            console.log(data);
        }

        $(function () {
            $("form").on('submit', function (e) {
                e.preventDefault();
                sendName();
            });
            $("#message-card").hide()
            connect()
        });
    })(jQuery);

</script>
