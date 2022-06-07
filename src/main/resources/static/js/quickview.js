(function ($) {
    $('#product-quickview').on('shown.bs.modal', function (e) {
        $('.ps-product--quickview .ps-product__images').slick('setPosition');
    });

    $('.product-quickview-open').on('shown.bs.modal', function (e) {
        $('.ps-product--quickview .ps-product__images').slick('setPosition');
    });
})(jQuery);
