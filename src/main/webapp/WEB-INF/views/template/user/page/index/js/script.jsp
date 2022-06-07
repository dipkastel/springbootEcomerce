
<script>
    function addToWishList(id) {
        const data = null;
        const xhr = new XMLHttpRequest();
        xhr.addEventListener("readystatechange", function () {
            if (this.readyState === this.DONE) {
                if (this.responseText === "successful") {
                    msg("Add to wishlist sucessful!");
                } else if (this.responseText === "failed") {
                    msg("You can only add 1 time!");
                }
                initData();
            }
        });
        xhr
            .open(
                "GET",
                "${pageContext.servletContext.contextPath}/api/wish-list/addProductToWishList?id_product="
                + id);
        xhr.setRequestHeader('Content-type', 'application/json');
        xhr.send(data);
    }

    function addProductToViewList(id) {
        const data = null;
        const xhr = new XMLHttpRequest();
        xhr.addEventListener("readystatechange", function () {
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
