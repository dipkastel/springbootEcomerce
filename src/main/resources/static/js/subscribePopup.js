(function ($) {
    function subscribePopup() {
        var subscribe = $('#subscribe'),
            time = subscribe.data('time');
        setTimeout(function () {
            if (subscribe.length > 0) {
                subscribe.addClass('active');
                $('body').css('overflow', 'hidden');
            }
        }, time);
        $('.ps-popup__close').on('click', function (e) {
            e.preventDefault();
            $(this)
                .closest('.ps-popup')
                .removeClass('active');
            $('body').css('overflow', 'auto');
        });
        $('#subscribe').on('click', function (event) {
            if (!$(event.target).closest('.ps-popup__content').length) {
                subscribe.removeClass('active');
                $('body').css('overflow-y', 'auto');
            }
        });
    }
    $(function () {
        subscribePopup();
    });
})(jQuery);
