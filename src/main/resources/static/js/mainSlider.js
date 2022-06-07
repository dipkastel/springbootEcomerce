(function ($) {

    function mainSlider() {
        var homeBanner = $('.ps-carousel--animate');
        homeBanner.slick({
            autoplay: true,
            speed: 1000,
            rtl: true,
            lazyLoad: 'progressive',
            arrows: false,
            fade: true,
            dots: true,
            prevArrow: "<i class='slider-next ba-next'></i>",
            nextArrow: "<i class='slider-prev ba-back'></i>",
        });
    }
    $(function () {
        mainSlider();
    });
})(jQuery);
