(function ($) {
    function progressBar() {
        var progress = $('.ps-progress');
        progress.each(function (e) {
            var value = $(this).data('value');
            $(this)
                .find('span')
                .css({
                    width: value + '%',
                });
        });
    }
    $(function () {
        progressBar();
    });
})(jQuery);
