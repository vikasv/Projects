<%@ Page Language="C#" AutoEventWireup="true" CodeFile="moviehomepage.aspx.cs" Inherits="project_moviehomepage" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My ECOMMERCE SITE</title>
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
<script
	src="${pageContext.request.contextPath}/resources/webDesign/js/customerHome.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/webDesign/js/jquery.mask.min.js"></script>

<!-- StyleSheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/webDesign/css/customerHome.css">
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
				<a class="navbar-brand" href="${pageContext.request.contextPath}"><img
					id="brandImg" style="width: 35px; height: 35px;"
					src="http://interspire-developers.com/wp-content/uploads/2011/08/interspire_solutions.png"
					alt=""><font face="MyCustomFont" size="6">MageCart</font></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">


				<ul class="nav navbar-nav navbar-right">
					<li id="signInDropDown" class="dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown">Login<b
							class="caret"></b></a>
						<ul class="dropdown-menu" style="padding: 15px; min-width: 250px;">
							<li>
								<div class="row">
									<div class="col-md-12">
										<form class="signInForm" name="signInForm" id="signInForm">
											<div class="form-group">
												<label class="sr-only" for="username">User Name </label> <input
													type="text" name="username" class="form-control"
													id="username" placeholder="User Name" required>
											</div>
											<div class="form-group">
												<label class="sr-only" for="password">Password</label> <input
													type="password" name="password" class="form-control"
													id="password" placeholder="Password" required>
											</div>
											<div class="form-group">
												<button id="signInButton" type="submit"
													class="btn btn-success btn-block">Sign in</button>
											</div>
										</form>
									</div>
								</div>
							</li>
							<li class="divider"></li>
							<li><input class="btn btn-primary btn-block" type="button"
								id="sign-in-google" value="Sign In with Google"> <input
								class="btn btn-primary btn-block" type="button"
								id="sign-in-twitter" value="Sign In with Twitter"></li>
						</ul></li>
					<li id="signUpButton"><a href="#" data-toggle="modal"
						data-target=".bs-example-modal-lg">Signup</a></li>

					<li id="loggedInDropDown" class="dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						id="loggedInDropDownName">${customer.customerfirstname}<b
							class="caret"></b></a>
						<ul class="dropdown-menu" style="padding: 15px; min-width: 250px;">
							<li><strong>Logged In: </strong>${customer.customerfirstname}</li>
							<li class="divider"></li>
							<li><a href="logout.htm"><input
									class="btn btn-primary btn-block" type="button" id="logout"
									value="Logout"></a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">24x7 Support <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#"><strong>Mail: </strong>sujithg9@gmail.com</a></li>
							<li class="divider"></li>
							<li><a href="#"><b>Address:</b> 75, Peterborough St,<br />
									Boston, MA, USA </a></li>
						</ul></li>
				</ul>

				<div align="right">
					<form name=searchForm id="searchForm" class="navbar-form">
						<div id="formGroup" class="form-group" style="display: inline;">
							<div class="input-group">
								<input id="searchKey" name="searchKey" type="text"
									class="typeahead" placeholder="Search Products"> <span
									class="input-group-addon"> <i
									class="glyphicon glyphicon-search"></i>
								</span>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
    </body>
    </html>
