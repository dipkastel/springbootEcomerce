(function ($) {
    function select2Cofig() {
        $('select.ps-select').select2({
            placeholder: $(this).data('placeholder'),
            minimumResultsForSearch: -1,
        });
    }
    $(function () {
        select2Cofig();
    });
})(jQuery);
