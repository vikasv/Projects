app.factory('LoginService', function LoginService($http, $location) {

    var currentUser = null;
    var currentusername = null;
    var loginfail = null;
    var getCurrentUser = function () {
        return currentUser;
    };
    var getloginfail = function () {
        return loginfail;
    };

    var changeImageSrc = function (src, callback) {
        var path = { src: src }
        console.log('inside loginservice for change image')
        $http.post("/upload/" + currentUser.username, path)
        .success(function (response) {
            console.log('inside loginservice for change image success')

            console.log(response);
            callback(response)
        })
    }

    var checkInfo = function (user, callback) {
        loginfail = null;

        $http.post("/login", user)
        .success(function (response) {
            console.log("service current user " + response);
            currentUser = response;
            console.log(response);
            currentusername = response.username;
            ($location.url("/profile"));
        })
        .error(function (response) {
            console.log("service current user failed" + response);
            currentUser = null;
            loginfail = true;
            callback();
        });
    };

    var addInfo = function (user, callback) {
        console.log("Inside Register Service");
        console.log(user);
        $http.post("/register", user)
        .success(function (res) {
            if (res == "success") {
                console.log("inside Service add" + res.username);
                console.log(res);
                checkInfo(user);
            } else {
                callback(res);
            }
        });
    };

    var update = function (user, callback) {
        console.log("Inside Update Service");
        console.log(user);
        console.log(currentusername);
        $http.put("/update/" + currentusername, user)
        .success(function (res) {
            if (res == "success") {
                console.log("inside Service add" + res.username);
                console.log(res);
                checkInfo(user);
                callback(res);
            }
        });
    };

    var getInfo = function (username, callback) {
        console.log("Inside getInfo Service");
        console.log(username);
        $http.post("/getinfo/" + username)
        .success(function (res) {
            callback(res);
        });
    };



    var logout = function () {
        currentUser = null;
        $http.post("/logout", currentUser)
        .success(function (res) {
            $location.url("/login");
        });
    };


    //Ride functionality
    var addRide = function (ride, callback) {
        console.log("Inside Register Service of Addride");
        console.log(ride);
        $http.post("/addride/" + currentUser.username, ride)
        .success(function (res) {
            if (res == "success") {
                console.log("Inside Service add return - " + res.source);
                console.log(ride);
                $location.url("/profile");
            } else {
                callback(res);
            }
        });
    };

    var getRides = function (callback) {
        $http.post("/getrides/" + currentUser.username)
        .success(function (response) {
            console.log("Received rides info for the user " + response);
            console.log(response);
            callback(response);
        })
    }

    var getPersons = function (callback) {
        $http.post("/getpersons/" + currentUser.username)
        .success(function (response1) {
            console.log(response1);
            console.log("Received persons info for the user " + response1);

            $http.post("/getpersonsshared/" + currentUser.username)
        .success(function (response2) {

            console.log("Received persons shared with info for the user " + response2);
            console.log(response2);
            for (var x in response2) {
                response1.push(response2[x])
            }
            console.log(response1);
            callback(response1);
        })
        })
    }

    var getuserwithprofile = function (users, callback) {
        $http.post('/getsrc', users)
        .success(function (response) {
            console.log("Received srcs for the users " + response);
            console.log(response);
            callback(response);
        })
    }

    var searchRides = function (callback) {
        $http.post("/getrides")
        .success(function (response) {
            callback(response);
        })
    }

    var addpersontoride = function (viewride, callback) {
        console.log("inside add service");
        $http.post("/addpersontoride/" + currentUser.username, viewride)
        .success(function (response) {
            console.log("return add service");

            if (response == 'success') {
                callback("success");
            } else {
                callback("error")
            }
        })
    }
    var removeFromRide = function (ride, callback) {
        console.log("inside removeFromRide service");
        $http.post("/removepersonfromride", ride)
        .success(function (response) {
            console.log("return removeFromRide service");

            if (response == 'success') {
                getRides(function (res) {
                    callback(res)
                })
            } else {
                callback("error")
            }
        })
    }

    var updateRide = function (ride, callback) {
        console.log("inside updateRide service");
        $http.post("/updateRide", ride)
        .success(function (res) {
            console.log("return updateRide service");
            if(res=='success')
                callback('success')
            else
                callback('error')
        })
    }

    return {
        login: checkInfo,
        add: addInfo,
        getCurrentUser: getCurrentUser,
        logout: logout,
        getloginfail: getloginfail,
        update: update,
        addRide: addRide,
        getRides: getRides,
        searchRides: searchRides,
        addpersontoride: addpersontoride,
        getPersons: getPersons,
        getInfo: getInfo,
        changeImageSrc: changeImageSrc,
        getuserwithprofile: getuserwithprofile,
        removeFromRide: removeFromRide,
        updateRide: updateRide
    }

});