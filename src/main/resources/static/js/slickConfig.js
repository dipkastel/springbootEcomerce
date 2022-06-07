(function ($) {

    function slickConfig() {
        var product = $('.ps-product--detail');

        if (product.length > 0) {
            var primary = product.find('.ps-product__gallery'),
                second = product.find('.ps-product__variants'),
                vertical = product
                    .find('.ps-product__thumbnail')
                    .data('vertical');
            primary.slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                asNavFor: '.ps-product__variants',
                fade: true,
                rtl: true,
                dots: false,
                infinite: false,
                arrows: primary.data('arrow'),
                prevArrow: "<a href='#'><i class='fa fa-angle-right'></i></a>",
                nextArrow: "<a href='#'><i class='fa fa-angle-left'></i></a>",
            });
            second.slick({
                slidesToShow: second.data('item'),
                slidesToScroll: -1,
                infinite: false,
                arrows: second.data('arrow'),
                rtl: true,
                focusOnSelect: true,
                prevArrow: "<a href='#'><i class='fa fa-angle-up'></i></a>",
                nextArrow: "<a href='#'><i class='fa fa-angle-down'></i></a>",
                asNavFor: '.ps-product__gallery',
                vertical: vertical,
                responsive: [
                    {
                        breakpoint: 1200,
                        settings: {
                            arrows: second.data('arrow'),
                            slidesToShow: 4,
                            vertical: false,
                            prevArrow:
                                "<a href='#'><i class='fa fa-angle-left'></i></a>",
                            nextArrow:
                                "<a href='#'><i class='fa fa-angle-right'></i></a>",
                        },
                    },
                    {
                        breakpoint: 992,
                        settings: {
                            arrows: second.data('arrow'),
                            slidesToShow: 4,
                            vertical: false,
                            prevArrow:
                                "<a href='#'><i class='fa fa-angle-left'></i></a>",
                            nextArrow:
                                "<a href='#'><i class='fa fa-angle-right'></i></a>",
                        },
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 3,
                            vertical: false,
                            prevArrow:
                                "<a href='#'><i class='fa fa-angle-left'></i></a>",
                            nextArrow:
                                "<a href='#'><i class='fa fa-angle-right'></i></a>",
                        },
                    },
                ],
            });
        }
    }
    function slickConfig1() {
        var product = $('.ps-product--detail-1');

        if (product.length > 0) {
            var primary = product.find('.ps-product__gallery'),
                second = product.find('.ps-product__variants'),
                vertical = product
                    .find('.ps-product__thumbnail')
                    .data('vertical');
            primary.slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                asNavFor: '.ps-product__variants',
                fade: true,
                dots: false,
                infinite: false,
                arrows: primary.data('arrow'),
                prevArrow: "<a href='#'><i class='fa fa-angle-left'></i></a>",
                nextArrow: "<a href='#'><i class='fa fa-angle-right'></i></a>",
            });
            second.slick({
                slidesToShow: second.data('item'),
                slidesToScroll: 1,
                infinite: false,
                arrows: second.data('arrow'),
                focusOnSelect: true,
                prevArrow: "<a href='#'><i class='fa fa-angle-up'></i></a>",
                nextArrow: "<a href='#'><i class='fa fa-angle-down'></i></a>",
                asNavFor: '.ps-product__gallery',
                vertical: vertical,
                responsive: [
                    {
                        breakpoint: 1200,
                        settings: {
                            arrows: second.data('arrow'),
                            slidesToShow: 4,
                            vertical: false,
                            prevArrow:
                                "<a href='#'><i class='fa fa-angle-left'></i></a>",
                            nextArrow:
                                "<a href='#'><i class='fa fa-angle-right'></i></a>",
                        },
                    },
                    {
                        breakpoint: 992,
                        settings: {
                            arrows: second.data('arrow'),
                            slidesToShow: 4,
                            vertical: false,
                            prevArrow:
                                "<a href='#'><i class='fa fa-angle-left'></i></a>",
                            nextArrow:
                                "<a href='#'><i class='fa fa-angle-right'></i></a>",
                        },
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 3,
                            vertical: false,
                            prevArrow:
                                "<a href='#'><i class='fa fa-angle-left'></i></a>",
                            nextArrow:
                                "<a href='#'><i class='fa fa-angle-right'></i></a>",
                        },
                    },
                ],
            });
        }
    }

    $(function () {
        slickConfig();
        slickConfig1();
        $('.ps-product--quickview .ps-product__images').slick({
            slidesToShow: 1,
            slidesToScroll: -1,
            rtl: true,
            fade: true,
            dots: false,
            arrows: true,
            infinite: false,
            prevArrow: "<a href='#'><i class='fa fa-angle-left'></i></a>",
            nextArrow: "<a href='#'><i class='fa fa-angle-right'></i></a>",
        });
    });
})(jQuery);
