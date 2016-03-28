$(function () {

    $("#searchKey").keypress(function (e) {
        if (e.which == 13) {
            e.preventDefault();
            var title = $("#searchKey").val();
            
            $.ajax({
                url: "http://www.myapifilms.com/imdb?title=" + title + "&format=JSONP&aka=0&business=0&seasons=0&seasonYear=0&technical=0&filter=M&exactFilter=0&limit=10&forceYear=o&lang=en-us&actors=N&biography=0&trailer=0&uniqueName=0&filmography=0&bornDied=0&starSign=0&actorActress=0&actorTrivia=0&movieTrivia=0&awards=0&moviePhotos=N&movieVideos=N",
                dataType: "jsonp",
                success: movieResults
            });
        }
    });

    $("#searchButton").click(function () {
        var title = $("#searchKey").val();
        $.ajax({
            url: "http://www.myapifilms.com/imdb?title=" + title + "&format=JSONP&aka=0&business=0&seasons=0&seasonYear=0&technical=0&filter=M&exactFilter=0&limit=10&forceYear=o&lang=en-us&actors=N&biography=0&trailer=0&uniqueName=0&filmography=0&bornDied=0&starSign=0&actorActress=0&actorTrivia=0&movieTrivia=0&awards=0&moviePhotos=N&movieVideos=N",
            dataType: "jsonp",
            success: movieResults
        });
    })


});


function movieResults(movies) {

    
    var searchResultBody = '';

    $.each(movies, function (index, movie) {

        var movieTitle = movie.title;
        var imdb = movie.urlIMDB;
        var poster = movie.urlPoster;
        var release = movie.releaseDate;
        var releaseYear = release.substring(0, 4);

        searchResultBody += '<div id ="searchHeight" class= "col-md-3 ' + (index + 1) + '"><div id="searchMovieheight" class="col-md-12 form-group well well-sm curve drop-shadow disp mov">' + ' <div class=""> <a href ="'
        + imdb
        + '" target="_blank"><img class="" src="'
        + poster
        + '" /></a> </div> '
        + '<h2><b>' + movie.title + '</b>' + '</h2></div> </div>'

       

    });

    $('#searchResults').empty();
    $('#mainContent').hide();
    
    $('#searchResults').html(searchResultBody);
    $('#searchResults').show();

}