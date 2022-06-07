(function ($) {
    function countDown() {
        var time = $('.ps-countdown');
        time.each(function () {
            var el = $(this),
                value = $(this).data('time');
            var countDownDate = new Date(value).getTime();
            var timeout = setInterval(function () {
                var now = new Date().getTime(),
                    distance = countDownDate - now;
                var days = Math.floor(distance / (1000 * 60 * 60 * 24)),
                    hours = Math.floor(
                        (distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
                    ),
                    minutes = Math.floor(
                        (distance % (1000 * 60 * 60)) / (1000 * 60)
                    ),
                    seconds = Math.floor((distance % (1000 * 60)) / 1000);
                el.find('.days').html(days);
                el.find('.hours').html(hours);
                el.find('.minutes').html(minutes);
                el.find('.seconds').html(seconds);
                if (distance < 0) {
                    clearInterval(timeout);
                    el.closest('.ps-section').hide();
                }
            }, 1000);
        });
    }

    $(function () {
        countDown();
    });
})(jQuery);
