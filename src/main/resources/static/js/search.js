
$(document).ready(function () {
    $(document).on("keyup", "#input-search", function (event) {
        var categoryId = document.querySelector('.categorySearch');
        var table = document.querySelector('.tableSearch');
        var queryCategory = ""
        if (categoryId.value !== "") {
            queryCategory += "&categoryId=" + categoryId.value
        }

        const data = null;
        const xhr = new XMLHttpRequest();
        xhr.addEventListener("readystatechange", function () {
            if (this.readyState === this.DONE) {
                var json = JSON.parse(this.responseText);
                console.log(json)
                table.innerHTML = getSearchTable(json)
            }
        });

        xhr.open("GET", "${pageContext.servletContext.contextPath}/filter/search?productName=" + this.value + queryCategory);
        xhr.setRequestHeader('Content-type', 'application/json');
        xhr.send(data);
    });

    function getSearchTable(json) {
        var table = ""
        for (let i = 0; i < json.length; i++) {
            table += "<div class='ps-product ps-product--wide ps-product--search-result'>"
            table += "<div class='ps-product__thumbnail'><a href='${pageContext.servletContext.contextPath}/product/detail?id=" + json[i].id + "' onclick='addProductToViewList(" + json[i].id + ")'><img src='${pageContext.request.contextPath}/product/display/0&" + json[i].id + "' style='width:60px;height:60px'></a></div>"
            table += "<div class='ps-product__content'><a class='ps-product__title' href='${pageContext.servletContext.contextPath}/product/detail?id=" + json[i].id + "' onclick='addProductToViewList(" + json[i].id + ")'>" + json[i].productName + "</a>"
            table += "<p class='ps-product__price' style='font-size: 17px'>$" + json[i].price + "</p>"
            table += "</div></div>"
        }
        return table
    }

})
