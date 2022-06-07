(function ($) {
    function subMenuToggle() {
        $('.menu--mobile .menu-item-has-children > .sub-toggle').on(
            'click',
            function (e) {
                e.preventDefault();
                var current = $(this).parent('.menu-item-has-children');
                $(this).toggleClass('active');
                current
                    .siblings()
                    .find('.sub-toggle')
                    .removeClass('active');
                current.children('.sub-menu').slideToggle(350);
                current
                    .siblings()
                    .find('.sub-menu')
                    .slideUp(350);
                if (current.hasClass('has-mega-menu')) {
                    current.children('.mega-menu').slideToggle(350);
                    current
                        .siblings('.has-mega-menu')
                        .find('.mega-menu')
                        .slideUp(350);
                }
            }
        );
        $('.menu--mobile .has-mega-menu .mega-menu__column .sub-toggle').on(
            'click',
            function (e) {
                e.preventDefault();
                var current = $(this).closest('.mega-menu__column');
                $(this).toggleClass('active');
                current
                    .siblings()
                    .find('.sub-toggle')
                    .removeClass('active');
                current.children('.mega-menu__list').slideToggle(350);
                current
                    .siblings()
                    .find('.mega-menu__list')
                    .slideUp(350);
            }
        );
        var listCategories = $('.ps-list--categories');
        if (listCategories.length > 0) {
            $('.ps-list--categories .menu-item-has-children > .sub-toggle').on(
                'click',
                function (e) {
                    e.preventDefault();
                    var current = $(this).parent('.menu-item-has-children');
                    $(this).toggleClass('active');
                    current
                        .siblings()
                        .find('.sub-toggle')
                        .removeClass('active');
                    current.children('.sub-menu').slideToggle(350);
                    current
                        .siblings()
                        .find('.sub-menu')
                        .slideUp(350);
                    if (current.hasClass('has-mega-menu')) {
                        current.children('.mega-menu').slideToggle(350);
                        current
                            .siblings('.has-mega-menu')
                            .find('.mega-menu')
                            .slideUp(350);
                    }
                }
            );
        }
    }
    $(function () {
        subMenuToggle();
    });
})(jQuery);
