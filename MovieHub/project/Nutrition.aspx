<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Nutrition.aspx.cs" Inherits="project_Nutrition" %>

<%@ Import Namespace="edu.neu.ccis.rasala" %>

<!DOCTYPE html>
<script runat="server">
// below is the code from Prof. Rasala's key hiding application.
    const string keyidentifier1 = "yummlyAppKey";
    const string keyidentifier2 = "yummlyAppId";
    const string keyidentifier3 = "6272d97d";
    const string keyidentifier4 = "714cb810ad9e636ae8af93f3fe16e1b4";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            id1.Text = KeyTools.GetKey(this, keyidentifier1);
            id2.Text = KeyTools.GetKey(this, keyidentifier2);
            id3.Text = KeyTools.GetKey(this, keyidentifier3);
            id4.Text = KeyTools.GetKey(this, keyidentifier4);
        }
    }
</script>
<html>
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nutrition</title>
    <link rel="icon" type="image/png" href="../images/my-icon2.png">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="javascript/slider.js"></script>
    <link href="css/slider.css" rel="stylesheet" />
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

        .clear {
            clear: both;
        }

        .home-icon, .icon-image {
            float: left;
        }

        .content-holder {
            background-color: white;
            width: 95%;
            height: 100%;
            padding: 0;
            margin: 0 auto;
            min-width: 638px; /*minimum width that the main container of this page should maintain*/
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

        #footer {
            background-color: #1C3044;
            width: 100%;
            height: 100%;
            border-top:1px solid yellow;
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



        /*CSS for the recipe's flavour chart starts here*/

        #data-table {
            border: solid 1px grey;
            width: auto;
            box-shadow: 0px 0px 50px #888888;
        }

            #data-table caption {
                color: #545454;
                font-size: 14px;
                font-weight: normal;
                line-height: 20px;
                margin: 0 0 20px 0;
                padding: 0;
                text-align: center;
            }

            #data-table thead {
                background: #f0f0f0;
            }

            #data-table th, #data-table td {
                border: none;
                border-bottom: 1px solid #ccc;
                margin: 0;
                padding: 10px;
                text-align: left;
            }

        .toggles {
            background: #ebebeb;
            color: #545454;
            height: 20px;
            padding: 15px;
        }

            .toggles p {
                margin: 0;
            }

            .toggles a {
                background: #222;
                border-radius: 3px;
                color: #fff;
                display: block;
                float: left;
                margin: 0 10px 0 0;
                padding: 0 6px;
                text-decoration: none;
            }

                .toggles a:hover {
                    color: yellow;
                }

        #reset-graph-button {
            float: right;
        }

        #wrapper {
            box-shadow: 0px 0px 50px #888888;
            height: auto;
            left: 50%;
            margin: 30px auto 0px auto;
            top: 90%;
            width: 700px;
            border: solid 1px;
            border-color: grey;
            background-color: white;
        }

        #figure {
            height: 380px;
            position: relative;
        }

            #figure ul {
                list-style: none;
                margin: 0;
                padding: 0;
            }

        .graph {
            height: 283px;
            position: relative;
        }

        .legend {
            background: #f0f0f0;
            border-radius: 4px;
            bottom: 0;
            position: absolute;
            text-align: center;
            width: auto;
        }

            .legend li {
                display: block;
                float: left;
                height: 20px;
                margin: 0;
                padding: 10px 30px;
                width: auto;
            }

            .legend span.icon {
                background-position: 50% 0;
                border-radius: 2px;
                display: block;
                float: left;
                height: 16px;
                margin: 2px 10px 0 0;
                width: 16px;
            }

        .x-axis {
            bottom: 0;
            color: #555;
            position: absolute;
            text-align: center;
            width: 100%;
        }

            .x-axis li {
                float: left;
                margin: 0 15px 0px 23px;
                padding: 2px 0;
                width: 76px;
            }

        .y-axis {
            color: #555;
            position: absolute;
            text-align: right;
            width: 100%;
        }

            .y-axis li {
                border-top: 1px solid #ccc;
                display: block;
                height: 62px;
                width: 100%;
                color: white;
            }

                .y-axis li span {
                    color: white;
                    display: block;
                    margin: -10px 0 0 -60px;
                    padding: 0 10px;
                    width: 40px;
                }

        .bars {
            height: 253px;
            position: absolute;
            width: 100%;
            z-index: 10;
        }

        .bar-group {
            float: left;
            height: 100%;
            margin: 0 15px;
            position: relative;
            width: 76px;
        }

        .bar {
            border-radius: 3px 3px 0 0;
            bottom: 0;
            cursor: pointer;
            height: 0;
            position: absolute;
            text-align: center;
            width: 24px;
        }

            .bar.fig0 {
                left: 0;
            }

            .bar.fig1 {
                left: 26px;
            }

            .bar.fig2 {
                left: 52px;
            }

            .bar span {
                background: #fefefe;
                border-radius: 3px;
                left: -8px;
                display: none;
                margin: 0;
                position: relative;
                text-shadow: rgba(255, 255, 255, 0.8) 0 1px 0;
                width: 40px;
                z-index: 20;
                -webkit-box-shadow: rgba(0, 0, 0, 0.6) 0 1px 4px;
                box-shadow: rgba(0, 0, 0, 0.6) 0 1px 4px;
            }

            .bar:hover span {
                display: block;
            }

        #data-table {
            display: none;
        }

        .bar span {
            background: #fefefe url('images/info-bg.gif') 0 100% repeat-x;
        }

        .fig0 {
            background: #747474 url('images/bar-02-bg.gif') 0 0 repeat-y;
        }

        .fig1 {
            background: #65c2e8 url('images/bar-02-bg.gif') 0 0 repeat-y;
        }

        .fig2 {
            background: #eea151 url('images/bar-02-bg.gif') 0 0 repeat-y;
        }

        .chart h2 {
            font-size: 18px;
            font-weight: normal;
            line-height: 20px;
            margin: 0 0 20px 0;
            padding: 0;
            text-align: center;
            text-transform: uppercase;
        }

        h4 {
            color: #545454;
            font-size: 14px;
            font-weight: normal;
            line-height: 20px;
            margin: 0 0 20px 0;
            padding: 0;
            text-transform: uppercase;
            text-align: center;
        }


        /*CSS for the flavour chart ends here*/


        #nutritionix-populate-result {
            background-color: black;
            background-image: url('../images/newfeeds-images/news-bg.png');
            font-family: Arial;
            font-size: 15px;
            color: darkblue;
        }

        .heading {
            font: bold;
            background-color: lightgreen;
            color: red;
        }

        .nutritionix-details {
            background-color: #FFFFB2;
        }

        .slide-show-panel {
            background-color: white;
            width: 95%;
            height: 100%;
        }

        .bxslider {
            height: 100%;
            width: 100%;
            background-color: black;
        }



        #welcome-name img {
            background-color: white;
            width: 70%;
            height: auto;
            border-top: 2px solid yellow;
        }


        .nutrition-portal {
            width: 100%;
            padding: 0px 20px 0px 20px;
            height: 450px;
        }

            .nutrition-portal ul li {
                display: block;
                list-style-type: none;
            }

        .nutrition-portal-list {
            padding: 0px 0px 0px 0px;
            margin: 0px 0px 0px 0px;
        }


        /*CSS for the 'Choose by category menu bar' starts here*/

        .my-category-panel,
        .my-category-panel ul,
        .my-category-panel li,
        .my-category-panel a {
            margin: 0;
            padding: 0;
            border: 0;
            list-style: none;
            font-weight: normal;
            text-decoration: none;
            line-height: 1;
            font-family: Arial;
            font-size: 14px;
            position: relative;
            height: auto;
        }

            .my-category-panel a {
                line-height: 1.3;
            }

        .my-category-panel {
            width: 100%;
        }

            .my-category-panel > ul > li > a {
                padding-right: 40px;
                font-size: 25px;
                font-weight: bold;
                display: block;
                background: #c20000;
                color: #ffffff;
                border-bottom: 1px solid #5c0000;
                text-transform: uppercase;
            }

                .my-category-panel > ul > li > a > span {
                    background: #f50000;
                    padding: 10px;
                    display: block;
                    font-size: 12px;
                    font-weight: 300;
                }

                .my-category-panel > ul > li > a:hover {
                    text-decoration: none;
                }

            .my-category-panel > ul > li.active {
                border-bottom: none;
            }

                .my-category-panel > ul > li.active > a {
                    color: #fff;
                }

                    .my-category-panel > ul > li.active > a span {
                        background: #c20000;
                    }

            .my-category-panel span.cnt {
                position: absolute;
                top: 8px;
                right: 15px;
                padding: 0;
                margin: 0;
                background: none;
            }

            .my-category-panel ul ul {
                display: none;
            }

                .my-category-panel ul ul li {
                    border: 1px solid #e0e0e0;
                    border-top: 0;
                }

                .my-category-panel ul ul a {
                    padding: 10px;
                    display: block;
                    color: #000000;
                    font-size: 12px;
                }

                    .my-category-panel ul ul a:hover {
                        color: #bd0e36;
                    }

                .my-category-panel ul ul li.odd {
                    background: #f4f4f4;
                }

                .my-category-panel ul ul li.even {
                    background: #fff;
                }

                .my-category-panel ul ul li:hover {
                    background: #B2FFFF;
                }


        .category-panel input[type="text"] {
            width: auto;
            height: 20px;
            font-family: Arial;
            margin: 0px 0px 10px 0px;
            outline: none;
            border-radius: 10px 10px;
            background-color: #F0F3FC;
        }

        .category-panel .img {
            height: 20px;
            width: 28px;
            background-repeat: no-repeat;
            margin-top: 2px;
            border: none;
            background-color: white;
            background-image: url('../images/new-search-icon.png');
        }

        /*CSS for the 'Choose by category menu bar' ENDs here*/

        .recipie-list-holder {
            text-align: left;
            font-size: 10px;
            font-family: Arial;
        }


            .recipie-list-holder img {
                width: 150px;
                height: 130px;
                box-shadow: white 0 0 30px;
            }

        .recipe-list-outterdiv {
            width: 490px;
            text-align: left;
            height: 70px;
        }

        .recipe-td {
            margin: 0px 2px 5px 2px;
            padding: 0px 40px 0px 20px;
            width: 12%;
            height: auto;
        }

        .red-upper {
            font-family: Arial;
            color: white;
            text-transform: uppercase;
        }

        .blue-upper {
            color: white;
            background-color: red;
            text-transform: uppercase;
        }

        .recipe-ul {
            color: white;
            font-family: Arial;
        }

        #desc-populate-result {
            width: auto;
            height: 100%;
            background-color: black;
            background-image: url('../images/newfeeds-images/news-bg.png');
        }

        .desc-title {
            color: white;
            text-transform: uppercase;
            font-family: Arial;
            text-align: center;
            font-size: 20px;
            text-shadow: white 0 0 40px;
        }

        .desc-ingredients {
            color: white;
            text-transform: uppercase;
            font-family: Arial;
            text-align: left;
            font-size: 15px;
            margin-right: -8px;
        }


            .desc-ingredients b {
                text-shadow: 0 0 400px;
            }

        #populate-result {
            height: 448px;
            background-color: black;
            background-image: url('../images/newfeeds-images/news-bg.png');
            width: auto;
            overflow-y: scroll;
        }

        .desc-img {
            box-shadow: white 0 0 40px;
            border-radius: 20px;
        }

        #desc-recipe-image {
            margin-right: 10%;
            float: left;
            margin-left: 20%;
        }

        #nutrition-data-table {
            color: white;
            text-transform: uppercase;
            font-family: Arial;
            text-align: center;
            font-size: 15px;
            box-shadow: white 0 0 20px;
            margin-left: 20%;
        }

            #nutrition-data-table th {
                background-color: #FF3333;
                color: white;
            }

            #nutrition-data-table td {
                background-color: none;
                color: white;
            }


        /*Below is the CSS for normal vieweing of the website*/

        @media screen and (min-width: 1100px) {

            .list-populate-panel {
                margin-left: 10px;
                padding: -60px 0px 0px 0px;
                width: 78%;
                height: auto;
                float: left;
                overflow-y: auto;
            }

            .for-mobile-view {
                display: none;
            }

            .responsive-nav {
                display: none;
            }


            #footer {
                background-color: #1C3044;
                width: 100%;
                height: 70px;
                color: white;
                border-top:1px solid yellow;
                 padding:10px 0px 0px 0px;
            }

            #hide {
                display: none;
            }

            .home-icon,
            .icon-image {
                float: left;
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

                .hover-bar,
                .hover-bar:visited {
                    margin-top: -63px;
                    background: red;
                    color: white;
                }

                .nav-bar,
                .nav-bar:visited {
                    color: white;
                    background-color: #1C3044;
                }

            .display-none {
                display: none;
            }

            .clear {
                clear: both;
            }

            .home-banner-img {
                height: auto;
                width: auto;
            }


            .category-panel {
                width: 20%;
                float: left;
                height: 450px;
            }
        }

        /*Below is the CSS for making website
          adaptable for mobile or small screen viewing*/

        @media screen and (max-width: 1099px) {


            .category-panel {
                width: 100%;
                background-image: url('../images/newfeeds-images/news-bg.png');
                height: 450px;
            }

            .category-panel b {
                color: white;
            }

            .list-populate-panel {
                width: 100%;
                height: auto;
                overflow-y: auto;
             }

            .normal-nav {
                display: none;
             }

            #hide-this {
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
                    
                    <!--
                        Below div 'normal-nav' is the normal view nagivation panel, i.e which is viewed when we look 
                        the site on a desktop
                     -->
                    <div class="normal-nav">
                        <ul class="navigation-menu">
                            <li><a href="../project/projectHomePage.aspx" class="nav-bar" target="_blank">
                                <p>HOME</p>
                            </a></li>
                            <li><a href="../project/videoHomePage.aspx" class="nav-bar" target="_blank">
                                <p>VIDEOS</p>
                            </a></li>
                            <li><a href="#" class="selected-bar">
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
                                <li><a href="../project/videoHomePage.aspx" target="_blank">
                                    <p>VIDEOS</p>
                                </a></li>
                                <li><a href="#">
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
            <div id="welcome-name">
                <img src="../images/kitchen-banner-pic.png" />
                
                <!--
                    Below mentioned are the labels which will be populated with the required application Keys via the Profs key hiding 
                    mechanism
                    -->
                <asp:Label ID="id1" runat="server" />
                <asp:Label ID="id2" runat="server" />
                <asp:Label ID="id3" runat="server" />
                <asp:Label ID="id4" runat="server" />

            </div>
            <!-- Below div is the spinner DIV which shows up where there is a ajax call on the page, and ends when the call ends-->
                    <div id="spinner" class="spinner" style="display: none">
                        <img id="img-spinner" src="../images/ajax-loader.gif" alt="Loading" />
                    </div>
                    
            <div class="nutrition-portal">
                <ul class="nutrition-portal-list">
                    <li class="category-panel" id="hide-this">   <!--hide this 'li' for responsive view-->
                        <div class="my-category-panel">
                            <div class="search-menu">
                                <input type="text" id="myQuery" placeholder="powered by yummly APIs" />
                                <input class="img" type="button" onclick="searchMyRecipe(document.getElementById('myQuery').value)" />
                            </div>
                            <hr />
                            <ul>
                                <li><a><span>CHOOSE  BY CATEGORY</span></a></li>
                                <li class='has-sub'><a href='#'><span>By Calorie content</span></a>
                                    <ul>
                                        <!--
                                             Calling the Function 'searchItemByCal_Brand' and passing the nutritionix URI for
                                             retreiving JSON format data of the particular food items, present in the desired 
                                             range of calories.
                                        -->
                                        <li><a href='#' onclick="searchItemByCal_brand('lt10')"><span>Less than 10</span></a></li>
                                        <li><a href='#' onclick="searchItemByCal_brand('bt10n100')"><span>Between 10 and 100</span></a></li>
                                        <li><a href='#' onclick="searchItemByCal_brand('bt100n1000')"><span>Between 100 and 1000</span></a></li>
                                        <li class='last'><a href='#' onclick="searchItemByCal_brand('mt1000')"><span>Greater than 1000</span></a></li>
                                    </ul>
                                </li>
                                <li class='has-sub'><a href='#'><span>Our Suggestions</span></a>
                                    <ul>
                                        <li><a href='#' onclick="searchItemByCal_brand('chobani')"><span>Chobani Yogurt- Improves gastrointestinal health</span></a></li>
                                        <li><a href='#' onclick="searchItemByCal_brand('optimum')"><span>Build Muscles by Optimum Nutrition</span></a></li>
                                        <li><a href='#' onclick="searchItemByCal_brand('oliveoil')"><span>Olive Oil -Reduces heart diseases & cancer</span></a></li>
                                        <li><a href='#' onclick="searchItemByCal_brand('quinoa')"><span>Quinoa- higher in fiber & protein</span></a></li>
                                        <li><a href='#' onclick="searchItemByCal_brand('eggs')"><span>Whole Eggs-Cheap & Rich Protein Source</span></a></li>
                                        <li><a href='#' onclick="searchItemByCal_brand('salmon')"><span>Wild Salmon -High omega-3 & Protein</span></a></li>
                                        <li class='last' onclick="searchItemByCal_brand('tfcreco')"><a href='#'><span>Total Fitness Club's Recommends</span></a></li>
                                    </ul>
                                </li>
                                <li class='last'><b>Powered by nutritionix APIs</b></li>
                            </ul>
                        </div>
                    </li>
                    <li class="list-populate-panel">
                        <div class="slide-show-panel">
                            
                            <!--BX Slider showcasing the various Healthy and highly nutritive food items-->

                            <ul class="bxslider">
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-1.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-2.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-3.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-4.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-5.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-6.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-7.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-8.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-9.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-10.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-11.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-12.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-13.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-14.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-15.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-16.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-17.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-18.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-19.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-20.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-21.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-22.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-23.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-24.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-25.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-26.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-27.jpg" /></li>
                                <li>
                                    <img src="../images/nutrition-facts-slider/pic-1.jpg" /></li>
                            </ul>
                        </div>
                        <div id="nutritionix-populate-result"></div>
                        <div id="populate-result"></div>
                        <div id="desc-populate-result">
                            <div id="desc-recipe-title"></div>
                            <div id="desc-recipe-image"></div>
                            <div id="desc-recipe-ingredients"></div>
                            <div class="clear"></div>
                            <div id="desc-recipe-flavour"></div>
                            <div id="desc-recipe-nutrients"></div>
                        </div>
                    </li>
                    
                    <!-- 
                        The Below mentioned Div shows up to showcase the 'CHOOSE BY CATEGORY' bar as per the mobile view.
                        By showing up this div(initially hidden) and hiding the previous div(initialy visible), we get a 
                        view which is mobile compatible
                    -->

                    <div class="clear hide"></div>
                    <li class="category-panel" id="hide">
                        <div class="my-category-panel">
                            <div class="search-menu">
                                <input type="text" id="myResponsiveQuery" placeholder="powered by yummly APIs" />
                                <input class="img" type="button" onclick="searchMyRecipe(document.getElementById('myResponsiveQuery').value)" />
                            </div>
                            <hr />
                            <ul>
                                <li><a><span>CHOOSE  BY CATEGORY</span></a></li>
                                <li class='has-sub'><a href='#'><span>By Calorie content</span></a>
                                    <ul>
                                        <li><a href='#' onclick="searchItemByCal_brand('lt10')"><span>Less than 10</span></a></li>
                                        <li><a href='#' onclick="searchItemByCal_brand('bt10n100')"><span>Between 10 and 100</span></a></li>
                                        <li><a href='#' onclick="searchItemByCal_brand('bt100n1000')"><span>Between 100 and 1000</span></a></li>
                                        <li class='last'><a href='#' onclick="searchItemByCal_brand('mt1000')"><span>Greater than 1000</span></a></li>
                                    </ul>
                                </li>
                                <li class='has-sub'><a href='#'><span>Our Suggestions</span></a>
                                    <ul>
                                        <li><a href='#' onclick="searchItemByCal_brand('chobani')"><span>Chobani Yogurt- Improves gastrointestinal health</span></a></li>
                                        <li><a href='#' onclick="searchItemByCal_brand('optimum')"><span>Build Muscles by Optimum Nutrition</span></a></li>
                                        <li><a href='#' onclick="searchItemByCal_brand('oliveoil')"><span>Olive Oil -Reduces heart diseases & cancer</span></a></li>
                                        <li><a href='#' onclick="searchItemByCal_brand('quinoa')"><span>Quinoa- higher in fiber & protein</span></a></li>
                                        <li><a href='#' onclick="searchItemByCal_brand('eggs')"><span>Whole Eggs-Cheap & Rich Protein Source</span></a></li>
                                        <li><a href='#' onclick="searchItemByCal_brand('salmon')"><span>Wild Salmon -High omega-3 & Protein</span></a></li>
                                        <li class='last' onclick="searchItemByCal_brand('tfcreco')"><a href='#'><span>Total Fitness Club's Recommends</span></a></li>
                                    </ul>
                                </li>
                                <li class='last'><b>Powered by nutritionix APIs</b></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>
            <div id="footer"><b>Copyright Total Fitness Club</b></div>
        </div>
    </div>
    <script type="text/javascript">

        // declaring variables which represent the various keys.
        var nutritionixAppKey;
        var nutritionixAppId;
        var yummlyAppKey;
        var yummlyAppId;

        $('#populate-result').hide(0);
        $('#desc-populate-result').hide(0);
        $('.nutrition-portal').show(0);
        $('.main-slider-holder').hide(0);
        $('#nutritionix-populate-result').hide(0);


        $(document).ready(function () {

            // hiding the Labels when page is ready.
            $('#id1').hide(0);
            $('#id2').hide(0);
            $('#id3').hide(0);
            $('#id4').hide(0);

            // retreiving the key values retreived by the prof's app.
            yummlyAppKey = document.getElementById('id1').innerText;
            yummlyAppId = document.getElementById('id2').innerText;
            nutritionixAppId = document.getElementById('id3').innerText;
            nutritionixAppKey = document.getElementById('id4').innerText;

            // A call to the BX Slider function
            $('.bxslider').bxSlider();

            // navigation panel jQuery 
            $('.navigation-menu li .nav-bar').each(function () {
                $(this).before($(this).clone().removeClass().addClass('hover-bar'));
            });
            $('.navigation-menu li').hover(function () {
                $(this).find('.hover-bar').stop().animate({ marginTop: '0px' }, 200);
            },
            function () {
                $(this).find('.hover-bar').stop().animate({ marginTop: '-63px' }, 200);
            });

            /* The code below manages the movement of the 'CHOOSE BY CATEGORY' menu panel.
               This counts the number of 'li' elements beneath each 'ul' element (which 
               inturn is beneath the outter 'ul' element), then displays the count next
               to the inner 'ul'element. 
               EXAMPLE: 
               <ul>
                 <li>
                    <ul>  ---> Here this 'ul' element would have count as "2" next to it, as per this code
                      <li>Data __1__</li>
                      <li>Data __2__</li>
                    </ul>
                 </li>
               </ul>
            */

            $('.my-category-panel > ul > li ul').each(function (i, element) {
                var li_count = $(element).find('li').length;
                var data = '<span class="cnt">' + li_count + '</span>';
                $(element).closest('li').children('a').append(data);
            });
            $('.my-category-panel ul ul li:odd').addClass('odd');
            $('.my-category-panel ul ul li:even').addClass('even');
            $('.my-category-panel > ul > li > a').click(function () {
                $('.my-category-panel li').removeClass('active');
                $(this).closest('li').addClass('active');
                var seeTab = $(this).next();
                if ((seeTab.is('ul')) && (seeTab.is(':visible'))) {
                    $(this).closest('li').removeClass('active');
                    seeTab.slideUp('normal');
                }
                if ((seeTab.is('ul')) && (!seeTab.is(':visible'))) {
                    $('.my-category-panel ul ul:visible').slideUp('normal');
                    seeTab.slideDown('normal');
                }
                if ($(this).closest('li').find('ul').children().length == 0) {
                    return true;
                } else {
                    return false;
                }
            });
        });

       
        /* 
        The function below makes the RESTFul call to the Nutritionix APIs and extracts the list of food items
        as per the desired calorie range. We specify the range in the query URI itself.
        */
        function searchItemByCal_brand(flag) {

            // the if conditions check the various flag messages passed on from above function call, inorder to differentiate which 
            // particular category search needs to be triggered.
            if(flag == 'lt10') {
              var  query_url = 'https://api.nutritionix.com/v1_1/search/?cal_min=0&cal_max=10&fields=*&appId='+ nutritionixAppId +'&appKey='+ nutritionixAppKey;
            }else
            if(flag == 'bt10n100') {
                var query_url = 'https://api.nutritionix.com/v1_1/search/?cal_min=10&cal_max=100&fields=*&appId=' + nutritionixAppId + '&appKey=' + nutritionixAppKey;
            } else
            if (flag == 'bt100n1000') {
                var query_url = 'https://api.nutritionix.com/v1_1/search/?cal_min=100&cal_max=1000&fields=*&appId=' + nutritionixAppId + '&appKey=' + nutritionixAppKey;
            } else
            if (flag == 'mt1000') {
                var query_url = 'https://api.nutritionix.com/v1_1/search/?cal_min=1000&cal_max=10000&fields=*&appId=' + nutritionixAppId + '&appKey=' + nutritionixAppKey;
            } else
            if (flag == 'chobani') {
                var query_url = 'https://api.nutritionix.com/v1_1/search/chobani%20yougurt?cal_min=0&cal_max=1000&fields=*&appId=' + nutritionixAppId + '&appKey=' + nutritionixAppKey;
            } else
            if (flag == 'optimum') {
                var query_url = 'https://api.nutritionix.com/v1_1/search/optimum%20whey?cal_min=0&cal_max=1000&fields=*&appId=' + nutritionixAppId + '&appKey=' + nutritionixAppKey;
            } else
            if (flag == 'oliveoil') {
                var query_url = 'https://api.nutritionix.com/v1_1/search/Extra%20Virgin%20Olive%20Oil?cal_min=0&cal_max=1000&fields=*&appId=' + nutritionixAppId + '&appKey=' + nutritionixAppKey;
            } else
            if (flag == 'quinoa') {
                var query_url = 'https://api.nutritionix.com/v1_1/search/Quinoa?cal_min=0&cal_max=1000&fields=*&appId=' + nutritionixAppId + '&appKey=' + nutritionixAppKey;
            } else
            if (flag == 'eggs') {
                var query_url = 'https://api.nutritionix.com/v1_1/search/Whole%20Eggs?cal_min=0&cal_max=1000&fields=*&appId=' + nutritionixAppId + '&appKey=' + nutritionixAppKey;
            } else
            if (flag == 'salmon') {
                var query_url = 'https://api.nutritionix.com/v1_1/search/Wild%20Salmon?cal_min=0&cal_max=1000&fields=*&appId=' + nutritionixAppId + '&appKey=' + nutritionixAppKey;
            } else
            if (flag == 'tfcreco') {
                var query_url = 'https://api.nutritionix.com/v1_1/search/Spinach%20OR%20Broccoli%20OR%20Red%20Meat%20OR%20Turkey%20OR%20Oats?cal_min=0&cal_max=1000&fields=*&appId=' + nutritionixAppId + '&appKey=' + nutritionixAppKey;
            }

            $("#spinner").show(0);
            $.ajax({
                url: query_url,
                crossDomain: true,
                dataType: 'json',
                success: function (response) {
                    console.log(response);
                    $('.slide-show-panel').hide(0);
                    $('#nutritionix-populate-result').show(0);
                    $('#populate-result').hide(0);
                    $('#desc-populate-result').hide(0);
                    var output = '';
                    var items = new Array();
                    items = response.hits;

                    output += "<hr><b class='desc-text desc-title'>CHECK OUT THE FOOD ITEMS FROM NUTRITIONIX.COM</b><br /><table id='nutritionix-table' border='0.5'>";
                    output += "<tr>";
                    output += "<td class='heading'>NAME</td>";
                    output += "<td class='heading'>BRAND</td>";
                    output += "<td class='heading'>DETAILS</td>";
                    output += "<td class='heading'>INGREDIENTS</td>";
                    output += "<td class='heading'>QUANTITY</td>";
                    output += "<td><img src='../images/nutritionix-pics/calories-pic.png' /></td>";
                    output += "<td><img src='../images/nutritionix-pics/sodium-pic.png' /></td>";
                    output += "<td><img src='../images/nutritionix-pics/carbs-pic.png' /></td>";
                    output += "<td><img src='../images/nutritionix-pics/fiber-pic.png' /></td>";
                    output += "<td><img src='../images/nutritionix-pics/protein-pic.png' /></td>";
                    output += "<td><img src='../images/nutritionix-pics/sugar-pic.png' /></td>";
                    output += "<td><img src='../images/nutritionix-pics/cholesterol-pic.png' /></td>";
                    output += "</tr>"

                    for (i = 0; i < items.length; i++) {
                        var ingredients = items[i].fields.nf_ingredient_statement;
                        var calories = items[i].fields.nf_calories;
                        var sodium = items[i].fields.nf_sodium;
                        var carbs = items[i].fields.nf_total_carbohydrate;
                        var fiber = items[i].fields.nf_dietary_fiber;
                        var protein = items[i].fields.nf_protein;
                        var sugar = items[i].fields.nf_sugars;
                        var cholesterol = items[i].fields.nf_cholesterol;
                        var serving_qty = items[i].fields.nf_serving_size_qty;
                        var serving_units = items[i].fields.nf_serving_size_unit;
                        var brand_name = items[i].fields.brand_name;
                        var item_name = items[i].fields.item_name;
                        var item_description = items[i].fields.item_description

                        output += "<tr class='nutritionix-details'>";
                        output += "<td>" + item_name + "</td>";
                        output += "<td>" + brand_name + "</td>";

                        if (item_description == null) {
                            output += "<td> N/A </td>";
                        } else {
                            output += "<td>" + item_description + "</td>";
                        }
                        if (ingredients == null) {
                            output += "<td> N/A </td>";
                        } else {
                            output += "<td>" + ingredients + "</td>";
                        }
                        if (serving_qty == null) {
                            output += "<td> N/A </td>";
                        } else {
                            output += "<td>" + serving_qty + "  " + serving_units + "</td>";
                        }
                        if (calories == null) {
                            output += "<td> N/A </td>";
                        } else {
                            output += "<td>" + calories + "</td>";
                        }
                        if (sodium == null) {
                            output += "<td> N/A </td>";
                        } else {
                            output += "<td>" + sodium + "</td>";
                        }
                        if (carbs == null) {
                            output += "<td> N/A </td>";
                        } else {
                            output += "<td>" + carbs + "</td>";
                        }
                        if (fiber == null) {
                            output += "<td> N/A </td>";
                        } else {
                            output += "<td>" + fiber + "</td>";
                        }
                        if (protein == null) {
                            output += "<td> N/A </td>";
                        } else {
                            output += "<td>" + protein + "</td>";
                        }
                        if (sugar == null) {
                            output += "<td> N/A </td>";
                        } else {
                            output += "<td>" + sugar + "</td>";
                        }
                        if (cholesterol == null) {
                            output += "<td> N/A </td>";
                        } else {
                            output += "<td>" + cholesterol + "</td>";
                        }
                        output += "</tr>";

                    }
                    output += "</table>";
                    document.getElementById("nutritionix-populate-result").innerHTML = output;
                    $("#spinner").hide(0);
                },
                error: function (e) { console.log(e); }
            });
        }


        /* 
            The function below makes the RESTFul call to the Yummly food APIs and extracts the list of food items
            as per the search query in the search box.
       */   

        function searchMyRecipe(myQuery) {
            $("#spinner").show(0);
            event.preventDefault();
            $.ajax({
                url: 'http://api.yummly.com/v1/api/recipes?_app_id='+ yummlyAppId +'&_app_key='+ yummlyAppKey +'&q=' + myQuery + '&requirePictures=true',
                crossDomain: true,
                dataType: 'jsonp',
                success: function (response) {
                    $('.slide-show-panel').hide(0);
                    $('#desc-populate-result').hide(0);
                    $('#nutritionix-populate-result').hide(0);
                    $('#populate-result').show(0);
                    parseRecipeData(response);
                    console.log(response);
                },
                error: function (e) { console.log(e); }
            });
        }

        /* 
           this array holds the data of all the recipe IDs, 
           here the index 0 would hold 1st recipes ID and so on
        */
        var recipeIDs = Array(); 

         /* 
           After the recipe list is extracted, if a person wants to view the details of a particular
           recipe, then this function is called as per the recipe we selected.
           Details of recipes are extracted once we have the recipe ID for it.
         */

        function openRecipeDetail(i) {
            $("#spinner").show(0);
            event.preventDefault();
            var newData = "";
            $.ajax({
                url: 'http://api.yummly.com/v1/api/recipe/' + recipeIDs[i] + '?_app_id='+ yummlyAppId +'&_app_key='+yummlyAppKey,
                crossDomain: true,
                dataType: 'jsonp',
                success: function (response) {
                    $('.slide-show-panel').hide(0);
                    $('#populate-result').hide(0);
                    $('#desc-populate-result').show(0);
                    $('#nutritionix-populate-result').hide(0);
                    parseRecipeDescription(response);
                },
            });
        }

        /*
           This function parses the normal recipe list data once we enter search query,
           along with a little information regarding it.
        */
        /*
        Notice here no code is ther to check if values have been retreived or not, as if there exists a recipe ID, which we checked in the previous method then
        there has to be details regarding that recipe. So we can avoid that check as it would be redundant.
        */
        function parseRecipeData(root) {
            var recipeImg;
            var recipeID;
            var recipeRating;
            var recipeName;
            var myRecipeList;
            var ingredients = new Array();
            myRecipeList += "<div class='recipe-list-outterdiv recipe-ul'>";
            myRecipeList += "<table class='recipie-list-holder recipe-ul'>";
            myRecipeList += "<tr>";

            //below if check is for checking if any data is being retreived or not from the API response object.
            // if not then appropriate message is passed in the alert box.
            if (root.matches.length < 1) {
                $('#populate-result').hide(0);
                $('.slide-show-panel').show(0);
                $("#spinner").hide(0);
                alert('Data cannot be retreived, try again with new search');
            } else {
                for (i = 0; i < root.matches.length ; i++) {
                    recipeIDs[i] = root.matches[i].id;
                    recipeID = root.matches[i].id;
                    recipeImg = root.matches[i].imageUrlsBySize["90"];
                    recipeName = root.matches[i].recipeName;
                    recipeRating = root.matches[i].rating;
                    ingredients = root.matches[i].ingredients;
                    ingredients_count = ingredients.length;
                    myRecipeList += "<td class='recipe-td'><ul class='recipe-ul'>";
                    myRecipeList += "<li class='recipe-ul'><p class='Recipie-name red-upper' display='inline' margin='0px'><b>" + recipeName + "</b></p></li>";
                    myRecipeList += "<li class='recipe-ul'><img src=" + recipeImg + " /></li>";
                    myRecipeList += "<li class='recipe-ul'><span><b class='red-upper'>Ingredients :</b><ul>"
                    for (j = 0; j < ingredients_count; j++) {
                        myRecipeList += "<li class='recipe-ul'>" + ingredients[j]; + "</li>";
                    }
                    myRecipeList += "</ul></span><br/></li>";
                    myRecipeList += "<li class='recipe-ul'>";
                    myRecipeList += "<span><b class='red-upper'>Rating : </b>" + recipeRating + "</span><br/></li>";
                    myRecipeList += "<li class='recipe-ul'>";
                    myRecipeList += "<a href='#' onClick='openRecipeDetail(" + i + ")'><b class='blue-upper'>View Recipe</b></a><br/>";
                    myRecipeList += "</li>";
                    myRecipeList += "</td>";
                }
                myRecipeList += "</tr>";
                myRecipeList += "</table>";
                myRecipeList += "</div>";

                document.getElementById("populate-result").innerHTML = myRecipeList;
                $("#spinner").hide(0);
            }
        }


        // This function gives the entire details regarding the recipe, like flavour, nutrition value etc.
        function parseRecipeDescription(root) {
            // items for getting recipe details

            var desc_recipeImg = root.images[0].hostedLargeUrl;
            var desc_recipeID;
            var desc_recipeRating = root.rating;
            var desc_recipeName = root.name;
            var desc_img;
            var desc_nos;
            var desc_source;
            var desc_name_data;
            var desc_img_data;
            var desc_ingredients_data;
            var desc_nutrients_data;
            var desc_nutrients = new Array();

            desc_nutrients = root.nutritionEstimates;

            var desc_flavour_data;
            var desc_numberOfServings = root.numberOfServings;
            var desc_ingredients = new Array();

            desc_ingredients = root.ingredientLines; //array of ingredients getting retreived

            desc_name_data += "<div><h2 class='desc-text desc-title'>" + desc_recipeName + "</h2></div>";
            desc_img_data += "<div class='desc-img-div'><img class='desc-img' src='" + desc_recipeImg + "'></div>";
            desc_ingredients_data += "<div class='desc-text desc-ingredients'><ul><li><b>Ingredients :</b></li>"

            for (i = 0; i < root.ingredientLines.length; i++) {
                desc_ingredients_data += "<li class='desc-text'>" + desc_ingredients[i] + "</li>";
            }
            desc_ingredients_data += "<br /><br /><li class='desc-text'><b>RATING :  " + desc_recipeRating + " / 5 </b></li>";
            desc_ingredients_data += "<br /><li class='desc-text'><b>SERVES FOR :  " + desc_numberOfServings + " PEOPLE</b></li>";
            desc_ingredients_data += "</div>";

            // adjusting the values from the API calls in a scale of 0 - 1000.
            var val1 = parseInt(root.flavors.Salty * 1000);
            var val2 = parseInt(root.flavors.Meaty * 1000);
            var val3 = parseInt(root.flavors.Sour * 1000);
            var val4 = parseInt(root.flavors.Bitter * 1000);
            var val5 = parseInt(root.flavors.Sweet * 1000);
            var val6 = parseInt(root.flavors.Piquant * 1000);

            /* below is the table which is present to store values of the flavours of the recipe, 
                which I will get from the API call.*/
            desc_flavour_data += "<hr><b class='desc-text desc-title'>CHECK OUT THE FLAVOURS OF THIS RECIPE :</b><br /><table id='data-table' border='1'>";
            desc_flavour_data += "<caption>Flavours of the Recipe displayed on a scale of 0 - 1000</caption>";
            desc_flavour_data += "<thead>";
            desc_flavour_data += "<tr>";
            desc_flavour_data += "<td>&nbsp;</td>";
            desc_flavour_data += "<th scope='col'>SALTY</th>";
            desc_flavour_data += "<th scope='col'>SAVORY</th>";
            desc_flavour_data += "<th scope='col'>SOUR</th>";
            desc_flavour_data += "<th scope='col'>BITTER</th>";
            desc_flavour_data += "<th scope='col'>SWEET<th>";
            desc_flavour_data += "<th scope='col'>SPICY<th>";
            desc_flavour_data += "</tr></thead>"
            desc_flavour_data += "<tbody><tr>";
            desc_flavour_data += "<th scope='row'>Flavours </th>";
            desc_flavour_data += "<td>" + val1 + "</td>";
            desc_flavour_data += "<td>" + val2 + "</td>";
            desc_flavour_data += "<td>" + val3 + "</td>";
            desc_flavour_data += "<td>" + val4 + "</td>";
            desc_flavour_data += "<td>" + val5 + "</td>";
            desc_flavour_data += "<td>" + val6 + "</td>";
            desc_flavour_data += "</tr>";
            desc_flavour_data += "</tbody></table>";


            desc_flavour_data += "<div id='wrapper'>";
            desc_flavour_data += "<div class='toggles'>";
            desc_flavour_data += "<p><a href='#' id='reset-graph-button'>Reset graph</a> Mouse over the bars to display information.</p></div>";
            desc_flavour_data += "<div class='chart'>";
            desc_flavour_data += "</div></div><br /><br />";

            // below is the table which is present to store values of the nutrients of the recipe, which I will get from the API call.
            desc_nutrients_data += "<hr><b class='desc-text desc-title'>CHECK OUT THE NUTRIENTS OF THIS RECIPE :</b><br /><br /><table id='nutrition-data-table' border='1'>";
            desc_nutrients_data += "<thead>";
            desc_nutrients_data += "<tr>";
            desc_nutrients_data += "<th>NUTRIENT</th>";
            desc_nutrients_data += "<th scope='col'>AMOUNT PRESENT</th>";
            desc_nutrients_data += "<th scope='col'>UNITS</th>";
            desc_nutrients_data += "</tr></thead>"
            desc_nutrients_data += "<tbody>";
            
            // incase no Nutrients data is available regarding the recipe, so set not available to all.
            if (desc_nutrients.length < 1) {
                desc_nutrients_data += "<tr><td> N/A </td>";
                desc_nutrients_data += "<td> N/A </td>";
                desc_nutrients_data += "<td> N/A </td></tr>";
            } else {
                // since there is no available label from the API repsponse regarding the FAT nutrient, so I am hardcoding it.
                // Since the FAT is the first element of the Array from the response, so i am setting the [0] index.
                desc_nutrients[0].description = "FATS";
            for (i = 0; i < desc_nutrients.length; i++) {
                     desc_nutrients_data += "<tr><td>" + desc_nutrients[i].description + "</td>";
                     desc_nutrients_data += "<td>" + desc_nutrients[i].value + "</td>";
                     desc_nutrients_data += "<td>" + desc_nutrients[i].unit.plural + "</td></tr>";
            }
            }

            desc_nutrients_data += "</tbody></table><br /><br /><hr>";
            desc_nutrients_data += "<a href='" + root.source.sourceRecipeUrl + "' target='_blank'>RECIPE SOURCE</a><br /><hr>";
            document.getElementById("desc-recipe-title").innerHTML = desc_name_data;
            document.getElementById("desc-recipe-image").innerHTML = desc_img_data;
            document.getElementById("desc-recipe-ingredients").innerHTML = desc_ingredients_data;
            document.getElementById("desc-recipe-flavour").innerHTML = desc_flavour_data;
            document.getElementById("desc-recipe-nutrients").innerHTML = desc_nutrients_data;

            createGraph('#data-table', '.chart'); // this function creates the graph from the flavour table values given as an input to it.                
            $("#spinner").hide(0);
        }

        // below is the actual implementation of the graph rendering function.
        function createGraph(data, container) {
            // declare some variables
            var bars = [];
            var figureContainer = $('<div id="figure"></div>');
            var graphContainer = $('<div class="graph"></div>');
            var barContainer = $('<div class="bars"></div>');
            var data = $(data);
            var container = $(container);
            var chartData;
            var chartYMax;
            var columnGroups;

            // Timer variables
            var barTimer;
            var graphTimer;

            // Create table data object
            var tableData = {
                // Get numerical data from table cells
                chartData: function () {
                    var chartData = [];
                    data.find('tbody td').each(function () {
                        var value = $(this).text();
                        var value1 = value * 1000;
                        chartData.push("500");
                    });
                    return chartData;
                },
                // Get heading data from table caption
                chartHeading: function () {
                    var chartHeading = data.find('caption').text();
                    return chartHeading;
                },
                // Get legend data from table body
                chartLegend: function () {
                    var chartLegend = [];
                    // Find th elements in table body - that will tell us what items go in the main legend
                    data.find('tbody th').each(function () {
                        chartLegend.push($(this).text());
                    });
                    return chartLegend;
                },
                // Get highest value for y-axis scale
                chartYMax: function () {
                    var chartData = this.chartData();
                    // Round off the value
                    var chartYMax = Math.ceil(Math.max.apply(Math, chartData) / 1000) * 1000;
                    return chartYMax;
                },
                // Get y-axis data from table cells
                yLegend: function () {
                    var chartYMax = this.chartYMax();
                    var yLegend = [];
                    // Number of divisions on the y-axis
                    var yAxisMarkings = 5;
                    // Add required number of y-axis markings in order from 0 - max
                    for (var i = 0; i < yAxisMarkings; i++) {
                        yLegend.unshift((chartYMax * i) / (yAxisMarkings - 1));
                    }
                    return yLegend;
                },
                // Get x-axis data from table header
                xLegend: function () {
                    var xLegend = [];
                    // Find th elements in table header - that will tell us what items go in the x-axis legend
                    data.find('thead th').each(function () {
                        xLegend.push($(this).text());
                    });
                    return xLegend;
                },
                // Sort data into groups based on number of columns
                columnGroups: function () {
                    var columnGroups = [];
                    // Get number of columns from first row of table body
                    var columns = data.find('tbody tr:eq(0) td').length;
                    for (var i = 0; i < columns; i++) {
                        columnGroups[i] = [];
                        data.find('tbody tr').each(function () {
                            columnGroups[i].push($(this).find('td').eq(i).text());
                        });
                    }
                    return columnGroups;
                }
            }

            // Useful variables for accessing table data        
            chartData = tableData.chartData();
            chartYMax = tableData.chartYMax();
            columnGroups = tableData.columnGroups();

            // Construct the graph

            // Loop through column groups, adding bars as we go
            $.each(columnGroups, function (i) {
                // Create bar group container
                var barGroup = $('<div class="bar-group"></div>');
                // Add bars inside each column
                for (var j = 0, k = columnGroups[i].length; j < k; j++) {
                    // Create bar object to store properties (label, height, code etc.) and add it to array
                    // Set the height later in displayGraph() to allow for left-to-right sequential display
                    var barObj = {};
                    barObj.label = this[j];
                    barObj.height = Math.floor(barObj.label / chartYMax * 100) + '%';
                    barObj.bar = $('<div class="bar fig2"><span>' + barObj.label + '</span></div>')
                        .appendTo(barGroup);
                    bars.push(barObj);
                }
                // Add bar groups to graph
                barGroup.appendTo(barContainer);
            });

            // Add heading to graph
            var chartHeading = tableData.chartHeading();
            var heading = $('<h4>' + chartHeading + '</h4>');
            heading.appendTo(figureContainer);

            // Add legend to graph
            var chartLegend = tableData.chartLegend();
            var legendList = $('<ul class="legend"></ul>');
            $.each(chartLegend, function (i) {
                var listItem = $('<li><span class="icon fig2"></span>' + this + '</li>')
                    .appendTo(legendList);
            });
            legendList.appendTo(figureContainer);

            // Add x-axis to graph
            var xLegend = tableData.xLegend();
            var xAxisList = $('<ul class="x-axis"></ul>');
            $.each(xLegend, function (i) {
                var listItem = $('<li><span>' + this + '</span></li>')
                    .appendTo(xAxisList);
            });
            xAxisList.appendTo(graphContainer);

            // Add y-axis to graph  
            var yLegend = tableData.yLegend();
            var yAxisList = $('<ul class="y-axis"></ul>');
            $.each(yLegend, function (i) {
                var listItem = $('<li><span>' + this + '</span></li>')
                    .appendTo(yAxisList);
            });
            yAxisList.appendTo(graphContainer);

            // Add bars to graph
            barContainer.appendTo(graphContainer);

            // Add graph to graph container     
            graphContainer.appendTo(figureContainer);

            // Add graph container to main container
            figureContainer.appendTo(container);

            // Set individual height of bars
            function displayGraph(bars, i) {
                // Changed the way we loop because of issues with $.each not resetting properly
                if (i < bars.length) {
                    // Animate height using jQuery animate() function
                    $(bars[i].bar).animate({
                        height: bars[i].height
                    }, 800);
                    // Wait the specified time then run the displayGraph() function again for the next bar
                    barTimer = setTimeout(function () {
                        i++;
                        displayGraph(bars, i);
                    }, 100);
                }
            }

            // Reset graph settings and prepare for display
            function resetGraph() {
                // Stop all animations and set bar height to 0
                $.each(bars, function (i) {
                    $(bars[i].bar).stop().css('height', 0);
                });

                // Clear timers
                clearTimeout(barTimer);
                clearTimeout(graphTimer);

                // Restart timer        
                graphTimer = setTimeout(function () {
                    displayGraph(bars, 0);
                }, 200);
            }

            // Helper functions

            // Call resetGraph() when button is clicked to start graph over
            $('#reset-graph-button').click(function () {
                resetGraph();
                return false;
            });

            // Finally, display graph via reset function
            resetGraph();
        }

    </script>
</body>
</html>
