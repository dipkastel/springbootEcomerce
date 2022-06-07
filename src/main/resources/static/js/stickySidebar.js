(function ($) {
    function stickySidebar() {
        var sticky = $('.ps-product--sticky'),
            stickySidebar,
            checkPoint = 992,
            windowWidth = $(window).innerWidth();
        if (sticky.length > 0) {
            stickySidebar = new StickySidebar(
                '.ps-product__sticky .ps-product__info',
                {
                    topSpacing: 20,
                    bottomSpacing: 20,
                    containerSelector: '.ps-product__sticky',
                }
            );
            if ($('.sticky-2').length > 0) {
                var stickySidebar2 = new StickySidebar(
                    '.ps-product__sticky .sticky-2',
                    {
                        topSpacing: 20,
                        bottomSpacing: 20,
                        containerSelector: '.ps-product__sticky',
                    }
                );
            }
            if (checkPoint > windowWidth) {
                stickySidebar.destroy();
                stickySidebar2.destroy();
            }
        } else {
            return false;
        }
    }
    $(function () {
        stickySidebar();
    });
})(jQuery);
