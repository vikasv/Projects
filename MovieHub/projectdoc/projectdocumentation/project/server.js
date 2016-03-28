var express = require('express');
var mongoose = require('mongoose');
//var uniqueValidator = require('mongoose-unique-validator');
var fs = require('fs');
var request = require('request');
var multer = require('multer')
var bodyparser = require('body-parser');
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var cookieParser = require('cookie-parser');
var session = require('express-session');

var app = express();

app.use(bodyparser.json());
app.use(bodyparser.urlencoded({ extended: true }));
app.use(multer());
app.use(session({
    secret: process.env.SESSION_SECRET || 'I am Habiba and this is a secret',
    resave: false,
    saveUninitialized: false
}));
app.use(cookieParser());
app.use(passport.initialize());
app.use(passport.session());

var connectionstring = process.env.OPENSHIFT_MONGODB_DB_URL || 'mongodb://localhost/test';
mongoose.connect(connectionstring);

app.use(express.static(__dirname + '/files'));

var SequenceSchema = new mongoose.Schema({
    id: Number, seq: Number
}, { collection: 'SequenceModel' });


var SequenceModel = mongoose.model("SequenceModel", SequenceSchema);

var UserInfoDBSchema = new mongoose.Schema({
    username: { type: String },//,unique: true },
    password: { type: String },
    usertype: { type: String },
    name: { type: String },
    email: { type: String },
    carnumber: { type: String },
    carmodel: { type: String },
    carcapacity: { type: Number },
    authorized: { type: String },
    address1: { type: String },
    address2: { type: String },
    city: { type: String },
    state: { type: String },
    personalmessage: { type: String },
    messages: { type: Array },
    profilepicture: { type: String }
}, { collection: 'UserInfoDBModel' });

//RoutesModel for the rides information

var RoutesDBSchema = new mongoose.Schema({
    routeID: { type: Number },
    username: { type: String },//,unique: true },
    source: { type: String },
    destination: { type: String },
    personcount: { type: Number },
    personcountfilled: { type: Number },
    proximity: { type: Number },
    cost: { type: Number },
    people: { type: Array },
    contact: { type: String },
    contactdetails: { type: String },
    startdate: { type: Date },
    starttime: { type: Date },
    created: { type: Date, default: Date.now },
}, { collection: 'RoutesModel' });

//LoginDBSchema.plugin(uniqueValidator);

var UserInfoDBModel = mongoose.model("UserInfoDBModel", UserInfoDBSchema);
//var UserInfoDBModel = mongoose.model("UserInfoDBModel", UserInfoDBSchema);
var RoutesModel = mongoose.model("RoutesModel", RoutesDBSchema);

////Image storing in mongodb

//var imgPath = 'img.png';
//var userSchema = new mongoose.Schema({
//    img: { data: Buffer, contentType: String }
//});


//var userModel = mongoose.model('UserModel', userSchema);

app.post("/upload/:username", function (req, res) {
    console.log("inside changeImage");

    UserInfoDBModel.findOneAndUpdate(
        { 'username': req.params.username },
             {
                 $set:
                    {
                        profilepicture: req.body.src
                    }
             }, function (err, response) {
                 console.log("User info updated");
                 console.log('success');
                 res.send('success');
             });
});



//
passport.use(new LocalStrategy(
    function (username, password, done) {
        console.log("****************TRYING TO LOGIN*********************");
        UserInfoDBModel.findOne({ username: username, password: password }, function (err, user) {
            if (user) {
                return done(null, user);
            } else {
                return done(null, false, { message: 'Unable to login' });
            }
        });
    }));

passport.serializeUser(function (user, done) {
    done(null, user);
});

passport.deserializeUser(function (user, done) {
    done(null, user);
});
var auth = function (req, res, next) {
    if (!(req.isAuthenticated())) {
        res.send(401);
    } else {
        next();
    }
};

app.post('/login', passport.authenticate('local'), function (req, res) {
    var user = req.user;
    UserInfoDBModel.findOne({ username: user.username }, function (err, data) {
        console.log("****************User Info found*********************");
        if (data) {
            res.json(data);
        }
    });
});

app.post("/register", function (req, res) {
    console.log("****************TRYING TO REGISTER*********************");

    console.log(req.body);
    var user = req.body;

    UserInfoDBModel.find({ username: user.username }, function (err, data) {
        if (data.length == 0) {
            console.log("Username does not exist");
            UserInfoDBModel.find({ email: user.email }, function (err, data) {
                if (data.length != 0) {
                    res.send("Email already registered");
                } else {
                    if (user.address2 == null) {
                        address2 = ' ';
                    } else {
                        address2 = user.address2;
                    }
                    if (user.personalmessage == null) {
                        personalmessage = ' ';
                    } else {
                        personalmessage = user.personalmessage;
                    }

                    if (user.usertype == 'driver') {

                        var newUserInfo = new UserInfoDBModel(
                            {
                                username: user.username, password: user.password, usertype: user.usertype,
                                name: user.name, email: user.email,
                                carnumber: user.carnumber, carmodel: user.carmodel, carcapacity: user.carcapacity, authorized: user.authorized,
                                address1: user.address1, address2: address2, city: user.city, state: user.state, personalmessage: personalmessage
                            });
                    } else {
                        var newUserInfo = new UserInfoDBModel(
                            {
                                username: user.username, password: user.password, usertype: user.usertype,
                                name: user.name, email: user.email,
                                carnumber: ' ', carmodel: ' ', carcapacity: ' ', authorized: ' ',
                                address1: user.address1, address2: address2, city: user.city, state: user.state,
                                personalmessage: personalmessage, profilepicture: 'http://1.viki.io/a/ph/avatar_profile-acc6c5a5a9d35bd7d292dfd776cfec76.png'
                            });

                    }
                    newUserInfo.save(function (err, userlocal) {
                        if (err == null) {
                            console.log("Data entered in UserInfoDBModel");
                            res.send("success");

                        } else {
                            console.log(err);
                            console.log("Error in UserInfoDB insert");
                            res.send("Server Problem: Error inserting information");
                        }
                    });


                }
            });

        } else {
            console.log("Username already exists");
            res.send("uname_exists");

        }
    });
});

app.put('/update/:currentusername', function (req, res) {

    console.log('*************************update information in server***********************');

    var username = req.params.currentusername;

    var user = req.body;
    console.log('username change from  - ' + username + '  to  - ' + user.username);

    if (user.address2 == null) {
        address2 = ' ';
    } else {
        address2 = user.address2;
    }
    if (user.personalmessage == null) {
        personalmessage = ' ';
    } else {
        personalmessage = user.personalmessage;
    }
    UserInfoDBModel.findOneAndUpdate({ 'username': username },
            {
                $set:
                   {
                       username: user.username,
                       usertype: user.usertype,
                       name: user.name,
                       email: user.email,
                       carnumber: (user.usertype == 'driver') ? user.carnumber : ' ',
                       carmodel: (user.usertype == 'driver') ? user.carmodel : ' ',
                       carcapacity: (user.usertype == 'driver') ? user.carcapacity : ' ',
                       address1: user.address1,
                       address2: address2,
                       city: user.city,
                       state: user.state,
                       personalmessage: personalmessage
                   }
            }, function (err, res) {
                console.log("User info updated");
                console.log(res);
            });
    UserInfoDBModel.find({ username: user.username }, function (err, data) {
        //console.log(data);
        res.send(data);
    });

});

app.get('/loginapp', function (req, res) {
    res.sendfile(__dirname + '/files/homepage.html');

});

app.get('/rest/user', auth, function (req, res) {
    res.json(PassportAuthenticationUser);
});

app.get("/loggedin", function (req, res) {
    res.send(req.isAuthenticated() ? req.user : '0');
});

app.post("/logout", function (req, res) {
    req.session.destroy();
    res.send(200);
});


/// Ride methods here

app.post("/addride/:username", function (req, res) {
    console.log("****************TRYING TO add a new ride*********************");

    console.log(req.body);
    var ride = req.body;

    var seq;
    SequenceModel.findOneAndUpdate({ id: 123 },
    {
        $inc: {
            seq: 1
        }
    }, function (err, result) { console.log(result); });
    SequenceModel.find({ id: 123 }, function (err, data) {
        console.log("Sequence - " + data[0].seq);
        seq = data[0].seq;
        console.log("Sequence generated - " + seq);


        var newRide = new RoutesModel({
            routeID: seq || 1,
            username: req.params.username,
            source: ride.source,
            destination: ride.destination,
            personcount: ride.personcount,
            personcountfilled: 1,
            proximity: ride.proximity,
            cost: ride.cost,
            startdate: ride.startdate,
            starttime: ride.starttime,
            contact: ride.contact,
            contactdetails: ride.contactdetails,
            people: [req.params.username]
        });
        newRide.save(function (err, ridelocal) {
            if (err == null) {
                console.log("Data entered in RoutesModel");
                res.send("success");

            } else {
                console.log(err);
                console.log("Error in RoutesModel insert");
                res.send("Server Problem: Error inserting information");
            }
        });
    });
});

app.post('/getrides/:username', function (req, res) {
    var username = req.params.username;
    RoutesModel.find({ username: username }, function (err, data) {
        if (data) {
            console.log("****************Rides for the user found*********************");
            RoutesModel.find({ people: { $in: [username] } }, function (err, data2) {
                if (data2) {
                    console.log("****************All the rides with user in people rides requested*********************");
                    for (var indx in data2) {
                        data.push(data2[indx]);
                    }
                    console.log(data);
                    res.json(data);
                }
            });
        }
    });
});

app.post('/getrides', function (req, res) {
    var username = req.params.username;
    RoutesModel.find(function (err, data) {
        if (data) {
            console.log("****************All the Rides requested*********************");
            res.json(data);
        }
    });
});


app.post('/getpersons/:username', function (req, res) {
    var username = req.params.username;
    RoutesModel.find({ username: username }, { people: 1, _id: 0 }, function (err, data) {
        if (data) {
            console.log("****************All the people in user's rides requested*********************");
            console.log(data)
            res.json(data);
        }
    });
});


app.post('/getsrc', function (req, res) {
    var users = req.body;
    console.log(users)
    var userswithprofiles = [];
    //for (var idx in users) {
    UserInfoDBModel.find({ username: { $in: users } }, { username: 1, profilepicture: 1, _id: 0 }, function (err, data) {
        if (data) {
            console.log("****************The SRC of person found*********************");
            console.log(data)
            res.json(data);

            //userswithprofiles.push(data);
            //console.log(userswithprofiles)
        }
    });
    // }

});

app.post('/getpersonsshared/:username', function (req, res) {
    var username = req.params.username;
    RoutesModel.find({ people: { $in: [username] } }, { people: 1, _id: 0 }, function (err, data) {
        if (data) {
            console.log("****************All the people with user in people rides requested*********************");
            console.log(data)
            res.json(data);
        }
    });
});

app.post('/addpersontoride/:adduser', function (req, res) {
    console.log("inside add to ride server");
    console.log(req.params.adduser)
    console.log(req.body)
    var routeid = req.body.routeID;
    RoutesModel.find({ routeID: routeid }, function (err, data1) {
        if (data1.length != 0) {
            console.log(data1)
            console.log("****************The requested Ride found********************");
            console.log(req.body.people)
            if (req.body.personcount >= req.body.personcountfilled + 1) {
                RoutesModel.findOneAndUpdate({ 'routeID': routeid },
                {
                    $set:
                       {
                           people: req.body.people,
                           personcountfilled: req.body.personcountfilled + 1
                       }
                }, function (err, data2) {
                    if (err == null) {
                        console.log(data2);
                        UserInfoDBModel.findOneAndUpdate({ 'username': req.body.username },
          
                      { $push: 
                          {
                              messages: req.params.adduser +' has joined the ride from '+req.body.source+' to '+req.body.destination+' dated - '+req.body.startdate
                          } 
                      }, function (err, res) {
                            console.log("User info updated");
                            console.log(res);
                        });
                    res.send('success');
                }
                });
        } else {
            res.send('alreadyfull');

        }

    } else {
            console.log("requested route not found")
            res.send("error")

}
});
})

app.post('/updateRide', function (req, res) {
    var ride = req.body
    console.log('in updateride server')
    console.log(ride.routeID)
    RoutesModel.findOneAndUpdate({ 'routeID': ride.routeID },
                 {
                     $set:
                        {
                            cost: ride.cost,
                            startdate: ride.startdate,
                            starttime: ride.starttime,
                            contact: ride.contact,
                            contactdetails: ride.contactdetails,
                        }
                 }, function (err, data2) {
                     console.log('second in updateride server')
                     console.log(err)
                     if (data2) {
                         console.log(data2);
                         res.send('success');
                     } else {
                         res.send('error')
                     }
                 });
})

app.post('/removepersonfromride', function (req, res) {
    console.log("inside remove from ride server");
    console.log(req.body)
    var routeid = req.body.routeID;
    RoutesModel.find({ routeID: routeid }, function (err, data1) {
        if (data1.length != 0) {
            console.log(data1)
            console.log("****************The requested Ride found********************");
            console.log(req.body.people)
            RoutesModel.findOneAndUpdate({ 'routeID': routeid },
            {
                $set:
                   {
                       people: req.body.people,
                       personcountfilled: req.body.personcountfilled - 1
                   }
            }, function (err, data2) {
                if (err == null) {
                    console.log(data2);
                    res.send('success');
                }
            });

        } else {
            console.log("requested route not found")
            res.send("error")

        }
    });
})

app.get('/', function (req, res) {
    res.sendfile(__dirname + '/files/homepage.html');

});


//get user profile info for modal

app.post('/getinfo/:username', function (req, res) {
    console.log("inside user info retrieval")

    UserInfoDBModel.findOne({ username: req.params.username }, function (err, data) {
        if (data) {
            console.log("Found user info")
            res.json(data)
        } else {
            res.send('error')
        }
    })
})

//app.listen(3000);
var ip = process.env.OPENSHIFT_NODEJS_IP || '127.0.0.1';
var port = process.env.OPENSHIFT_NODEJS_PORT || 8080;
app.listen(port, ip, function () {
    console.log('%s: Node server started on %s:%d ...',
                Date(Date.now()), ip, port)
});



/////CRAP

//Get Carbon emmision data from API call as JSON

app.get('/getcarbonfootprint/:query', function (req, res) {
    console.log("inside getwikidata");

    var dist = req.params.query;
    console.log(dist);

    request('http://impact.brighterplanet.com/automobile_trips.json?key=5a927d96eca397b6659a3c361ce32254&distance=' + dist,
    function (error, response, body) {
        if (!error && response.statusCode == 200) {
            console.log(response);
            var info = JSON.parse(body);
            res.send(info);
        }
    })
});
