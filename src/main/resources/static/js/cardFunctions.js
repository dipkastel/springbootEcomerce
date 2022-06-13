
/* $(document).ready(function(){ */
var queryOnchange="";
var queryFilter="";
var filter = document.querySelector('#filter');
var brand = document.querySelector('#filterBrand');
var part = document.querySelector('#filterPart');
var tblProduct = document.querySelector('#filteredProduct');
var totalProduct = document.querySelector('#productTotal');
var cbxFilter =document.querySelector('#cbxFilter');
var searchBrand =document.querySelector('#searchBrand');
var queryParams = new URLSearchParams(window.location.search);
var btnPrice =document.querySelector('#btnPrice');
var countWish = document.querySelector('#countWish');
var cookie = document.cookie;
var arr_product;
var products = [];
var cartItems = [];

window.onload = initData();

function initData() {
    cookies();
    if (arr_product != null) {
        if (arr_product[0] != "") {
            countWish.innerHTML = arr_product.length;
        } else {
            countWish.innerHTML = 0;
        }
    }
    // initCartItem();
    // initCartItemData();
    // getAllProducts();
}


function updateWishlist() {
    cookies();
    if (arr_product != null) {
        if (arr_product[0] != "") {
            countWish.innerHTML = arr_product.length;
        } else {
            countWish.innerHTML = 0;
        }
    }
}


function cookies() {
    cookie = document.cookie;
    if (cookie != null) {
        matchs = cookie.match("wishlist=([^;]*)");
        if (matchs != null) {
            arr_product = matchs[1].split('a');
        }
    }
}

//remove item to cart
$(document).on("click", ".removeCartProduct", function () {
    if (cartItems.length > 0) {
        var deleteProductId = $(this).attr('value')
        var deleteProductIndex = -1;
        // alert($(this).attr('value'));
        for (let i = 0; i < cartItems.length; i++) {
            if (cartItems[i].id == deleteProductId) {
                deleteProductIndex = i;
                break;
            }
        }
        if (deleteProductIndex != -1) {
            cartItems.splice(deleteProductIndex, 1);
            countCartItems()
            showCartItems()
            updateCartItemsCookie(cartItems)
        }
    }
});

function getCartItemContent(items) {
    var user = '${user}';
    var cartItemContent = "";
    if (cartItems.length > 0) {
        var totalPrice = 0;
        for (let i = 0; i < cartItems.length; i++) {
            totalPrice += cartItems[i].totalPrice
            cartItemContent += "<div class='ps-cart__items'>";
            cartItemContent += "<div class='ps-product--cart-mobile'>"
            cartItemContent += "<div class='ps-product__thumbnail'><a href='#'><img src='/product/display/0&" + cartItems[i].id + "' alt=''></a></div>"
            cartItemContent += "<div class='ps-product__content '><a class='ps-product__remove removeCartProduct ' value='" + cartItems[i].id + "' ><i class='icon-cross ' ></i></a><a href='product-default.html'>"
                + cartItems[i].name + "</a>"
            cartItemContent += "<p><strong>فروشنده:</strong>  بایچه</p><small>"
                + cartItems[i].quantity
                + "x"
                + cartItems[i].price
                + " تومان</small>"
            cartItemContent += " </div> </div>"
            cartItemContent += " </div>"
        }
        cartItemContent += "<div class='ps-cart__footer'>"
        cartItemContent += "<h3>مجموع:<strong>" + totalPrice
            + " تومان</strong></h3>"
        if (user !== "") {
            cartItemContent += "<figure><a class='ps-btn' href='/customer/product/checkout-page'>سبد خرید</a><a class='ps-btn' href='/customer/product/checkout'>صورت حساب</a></figure>"
        } else {
            cartItemContent += "<figure><a class='ps-btn' href='/cart'>سبد خرید</a><a class='ps-btn' href='/customer/product/checkout'>صورت حساب</a></figure>"
        }
        cartItemContent += " </div>"
    }
    return cartItemContent;
}

function countCartItems() {
    document.getElementById('cartItemCount-1').innerHTML = cartItems.length
    document.getElementById('cartItemCount-2').innerHTML = cartItems.length
}

function showCartItems() {
    document.getElementById('cart-content-1').removeAttribute('style')
    document.getElementById('cart-content-2').removeAttribute('style')
    document.getElementById('cart-content-1').innerHTML = getCartItemContent(cartItems);
    document.getElementById('cart-content-2').innerHTML = getCartItemContent(cartItems);
    if (cartItems.length == 0) {
        document.getElementById('cart-content-1').setAttribute("style",
            "display: none;");
        document.getElementById('cart-content-2').setAttribute("style",
            "display: none;");
    }
}

function initCartItemData() {
    const data = null;
    const xhr = new XMLHttpRequest();
    xhr.addEventListener("readystatechange", function () {
        if (this.readyState === this.DONE) {
            var json = JSON.parse(this.responseText);
            console.log("initCartItem->>>")
            console.log(json)
            // if (cartItems.length >0){
            // 	cartItems.push(json)
            // }else{
            cartItems = json
            // }
        }
        countCartItems()
        showCartItems()
    });

    xhr
        .open("GET",
            "/product/getAll");
    xhr.setRequestHeader('Content-type', 'application/json');
    xhr.send(data);
}

function initCartItem() {
    const data = null;
    const xhr = new XMLHttpRequest();
    xhr.addEventListener("readystatechange", function () {
        if (this.readyState === this.DONE) {
            var json = JSON.parse(this.responseText);
            console.log("initCartItem->>>")
            console.log(json)
            // if (cartItems.length >0){
            // 	cartItems.push(json)
            // }else{
            cartItems = json
            // }
        }
        // countCartItems()
        // showCartItems()
    });

    xhr
        .open("GET",
            "/cart/getAll");
    xhr.setRequestHeader('Content-type', 'application/json');
    xhr.send(data);
}

function updateCartItemsCookie(cartItemsArr) {
    var value = "[]";
    if (cartItemsArr.length > 0) {
        value = "["
        for (let i = 0; i < cartItemsArr.length; i++) {
            value += JSON.stringify(cartItemsArr[i]) + ","
        }
        value = value.substring(0, value.length - 1)
        value += "]"
    }

    const data = value;
    const xhr = new XMLHttpRequest();
    xhr.addEventListener("readystatechange", function () {
        if (this.readyState === this.DONE) {
            var json = JSON.parse(this.responseText);
            // if (json.length>0){
            console.log("updateCartItemsCookie->>>>>")
            console.log(json)
            cartItems = json
            // }
        }
    });

    xhr.open("POST",
        "/cart/update");
    xhr.setRequestHeader('Content-type', 'application/json');
    console.log(data)
    xhr.send(data);
}

//add to Cart
$(document).on("click", ".toCart", function (event) {
    initCartItem();
    toCart(this.getAttribute('value'), event)
});

$(document).on("click", ".buyNow", function (event) {
    var user = ''
    initCartItem();
    toCart(this.getAttribute('value'), event)
    window.setTimeout(function () {
        if (user !== "") {
            window.location.href = "/customer/product/checkout-page";
        } else {
            window.location.href = "/cart";
        }
    }, 500)
});


function toCart(value, event) {
    if (checkStock(value, getCartProductQty(value))) {
        addItemToCart("/restapi/product/detail?id=" + value)
    } else {
        event.preventDefault()
    }
}

function checkStock(productId, qty) {
    if (qty != null) {
        for (let i = 0; i < products.length; i++) {
            if (products[i].id == productId) {
                if (qty < products[i].stockQuantity) {
                    return true;
                } else {
                    return false;
                }
            }
        }
    } else {
        return true;
    }

    return false;
}

function getCartProductQty(productId) {
    if (cartItems.length > 0) {
        for (let i = 0; i < cartItems.length; i++) {
            if (cartItems[i].id == productId) {
                return cartItems[i].sellingQuantity
            }
        }
    }
    return null;
}

function addItemToCart(url) {
    const data = null;
    const xhr = new XMLHttpRequest();
    xhr.addEventListener("readystatechange", function () {
        if (this.readyState === this.DONE) {
            var json = JSON.parse(this.responseText);
            console.log("JSON ->>>>")
            console.log(json)
            if (cartItems.length > 0) {
                var count = 0;
                for (let i = 0; i < cartItems.length; i++) {
                    //if duplicate sellingQuantity +=1
                    if (cartItems[i].id == json.id) {
                        cartItems[i].sellingQuantity += 1
                        cartItems[i].totalPrice = parseFloat(cartItems[i].price) * parseInt(cartItems[i].sellingQuantity)
                        count += 1
                    }
                }
                if (count == 0) {
                    cartItems.push(json)
                    // countCartItems()
                }
                updateCartItemsCookie(cartItems)
                showCartItems()
                console.log("cartItems ->>>>")
                console.log(cartItems)
            } else {
                cartItems.push(json)
                console.log("cartItems ->>>>")
                console.log(cartItems)
                // countCartItems()
                showCartItems()
                updateCartItemsCookie(cartItems)
            }
            countCartItems()
            msg("Add to cart sucessful !");

        }
    });

    xhr.open("GET", url);
    xhr.setRequestHeader('Content-type', 'application/json');
    xhr.send(data);

}
