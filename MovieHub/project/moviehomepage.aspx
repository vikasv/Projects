<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Movies</title>
    <link rel="icon" type="image/png"
        href="${pageContext.request.contextPath}/resources/images/logofinal.ico" />
    <!-- JQuery Libraries -->
    <link rel="stylesheet"
        href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" type="text/css"
        href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />
    <script type="text/javascript"
        src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript"
        src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script type="text/javascript"
        src="//cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.9.3/typeahead.min.js"></script>

    <!-- Bootstrap CDNs -->
    <link rel="stylesheet"
        href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link rel="stylesheet"
        href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css">
    <script
        src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script
        src="http://cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
    <!-- JavaScript File -->
    <script src="javascript/homePageSearch.js"></script>
    <script src="javascript/search.js"></script>
    <script src="javascript/footer.js"></script>


    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script runat="server">
    
        public void RequestRSSItem(string rssURL)
        {
            System.Net.WebRequest myRequest = System.Net.WebRequest.Create(rssURL);
            System.Net.WebResponse myResponse = myRequest.GetResponse();

            System.IO.Stream rssStream = myResponse.GetResponseStream();
            System.Xml.XmlDocument rssDoc = new System.Xml.XmlDocument();
            rssDoc.Load(rssStream);

            System.Xml.XmlNodeList rssItems = rssDoc.SelectNodes("rss/channel/item");

            string title = "";
            string link = "";
            string description = "";

            for (int i = 0; i < rssItems.Count; i++)
            {
                System.Xml.XmlNode rssDetail;

                rssDetail = rssItems.Item(i).SelectSingleNode("title");
                if (rssDetail != null)
                {
                    title = rssDetail.InnerText;
                }
                else
                {
                    title = "";
                }

                rssDetail = rssItems.Item(i).SelectSingleNode("link");
                if (rssDetail != null)
                {
                    link = rssDetail.InnerText;
                }
                else
                {
                    link = "";
                }

                rssDetail = rssItems.Item(i).SelectSingleNode("description");
                if (rssDetail != null)
                {
                    description = rssDetail.InnerText;
                }
                else
                {
                    description = "";
                }

                Response.Write("<p><b><a href='" + link + "' target='new'>" + title + "</a></b><br/>");
                Response.Write(description + "</p>");
            }
        }


    </script>




    <!-- StyleSheet -->
    <link rel="stylesheet" href="css/movieHome.css">
</head>
<body>



    <nav
        class="navbar navbar-default navbar-inverse navbar-fixed-top drop-shadow"
        role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> <span
                        class="icon-bar"></span><span class="icon-bar"></span><span
                            class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="movieHomePage.aspx">
                    <img
                        id="brandImg" style="width: 35px; height: 35px;"
                        src="http://interspire-developers.com/wp-content/uploads/2011/08/interspire_solutions.png"
                        alt=""><font face="MyCustomFont" size="6">MovieHub</font></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse"
                id="bs-example-navbar-collapse-1">

                <ul class="nav navbar-nav">
                    <li class="active"><a href="movieHomePage.aspx">Home</a></li>
                    <li><a href="inTheatres.aspx">In Theatres</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">UpComing <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="comingSoon.aspx">Week Releases</a></li>
                            <li><a href="inFuture.aspx">Future Releases</a></li>
                        </ul>
                    </li>
                    <li><a href="trailers.aspx"> Trailer by Genre </a></li>
                    <li><a href="topCollections.aspx">Top Movies</a></li>
                    
                    <li><a href="../Default.aspx">Course Site</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                        data-toggle="dropdown">24x7 Support <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><strong>Mail: </strong>vellanki.v@husky.neu.edu</a></li>
                            <li class="divider"></li>
                            <li><a href="#"><b>Address:</b> 75 St Alphonsus St,<br />
                                Boston, MA, USA </a></li>
                        </ul>
                    </li>
                </ul>

                <div align="right">
                    <div name="searchForm" id="searchForm" class="navbar-form">
                        <div id="formGroup" class="form-group" style="display: inline;">
                            <div class="input-group">
                                <input id="searchKey" name="searchKey" type="text"
                                    class="typeahead" placeholder="Search Movies">
                                <span
                                    class="input-group-addon"><i id="searchButton"
                                        class="glyphicon glyphicon-search"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>



    <div id="mainContent" class="container-fluid">
        <!-- /.col -->
        <div class="col-md-12">
            <div id="carousel-example-generic" class="carousel slide">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0"
                        class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="5"></li>

                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner curveTop">
                    <div class="item active">
                        <img src="images/Furious-7.jpg" alt="">
                        <div class="carousel-caption">
                            <font color="white" size="5"><b> Furious 7</b></font>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/runallnight.jpg" alt="">
                        <div class="carousel-caption">
                            <font color="white" size="5"><b>Run all night</b></font>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/GOT.jpg" alt="">
                        <div class="carousel-caption">
                            <font color="white" size="5"><b>Game Of Thrones</b></font>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/interstellar.jpg" alt="">
                        <div class="carousel-caption">
                            <font color="white" size="5"><b>Interstellar</b></font>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/avengers1.jpg" alt="">
                        <div class="carousel-caption">
                            <font color="white" size="5"><b>Avengers-2</b></font>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/insurgent.jpg" alt="">
                        <div class="carousel-caption">
                            <font color="white" size="5"><b>Insurgent</b></font>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="panel panel-default">
                <div class="panel-heading"><b>WEBSITE INFORMATION</b></div>
                <div class="panel-body">
                    <b>In Theatres:</b>
                    <p>
                        Explore to see the movies currently running in the theaters.
                                       Browse to know better about the movies.Click on image to read the detailed synopsis,
                                       starring and ratings of the movies and shows accurate data about movies.
                    </p>
                    <b>Trending Movies:</b>
                    <p>
                        What's the most trending movie?See the rankings 
                                        based on the collections of the movies running in theatres right now!!
                    </p>
                    <b>Coming Soon:</b>
                    <br />

                    <b>Weekend Releases:</b>
                    <p>
                        Hurry Up!Gear up for the weekend.Browse through this tab 
                                        to get a list of movies which are going to open in theatres on the weekend  and pre-book your tickets.
                    </p>
                    <b>Upcoming Releases:</b>
                    <p>
                        Coming Soon!!! Explore to see the details of the yet to be released movies.
                                             Find out when they are coming.
                    </p>

                    <b>Search:</b>
                    <p>
                        Your favaorite movie is just a click away!! Search for any of your favourite movies in the Rotten Tomatoes 
                                        database and get all the information regarding it in a single click.
                    </p>
                    <b>Trailers:</b>
                    <p>
                        Lets see how many latest movies trailers you've seen out of 
                                         all the trailers based on genres. Do check this list for good trailers! Start watching and have fun. 
                    </p>
                    <b>Site Home: </b>
                    <p>Get back to Vikas's course site. </p>
                
                </div>

            </div>
        </div>
        <div id="newsFeed" class="col-md-4">

            <div class="panel panel-default">
                <div class="panel-heading"><b>Latest Movie News</b></div>
                <div id="movieFeed">
                    <form id="form1" runat="server">

                        <%
                            string rssURL = "http://rss.feedsportal.com/c/592/f/7507/index.rss";
                            RequestRSSItem(rssURL);            
                        %>
                    </form>
                </div>
            </div>

        </div>

    </div>

    <div id="searchResults" class="container-fluid">
    </div>
    <nav class="navbar navbar-default navbar-fixed-bottom  drop-shadow">
        <div class="navbar-inner">
            <div id="footertext" class="container-fluid">
                <p class="navbar-text pull-right">
                    &copy; Copyright 2015 <b>Vikas Vellanki</b>
                </p>
            </div>
        </div>
    </nav>


</body>
</html>
