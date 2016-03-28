$(document).ready(function () {

    var apikey = "zv998dvdav53ajkwxm679s5f";
    var baseUrl = "http://api.rottentomatoes.com/api/public/v1.0";


    var moviesSearchUrl = baseUrl + '/movies.json?apikey=' + apikey;
    

    $("#searchKey").keydown(function (event) {
   
        var searchKey = $('#searchKey').val();
            
            $.ajax({
                url: moviesSearchUrl + '&q=' + encodeURI(searchKey) + '&page_limit=12',
                dataType: "jsonp",
                sucess: function () {
                        alert('success');
                    },
                    error: function(){
                        alert('failure');
                    }
            });
        
    });















});