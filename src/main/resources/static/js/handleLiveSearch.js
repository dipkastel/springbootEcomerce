(function ($) {

    function handleLiveSearch() {
        $('body').on('click', function (e) {
            if (
                $(e.target).closest('.ps-form--search-header') ||
                e.target.className === '.ps-form--search-header'
            ) {
                $('.ps-panel--search-result').removeClass('active');
            }
        });
        $('#input-search').on('keypress', function () {
            $('.ps-panel--search-result').addClass('active');
        })
    }
    $(function () {
        handleLiveSearch();
    });
})(jQuery);
