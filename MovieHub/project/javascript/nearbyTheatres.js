$(document).ready(function () {

    var map;
    var infowindow;

        // var pyrmont = new google.maps.LatLng(42.3601, -71.0589);
        navigator.geolocation.getCurrentPosition(locationHandler);
        var pyrmont;
        function locationHandler(position) {
            var lat = position.coords.latitude;
            var lng = position.coords.longitude;
            console.log(lat)
            console.log(lng)
            pyrmont = new google.maps.LatLng(lat, lng);
            console.log(pyrmont)


            map = new google.maps.Map(document.getElementById('map-canvas'), {
                center: pyrmont,
                zoom: 11
            });

            var request = {
                location: pyrmont,
                radius: 200000,
                types: ['movie_theater']
            };
            infowindow = new google.maps.InfoWindow();
            var service = new google.maps.places.PlacesService(map);
            service.nearbySearch(request, callback);
        }

  

   // google.maps.event.addDomListener(window, 'load', initialize);

});

function callback(results, status) {
    if (status == google.maps.places.PlacesServiceStatus.OK) {
        for (var i = 0; i < results.length; i++) {
            createMarker(results[i]);
        }
    }
}

function createMarker(place) {
    var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({
        map: map,
        position: place.geometry.location
    });

    google.maps.event.addListener(marker, 'click', function () {
        infowindow.setContent(place.name);
        infowindow.open(map, this);
    });
}