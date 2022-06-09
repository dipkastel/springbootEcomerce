<%@ page contentType="text/html; charset=UTF-8" %>
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
