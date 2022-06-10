<%@ page contentType="text/html; charset=UTF-8" %>


<script>
    function IsPhone(phone) {
        var regex =   /^09(1[0-9]|3[1-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}$/;
        if(!regex.test(phone)) {
            return false;
        }else{
            return true;
        }
    }

    $('#btnSave')
        .on(
            'click',
            function () {
                let fname = $('#fname');
                let fnameError = $('#fname-error');
                let lname = $('#lname');
                let lnameError = $('#lname-error');
                let email = $('#email');
                let emailError = $('#email-error');
                let nationalCode = $('#nationalCode');
                let nationalCodeError = $('#nationalCode-error');
                let hasSubmit = [];

                if (nationalCode.val().length !==10) {
                    hasSubmit.push(1);
                    nationalCode.addClass(
                        'form-control is-invalid');
                    nationalCodeError.html(
                        'کد ملی درست نیست');
                }
                if (email.val().length > 250) {
                    hasSubmit.push(1);
                    email.addClass(
                        'form-control is-invalid');
                    emailError.html(
                        'ایمیل طولانی است');
                }
                if (lname.val().length > 250) {
                    hasSubmit.push(1);
                    lname.addClass(
                        'form-control is-invalid');
                    lnameError.html(
                        'نام خانوادگی طولانی است');
                }
                if (fname.val().length > 250) {
                    hasSubmit.push(1);
                    fname.addClass(
                        'form-control is-invalid');
                    fnameError.html(
                        'نام طولانی است');
                }
                if (fname.val().length === 0) {
                    hasSubmit.push(1);
                    fname.addClass(
                        'form-control is-invalid');
                    fnameError.html(
                        'نام را وارد کنید');
                }

                if (lname.val().length === 0) {
                    hasSubmit.push(1);
                    lname.addClass(
                        'form-control is-invalid');
                    lnameError.html(
                        'نام خانوادگی را وارد کنید');
                }


                if (email.val().length === 0) {
                    hasSubmit.push(1);
                    email.addClass(
                        'form-control is-invalid');
                    emailError.html(
                        'ایمیل را وارد کنید');
                }



                if (hasSubmit.length === 0) {
                    $('#frm').submit();
                }

            });
</script>

<script>
    $(document).ready(function(){

//cookie and cartItem
        var cartItems = [];
        var products = [];
        window.onload = initData();

        function initData(){
            initCartItem();
            getAllProducts();
        }

        function getAllProducts(){

            const data = null;
            const xhr = new XMLHttpRequest();
            xhr.addEventListener("readystatechange", function () {
                if (this.readyState === this.DONE) {
                    var json = JSON.parse(this.responseText);
                    console.log(json)
                    products = json
                }
            });

            xhr.open("GET", "${pageContext.servletContext.contextPath}/filter/getAllProducts");
            xhr.setRequestHeader('Content-type', 'application/json');
            xhr.send(data);
        }



//checkout
        $(document).on("click",".checkout", function(){
            updateCartItemsCookie(cartItems)
        });
//increase Qty
        $(document).on("click",".up", function(event){
            var productId = this.value;
            var qty = document.querySelector('.itemQty-'+this.value);
            var invalid = document.querySelector('.invalid-'+this.value);
            var invalidText = document.querySelector('.invalid-text-'+this.value)
            // alert(invalidText)
            if (checkStock(productId,qty.value)){
                qty.value = Number(qty.value) + 1
                updateCartItems(cartItems,productId,qty.value)
                if (invalidText!=null){
                    invalidText.remove()
                }
            }else{
                event.preventDefault()
                invalid.innerHTML = "<div class='invalid-text-"+this.value+"'>اتمام موجودی !</div>"
            }

        });

        function checkStock(productId,qty){
            for (let i = 0; i < products.length ; i++) {
                if (products[i].id == productId){
                    if (qty < products[i].stockQuantity){
                        return true;
                    }else{
                        return false;
                    }
                }
            }
            return false;
        }

//decrease Qty
        $(document).on("click",".down", function(event){
            var productId = this.value;
            var qty = document.querySelector('.itemQty-'+this.value);
            var invalidText = document.querySelector('.invalid-text-'+this.value)
            if (Number(qty.value) != 1){
                qty.value = Number(qty.value) - 1
                if (invalidText!=null){
                    invalidText.remove()
                }
            }else{
                event.preventDefault()
            }
            updateCartItems(cartItems,productId,qty.value)
        });

//remove cart item

        $(document).on("click",".removeCartProduct", function(){
            if (cartItems.length >0){
                var deleteProductId = $(this).attr('value')
                var deleteProductIndex = -1;
                // alert($(this).attr('value'));
                for (let i = 0; i < cartItems.length; i++) {
                    if (cartItems[i].product.id == deleteProductId){
                        deleteProductIndex = i;
                        break;
                    }
                }
                if (deleteProductIndex != -1){
                    cartItems.splice(deleteProductIndex, 1);
                    countCartItems()
                    showCartItems()
                    updateCartItemsCookie(cartItems)
                    document.getElementById('tblShoppingCart').innerHTML = getTableShoppingCart(cartItems)
                    document.querySelector('.ps-table--shopping-cart tfoot').innerHTML = getFooterShoppingCartTable(cartItems)
                }


            }
        });

        function updateCartItems(items,productId,Qty) {
            var totalPriceItem = document.querySelector('.totalPriceItem-'+productId)
            var totalPriceCart = document.querySelector('.totalPriceCart')
            if (items.length>0){
                for (let i = 0; i < items.length; i++) {
                    if (items[i].product.id == productId){
                        items[i].sellingQuantity = Qty
                        items[i].totalPrice =  parseInt(items[i].sellingQuantity) * parseFloat(items[i].product.price)
                        totalPriceItem.innerHTML =  items[i].totalPrice+"تومان"
                        totalPriceCart.innerHTML =  getTotalPriceCart(items)+"تومان"
                    }
                }
            }
        }

        function getTotalPriceCart(items) {
            var total = 0;
            for (let i = 0; i < items.length; i++) {
                total += items[i].totalPrice
            }
            return total
        }

        function getCartItemContent(items) {
            var cartItemContent ="";
            var user = '${user}'
            if (cartItems.length >0){
                var totalPrice = 0;
                for (let i = 0; i < cartItems.length; i++) {
                    totalPrice += cartItems[i].totalPrice
                    cartItemContent += "<div class='ps-cart__items'>";
                    cartItemContent +="<div class='ps-product--cart-mobile'>"
                    cartItemContent +="<div class='ps-product__thumbnail'><a href='#'><img src='${pageContext.request.contextPath}/product/display/0&"+cartItems[i].product.id+"' alt=''></a></div>"
                    cartItemContent +="<div class='ps-product__content '><a class='ps-product__remove removeCartProduct ' value='"+cartItems[i].product.id+"' ><i class='icon-cross ' ></i></a><a href='product-default.html'>"+cartItems[i].product.productName+"</a>"
                    cartItemContent +="<p><strong>فروشنده:</strong>  بایچه</p><small>"+cartItems[i].sellingQuantity+" x "+cartItems[i].product.price+"تومان</small>"
                    cartItemContent +=" </div> </div>"
                    cartItemContent +=" </div>"
                }
                cartItemContent+="<div class='ps-cart__footer'>"
                cartItemContent += "<h3>مجموع:<strong>"+totalPrice+"تومان</strong></h3>"
                if (user !==""){
                    cartItemContent +="<figure><a class='ps-btn' href='${pageContext.servletContext.contextPath}/customer/product/checkout-page'>View Cart</a><a class='ps-btn checkout' href='${pageContext.servletContext.contextPath}/customer/product/checkout'>Checkout</a></figure>"
                }else{
                    cartItemContent +="<figure><a class='ps-btn' href='${pageContext.servletContext.contextPath}/cart'>View Cart</a><a class='ps-btn checkout' href='${pageContext.servletContext.contextPath}/customer/product/checkout'>Checkout</a></figure>"
                }
                cartItemContent +=" </div>"
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
            if (cartItems.length ==0){
                document.getElementById('cart-content-1').setAttribute("style", "display: none;");
                document.getElementById('cart-content-2').setAttribute("style", "display: none;");
            }
        }

        function updateCartItemsCookie(cartItemsArr) {
            var value = "[]";
            if (cartItemsArr.length >0){
                value ="["
                for (let i = 0; i < cartItemsArr.length; i++) {
                    value += JSON.stringify(cartItemsArr[i]) +","
                }
                value = value.substring(0,value.length-1)
                value +="]"
            }


            const data = value;
            const xhr = new XMLHttpRequest();
            xhr.addEventListener("readystatechange", function () {
                if (this.readyState === this.DONE) {
                    var json = JSON.parse(this.responseText);
                    // if (json.length>0){
                    console.log("cart: "+json)
                    cartItems = json
                    // }
                }
            });

            xhr.open("POST", "${pageContext.servletContext.contextPath}/cart/update");
            xhr.setRequestHeader('Content-type', 'application/json');
            console.log(data)
            xhr.send(data);
        }

        function initCartItem() {
            const data = null;
            const xhr = new XMLHttpRequest();
            xhr.addEventListener("readystatechange", function () {
                if (this.readyState === this.DONE) {
                    var json = JSON.parse(this.responseText);
                    console.log(json)
                    cartItems = json
                    countCartItems()
                    showCartItems()
                }
            });

            xhr.open("GET", "${pageContext.servletContext.contextPath}/cart/getAll");
            xhr.setRequestHeader('Content-type', 'application/json');
            xhr.send(data);
        }

        function getTableShoppingCart(item) {
            var    table = "";
            if (item.length>0){
                for (let i = 0; i < item.length; i++) {
                    table+="<tr>"
                    table +="<td data-label='Product'>"
                    table +="<div class='ps-product--cart'>"
                    table +="<div class='ps-product__thumbnail'><a href='${pageContext.servletContext.contextPath}/product/detail?id="+item[i].product.id+"' onclick='addProductToViewList("+item[i].product.id+")'><img src='${pageContext.request.contextPath}/product/display/0&"+item[i].product.id+"' alt=''></a></div>"
                    table +="<div class='ps-product__content'><a href='${pageContext.servletContext.contextPath}/product/detail?id="+item[i].product.id+"' onclick='addProductToViewList("+item[i].product.id+")'>"+item[i].product.productName+"</a>"
                    table +="<p>Sold By:<strong> ANGRY NERDS</strong></p>"
                    table +="</div> </div> </td>"
                    table +="<td class='price text-center' data-label='Price'>$"+item[i].product.price+"</td>"
                    table +="<td data-label='Quantity' class='text-center'>"
                    table +="<div class='form-group--number'>"
                    table +="<button class='up' value='"+item[i].product.id+"'>+</button>"
                    table +="<button class='down' value='"+item[i].product.id+"'>-</button>"
                    table +="<input class='form-control itemQty-"+item[i].product.id+"'   type='text' placeholder='1' value='"+item[i].sellingQuantity+"' readonly>"
                    table +=" </div><span style='color: red' class='invalid-"+item[i].product.id+"'></span></td>"
                    table +="<td data-label='Total' class='text-center totalPriceItem'>"+item[i].totalPrice+"تومان</td>"
                    table +=" <td data-label='Actions'><a class='removeCartProduct' value='"+item[i].product.id+"'><i class='icon-cross'></i></a></td>"
                    table +=" </tr>"
                }
            }else{
                table +="  <tr> <td colspan='5' class='text-center'><h1>محصولی انتخاب نشده</h1></td></tr>"
                document.querySelector('.hide-1').style.display = "none"
                document.querySelector('.hide-2').style.display = "none"
            }
            return table;
        }

        function getFooterShoppingCartTable(item) {
            var    table = "";
            if (item.length>0){

                var total = 0;
                for (let i = 0; i < item.length; i++) {
                    total += item[i].totalPrice
                }
                table+="<tfoot style='border-bottom: 1px solid #dee2e6'>"
                table+="<tr class='text-center'>"
                table+="<td colspan='3'><h3>SUBTOTAL</h3></td>"
                table+="<td colspan='2'><h3 class='totalPriceCart'>$"+total+"</h3></td>"
                table+="</tr></tfoot>"
            }
            return table;
        }

    })


</script>
<script>
    function addProductToViewList(id) {
        const data = null;
        const xhr = new XMLHttpRequest();
        xhr.addEventListener("readystatechange", function() {
        });
        xhr
            .open(
                "GET",
                "${pageContext.servletContext.contextPath}/api/wish-list/addProductToViewList?id_product="
                + id);
        xhr.setRequestHeader('Content-type', 'application/json');
        xhr.send(data);
    }
</script>

<script>
    function checkout(){
        window.setTimeout(function () {
            window.location.href = "${pageContext.servletContext.contextPath}/customer/product/checkout";
        },300)
    }

</script>
<script src="${pageContext.servletContext.contextPath}/js/paging1.js"></script>
<script>
    $(document).ready(function(){
        $(function() {
            $("#listPage").JPaging({
                pageSize: 6
            });
        });
    })


</script>

<script>
    var tblProduct = document.querySelector('#wishProductTable');
    function removeFromWishList(id) {
        const data = null;
        const xhr = new XMLHttpRequest();
        xhr.addEventListener("readystatechange", function() {
            if (this.readyState === this.DONE) {
                var json = JSON.parse(this.responseText);
                // initData();
                updateWishlist();
                if (json.length > 0) {
                    tblProduct.innerHTML = getWishListTable(json);
                } else {
                    tblProduct.innerHTML = getNoWishProductFound();
                }
            }
        });
        xhr
            .open(
                "GET",
                "${pageContext.servletContext.contextPath}/api/wish-list/removeProductFromWishList?id_product="
                + id);
        xhr.setRequestHeader('Content-type', 'application/json');
        xhr.send(data);
    }

    function getWishListTable(json) {
        var wishListTable = '';
        for (let i = 0; i < json.length; i++) {
            wishListTable += '<tr>';
            wishListTable += '<td data-label="Remove"><a onClick="removeFromWishList('
                + json[i].id + ')"><i class="icon-cross"></i></a></td>';
            wishListTable += '<td data-label="Product">';
            wishListTable += '<div class="ps-product--cart">';
            wishListTable += '<div class="ps-product__thumbnail">';
            wishListTable += '<a href="${pageContext.servletContext.contextPath}/product/detail?id='+json[i].id+'"><img src="${pageContext.request.contextPath}/product/display/0&'+json[i].id+'" alt="" width="100px" height="100px"></a>';
            wishListTable += '</div>';
            wishListTable += '<div class="ps-product__content">';
            wishListTable += '<a href="${pageContext.servletContext.contextPath}/product/detail?id='+json[i].id+'">'+json[i].productName+'</a><p>فروشنده:<strong> بایچه</strong></p>';
            wishListTable += '</div>';
            wishListTable += '</div>';
            wishListTable += '</td>';
            wishListTable += '<td class="price text-center" data-label="Price">$'
                + json[i].price + '</td>';
            wishListTable += '<td data-label="Status" class="text-center"><span class="ps-tag ps-tag--in-stock ">'
                + json[i].enabled + '</span></td>';
            wishListTable += '<td data-label="action"><a class="ps-btn" onclick="addItemToCart('+json[i].id+')">Add to cart</a></td></tr>';
        }
        return wishListTable;
    }
    function getNoWishProductFound() {
        return '<tr><td colspan="5" class="text-center"><h1>محصولی وجود ندارد !!!</h1></td></tr>';
    }

    // Add to cart in wishlist page
    function checkStock(productId,qty){
        if (qty !=null){
            for (let i = 0; i < products.length ; i++) {
                if (products[i].id == productId){
                    if (qty < products[i].stockQuantity){
                        return true;
                    }else{
                        return false;
                    }
                }
            }
        }else{
            return true;
        }

        return false;
    }

    function getCartProductQty(productId){
        if (cartItems.length>0){
            for (let i = 0; i < cartItems.length; i++) {
                if (cartItems[i].product.id == productId){
                    return cartItems[i].sellingQuantity
                }
            }
        }
        return null;
    }

    function addItemToCart(id){
        if (checkStock(id,getCartProductQty(id))){
            const data = null;
            const xhr = new XMLHttpRequest();
            xhr.addEventListener("readystatechange", function () {
                if (this.readyState === this.DONE) {
                    var json = JSON.parse(this.responseText);
                    console.log("json addItem: "+json)
                    if (cartItems.length>0){
                        var count = 0;
                        for (let i = 0; i < cartItems.length; i++) {
                            //if duplicate sellingQuantity +=1
                            if (cartItems[i].product.id == json.product.id){
                                cartItems[i].sellingQuantity += 1
                                cartItems[i].totalPrice =  parseFloat(cartItems[i].totalPrice) *  parseInt(cartItems[i].sellingQuantity)
                                count += 1
                            }
                        }
                        if (count == 0){
                            cartItems.push(json)
                            countCartItems()
                        }
                        updateCartItemsCookie(cartItems)
                        showCartItems()
                        console.log(cartItems)
                    }else{
                        cartItems.push(json)
                        console.log("cartItems: "+cartItems)
                        countCartItems()
                        showCartItems()
                        updateCartItemsCookie(cartItems)
                    }
                    msg("Add to cart successful!");
                    removeFromWishList(id)

                }
            });

            xhr.open("GET", "${pageContext.servletContext.contextPath}/cart/get?productId="
                + id);
            xhr.setRequestHeader('Content-type', 'application/json');
            xhr.send(data);
        }else{
            msg("Add to cart failed!");
        }
    }

    function addProductToViewList(id) {
        const data = null;
        const xhr = new XMLHttpRequest();
        xhr.addEventListener("readystatechange", function() {
            if (this.readyState === this.DONE) {

            }
        });
        xhr
            .open(
                "GET",
                "${pageContext.servletContext.contextPath}/api/wish-list/addProductToViewList?id_product="
                + id);
        xhr.setRequestHeader('Content-type', 'application/json');
        xhr.send(data);
    }
</script>
