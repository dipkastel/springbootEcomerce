
<%--<script>--%>
<%--    var countWish = document.querySelector('#countWish');--%>
<%--    var cookie = document.cookie;--%>
<%--    var arr_product;--%>
<%--    window.onload = initData();--%>
<%--    function initData() {--%>
<%--        cookies();--%>
<%--        if (arr_product != null) {--%>
<%--            if (arr_product[0] != "") {--%>
<%--                countWish.innerHTML = arr_product.length;--%>
<%--            } else {--%>
<%--                countWish.innerHTML = 0;--%>
<%--            }--%>
<%--        }--%>
<%--    }--%>

<%--    function cookies() {--%>
<%--        cookie = document.cookie;--%>
<%--        if (cookie != null) {--%>
<%--            matchs = cookie.match("wishlist=([^;]*)");--%>
<%--            if (matchs != null) {--%>
<%--                arr_product = matchs[1].split('a');--%>
<%--            }--%>
<%--        }--%>
<%--    }--%>
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
<%--            if (this.readyState === this.DONE) {--%>

<%--            }--%>
<%--        });--%>
<%--        xhr.open(--%>
<%--            "GET",--%>
<%--            "${pageContext.servletContext.contextPath}/api/wish-list/addProductToViewList?id_product="--%>
<%--            + id);--%>
<%--        xhr.setRequestHeader('Content-type', 'application/json');--%>
<%--        xhr.send(data);--%>
<%--    }--%>
<%--</script>--%>
<%--<script>--%>

<%--    $(document).ready(function () {--%>
<%--        // var cartItems = [];--%>
<%--        // var products = [];--%>
<%--        // window.onload = initData();--%>
<%--        // function initData() {--%>
<%--        // 	initCartItem();--%>
<%--        // 	getAllProducts();--%>
<%--        // }--%>

<%--        //////////////////////////////////////////////////--%>
<%--        //increase Qty--%>
<%--        $(document).on("click", ".up", function (event) {--%>
<%--            var productId = this.value;--%>
<%--            var qty = document.querySelector('.itemQty-' + this.value);--%>
<%--            var invalid = document.querySelector('.invalid-' + this.value);--%>
<%--            var invalidText = document.querySelector('.invalid-text-' + this.value)--%>
<%--            // alert(invalidText)--%>
<%--            if (checkStock(productId, qty.value)) {--%>
<%--                qty.value = Number(qty.value) + 1--%>
<%--                updateCartItems(new URLSearchParams(window.location.search).get("id"), qty.value)--%>
<%--                if (invalidText != null) {--%>
<%--                    invalidText.remove()--%>
<%--                }--%>
<%--            } else {--%>
<%--                event.preventDefault()--%>
<%--                invalid.innerHTML = "<div class='invalid-text-" + this.value + "'>اتمام موجودی !</div>"--%>
<%--            }--%>

<%--        });--%>

<%--        function checkStock(productId, qty) {--%>
<%--            for (let i = 0; i < products.length; i++) {--%>
<%--                if (products[i].id == productId) {--%>
<%--                    if (qty < products[i].stockQuantity) {--%>
<%--                        return true;--%>
<%--                    } else {--%>
<%--                        return false;--%>
<%--                    }--%>
<%--                }--%>
<%--            }--%>
<%--            return false;--%>
<%--        }--%>

<%--        //decrease Qty--%>
<%--        $(document).on("click", ".down", function (event) {--%>
<%--            var productId = this.value;--%>
<%--            var qty = document.querySelector('.itemQty-' + this.value);--%>
<%--            var invalidText = document.querySelector('.invalid-text-' + this.value)--%>
<%--            if (Number(qty.value) != 1) {--%>
<%--                qty.value = Number(qty.value) - 1--%>
<%--                if (invalidText != null) {--%>
<%--                    invalidText.remove()--%>
<%--                }--%>
<%--            } else {--%>
<%--                event.preventDefault()--%>

<%--            }--%>
<%--            updateCartItems(new URLSearchParams(window.location.search).get("id"), qty.value)--%>
<%--        });--%>

<%--        function findProduct(productId) {--%>
<%--            // initCartItem();--%>
<%--            console.log("id: " + productId)--%>
<%--            var qty = document.querySelector('.itemQty-' + productId);--%>
<%--            const data = null;--%>
<%--            const xhr = new XMLHttpRequest();--%>
<%--            xhr.addEventListener("readystatechange", function () {--%>
<%--                if (this.readyState === this.DONE) {--%>
<%--                    var json = JSON.parse(this.responseText);--%>
<%--                    console.log(json)--%>

<%--                    if (cartItems.length > 0) {--%>
<%--                        if (!updateCartItems(productId, qty.value)) {--%>
<%--                            json.sellingQuantity = qty.value--%>
<%--                            cartItems.push(json)--%>
<%--                        }--%>
<%--                        console.log("CartItem Product detail->>>>>")--%>
<%--                        console.log(cartItems)--%>
<%--                    } else {--%>
<%--                        json.sellingQuantity = qty.value--%>
<%--                        cartItems.push(json)--%>
<%--                        console.log("CartItem Product detail->>>>>")--%>
<%--                        console.log(cartItems)--%>
<%--                    }--%>
<%--                    console.log("Update CartItem Product detail->>>>>")--%>
<%--                    updateCartItemsCookieDataDetail()--%>

<%--                }--%>
<%--            });--%>

<%--            xhr.open("GET", "${pageContext.servletContext.contextPath}/cart/get?productId=" + productId);--%>
<%--            xhr.setRequestHeader('Content-type', 'application/json');--%>
<%--            xhr.send(data);--%>
<%--        }--%>


<%--        function updateCartItems(productId, Qty) {--%>
<%--            if (cartItems.length > 0) {--%>
<%--                for (let i = 0; i < cartItems.length; i++) {--%>
<%--                    if (cartItems[i].product.id == productId) {--%>
<%--                        cartItems[i].sellingQuantity = parseInt(Qty)--%>
<%--                        cartItems[i].totalPrice = parseInt(cartItems[0].sellingQuantity) * parseFloat(cartItems[i].product.price)*15--%>
<%--                        return true;--%>
<%--                    }--%>
<%--                }--%>
<%--            }--%>
<%--            return false;--%>
<%--        }--%>

<%--        //add to Cart--%>
<%--        $(document).on("click", ".toCartDetail", function (event) {--%>
<%--            // alert(cartItems[0].sellingQuantity)--%>
<%--            findProduct(new URLSearchParams(window.location.search).get("id"));--%>
<%--            // updateCartItemsCookieData(cartItems)--%>
<%--            msg("Add to cart sucessful !");--%>

<%--        });--%>

<%--        $(document).on("click", ".buyNowDetail", function (event) {--%>
<%--            // updateCartItemsCookie(cartItems)--%>
<%--            var user = '${user}'--%>
<%--            findProduct(new URLSearchParams(window.location.search).get("id"));--%>
<%--            window.setTimeout(function () {--%>
<%--                if (user !== "") {--%>
<%--                    window.location.href = "${pageContext.servletContext.contextPath}/customer/product/checkout-page";--%>
<%--                } else {--%>
<%--                    window.location.href = "${pageContext.servletContext.contextPath}/cart";--%>
<%--                }--%>
<%--            }, 500)--%>
<%--        });--%>



<%--        function toCart(value, event) {--%>
<%--            if (checkStock(value, getCartProductQty(value))) {--%>
<%--                addItemToCart("${pageContext.servletContext.contextPath}/cart/get?productId=" + value)--%>
<%--            } else {--%>
<%--                event.preventDefault()--%>
<%--            }--%>
<%--        }--%>

<%--        function getCartProductQty(productId) {--%>
<%--            if (cartItems.length > 0) {--%>
<%--                for (let i = 0; i < cartItems.length; i++) {--%>
<%--                    if (cartItems[i].product.id == productId) {--%>
<%--                        return cartItems[i].sellingQuantity--%>
<%--                    }--%>
<%--                }--%>
<%--            }--%>
<%--            return null;--%>
<%--        }--%>

<%--        function addItemToCart(url) {--%>
<%--            const data = null;--%>
<%--            const xhr = new XMLHttpRequest();--%>
<%--            xhr.addEventListener("readystatechange", function () {--%>
<%--                if (this.readyState === this.DONE) {--%>
<%--                    var json = JSON.parse(this.responseText);--%>
<%--                    console.log(json)--%>
<%--                    if (cartItems.length > 0) {--%>
<%--                        var count = 0;--%>
<%--                        for (let i = 0; i < cartItems.length; i++) {--%>
<%--                            //if duplicate sellingQuantity +=1--%>
<%--                            if (cartItems[i].product.id == json.product.id) {--%>
<%--                                cartItems[i].sellingQuantity += 1--%>
<%--                                cartItems[i].totalPrice = parseFloat(cartItems[i].product.price) * parseInt(cartItems[i].sellingQuantity)*11--%>
<%--                                count += 1--%>
<%--                            }--%>
<%--                        }--%>
<%--                        if (count == 0) {--%>
<%--                            cartItems.push(json)--%>
<%--                            countCartItems()--%>
<%--                        }--%>
<%--                        updateCartItemsCookie(cartItems)--%>
<%--                        showCartItems()--%>
<%--                        console.log(cartItems)--%>
<%--                    } else {--%>
<%--                        cartItems.push(json)--%>
<%--                        console.log(cartItems)--%>
<%--                        countCartItems()--%>
<%--                        showCartItems()--%>
<%--                        updateCartItemsCookie(cartItems)--%>
<%--                    }--%>

<%--                }--%>
<%--            });--%>

<%--            xhr.open("GET", url);--%>
<%--            xhr.setRequestHeader('Content-type', 'application/json');--%>
<%--            xhr.send(data);--%>
<%--        }--%>

<%--        function updateCartItemsCookieDataDetail() {--%>
<%--            var value = "[]";--%>
<%--            if (cartItems.length > 0) {--%>
<%--                value = "["--%>
<%--                for (let i = 0; i < cartItems.length; i++) {--%>
<%--                    value += JSON.stringify(cartItems[i]) + ","--%>
<%--                }--%>
<%--                value = value.substring(0, value.length - 1)--%>
<%--                value += "]"--%>
<%--            }--%>

<%--            const data = value;--%>
<%--            const xhr = new XMLHttpRequest();--%>
<%--            xhr.addEventListener("readystatechange", function () {--%>
<%--                if (this.readyState === this.DONE) {--%>
<%--                    var json = JSON.parse(this.responseText);--%>
<%--                    // if (json.length>0){--%>
<%--                    console.log(json)--%>
<%--                    cartItems = json--%>
<%--                    countCartItems();--%>
<%--                    showCartItems();--%>
<%--                    // }--%>

<%--                }--%>
<%--            });--%>

<%--            xhr.open("POST", "${pageContext.servletContext.contextPath}/cart/update");--%>
<%--            xhr.setRequestHeader('Content-type', 'application/json');--%>
<%--            console.log(data)--%>
<%--            xhr.send(data);--%>

<%--        }--%>
<%--    })--%>

<%--    function msg(value) {--%>
<%--        var style = value;--%>
<%--        var time = 1200;--%>
<%--        var message;--%>
<%--        switch (value) {--%>
<%--            case "alert-success": message = "Successful !"; break;--%>
<%--            case "alert_warning": message = "error warning"; break;--%>
<%--            case "alert-danger": message = "Failed !"; break;--%>
<%--            case "alert_info": message = "Data not found"; break;--%>
<%--            default:--%>
<%--                if (value.includes("invalid") || value.includes("failed") || value.includes("only")) {--%>
<%--                    style = "alert-danger";--%>
<%--                } else {--%>
<%--                    style = "alert-success";--%>
<%--                }--%>
<%--                message = value;--%>
<%--        }--%>
<%--        var height = ($(window).height() - 45) / 5;--%>

<%--        if ($(window).scrollTop() >= height) {--%>
<%--            height = ($(window).scrollTop() + 70)--%>
<%--        }--%>


<%--        $('<div id="promptModal">')--%>
<%--            .appendTo('body')--%>
<%--            .addClass('alert ' + style)--%>
<%--            .css({--%>
<%--                "display": "block",--%>
<%--                "z-index": 99999,--%>
<%--                "left": ($(document.body).outerWidth(true) - 200),--%>
<%--                "top": height,--%>
<%--                "position": "absolute",--%>
<%--                "padding": "20px",--%>
<%--                "border-radius": "5px",--%>
<%--                "width": "200px",--%>
<%--                "text-align": "center",--%>

<%--            })--%>
<%--            .html(message)--%>
<%--            .show()--%>
<%--            .delay(time)--%>
<%--            .fadeOut(10, function () {--%>
<%--                $('#promptModal').remove();--%>
<%--            });--%>


<%--    }--%>
<%--</script>--%>
<!-- <script>
$(document).ready(function () {
$('#btnSubmitReview').on('click', function () {
let user = $('#user');
$.ajax({
method: $('#frmReview').attr('method'),
url: $('#frmReview').attr('action'),
data: $('#frmReview').serialize(),
success: function (data) {
console.log(data.message);
if (data.message === 'success') {
msg("Review sucessful!");
} else if (data.message === 'not login') {
if (user.val() === "") {
window.location.href = "/login";
}
msg("Review failed!");
} else if (data.message === 'customer not exists') {
window.location.href = "/customer/info";
msg("invalid, please enter your information!");
} else if (data.message === 'admin not review') {
msg("invalid, admin has no rights!");
}
}
});
});
});
</script> -->
