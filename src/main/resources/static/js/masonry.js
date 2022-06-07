(function ($) {

    function masonry($selector) {
        var masonry = $($selector);
        if (masonry.length > 0) {
            if (masonry.hasClass('filter')) {
                masonry.imagesLoaded(function () {
                    masonry.isotope({
                        columnWidth: '.grid-sizer',
                        itemSelector: '.grid-item',
                        isotope: {
                            columnWidth: '.grid-sizer',
                        },
                        filter: '*',
                    });
                });
                var filters = masonry
                    .closest('.masonry-root')
                    .find('.ps-masonry-filter > li > a');
                filters.on('click', function (e) {
                    e.preventDefault();
                    var selector = $(this).attr('href');
                    filters.find('a').removeClass('current');
                    $(this)
                        .parent('li')
                        .addClass('current');
                    $(this)
                        .parent('li')
                        .siblings('li')
                        .removeClass('current');
                    $(this)
                        .closest('.masonry-root')
                        .find('.ps-masonry')
                        .isotope({
                            itemSelector: '.grid-item',
                            isotope: {
                                columnWidth: '.grid-sizer',
                            },
                            filter: selector,
                        });
                    return false;
                });
            } else {
                masonry.imagesLoaded(function () {
                    masonry.masonry({
                        columnWidth: '.grid-sizer',
                        itemSelector: '.grid-item',
                    });
                });
            }
        }
    }
    $(function () {
        masonry('.ps-masonry');
    });
})(jQuery);
