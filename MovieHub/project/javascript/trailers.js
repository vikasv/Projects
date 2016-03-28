$(document).ready(function () {

    $('.populate-video').hide(0);
    $('#pwd-null-error').hide(0);
    $('#username-null-error').hide(0);
    $('#mismatch-error').hide(0);

    $('.shoulder').mouseover(function () {
        $('.content-holder').addClass('set-bg-img');
        SearchYouTube("Horror movie trailers");
        $('.home-banner-img').hide(0);
        $('.v-tabs').addClass('onhover-opacity');
        $(this).removeClass('onhover-opacity');
    });

    $('.chest').mouseover(function () {
        $('.content-holder').addClass('set-bg-img');
        SearchYouTube("Romantic movie trailers");
        $('.home-banner-img').hide(0);
        $('.v-tabs').addClass('onhover-opacity');
        $(this).removeClass('onhover-opacity');
    });

    $('#biceps').mouseover(function () {
        $('.content-holder').addClass('set-bg-img');
        SearchYouTube("Science fiction movie trailers");
        $('.home-banner-img').hide(0);
        $('.v-tabs').addClass('onhover-opacity');
        $(this).removeClass('onhover-opacity');
    });

    $('#triceps').mouseover(function () {
        $('.content-holder').addClass('set-bg-img');
        SearchYouTube("sports based movie trailers");
        $('.home-banner-img').hide(0);
        $('.v-tabs').addClass('onhover-opacity');
        $(this).removeClass('onhover-opacity');
    });

    $('.back').mouseover(function () {
        $('.content-holder').addClass('set-bg-img');
        SearchYouTube("Action movie trailers");
        $('.home-banner-img').hide(0);
        $('.v-tabs').addClass('onhover-opacity');
        $(this).removeClass('onhover-opacity');
    });

    $('#abs').mouseover(function () {
        $('.content-holder').addClass('set-bg-img');
        SearchYouTube("comedy movie trailers");
        $('.home-banner-img').hide(0);
        $('.v-tabs').addClass('onhover-opacity');
        $(this).removeClass('onhover-opacity');
    });

    $('.legs').mouseover(function () {
        $('.content-holder').addClass('set-bg-img');
        SearchYouTube("Animated movie trailers");
        $('.home-banner-img').hide(0);
        $('.v-tabs').addClass('onhover-opacity');
        $(this).removeClass('onhover-opacity');
    });

    $('#calves').mouseover(function () {
        $('.content-holder').addClass('set-bg-img');
        SearchYouTube("mystery movie trailers");
        $('.home-banner-img').hide(0);
        $('.v-tabs').addClass('onhover-opacity');
        $(this).removeClass('onhover-opacity');
    });

    $(document).ready(function () {

        //navigation menu Jquery for the slideup and slideDown effect.

        $('.navigation-menu li .nav-bar').each(function () {
            $(this).before($(this).clone().removeClass().addClass('hover-bar'));
        });
        $('.navigation-menu li').hover(function () {
            $(this).find('.hover-bar').stop().animate({ marginTop: '0px' }, 200);
        },
        function () {
            $(this).find('.hover-bar').stop().animate({ marginTop: '-63px' }, 200);
        });
    });


    $('#triceps').click(function () {
        $('.home-banner-img').hide(0);
        SearchYouTube("sports based movie trailers");
    });

    $('#biceps').click(function () {
        $('.home-banner-img').hide(0);
        SearchYouTube("Science fiction movie trailers");
    });

    $('#calves').click(function () {
        $('.home-banner-img').hide(0);
        SearchYouTube("mystery movie trailers");
    });

    $('.shoulder').click(function () {
        $('.home-banner-img').hide(0);
        SearchYouTube("Horror movie trailers");
    });

    $('.back').click(function () {
        $('.home-banner-img').hide(0);
        SearchYouTube("Action movie trailers");
    });

    $('.legs').click(function () {
        $('.home-banner-img').hide(0);
        SearchYouTube("Animated movie trailers");
    });

    $('#abs').click(function () {
        $('.home-banner-img').hide(0);
        SearchYouTube("comedy movie trailers");
    });

    function SearchYouTube(query) {
        $("#spinner").show(0);
        $.ajax({
            url: 'http://gdata.youtube.com/feeds/videos?alt=json-in-script&q=' + query,
            dataType: 'jsonp',
            success: function (data) {

                $("#spinner").show(0);
                var message = "";

                if (data.feed.entry.length == null) {
                    $("#spinner").hide(0);
                    alert('Data cannot be retreived, try again with new search');
                }
                else {
                    for (i = 0; i < data.feed.entry.length; i++) {
                        //console.log(data.feed.entry[i]);
                        message += "<div class='col-md-6 search_item'>";

                        message += "<div class='separate'>"

                        message += "<a  target='_blank'  href='" + data.feed.entry[i].media$group.media$player[0].url + "'>";
                        message += "<img class='col-md-8' height='170px' src=" + data.feed.entry[i].media$group.media$thumbnail[2].url + " /></a>";

                        message += "<a target='_blank' style='color:blue' class='col-md-10 hyperlink ' href='" + data.feed.entry[i].media$group.media$player[0].url + "'>" + data.feed.entry[i].media$group.media$title.$t + "</a>";
                        message += "<table style='margin-left:20px;margin-top:50px'>"
                        message += "<tr>"
                        message += "<td class='row-left'>"
                        message += "<b>Duration :  </b>" + data.feed.entry[i].media$group.yt$duration.seconds + " secs<br/>";
                        message += "</td></tr>"
                        message += "<tr><td class='row-left'>"
                        message += "<b>Category :  </b>" + data.feed.entry[i].media$group.media$category[0].label + "<br/>";
                        message += "</td></tr>"
                        message += "<tr><td class='row-left'>"
                        message += "<b>Views : </b>" + data.feed.entry[i].yt$statistics.viewCount + " views<br/>";
                        message += "</td></tr>"
                        //message += "<tr><td class='row-left'>"
                        //message += "<b>Rating : </b>" + data.feed.entry[i].gd$rating.average + " / 5<br/>";
                        //message += "</td>"
                        //message += "</tr>"
                        message += "</table>"


                        message += "</div>"

                        message += "</div>";

                    }

                    document.getElementById("pop-video-id").innerHTML = message;
                    $("#spinner").hide(0);
                    $('.populate-video').show(0);
                }

            },
            error: function () {
                alert("Error loading the specified video");
            }
        });
    }


});