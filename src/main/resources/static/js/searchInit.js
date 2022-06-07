(function ($) {
    function searchInit() {
        var searchbox = $('.ps-search');
        $('.ps-search-btn').on('click', function (e) {
            e.preventDefault();
            searchbox.addClass('active');
        });
        searchbox.find('.ps-btn--close').on('click', function (e) {
            e.preventDefault();
            searchbox.removeClass('active');
        });
    }
    $(function () {
        searchInit();
    });
})(jQuery);
