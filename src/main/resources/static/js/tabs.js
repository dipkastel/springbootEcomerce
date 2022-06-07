(function ($) {
    function tabs() {
        $('.ps-tab-list  li > a ').on('click', function (e) {
            e.preventDefault();
            var target = $(this).attr('href');
            $(this)
                .closest('li')
                .siblings('li')
                .removeClass('active');
            $(this)
                .closest('li')
                .addClass('active');
            $(target).addClass('active');
            $(target)
                .siblings('.ps-tab')
                .removeClass('active');
        });
        $('.ps-tab-list.owl-slider .owl-item a').on('click', function (e) {
            e.preventDefault();
            var target = $(this).attr('href');
            $(this)
                .closest('.owl-item')
                .siblings('.owl-item')
                .removeClass('active');
            $(this)
                .closest('.owl-item')
                .addClass('active');
            $(target).addClass('active');
            $(target)
                .siblings('.ps-tab')
                .removeClass('active');
        });
    }
    $(function () {
        tabs();
    });
})(jQuery);
