<%@ Page Language="C#" AutoEventWireup="true" CodeFile="homepage.aspx.cs" Inherits="project_homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'/>
		<meta charset="utf-8"/>
		
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
       <title>VIKAS Home Page</title>
        
</head>
<body>
    <div class="page-wrap">
    
	
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

<div class="wrap">

<div class="sliderCurve">
<ul class="slides">
    <input type="radio" name="radio-btn" id="img-1" checked />
    <li class="slide-container">
		<div class="slide">
			<img src="images/fitnessclub1.jpg"/>
        </div>
		<div class="nav">
			<label for="img-6" class="prev">&#x2039;</label>
			<label for="img-2" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-2" />
    <li class="slide-container">
        <div class="slide">
          <img src="images/fitnessclub5.jpg" />
        </div>
		<div class="nav">
			<label for="img-1" class="prev">&#x2039;</label>
			<label for="img-3" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-3" />
    <li class="slide-container">
        <div class="slide">
          <img src="images/fitnessclub4.jpg" />
        </div>
		<div class="nav">
			<label for="img-2" class="prev">&#x2039;</label>
			<label for="img-4" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-4" />
    <li class="slide-container">
        <div class="slide">
          <img src="images/fitnessclub2.jpg" />
        </div>
		<div class="nav">
			<label for="img-3" class="prev">&#x2039;</label>
			<label for="img-5" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-5" />
    <li class="slide-container">
        <div class="slide">
          <img src="images/fitnessclub3.jpg" />
        </div>
		<div class="nav">
			<label for="img-4" class="prev">&#x2039;</label>
			<label for="img-6" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-6" />
    <li class="slide-container">
        <div class="slide">
          <img src="http://farm9.staticflickr.com/8195/8098750703_797e102da2_z.jpg" />
        </div>
		<div class="nav">
			<label for="img-5" class="prev">&#x2039;</label>
			<label for="img-1" class="next">&#x203a;</label>
		</div>
    </li>

    <li class="nav-dots">
      <label for="img-1" class="nav-dot" id="img-dot-1"></label>
      <label for="img-2" class="nav-dot" id="img-dot-2"></label>
      <label for="img-3" class="nav-dot" id="img-dot-3"></label>
      <label for="img-4" class="nav-dot" id="img-dot-4"></label>
      <label for="img-5" class="nav-dot" id="img-dot-5"></label>
      <label for="img-6" class="nav-dot" id="img-dot-6"></label>
    </li>
</ul>
</div>
<div class="new1">
<div class="bmiDesc"> 
</div>
<div class="bmiApp">
<div class="bmi-finder-panel">

                    <div class="bmi-head">  

                        <h1 style="font-size:20px;color:white;padding-top:10px;margin-bottom:10px"> Find your BMI here </h1>
                    </div>
                    <div class="bmi-container">

                        <form name="form" id="form1" runat="server">
                            <input id="age" type="text" class="bmi-fields" placeholder="Age" name="age" /><br />
                            <div class="error" id="age-null-error">AGE CANNOT BE NULL</div>
                            <input id="height" type="text" class="bmi-fields" placeholder="Height (in Centimeters)" name="height" /><br />
                            <div class="error" id="height-null-error">HEIGHT CANNOT BE NULL</div>
                            <input id="weight" type="text" class="bmi-fields" placeholder="Weight (in Kilos)" name="weight" /><br />
                            <div class="error" id="weight-null-error">WEIGHT CANNOT BE NULL</div>
                            <input id="calculate" type="button" value="CALCULATE" onclick="compute_bmi()" /><br />
                            <div class="res">
                            <div class="bmi-text" id="result">RESULT</div>
                            <div class="res-val" id="result-value">00.00</div>
                            </div>
                            <hr />
                            <div class="bmi-report">
                                <div id="unit1" class="bmi-text">Very severely underweight</div>
                                <div class="report-val" id="val1">< 15</div>
                                <br />
                                <div id="unit2" class="bmi-text">Severely underweight</div>
                                <div class="report-val" id="val2">15.0 - 16.0</div>
                                <br />
                                <div id="unit3" class="bmi-text">Underweight</div>
                                <div class="report-val" id="val3">16.0 - 18.5</div>
                                <br />
                                <div id="unit4" class="bmi-text">Normal (healthy weight)</div>
                                <div class="report-val" id="val4">18.5 - 25</div>
                                <br />
                                <div id="unit5" class="bmi-text">Overweight</div>
                                <div class="report-val" id="val5">25 - 30</div>
                                <br />
                                <div id="unit6" class="bmi-text">Obese Class I (Moderately obese)</div>
                                <div class="report-val" id="val6">30 - 35</div>
                                <br />
                                <div id="unit7" class="bmi-text">Obese Class II (Severely obese)</div>
                                <div class="report-val" id="val7">35 - 40</div>
                                <br />
                                <div id="unit8" class="bmi-text">Obese Class III (Very severely obese)</div>
                                <div class="report-val" id="val8">> 40</div>
                                <br />
                            </div>
                            <hr />
                        </form>
                    </div>
                    
                    <div class="clear hide"></div>
                </div>
            </div>
</div>
</div>
</div>

</body>
</html>
