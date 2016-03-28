app.controller("pollutioncontroller", function ($scope, $http, $location,LoginService) {

    var map;
    var directionDisplay,
        directionsService = new google.maps.DirectionsService(),
        map;
    $scope.pollutionfail = ''
    $scope.loading = false;

    $scope.closeDetails = function () {
        $scope.pollutionsuccess = ''
        $scope.pollution = null;
    }

    $scope.calculatePollution = function () {
        $scope.loading = true;
        $scope.pollutionsuccess = null;
     //   $scope.pollution = { source: 'bos', destination: 'nyc' }
        if ($scope.pollution == null) {
            // cannot calculate route
            $scope.pollutionfail = 'Please enter values'
            $scope.loading = false;

        }
        else {
            $scope.pollutionfail = ''

            var start = $scope.pollution.source,
            end = $scope.pollution.destination;
            var request = {
                origin: start,
                destination: end,
                travelMode: google.maps.DirectionsTravelMode['DRIVING']
            };

            directionsService.route(request, function (response, status) {
                console.log(response)
                if (status == google.maps.DirectionsStatus.OK) {
                    $scope.pollution.source = response.routes[0].legs[0].start_address;
                    $scope.pollution.destination = response.routes[0].legs[0].end_address;
                    console.log("Inside angular pollution script before request");
                   var dist = ((response.routes[0].legs[0].distance.value) / 1000);
                   $scope.distance = dist;
                    var text = "";
                    $http.get("/getcarbonfootprint/"+dist)
                        .success(function (data) {
                            console.log("Inside angular pollution script response ");
                            console.log(data);
                            $scope.pollution1 = data;
                            $scope.pollutionsuccess = data;
                            $scope.loading = false;

                        });
                }
            });

        }
    }


});