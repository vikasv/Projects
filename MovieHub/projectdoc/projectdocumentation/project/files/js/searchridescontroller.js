app.controller("searchridescontroller", function ($scope, $http, $location, LoginService) {

    var map;
    var directionDisplay,
        directionsService = new google.maps.DirectionsService(),
        map;

    var mapCanvas = document.getElementById('map_canvas');
    directionsDisplay = new google.maps.DirectionsRenderer();

    var mapOptions = {
        center: new google.maps.LatLng(42.3601, -71.0589),
        zoom: 10,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(mapCanvas, mapOptions)
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById("directions"));

    $scope.addpersontoride = function (viewride) {

        var people = viewride.people;
        people.push($scope.currentUser.username)
        viewride.people = people;
        LoginService.addpersontoride(viewride, function (response) {
            if (response == 'success') {
                $scope.addedride = 'Successfully added you to the ride'
            }
        })
    }

    $scope.calculateRoute = function () {
        var start = 'boston'//$("#from").val(),
        end = 'nyc'//$("#to").val();
        $scope.addedride = null
        if (start == '' || end == '') {
            $("#results").hide();
            return;
        }
        else {
            var request = {
                origin: start,
                destination: end,
                travelMode: google.maps.DirectionsTravelMode['DRIVING']
            };

            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                    $scope.searchride = {
                        source: response.routes[0].legs[0].start_address,
                        destination: response.routes[0].legs[0].end_address
                    };

                    $scope.$apply()
                    $(".expand").show();
                }
                else {
                    $(".expand").hide();
                    $("#results").hide();

                }
            });

        }
    }


    $('.easy-modal').easyModal({
        top: 100,
        overlay: 0.2,
        overflow:scroll
    });

    $('.easy-modal-close').click(function (e) {
        $('.easy-modal').trigger('closeModal');
    });
    var target;
    $scope.expandInfo = function (ride) {
        $scope.addedride = null;
        /*  var msg = $("<div class='dialog' title='Details'<p>"+ride+"</p></div>");
          $(msg).dialog({
              modal: true,
              buttons: {
                  Ok: function () {
                      $(this).dialog("close");
                  }
              }
          });*/
       // console.log(ride.destination);
        $scope.viewride = ride;
        $scope.viewride.people = $.unique($scope.viewride.people)
        if ($scope.currentUser!=null && $scope.viewride.people.indexOf($scope.currentUser.username) > -1) {
            //  $scope.viewride.people.splice($.inArray($scope.currentUser.username, $scope.viewride.people), 1);
            $scope.addedride = 'Already added!!'

        } 
        if (ride.personcount < ride.personcountfilled + 1) {
            $scope.addedride = 'Sorry!! Already filled.'
        }
        target = $('.easy-modal-open').attr('href');
        $(target).trigger('openModal');
    };

    $('.user-modal').easyModal({
        top: 100,
        overlay: 0.2
    });

    $('.user-modal-close').click(function (e) {
        $('.user-modal').trigger('closeModal');
        $(target).trigger('openModal');

    });

    $scope.getUserProfile = function (username) {
        LoginService.getInfo(username, function (res) {
            if (res == 'error') {
                $scope.viewusererror = 'Unable to retrieve user information at this point of time!!'
            } else {
                $scope.viewusererror = ''
                $scope.viewuser = res
            }
        });
        var viewuserinfo = $('.user-modal-open').attr('href');
        $('.easy-modal').trigger('closeModal');
        $(viewuserinfo).trigger('openModal');
    }

    $scope.searchRides = function () {
        $scope.resultrides = [];
        $scope.resultridesmessage = '';

        var myPosition,myposition1;
        //retrieve lat long of the entered source
        var geocoder = new google.maps.Geocoder();
        var address = $scope.searchride.source;//document.getElementById("add").value;
        var address1 = $scope.searchride.destination;//document.getElementById("add").value;

        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var lat = results[0].geometry.location.lat();
                var long = results[0].geometry.location.lng();
                myPosition = new google.maps.LatLng(lat, long);
            }
        });

        geocoder.geocode({ 'address': address1 }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var lat = results[0].geometry.location.lat();
                var long = results[0].geometry.location.lng();
                myPosition1 = new google.maps.LatLng(lat, long);
            }
        });

        var resultrides = [];
        var cascadiaFault1;
        var directionDisplay,
    directionsService = new google.maps.DirectionsService(), map;

        LoginService.searchRides(function (res) {
            var poly = [];
            var poly1 = [];
            $scope.resultsuccess = false;
            doSynchronousLoop(res)

        });

        function doSynchronousLoop(res) {
            if (res.length > 0) {
                var loop = function (res, i) {
                    func(res[i], function () {
                        if (++i < res.length) {
                            loop(res, i);
                        } else {
                            if ($scope.resultrides.length == 0) {
                                $scope.searchridefail = 'No results found'
                            } else {
                                $scope.resultsuccess = true;
                            }
                        }
                    });
                };
                loop(res, 0);
            } else {
            }
        }

        function func(obj, callback) {
           // resultrides.push(obj);
           // $scope.resultrides = resultrides;
           // $scope.$apply();
            if ($scope.searchride.source == obj.source && $scope.searchride.destination == obj.destination) {
                resultrides.push(obj);
                $scope.resultrides = resultrides;
                $scope.$apply();
            } else {
                var request = {
                    origin: obj.source,
                    destination: obj.destination,
                    travelMode: google.maps.DirectionsTravelMode['DRIVING']
                };

                directionsService.route(request, function (response, status) {
                    if (status == google.maps.DirectionsStatus.OK) {
                        poly1 = response.routes[0].overview_path;

                        poly = new google.maps.Polyline({
                            path: poly1,
                            map: map
                        })

                        if (google.maps.geometry.poly.containsLocation(myPosition, poly, 0.9) == true &&
                            google.maps.geometry.poly.containsLocation(myPosition1, poly, 0.9) == true) {
                            resultrides.push(obj);
                            $scope.resultrides = resultrides;
                            $scope.$apply();
                        }

                    }


                });
            }
            callback();

        }
    }
});

