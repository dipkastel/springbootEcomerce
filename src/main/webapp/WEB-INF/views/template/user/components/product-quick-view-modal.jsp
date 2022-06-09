<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="modal fade product-quickview-open" id="product-quickview" tabindex="-1" role="dialog"
     aria-labelledby="product-quickview" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content"><span class="modal-close" data-dismiss="modal"><i class="icon-cross2"></i></span>
            <article class="ps-product--detail ps-product--fullwidth ps-product--quickview">
                <div class="ps-product__header">
                    <div class="modal_product__thumbnail">
                    </div>

                    <div class="ps-product__info">
                        <h1></h1>
                        <div class="ps-product__meta">
                            <p>برند: <a href=""></a></p>
                        </div>
                        <h4 class="ps-product__price">
                            تومان</h4>
                        <div class="ps-product__desc">
                            <div class="ps-list-options">
                            </div>
                            <div class="ps-description">
                            </div>
                        </div>
                        <div class="ps-product__shopping"><a class="ps-btn ps-btn--black toCart" value="[product-id]">افزودن
                            به سبد خرید</a><a class="ps-btn buyNow" value="[product-id]">خرید</a>
                        </div>
                    </div>
                </div>
            </article>
        </div>
    </div>
</div>
