(function ($) {
    function filterSlider() {
        var nonLinearSlider = document.getElementById('nonlinear');
        if (typeof nonLinearSlider != 'undefined' && nonLinearSlider != null) {
            noUiSlider.create(nonLinearSlider, {
                connect: true,
                behaviour: 'tap',
                start: [0, 1000],
                range: {
                    min: 0,
                    '10%': 100,
                    '20%': 200,
                    '30%': 300,
                    '40%': 400,
                    '50%': 500,
                    '60%': 600,
                    '70%': 700,
                    '80%': 800,
                    '90%': 900,
                    max: 1000,
                },
            });
            var nodes = [
                document.querySelector('.ps-slider__min'),
                document.querySelector('.ps-slider__max'),
            ];
            nonLinearSlider.noUiSlider.on('update', function (values, handle) {
                nodes[handle].innerHTML = Math.round(values[handle]);
            });
        }
    }
    $(function () {
        filterSlider();
    });
})(jQuery);
