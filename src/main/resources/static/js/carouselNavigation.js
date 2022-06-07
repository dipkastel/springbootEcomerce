(function ($) {
    function carouselNavigation() {
        var prevBtn = $('.ps-carousel__prev'),
            nextBtn = $('.ps-carousel__next');
        prevBtn.on('click', function (e) {
            e.preventDefault();
            var target = $(this).attr('href');
            $(target).trigger('prev.owl.carousel', [1000]);
        });
        nextBtn.on('click', function (e) {
            e.preventDefault();
            var target = $(this).attr('href');
            $(target).trigger('next.owl.carousel', [1000]);
        });
    }
    $(function () {
        carouselNavigation();
    });
})(jQuery);
