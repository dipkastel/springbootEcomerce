(function ($) {

    function productFilterToggle() {
        $('.ps-filter__trigger').on('click', function (e) {
            e.preventDefault();
            var el = $(this);
            el.find('.ps-filter__icon').toggleClass('active');
            el.closest('.ps-filter')
                .find('.ps-filter__content')
                .slideToggle();
        });
        if ($('.ps-sidebar--home').length > 0) {
            $('.ps-sidebar--home > .ps-sidebar__header > a').on(
                'click',
                function (e) {
                    e.preventDefault();
                    $(this)
                        .closest('.ps-sidebar--home')
                        .children('.ps-sidebar__content')
                        .slideToggle();
                }
            );
        }
    }
    $(function () {
        productFilterToggle();
    });
})(jQuery);
