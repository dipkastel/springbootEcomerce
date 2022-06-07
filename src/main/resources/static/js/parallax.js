(function ($) {

    function parallax() {
        $('.bg--parallax').each(function () {
            var el = $(this),
                xpos = '50%',
                windowHeight = $(window).height();
            if (isMobile.any()) {
                $(this).css('background-attachment', 'scroll');
            } else {
                $(window).scroll(function () {
                    var current = $(window).scrollTop(),
                        top = el.offset().top,
                        height = el.outerHeight();
                    if (
                        top + height < current ||
                        top > current + windowHeight
                    ) {
                        return;
                    }
                    el.css(
                        'backgroundPosition',
                        xpos + ' ' + Math.round((top - current) * 0.2) + 'px'
                    );
                });
            }
        });
    }
    $(function () {
        parallax();
    });
})(jQuery);
