(function(window) {
    var $ = window.jQuery;
    window.startGeoLocation = function() {
        function moveTo(url) {
            $.mobile.changePage(
                url,
                {
                    transition: 'slide'
                }
            );
        }

        var geo = navigator.geolocation;
        if(!geo) {
            moveTo("/station/near?error=1");
            return;
        }
        geo.getCurrentPosition(
            function (pos) {
                moveTo("/station/near?lat=" + pos.coords.latitude + "&long=" + pos.coords.longitude);
            },
            function () {
                moveTo("/station/near?error=2");
            }
        );
    };
})(window);
