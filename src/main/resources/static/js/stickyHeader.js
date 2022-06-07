(function ($) {
    function stickyHeader() {
        var header = $('.header'),
            scrollPosition = 0,
            checkpoint = 50;
        header.each(function () {
            if ($(this).data('sticky') === true) {
                var el = $(this);
                $(window).scroll(function () {
                    var currentPosition = $(this).scrollTop();
                    if (currentPosition > checkpoint) {
                        el.addClass('header--sticky');
                    } else {
                        el.removeClass('header--sticky');
                    }
                });
            }
        });

        var stickyCart = $('#cart-sticky');
        if (stickyCart.length > 0) {
            $(window).scroll(function () {
                var currentPosition = $(this).scrollTop();
                if (currentPosition > checkpoint) {
                    stickyCart.addClass('active');
                } else {
                    stickyCart.removeClass('active');
                }
            });
        }
    }
    $(function () {
        stickyHeader();
    });
})(jQuery);
