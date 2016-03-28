
app.controller("profilecontroller", function ($scope, $sce, $http, $location, LoginService) {
    $scope.date = new Date();
    $scope.personsshared = [];//[{ profilepicture: 'http://s3.amazonaws.com/37assets/svn/765-default-avatar.png' }];
    var messagesarray = $scope.currentUser.messages;
    $scope.messagesarray = messagesarray.reverse();

    $(".tabs-menu a").click(function (event) {
        event.preventDefault();
        $(this).parent().addClass("current");
        $(this).parent().siblings().removeClass("current");
        var tab = $(this).attr("href");
        if (tab == '#tab-1') {
            $scope.showinputbox = false;
            console.log("inside tab1 click")
        }
        if (tab == '#tab-2') {
            $scope.showmessage = ''
        }
        if (tab == '#tab-2') {
            var rides = LoginService.getRides(function (res) {
                console.log("Inside getrides in controller");
                console.log(res);
                $scope.rides = res;
            });
        }
        if (tab == '#tab-3') {
            var persons = LoginService.getPersons(function (res) {
                console.log("Inside getPersons in controller");
                console.log(res);
                var array = [];
                for (var x in res) {
                    for (var y in res[x].people) {
                        if (res[x].people[y] != $scope.currentUser.username) {
                            array.push(res[x].people[y])
                        }
                    }
                }
                array = $.unique(array)
                console.log(array)

                LoginService.getuserwithprofile(array, function (res) {

                    $scope.personsshared = res;

                })



            });

        }
        $(".tab-content").not(tab).css("display", "none");
        $(tab).fadeIn();

    });

    $scope.removeFromRide = function (ride) {

        console.log("inside the removePerson")
        var people = ride.people;
        var index = people.indexOf($scope.currentUser.username);
        if (index > -1) {
            people.splice(index, 1);
        }
        ride.people = people;
        console.log(ride);
        LoginService.removeFromRide(ride, function (response) {
            console.log(response);
            $scope.rides = response;
        })
    }


    $scope.getsrc = function (username) {
        console.log("inside getsrc")
        LoginService.getProfileSrc(username, function (response) {
            var src = response;
            return src
        })
    }

    //function hexToBase64(str) {
    //    return btoa(String.fromCharCode.apply(null, str.replace(/\r|\n/g, "").replace(/([\da-fA-F]{2}) ?/g, "0x$1 ").replace(/ +$/, "").split(" ")));
    //}


    //$('.profileimage').contenthover({
    //    overlay_background: '#000',
    //    overlay_opacity: 0.7,
    //    effect: 'slide',
    //    slide_speed: 700,
    //    slide_direction: 'left'
    //});
    $scope.uploadImageURL = function () {
        console.log("inside changeImage");
        if ($scope.newprofilePicture != '' && $scope.newprofilePicture != null) {
            LoginService.changeImageSrc($scope.newprofilePicture, function (res) {
                console.log("Successful changeImage");
                if (res == 'success') {
                    $scope.showinputbox = false;
                    $scope.currentUser.profilepicture = $scope.newprofilePicture;
                }
            })
        }
    }

    //show edit form for the ride
    //show user information in modal

    $('.ride-modal').easyModal({
        top: 200,
        overlay: 0.2
    });

    $('.ride-modal-close').click(function (e) {
        $('.ride-modal').trigger('closeModal');
    });

    $scope.editInfo = function (ride) {
        console.log("inside editINfo()")
        $scope.editride = ride
        $scope.editride = {
            routeID: ride.routeID,
            source: ride.source,
            destination: ride.destination,
            starttime: ride.starttime,
            personcount: ride.personcount,
            cost: ride.starcostttime,
            contact: ride.contact,
            contactdetails: ride.contactdetails,
            startdate: new Date()

        }
        //LoginService.getRide(ride.routeID, function (res) {
        //    console.log("ride recieved")
        //    console.log(res)
        //    res.startdate = new Date(res.startdate)
        //    $scope.editride = res;
        //})
        //$scope.editride.starttime = ride.starttime
        //$scope.editride.personcount = ride.personcount
        //$scope.editride.cost = ride.starcostttime
        //$scope.editride.contact = ride.contact
        //$scope.editride.contactdetails = ride.contactdetails

        console.log($scope.editride)
        target = $('.ride-modal-open').attr('href');
        $(target).trigger('openModal');
    }

    //update ride info

    $scope.updateRideInfo = function (ride) {
        console.log('inside updateride info')
        LoginService.updateRide(ride, function (res) {
            console.log('return updateride info')

            if (res == 'success') {
                $scope.updateride = 'Successfully Updated'
            } else {
                $scope.updateride = 'Failed Update'

            }
        })
    }

    //show user information in modal

    $('.easy-modal').easyModal({
        top: 200,
        overlay: 0.2
    });

    $('.easy-modal-close').click(function (e) {
        $('.easy-modal').trigger('closeModal');
    });

    $scope.getUserProfile = function (username) {
        LoginService.getInfo(username, function (res) {
            if (res == 'error') {
                $scope.viewusererror = 'Unable to retrieve user information at this point of time!!'
            } else {
                $scope.viewusererror = ''
                $scope.viewuser = res
                console.log($scope.viewuser)
            }
        });
        var viewuserinfo = $('.easy-modal-open').attr('href');
        console.log(viewuserinfo)
        $(viewuserinfo).trigger('openModal');
    }

    //Update User Information
    $scope.updateInfo = function (user) {
        console.log(user);
        $('#savebutton2').css({
            'display': 'none'
        });
        $scope.saved = 'Saved Successfully'
        LoginService.update(user, function (res) {
            if (res == 'success') {
                $('#savebutton2').css({
                    'display': 'none'
                });
            }
        });
    };

    $scope.updateText = function (user) {
        user.personalmessage = $('#personalmsgpara').text();
        user.personalinterests = $('#personalinterestspara').text();
        console.log(user);
        $scope.showmessage = 'Saved successfully'
        $scope.showbutton = false;
        LoginService.update(user, function (res) {
            if (res == 'success') {
                $('#savebutton1').css({
                    'display': 'none'
                });
            }
        });

    };

    $('#personalmsg').click(function () {
        $('#personalmsgpara').attr('contenteditable', 'true')
            .css({
                'color': 'gray',
                'font-family': 'arial',
                'border': '1px solid white'
            }).focus();;
        $('#personalmsg').css({
            'display': 'none'
        });
        $('#okbutton1').css({
            'display': 'inline-block'
        });
    });

    $scope.showbutton = false

    $scope.doneEditing1 = function () {
        $('#personalmsgpara')
            .attr('contenteditable', 'false')
            .css({
                'color': 'black',
                'font-family': "'Lato', Calibri, Arial, sans-serif"
            });
        $('#personalmsg').css({
            'display': 'inline-block'
        });
        $('#okbutton1').css({
            'display': 'none'
        });
        $scope.personalmessage = $('#personalmsgpara').text();
        console.log($scope.personalmessage);
        if ($scope.personalmessage != $scope.currentUser.personalmessage) {
            //$('#savebutton').css({
            //    'display': 'inline-block'
            //});
            $scope.showbutton = true
        } else {
            //$('#savebutton').css({
            //    'display': 'none'
            //});
            $scope.showbutton = false

        }
    }

    //For the interests

    $('#interests').click(function () {
        $('#personalinterestspara').attr('contenteditable', 'true')
            .css({
                'color': 'gray',
                'font-family': 'arial',
                'border': '1px solid white'
            }).focus();
        $('#interests').css({
            'display': 'none'
        });
        $('#okbutton2').css({
            'display': 'inline-block'
        });
    });

    $scope.doneEditing2 = function () {
        $('#personalinterestspara')
            .attr('contenteditable', 'false')
            .css({
                'color': 'black',
                'font-family': "'Lato', Calibri, Arial, sans-serif"
            }).focus();;
        $('#interests').css({
            'display': 'inline-block'
        });
        $('#okbutton2').css({
            'display': 'none'
        });
        $scope.personalmessage = $('#personalinterestspara').text();
        if ($scope.personalmessage != $scope.currentUser.personalmessage) {
            //$('#savebutton2').css({
            //    'display': 'inline-block'
            //});
            $scope.showbutton = true

        } else {
            //$('#savebutton2').css({
            //    'display': 'none'
            //});
            $scope.showbutton = false

        }
    }

    //For the user information
    $('#userinfo').click(function () {
        $scope.saved = ''

        console.log("inside userinfo click")
        $('#okbuttonuser').css({
            'display': 'inline-block'
        });
        $('#userinfo').css({
            'display': 'none'
        });
        $('#name')
            .removeAttr('disabled')
            .css({
                'color': 'black',
                'font-family': 'arial',
                'border': '1px solid white'
            }).focus();
        $('#username')
            .removeAttr('disabled')
            .css({
                'color': 'black',
                'font-family': 'arial',
                'border': '1px solid white'
            });
        $('#email')
            .removeAttr('disabled')
            .css({
                'color': 'black',
                'font-family': 'arial',
                'border': '1px solid white'
            });


    });

    $scope.edituserinfo = function () {
        $('#name')
            .attr('disabled', 'disabled')
            .css({
                'color': '#8a97a0',
                'font-family': 'Georgia, "Times New Roman", Times, serif'
            });
        $('#username')
            .attr('disabled', 'disabled')
            .css({
                'color': '#8a97a0',
                'font-family': 'Georgia, "Times New Roman", Times, serif'
            });
        $('#email')
           .attr('disabled', 'disabled')
            .css({
                'color': '#8a97a0',
                'font-family': 'Georgia, "Times New Roman", Times, serif'
            });
        $('#userinfo').css({
            'display': 'inline-block'
        });
        $('#okbuttonuser').css({
            'display': 'none'
        });
        $('#savebutton2').css({
            'display': 'inline-block'
        });
    }

    //For the Car information
    $('#carinfo').click(function () {
        $scope.saved = ''

        console.log("inside carinfo click")
        $('#carnumber')
            .removeAttr('disabled')
            .css({
                'color': 'black',
                'font-family': 'arial',
                'border': '1px solid white'
            }).focus();
        $('#carmodel')
            .removeAttr('disabled')
            .css({
                'color': 'black',
                'font-family': 'arial',
                'border': '1px solid white'
            });
        $('#carcapacity')
            .removeAttr('disabled')
            .css({
                'color': 'black',
                'font-family': 'arial',
                'border': '1px solid white'
            });
        $('#carinfo').css({
            'display': 'none'
        });
        $('#okbuttoncar').css({
            'display': 'inline-block'
        });
    });

    $scope.editcarinfo = function () {
        $('#carnumber')
           .attr('disabled', 'disabled')
            .css({
                'color': '#8a97a0',
                'font-family': 'Georgia, "Times New Roman", Times, serif'
            });
        $('#carmodel')
            .attr('disabled', 'disabled')
            .css({
                'color': '#8a97a0',
                'font-family': 'Georgia, "Times New Roman", Times, serif'
            });
        $('#carcapacity')
            .attr('disabled', 'disabled')
            .css({
                'color': '#8a97a0',
                'font-family': 'Georgia, "Times New Roman", Times, serif'
            });
        $('#carinfo').css({
            'display': 'inline-block'
        });
        $('#okbuttoncar').css({
            'display': 'none'
        });
        $('#savebutton2').css({
            'display': 'inline-block'
        });
    }

    //For the address information
    $('#addressinfo').click(function () {
        $scope.saved = ''

        console.log("inside addressinfo click")
        $('#address1')
            .removeAttr('disabled')
            .css({
                'color': 'black',
                'font-family': 'arial',
                'border': '1px solid white'
            }).focus();
        $('#address2')
            .removeAttr('disabled')
            .css({
                'color': 'black',
                'font-family': 'arial',
                'border': '1px solid white'
            });
        $('#city')
            .removeAttr('disabled')
            .css({
                'color': 'black',
                'font-family': 'arial',
                'border': '1px solid white'
            });
        $('#state')
            .removeAttr('disabled')
            .css({
                'color': 'black',
                'font-family': 'arial',
                'border': '1px solid white'
            });
        $('#addressinfo').css({
            'display': 'none'
        });
        $('#okbuttonaddress').css({
            'display': 'inline-block'
        });
    });

    $scope.editaddressinfo = function () {
        $('#address1')
            .attr('disabled', 'disabled')
            .css({
                'color': '#8a97a0',
                'font-family': 'Georgia, "Times New Roman", Times, serif'
            });
        $('#address2')
            .attr('disabled', 'disabled')
            .css({
                'color': '#8a97a0',
                'font-family': 'Georgia, "Times New Roman", Times, serif'
            });
        $('#city')
            .attr('disabled', 'disabled')
            .css({
                'color': '#8a97a0',
                'font-family': 'Georgia, "Times New Roman", Times, serif'
            });
        $('#state')
            .attr('disabled', 'disabled')
            .css({
                'color': '#8a97a0',
                'font-family': 'Georgia, "Times New Roman", Times, serif'
            });
        $('#addressinfo').css({
            'display': 'inline-block'
        });
        $('#okbuttonaddress').css({
            'display': 'none'
        });
        $('#savebutton2').css({
            'display': 'inline-block'
        });
    }

});