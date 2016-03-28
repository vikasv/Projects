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


    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script src="javascript/trailers.js"></script>
    <link rel="stylesheet" href="css/movieHome.css">

    <link rel="stylesheet" href="css/trailers.css" />
    <script src="javascript/footer.js"></script>
    

    <!-- StyleSheet -->
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
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="movieHomePage.aspx"><img
					id="brandImg" style="width: 35px; height: 35px;"
					src="http://interspire-developers.com/wp-content/uploads/2011/08/interspire_solutions.png"
					alt=""><font face="MyCustomFont" size="6">MovieHub</font></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">

                <ul class="nav navbar-nav">
              <li ><a href="movieHomePage.aspx">Home</a></li>
              <li><a href="inTheatres.aspx">In Theatres</a></li>
              
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> UpComing <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="comingSoon.aspx">Week Releases</a></li>
                  <li><a href="inFuture.aspx">Future Releases</a></li>
                </ul>
              </li>
              <li class="active"><a href="trailers.aspx">  Trailer by Genre</a></li>
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
						</ul></li>
				</ul>

				<div align="right">
					<div name=searchForm id="searchForm" class="navbar-form">
						<div id="formGroup" class="form-group" style="display: inline;">
							<div class="input-group">
								<input id="searchKey" name="searchKey" type="text"
									class="typeahead" placeholder="Search Movies"> <span
									class="input-group-addon"> <i id="searchButton"
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
        <div id="main-wrapper">
            <div class="content-holder">

                <div class="banner-pic-pannel">
                    <div id="main-videotabs">

                        <div class="col-md-12">
                            <div class="col-md-3" >
                                <div class="span3 bs-docs-sidebar " >
                                    <ul class="nav nav-tabs nav-stacked" style="border-bottom-color:#ddd">
                                        <li class="active v-tabs chest"><a href="#"><i class="icon-chevron-right"></i>ROMANTIC </a></li>
                                        <li class="active v-tabs back"><a href="#"><i class="icon-chevron-right"></i>ACTION </a></li>
                                        <li class="active v-tabs" id="abs"><a href="#"><i class="icon-chevron-right"></i>COMEDY </a></li>
                                        <li class="active v-tabs shoulder"><a href="#"><i class="icon-chevron-right"></i>HORROR </a></li>
                                        <li class="active v-tabs" id="biceps"><a href="#"><i class="icon-chevron-right"></i>SCIENCE FICTION </a></li>
                                        <li class="active v-tabs" id="triceps"><a href="#"><i class="icon-chevron-right"></i>SPORTS </a></li>
                                        <li class="active v-tabs legs"><a href="#"><i class="icon-chevron-right"></i>ANIMATED </a></li>
                                        <li class="active v-tabs" id="calves"><a href="#"><i class="icon-chevron-right" ></i>MYSTERY </a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-9">

                                <div id="spinner" class="spinner" style="display: none">
                                </div>

                                <div class="populate-video" id="pop-video-id"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clear"></div>

            </div>
        </div>

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
