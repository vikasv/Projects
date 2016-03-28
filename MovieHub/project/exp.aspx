<!--
            NOTE: 
            I have purposly not made a separate CSS/JavaScript file for any of my ASPX files.
            This is inspired by the sole fact that it would provide anyone reviewing my code a easier/quick
            way to see everthything what is going on in my file and get done with it.
            Unlike making a separate file for CSS and Javascript (a good design practice though) would end up 
            the reviewer switching back and forth between the CSS/JS and the aspx file. 
            I personally feel this would be helpful hence I have added my comments wherever I could.
          -->
        
         <!--
             videoHomePage.aspx :
             This is the Home page for the various workout videos which the visitor has the option to view.
             It divides the various muscles of the body as small and large and provides an option to view 
             videos specific to each muscles.
             Initially it showcases the various muscles of the human body using an image, and various pointers 
             pointing to each muscles (by the way I hand crafted each pointer in paint and created that image).
          -->

<%@ Page Language="C#" %>

<!DOCTYPE html>
<script runat="server">


</script>
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TFC Videos</title>
    <link rel="icon" type="image/png" href="../images/my-icon2.png">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <style>

        body {
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            padding: 0px;
            width: auto;
            margin-top: 0px;
        }

        a:visited, a {
            text-decoration: none;
            text-decoration-color: none;
        }

        #main-wrapper {
            text-align: center;
            padding: 0px;
            width: auto;
            background-color: #F0F3FC;
        }

        #main-nav-panel {
            margin-top: -2px;
            overflow: hidden;
            width: auto;
            background-color:black;
        }

        .navigation-menu {
            margin-left: -40px;
            margin-top: -0px;
            margin-bottom: -0px;
            overflow: hidden;
            width: auto;
        }


        .current {
            display: none;
        }


        .content-holder {
            width: 95%;
            height: 100%;
            padding: 0;
            margin: 0 auto;
            position: relative;
            min-width: 350px; /*minimum width that the main container of this page should maintain*/
        }


        .home-icon, .icon-image {
            float: left;
        }

        p {
            margin-bottom: -10px;
        }

        .search_item a {
            text-decoration-color: none;
            text-decoration: none;
            color: red;
            font-family: Arial;
            font-family: Arial;
            font-size: 12px;
        }

        .search_item {
            text-decoration-color: none;
            text-decoration: none;
            color: green;
            font-family: Arial;
            font-family: Arial;
            font-size: 12px;
            line-height: 20px;
            padding-left: 50px;
        }

            .search_item img {
                padding-right: 20px;
            }

            .search_item b {
                text-decoration-color: none;
                text-decoration: none;
                color: darkkhaki;
                font-family: Arial;
                font-size: 10px;
            }

        .top-message {
            background-color: black;
            color: white;
            font-family: Arial;
            border-top: 1px solid yellow;
            border-bottom: 1px solid red;
            font: bold;
            line-height: 30px;
        }

        .set-bg-img {
            background-image: url('../images/newfeeds-images/news-bg.png');
        }


        #footer {
            background-color: #1C3044;
            width: 100%;
            height: 70px;
            color: white;
            padding:10px 0px 0px 0px;
        }
        
        /* The Loading bar CSS, centered in the page */
        .spinner {
            position: fixed;
            top: 50%;
            left: 50%;
            margin-left: -50px;
            margin-top: -50px; 
            text-align: center;
            z-index: 1234;
            overflow: auto;
            width: 110px; 
            height: 110px;
        }

        /*Below is the CSS for normal vieweing of the website*/

        @media screen and (min-width: 1100px) {


            .for-mobile-view {
                display: none;
            }

            .responsive-nav {
                display: none;
            }


            .hide {
                display: none;
            }


            .normal-nav ul {
                height: 63px;
                font-family: Arial;
                font-size: 16px;
                font: bold;
                text-align: center;
            }

                .normal-nav ul li {
                    border-right: 1px solid black;
                    display: inline-block;
                    float: left;
                    list-style-type: none;
                    overflow: hidden;
                    height: 63px;
                    width: 11%;
                }

                    .normal-nav ul li a,
                    .normal-nav ul li a:hover,
                    .normal-nav ul li a:visited {
                        text-decoration: none;
                        height: 63px;
                    }

            .selected-bar,
            .selected-bar:visited,
            .nav-bar, .nav-bar:visited,
            .hover-bar, .hover-bar:visited {
                outline: none;
                padding: 2px 10px;
                display: block;
            }

                .selected-bar,
                .selected-bar:visited {
                    background-color: red;
                    color: white;
                    border: 2px solid yellow;
                }

                .hover-bar, .hover-bar:visited {
                    margin-top: -63px;
                    background: red;
                    color: white;
                }

                .nav-bar, .nav-bar:visited {
                    color: white;
                    background-color: #1C3044;
                }

            .display-none {
                display: none;
            }

            .banner-pic-pannel {
                height: auto;
                width: auto;
                background-repeat: no-repeat;
                position: relative;
            }

            .clear {
                clear: both;
            }

            .home-banner-img {
                height: auto;
                width: 100%;
            }

            #large-bodypart {
                float: left;
                padding: 20px 20px 0px 30px;
            }

            #small-bodypart {
                float: right;
                padding: 20px 20px 0px 20px;
            }

            .v-tabs {
                display: block;
                min-width: 240px;
                background-color: #B2B2FF;
                height: 95px;
                border: 1px solid lightgrey;
                color: darkblue;
                font-family: Arial;
                text-align: center;
                font: bold;
            }

            .onhover-opacity {
                opacity: 0.4;
            }

            .populate-video {
                height: auto;
                float: left;
                width: 55%;
                max-width: 52%;
                padding: 20px 5px 0px 5px;
                max-height: 480px;
                overflow-y: auto;
            }

            #main-videotabs img {
                width: auto;
            }
        }

        /*Below is the CSS for making website
         adaptable for mobile or small screen viewing*/

        @media screen and (max-width: 1099px) {


            .home-banner-img {
                width: 100%;
            }

            #large-bodypart {
                display: none;
            }


            #large-bodypart-mobile {
                background-color: white;
                text-align: center;
                width: 50%;
                float: right;
                background-image: url('../images/newfeeds-images/news-bg.png');
            }

            #small-bodypart {
                width: 50%;
                float: left;
                background-color: white;
                background-image: url('../images/newfeeds-images/news-bg.png');
            }

            .v-tabs {
                display: block;
                background-color: #B2B2FF;
                height: 95px;
                border: 1px solid black;
                color: white;
                font-family: Arial;
                text-align: center;
                margin: 10px 10px;
                font: bold;
            }

            .onhover-opacity {
                opacity: 0.4;
            }

            .populate-video {
                height: auto;
                border-bottom: 3px solid red;
                margin-bottom: 3px;
                width: auto;
                padding: 20px 5px 0px 5px;
                overflow-y: scroll;
                max-height: 400px;
            }

            .normal-nav {
                display: none;
            }


            nav {
                float: right;
                background-color: black;
                margin-bottom: -12px;
                min-height: 80px;
                width: 100%;
                padding: 0px 0px;
                margin-top: -20px;
            }

                nav ul {
                    width: 100%;
                    padding: 22px 0px 22px 0px;
                    position: relative;
                    border-left: 1px solid grey;
                    height: 100%;
                    color: white;
                    background-color: red;
                    background-repeat: no-repeat;
                    font-family: Arial;
                }

                nav li {
                    display: none;
                    margin: 0;
                }

                nav .current {
                    display: block;
                }

                nav a {
                    display: block;
                    padding: 5px 5px 5px 32px;
                    text-align: left;
                }

                nav .current a, nav p {
                    background: none;
                    text-align: center;
                    color: white;
                }

                nav ul:hover {
                    background-image: none;
                }

                    nav ul:hover li {
                        display: block;
                        margin: 0 0 5px;
                        color: white;
                    }

                nav li:hover p {
                    text-shadow: yellow 0 0 10px;
                    color: darkkhaki;
                }

                nav ul:hover .current {
                    background: url(images/icon-check.png) no-repeat;
                }
        }
    </style>
</head>
<body>
    <div id="main-wrapper">
        <div class="content-holder">
            <div class="header-panel">
                <div class="home-icon">
                    <img src="../images/TFC-icon.png" class="icon-image" />
                </div>
                <div id="main-nav-panel">
                    <div class="normal-nav">
                        <ul class="navigation-menu">
                            <li><a href="../project/projectHomePage.aspx" class="nav-bar" target="_blank">
                                <p>HOME</p>
                            </a></li>
                            <li><a href="#" class="selected-bar">
                                <p>VIDEOS</p>
                            </a></li>
                            <li><a href="../project/nutritionPage.aspx" class="nav-bar" target="_blank">
                                <p>NUTRITION</p>
                            </a></li>
                            <li><a href="../project/trackDataPage.aspx" class="nav-bar" target="_blank">
                                <p>RECORD</p>
                            </a></li>
                            <li><a href="../project/myStore.aspx" class="nav-bar" target="_blank">
                                <p>STORE</p>
                            </a></li>
                            <li><a href="../project/storeLocatorPage.aspx" id="loc-bar" class="nav-bar" target="_blank">
                                <p>LOCATOR</p>
                            </a></li>
                            <li><a href="../project/fitnessNewsPage.aspx" class="nav-bar" target="_blank">
                                <p>FEEDS</p>
                            </a></li>
                            <li><a href="../project/contactUsPage.aspx" id="A1" class="nav-bar" target="_blank">
                                <p>REACH US</p>
                            </a></li>
                        </ul>
                    </div>

                    <!-- 
                         The Below mentioned Div shows up to showcase the menu as per the mobile view.
                         This accumulates the entire Menu options into one single tab, hence enabling 
                         mobile view compatability
                    -->

                    <div class="responsive-nav">
                        <nav>
                            <ul>
                                <li class="current">
                                    <img src="../images/icon-menu.png" />
                                    M E N U</li>
                                <li><a href="../project/projectHomePage.aspx" target="_blank">
                                    <p>HOME</p>
                                </a></li>
                                <li><a href="#">
                                    <p>VIDEOS</p>
                                </a></li>
                                <li><a href="../project/nutritionPage.aspx" target="_blank">
                                    <p>NUTRITION</p>
                                </a></li>
                                <li><a href="../project/trackDataPage.aspx" target="_blank">
                                    <p>RECORD</p>
                                </a></li>
                                <li><a href="../project/myStore.aspx" target="_blank">
                                    <p>STORE</p>
                                </a></li>
                                <li><a href="../project/storeLocatorPage.aspx" target="_blank">
                                    <p>LOCATOR</p>
                                </a></li>
                                <li><a href="../project/fitnessNewsPage.aspx" target="_blank">
                                    <p>FEEDS</p>
                                </a></li>
                                <li><a href="../project/contactUsPage.aspx" target="_blank">
                                    <p>REACH US</p>
                                </a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="top-message">HOVER THE ICONS BELOW TO POPULATE THE WORKOUT VIDEOS IN THE MIDDLE</div>
            <div class="banner-pic-pannel">
                <div id="main-videotabs">
                    <div class="v-tab-holder" id="large-bodypart">
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
                    </div>
                    <img src="../images/video-banner.jpg" class="home-banner-img" />
                    
                    <!-- Below div is the spinner DIV which shows up where there is a ajax call on the page, and ends when the call ends-->
                    <div id="spinner" class="spinner" style="display: none">
                        <img id="img-spinner" src="../images/ajax-loader.gif" alt="Loading" />
                    </div>
                    
                    <!-- This is the Div where the Videos get populated -->
                    <div class="populate-video" id="pop-video-id"></div>

                    <div class="v-tab-holder" id="small-bodypart">
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

                    <!--
                        Below mentioned Div is for mobile viewing only, When a person looks this page 
                        on hi/her mobile or in a very small dimention then this Div shows up
                     -->

                    <div class="for-mobile-view">
                        <div class="v-tab-holder" id="large-bodypart-mobile">
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
                        </div>
                    </div>
                </div>
            </div>

            <div class="clear"></div>
            <div id="footer"><b>Copyright Total Fitness Club</b></div>
        </div>
    </div>
    <script type="text/javascript">

        $('.populate-video').hide(0);
        $('#pwd-null-error').hide(0);
        $('#username-null-error').hide(0);
        $('#mismatch-error').hide(0);

        $('.shoulder').mouseover(function () {

            //set the background color of the tabs as white on page ready
            $('.content-holder').addClass('set-bg-img');

            /* 
              calling the youtube APIs for retreiving videos.
              Note that the parameter the the 'SearchYouTube' function forms the query to the 
              YouTube API and populates the videos.
           */

            SearchYouTube("SHOULDER WORKOUT VIDEOS");
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

        /* 
           Below mentioned jQuery performs the YouTube search as per the click event on the 
           particular tab i.e triceps, biceps etc.
           Note that the parameter the the 'SearchYouTube' function forms the query to the 
           YouTube API and populates the videos.
        */

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
            SearchYouTube("SHOULDER WORKOUT VIDEOS");
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

        //youtube video retreival code below

        function SearchYouTube(query) {
            $("#spinner").show(0);
            $.ajax({

                // call to the YouTube APIs for getting the list of desired videos as per the 'query' given

                url: 'http://gdata.youtube.com/feeds/videos?alt=json-in-script&q=' + query,

                // response format here is JSONP
                dataType: 'jsonp',
                success: function (data) {
                    //$("#spinner").bind("ajaxSend", function () {
                    $("#spinner").show(0);
                    //bind("ajaxStop", function () {

                    //}).bind("ajaxError", function () {
                    //  $(this).hide(0);
                    //});
                    var message = "";

                    //below if check is for checking if any data is being retreived or not from the API response object.
                    // if not then appropriate message is passed in the alert box.
                    if (data.feed.entry.length == null) {
                        $("#spinner").hide(0);
                        alert('Data cannot be retreived, try again with new search');
                    }
                    else {
                        for (i = 0; i < data.feed.entry.length; i++) {
                            message += "<div class='search_item'>";
                            message += "<table width='100%'>";
                            message += "<tr>";
                            message += "<td vAlign='top' align='left'>";
                            message += "<a  target='_blank'  href='" + data.feed.entry[i].media$group.media$player[0].url + "'>";
                            message += "<img width='auto' height='auto' src=" + data.feed.entry[i].media$group.media$thumbnail[2].url + " /></a>";
                            message += "</td>";
                            message += "<td vAlign='top' width='100%' align='left'>";
                            message += "<b>TITLE : </b><a target='_blank'  href='" + data.feed.entry[i].media$group.media$player[0].url + "'>" + data.feed.entry[i].media$group.media$title.$t + "</a><br/>";
                            message += "<b>DURATION :  </b>" + data.feed.entry[i].media$group.yt$duration.seconds + " secs<br/>";
                            message += "<b>VIEWS : </b>" + data.feed.entry[i].yt$statistics.viewCount + " views<br/>";
                            message += "<b>RATING : </b>" + data.feed.entry[i].gd$rating.average + " / 5<br/>";
                            message += "<b>CATEGORY :  </b>" + data.feed.entry[i].media$group.media$category[0].label + "<br/>";
                            message += "</td>";
                            message += "</tr>";
                            message += "</table>";
                            message += "</div>";
                            message += "<hr />";
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