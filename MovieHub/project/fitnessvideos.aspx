<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fitnessvideos.aspx.cs" Inherits="project_fitnessvideos" %>



<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fitness Videos</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
		<link href="css/style.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="css/iconic.css" media="screen" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" media="screen" href="css/bmi.css" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="javascript/jquery.js"></script>
        <script src="javascript/main.js"></script>
        <script src="javascript/bmi.js"></script>
        <link rel="stylesheet" href="css/homepageslides.css" />
		<script src="javascript/prefix-free.js"></script>
        <link rel="stylesheet" href="css/videohome.css" />
</head>
<body>


    <nav>
		<ul class="menu">
			<li><a href="#"><span class="iconic home"></span> Home</a></li>
			<li><a href="#"><span class="iconic plus-alt"></span> Videos </a></li>
			<li><a href="#"><span class="iconic magnifying-glass"></span> Nutrition </a></li>
			<li><a href="#"><span class="iconic map-pin"></span> Products</a></li>
			<li><a href="#"><span class="iconic mail"></span> Contact</a></li>
      
		</ul>
		<div class="clearfix"></div>
	</nav>
    <div id="main-wrapper">
        <div class="content-holder">
            
            <div class="top-message">Check out the workout videos by clicking on it. </div>
            <div class="banner-pic-pannel">
                <div id="main-videotabs">
               <div class="v-tab-holder" id="large-bodypart">
                   <ul>

                   
                        <a href="#">
                            <div class="v-tabs shoulder">
                                <br />
                                <br />
                                SHOULDER
                            </div>
                        </a>
                        <br />
                        <a href="#">
                            <div class="v-tabs chest">
                                <br />
                                <br />
                                CHEST
                            </div>
                        </a>
                        <br />
                        <a href="#">
                            <div class="v-tabs back">
                                <br />
                                <br />
                                BACK
                            </div>
                        </a>
                        <br />
                        <a href="#">
                            <div class="v-tabs legs">
                                <br />
                                <br />
                                LEGS
                            </div>
                        </a>
                        <br />
                    

               
                        <a href="#">
                            <div class="v-tabs" id="biceps">
                                <br />
                                <br />
                                BICEPS
                            </div>
                        </a>
                        <br />
                        <a href="#">
                            <div class="v-tabs" id="triceps">
                                <br />
                                <br />
                                TRICEPS
                            </div>
                        </a>
                        <br />
                        <a href="#">
                            <div class="v-tabs" id="abs">
                                <br />
                                <br />
                                ABS
                            </div>
                        </a>
                        <br />
                        <a href="#">
                            <div class="v-tabs" id="calves">
                                <br />
                                <br />
                                CALVES
                            </div>
                        </a>
                        <br />
                    
                   </div>
  
                    <div id="spinner" class="spinner" style="display: none">
                        
                    </div>
                    
                    <div class="populate-video" id="pop-video-id"></div>

    

                    
                </div>
            </div>

            <div class="clear"></div>
            
        </div>
    </div>
    <script type="text/javascript">

        $('.populate-video').hide(0);
        $('#pwd-null-error').hide(0);
        $('#username-null-error').hide(0);
        $('#mismatch-error').hide(0);

        $('.shoulder').mouseover(function () {

            
            $('.content-holder').addClass('set-bg-img');

            /* 
              calling the youtube APIs for retreiving videos.
              Note that the parameter the the 'SearchYouTube' function forms the query to the 
              YouTube API and populates the videos.
           */

            SearchYouTube("Workout shoulders");
            $('.home-banner-img').hide(0);
            $('.v-tabs').addClass('onhover-opacity');
            $(this).removeClass('onhover-opacity');
        });


        $('.chest').mouseover(function () {
            $('.content-holder').addClass('set-bg-img');
            SearchYouTube("CHEST WORKOUT VIDEOS");
            $('.home-banner-img').hide(0);
            $('.v-tabs').addClass('onhover-opacity');
            $(this).removeClass('onhover-opacity');
        });


        $('#biceps').mouseover(function () {
            $('.content-holder').addClass('set-bg-img');
            SearchYouTube("BICEPS WORKOUT VIDEOS");
            $('.home-banner-img').hide(0);
            $('.v-tabs').addClass('onhover-opacity');
            $(this).removeClass('onhover-opacity');
        });


        $('#triceps').mouseover(function () {
            $('.content-holder').addClass('set-bg-img');
            SearchYouTube("TRICEPS WORKOUT VIDEOS");
            $('.home-banner-img').hide(0);
            $('.v-tabs').addClass('onhover-opacity');
            $(this).removeClass('onhover-opacity');
        });

        $('.back').mouseover(function () {
            $('.content-holder').addClass('set-bg-img');
            SearchYouTube("BACK WORKOUT VIDEOS");
            $('.home-banner-img').hide(0);
            $('.v-tabs').addClass('onhover-opacity');
            $(this).removeClass('onhover-opacity');
        });

        $('#abs').mouseover(function () {
            $('.content-holder').addClass('set-bg-img');
            SearchYouTube("ABS WORKOUT VIDEOS");
            $('.home-banner-img').hide(0);
            $('.v-tabs').addClass('onhover-opacity');
            $(this).removeClass('onhover-opacity');
        });

        $('.legs').mouseover(function () {
            $('.content-holder').addClass('set-bg-img');
            SearchYouTube("LEGS WORKOUT VIDEOS");
            $('.home-banner-img').hide(0);
            $('.v-tabs').addClass('onhover-opacity');
            $(this).removeClass('onhover-opacity');
        });

        $('#calves').mouseover(function () {
            $('.content-holder').addClass('set-bg-img');
            SearchYouTube("calves muscle");
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
            SearchYouTube("TRICEPS WORKOUT VIDEOS");
        });

        $('#biceps').click(function () {
            $('.home-banner-img').hide(0);
            SearchYouTube("BICEPS WORKOUT VIDEOS");
        });

        $('#calves').click(function () {
            $('.home-banner-img').hide(0);
            SearchYouTube("CALVES WORKOUT VIDEOS");
        });

        $('.shoulder').click(function () {
            $('.home-banner-img').hide(0);
            SearchYouTube("Workout shoulders");
        });

        $('.back').click(function () {
            $('.home-banner-img').hide(0);
            SearchYouTube("BACK WORKOUT VIDEOS");
        });

        $('.legs').click(function () {
            $('.home-banner-img').hide(0);
            SearchYouTube("LEGS WORKOUT VIDEOS");
        });

        $('#abs').click(function () {
            $('.home-banner-img').hide(0);
            SearchYouTube("ABS WORKOUT VIDEOS");
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
                            message += "<div class='search_item'>";
                           
                            message += "<div class='separate'>"
                           
                            message += "<a  target='_blank'  href='" + data.feed.entry[i].media$group.media$player[0].url + "'>";
                            message += "<img width='300px' height='170px' src=" + data.feed.entry[i].media$group.media$thumbnail[2].url + " /></a>";
                           
                            message += "</div>"
                            message += "<div class='separate'>"
                            
                            message += "<a target='_blank'  href='" + data.feed.entry[i].media$group.media$player[0].url + "'>" + data.feed.entry[i].media$group.media$title.$t + "</a><br/>";
                            message += "<table class='top-gap'>"
                            message += "<tr>"
                            message += "<td class='row-left'>"
                            message += "<b>Duration :  </b>" + data.feed.entry[i].media$group.yt$duration.seconds + " secs<br/>";
                            message += "</td>"
                            message += "<td class='row-left'>"
                            message += "<b>Category :  </b>" + data.feed.entry[i].media$group.media$category[0].label + "<br/>";
                            message += "</td>"
                            message += "<td class='row-left'>"
                            message += "<b>Views : </b>" + data.feed.entry[i].yt$statistics.viewCount + " views<br/>";
                            message += "</td>"
                            message += "<td class='row-left'>"
                            message += "<b>Rating : </b>" + data.feed.entry[i].gd$rating.average + " / 5<br/>";
                            message += "</td>"
                            message += "</tr>"
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


    </script>
</body>
</html>