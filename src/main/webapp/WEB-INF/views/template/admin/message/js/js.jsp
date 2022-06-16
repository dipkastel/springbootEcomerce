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
                stompClient.subscribe('/chat/' + user + '/ctoa', function (greeting) {
                    showGreeting(JSON.parse(greeting.body));
                });
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
            stompClient.send("/app/chat/" + ClientDestinationIdentifire, {}, data);

        }

        function showGreeting(data) {
            var item = $($("#chat-item").html()).clone()
            item.find(".direct-chat-text").html(data.message)
            item.find(".direct-chat-timestamp").html(data.createdDate)
            $("#messageBox").prepend(item)
            console.log(data);
        }

        $(function () {
            $("form").on('submit', function (e) {
                e.preventDefault();
                sendName();
            });
            connect();
        });
    })(jQuery);

</script>
