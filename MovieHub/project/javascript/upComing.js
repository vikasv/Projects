$(document).ready(function () {

var dir = '';
function GetCount(ddate, iid) {

    dateNow = new Date();
    amount = ddate.getTime() - dateNow.getTime();
    delete dateNow;

    if (amount < 0) {
        document.getElementById(iid).innerHTML = "Movie running in theatres now!";
    }

    else {
        days = 0; hours = 0; mins = 0; secs = 0; out = "";

        amount = Math.floor(amount / 1000);

        days = Math.floor(amount / 86400);
        amount = amount % 86400;

        hours = Math.floor(amount / 3600);
        amount = amount % 3600;

        mins = Math.floor(amount / 60);
        amount = amount % 60;

        secs = Math.floor(amount);

        if (days != 0) { out += days + " " + ((days == 1) ? "day" : "days") + ", "; }
        if (hours != 0) { out += hours + " " + ((hours == 1) ? "hour" : "hours") + ", "; }
        out += mins + " " + ((mins == 1) ? "min" : "mins") + ", ";
        out += secs + " " + ((secs == 1) ? "sec" : "secs") + ", ";
        out = out.substr(0, out.length - 2);
        document.getElementById(iid).innerHTML = "Releasing in " + "<b>" + out + "</b>";

        setTimeout(function () { GetCount(ddate, iid) }, 1000);
    }
}

function days_between(date1, date2) {

    var ONE_DAY = 1000 * 60 * 60 * 24

    var date1_ms = date1.getTime()
    var date2_ms = date2.getTime()

    var difference_ms = Math.abs(date1_ms - date2_ms)

    return Math.round(difference_ms / ONE_DAY)

}

var apikey = "zv998dvdav53ajkwxm679s5f";
var baseUrl = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/upcoming.json";


var moviesSearchUrl = baseUrl + '?apikey=' + apikey;





function getmoviedata() {

    $(document).ready(function () {


        $.ajax({
            url: moviesSearchUrl,
            dataType: "jsonp",
            success: searchCallback
        });

    });

    function searchCallback(data) {
        var movies = data.movies;

        $.each(movies, function (index, movie) {
            //$("div.c" + (index + 1)).css("background-color", "Black");
            //var markup = '<div><a href ="' + movie.links.alternate + '" class = "linkclass1" target="_blank"><img class=" bord1 i1' + (index + 1) + '" src="' + movie.posters.detailed + '" /></a>';
            //markup += '<a href ="' + movie.links.alternate + '" class = "linkclass1" target="_blank"><div class = " insdiv1 d1' + (index + 1) + '">' + movie.title + '(' + movie.year + ')</div></div></a>';

            var markup = '<div class= "col-md-12 ' + (index + 1) + '"><div id="thisWeek" class="col-md-12 form-group well well-sm curve drop-shadow disp mov">' + ' <div class=""> <a href ="http://www.imdb.com/title/tt' + movie.alternate_ids.imdb + '" target="_blank"><img class="movieBanner" src="' + movie.posters.detailed + '" /></a> </div>'

            var fulldate = movie.release_dates.theater.split("-");

            var curr_date = new Date();


            var reldate = new Date();
            reldate.setYear(fulldate[0]);
            reldate.setMonth(fulldate[1] - 1);
            reldate.setDate(fulldate[2]);

            var totdays = days_between(curr_date, reldate);



            markup += '<div class=""> <div class= "movieDesc">';
            markup += '<h2><b>' + movie.title + '</b> <i>(' + movie.year + ')</i>' + '</h2>'
            markup += '<div class = "movieAcceptedAgeGroup">' + movie.mpaa_rating + '</div>';
            if (movie.runtime) {
                markup += '<div class = "movieLength"> | ' + movie.runtime + ' mins </div>';
            }
            markup += '<div class = "movieReleaseDate"> | ' + fulldate[1] + '/' + fulldate[2] + '/' + fulldate[0] + '</div>';
            //'Year:' + fulldate[0] + ' Month: ' + fulldate[1] + 'Date: ' + fulldate[2];
            //markup += 'Running Successfully for' + totdays + ' days';

            var divid = 'cb' + (index + 1);

            markup += '<div id = "cb' + (index + 1) + '">' + divid + '</div>';

            markup += '</div>';
            markup += '<div class="rightarea right' + (index + 1) + '"></div>';

            var inrightarea = '';
            var castinfo = '';
            if (typeof (movie.abridged_cast) != "undefined") {
                var cast = movie.abridged_cast;
                var z = 1;
                if (cast[0]) {
                    castinfo = '<div class = "castdiv"><b> Cast: </b></br>';
                    castinfo += cast[0].name;
                    while (cast[z]) {
                        castinfo += ', ' + cast[z].name;
                        z++;
                    }
                    castinfo += '</div>';
                }
            }

            glink = "http://www.google.com/movies?near=02125&hl=en&q=" + encodeURI(movie.title);

            inrightarea += castinfo;


            inrightarea += '<div class = "dirinfo dir' + (index + 1) + '" ></div>';

            inrightarea += '<div class = "others">';


            inrightarea += '</div>';
            markup += '</div>';

            markup += '<div class = "sep"></div>';


            //var innermarkup = '';
            //if (movie.abridged_cast[0]) {
            //   innermarkup = '<p class = "cast1"> Cast:' + movie.abridged_cast[0].name;
            // }

            //if (movie.abridged_cast[1]) {
            //   innermarkup += ', ' + movie.abridged_cast[1].name;
            //}

            //innermarkup += '</p>';

            $("div.context").append(markup);
            $("div.right" + (index + 1)).append(inrightarea);


            var thisdir = "div.dir" + (index + 1);

            var $placeholder = $('<div>').appendTo(thisdir);

            $.ajax({
                url: movie.links.self + '?apikey=' + apikey,
                dataType: "jsonp",
                async: false,
                success: getinfo
            });


            function getinfo(json) {
                if (json.abridged_directors) {
                    dir = json.abridged_directors[0].name;
                    $placeholder.replaceWith('<b> Director: </b><br/>' + dir);
                }
            }

            $("div.mov" + (index + 1)).hide();
            GetCount(reldate, divid);

        });

        $("div.mov1").animate({ width: 'toggle' }, 700, function showNext() {
            $(this).next("div").next("div").animate({ width: 'toggle' }, 700, showNext);
        });


    }
}

window.onload = getmoviedata;

});