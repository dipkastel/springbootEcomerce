(function ($) {
    function mapConfig() {
        var map = $('#contact-map');
        if (map.length > 0) {
            map.gmap3({
                address: map.data('address'),
                zoom: map.data('zoom'),
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                scrollwheel: false,
            })
                .marker(function (map) {
                    return {
                        position: map.getCenter(),
                        icon: 'img/marker.png',
                    };
                })
                .infowindow({
                    content: map.data('address'),
                })
                .then(function (infowindow) {
                    var map = this.get(0);
                    var marker = this.get(1);
                    marker.addListener('click', function () {
                        infowindow.open(map, marker);
                    });
                });
        } else {
            return false;
        }
    }
    $(function () {
        mapConfig();
    });
})(jQuery);
