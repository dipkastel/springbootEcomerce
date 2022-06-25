<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--popup--%>
<script>
    (function ($) {
        $(".open-quick-view").click(function (arg) {
            $.get("/restapi/product/detail?id=" + $(this).attr("p-id"))
                .done(function (_data) {
                    $(".ps-product__info h1").text(_data.name)
                    if (_data.brand) {
                        $(".ps-product__meta p a").text(_data.brand.name)
                        $(".ps-product__meta p a").attr("href", "/brands/" + _data.brand.slug)
                    }else{
                        $(".ps-product__meta p a").text("نامشخص")
                        $(".ps-product__meta p a").removeAttr("href")
                    }
                    $(".ps-product__price").text(_data.price + " تومان ")
                    $(".ps-list-description").text(_data.shortDescription)
                    $(".ps-list-options").html("")
                    _data.attributes.forEach(function (arg) {
                        $(".ps-list-options").append($("<p>").text(arg.name + " : " + arg.option))
                    })
                    $(".modal_product__thumbnail").html("")
                    $(".modal_product__thumbnail").append('<div class="q_view__images" data-owl-auto="true" data-owl-loop="true"' +
                        ' data-owl-speed="5000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="true"'+
                    'data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1"'+
                    'data-owl-item-lg="1" data-owl-item-xl="1" data-owl-duration="1000"'+
                    'data-owl-animate-in="fadeIn" data-owl-animate-out="fadeOut" data-owl-mousedrag="on">'+
                    '</div>')

                    _data.images.forEach(function (arg) {
                        $(".q_view__images").append('<a href=""><img class="q_view_image" src="/image/display/'+arg.id+'" style="background-repeat: no-repeat; background-position: center center;"></a>')
                    })

                    $("#product-quickview").modal()

                })
                .fail(function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR)
                });
        })
        $(function () {

        });
    })(jQuery);

</script>
<%--chat--%>
<script>

    (function ($) {
        var chatClient = null;
        var userUniqeId = readCookie("uuid");
        if(userUniqeId==null){
            let uniqid= GenerateRandomUUID();
            createCookie("uuid",uniqid,30);
            userUniqeId = uniqid;
        }
        function openChatBox(){
            $("#chat").addClass("hidden");
            $("#chatBox").removeClass("hidden");
        }
        function CloseChatBox(){
            $("#chat").removeClass("hidden");
            $("#chatBox").addClass("hidden");
        }
        $("#chat").on('click', function (e) {
            openChatBox();
        })
        $("#btn_close_chat").on('click', function (e) {
            CloseChatBox();
        })
        $("#btn-chat-send").on('click', function (e) {
            ChatSend($("#message").val())
        });

        function connect(user) {
            var socket = new SockJS('/ChatEndPoint');
            chatClient = Stomp.over(socket);
            chatClient.connect({}, function (frame) {
                if(frame.command=="CONNECTED"){
                    onChatConnect();
                }
            });
        }
        function onChatConnect(){
            chatClient.subscribe('/chat/siteChat/' + userUniqeId, function (greeting) {
                messageRecived(JSON.parse(greeting.body));
            });
            $("#chat").removeClass("hidden")
            siteVisitSend(window.location.href)
        }

        function disconnect() {
            if (chatClient !== null) {
                chatClient.disconnect();
            }
            console.log("Disconnected");
        }

        function ChatSend(message){
            var message = {'message': message,
                            'sender':userUniqeId,
                            'client':userUniqeId,
                            'reciver':'admin'}
            var data = JSON.stringify(message)
            chatClient.send("/app/siteChat/"+userUniqeId, {}, data);
        }
        function DeliverSend(message){
            chatClient.send("/app/siteChatDelivery/"+userUniqeId, {}, JSON.stringify(message));
        }
        function ReadSend(message){
            chatClient.send("/app/siteChatRead/"+userUniqeId, {},JSON.stringify(message));
        }
        function siteVisitSend(url){

            var siteVisit =  {
                'userUniq':userUniqeId,
                'url':window.location.href
            }
            var data = JSON.stringify(siteVisit)
            chatClient.send("/app/siteVisit", {},siteVisit=data);
        }

        function messageRecived(data) {
            if($("#"+data.id)[0]){
                console.log("is delivery")
                $("#"+data.id).find(".direct-chat-timestamp").append('<i class="far fa-check-circle float-left"></i>');
                return;
            }
            if(data.sender==userUniqeId){
                var item = $("#my-chat-item").clone()
                item.attr("id",data.id);
                item.find(".direct-chat-text").html(data.message)
                item.find(".direct-chat-name").html(data.sender)
                var dt = new Date(data.createdDate);
                item.find(".direct-chat-timestamp").html( dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds())
                $("#message_Box").append(item)
                $("#message").val("")
                $("#message_Box").animate({ scrollTop: $("#message_Box").height() }, 100);
            }
            if(data.reciver==userUniqeId){
                var item = $("#chat-item").clone()
                item.attr("id",data.id);
                item.find(".direct-chat-text").html(data.message)
                item.find(".direct-chat-name").html(data.sender)
                var dt = new Date();
                item.find(".direct-chat-timestamp").html( dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds())
                $("#message_Box").append(item)
                $("#message_Box").animate({ scrollTop: $("#message_Box").height() }, 100);
                DeliverSend(data)
            }
            openChatBox()
        }

        function readCookie(name) {
            var nameEQ = name + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') c = c.substring(1, c.length);
                if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
            }
            return null;
        }
        function createCookie(name, value, days) {
            if (days) {
                var date = new Date();
                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                var expires = "; expires=" + date.toGMTString();
            }
            else var expires = "";

            document.cookie = name + "=" + value + expires + "; path=/";
        }
        function GenerateRandomUUID() {
            let min = 100000000
            let max = 999999999
            return "Visitor"+Math.floor(Math.random() * (max - min + 1) + min)
        }

        $(function () {

            connect(userUniqeId);

        });
    })(jQuery);

</script>
<%--<script>--%>
<%--    function addToWishList(id) {--%>
<%--        const data = null;--%>
<%--        const xhr = new XMLHttpRequest();--%>
<%--        xhr.addEventListener("readystatechange", function () {--%>
<%--            if (this.readyState === this.DONE) {--%>
<%--                if (this.responseText === "successful") {--%>
<%--                    msg("Add to wishlist sucessful!");--%>
<%--                } else if (this.responseText === "failed") {--%>
<%--                    msg("You can only add 1 time!");--%>
<%--                }--%>
<%--                initData();--%>
<%--            }--%>
<%--        });--%>
<%--        xhr--%>
<%--            .open(--%>
<%--                "GET",--%>
<%--                "${pageContext.servletContext.contextPath}/api/wish-list/addProductToWishList?id_product="--%>
<%--                + id);--%>
<%--        xhr.setRequestHeader('Content-type', 'application/json');--%>
<%--        xhr.send(data);--%>
<%--    }--%>

<%--    function addProductToViewList(id) {--%>
<%--        const data = null;--%>
<%--        const xhr = new XMLHttpRequest();--%>
<%--        xhr.addEventListener("readystatechange", function () {--%>
<%--        });--%>
<%--        xhr--%>
<%--            .open(--%>
<%--                "GET",--%>
<%--                "${pageContext.servletContext.contextPath}/api/wish-list/addProductToViewList?id_product="--%>
<%--                + id);--%>
<%--        xhr.setRequestHeader('Content-type', 'application/json');--%>
<%--        xhr.send(data);--%>
<%--    }--%>
<%--</script>--%>
