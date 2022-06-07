(function ($) {

    function backgroundImage() {
        var databackground = $('[data-background]');
        databackground.each(function () {
            if ($(this).attr('data-background')) {
                var image_path = $(this).attr('data-background');
                $(this).css({
                    background: 'url(' + image_path + ')',
                });
            }
        });
    }
    $(function () {
        backgroundImage();
    });
})(jQuery);
