<#import "/client/layout/abilistsClientLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<link href="${configBean.contextPath?if_exists}/static/apps/css/home/social.css?20170825" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

@media (min-width: 1024px) { 
	.container { 
		width: 1024px !important;
	}
	.right-col-cus {
		padding-right: -5px;
	}
	.left-col-cus {
		padding-left: -5px;
	}
}

.one {
	// margin: 0 auto;
	max-width:100%;
    background: url("${configBean.contextPath?if_exists}/static/apps/img/bg03.png?20180101") center center;
    background-size: cover;
    -moz-background-size: cover;
}

.two {
	margin: 0 auto;
	width: 100%;
	max-width:100%;
    background: url("${configBean.contextPath?if_exists}/static/apps/img/home01.png?20180101");
    background-size: cover;
    -moz-background-size: cover;
}

.three {
	margin: 0 auto;
	width: 100%;
	max-width:100%;
    background: url("${configBean.contextPath?if_exists}/static/img/home02.png?20180101");
    background-size: cover;
    -moz-background-size: cover;
}

.slider-size {
	height: 400px; /* This is your slider height */
	width: 100%;
}

.carousel {
	width:100%; 
	margin:0 auto; /* center your carousel if other than 100% */ 
}

#myCarousel .slider-size {
    height: 300px; //This is your slider height
    width: 100%;
}

div.transbox {
	padding-left: 5px;
	padding-right: 5px;
	z-index: 1;
	position: absolute;
	top: 100px;
	left: 100px;
	background-color: rgba(31, 182, 249, 0.52);
	color: white;
	font: bold 24px/45px Helvetica, Sans-Serif; 
}

.first-word {
	color: white;
	font: bold 24px/45px Helvetica, Sans-Serif; 
}

div.transbox p {
	margin: 1%;
	font-size: 20px;
	color: #000000;
}

.carousel-img { 
	position: relative; 
	width: 100%; /* for IE 6 */
}

.title-img { 
	position: absolute; 
	top: 100px; 
	left: 150px; 
	width: 100%; 
}

h2 span { 
	color: #ff6600; 
	font: bold 24px/45px Helvetica, Sans-Serif; 
	letter-spacing: -1px;  
	background: rgb(0, 0, 0); /* fallback color */
	background: rgba(0, 0, 0, 0.7);
	padding: 10px; 
	left: 150px;
}

.bgIndex {
    background: url('${configBean.contextPath?if_exists}/static/img/bgIndex.jpg?20180101') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    background-size: cover;
    -o-background-size: cover;

	margin-left: 0;
	margin-right: 0;
	overflow: hidden;
}

.fw-row {
    margin-left: 0;
    margin-right: 0;
    overflow: hidden;
	background-color: #eee;
	padding: 50px;
}

/* Only index */
.navbar {
    margin-bottom: 10px;
}

</style>

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->
	  <ol class="carousel-indicators">
	    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	    <li data-target="#myCarousel" data-slide-to="1"></li>
	    <li data-target="#myCarousel" data-slide-to="2"></li>
	  </ol>

	  <!-- Wrapper for slides -->
	  <div class="carousel-inner" role="listbox">

	    <div class="item one active">
		    <div class="transbox">
		    	<a href="/home/download">
					<h3 class="first-word">Try it Free</h3>
				</a>
	  	    </div>
	    	<div class="slider-size">
				<div class="carousel-caption">
					<h3></h3>
				</div>
			</div>
	    </div>
	    <div class="item two">
	    	<h2 class="title-img"><span>How is your career</span></h2>
	    	<div class="slider-size">
				<div class="carousel-caption">
					<h3></h3>
				</div>
			</div>
	    </div>
	    <div class="item three">
	    	<h2 class="title-img"><span>How is your skills</span></h2>
	    	<div class="slider-size">
				<div class="carousel-caption">
					<h3></h3>
				</div>
			</div>
	    </div>
	  </div>

	  <!-- Controls -->
	  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>

    <div class="row fw-row" style="background-color: white;">
	    <div class="col-md-8">
		    <h2><@spring.message "index.heading.title1"/></h2>
		    <p style="font-size: 120%;"><@spring.message "index.heading.body1"/></p>
	    </div>
	    <div class="col-md-4 text-center">
	    	<h1 style="font-size: 300%; padding-top: 20px;"><span class="glyphicon glyphicon-list"></span></h1>
		</div>
	</div>

    <div class="row fw-row">
		<div class="col-md-4 text-center">
			<h1 style="font-size: 300%; padding-top: 20px;"><span class="glyphicon glyphicon-stats"></span></h1>
        </div>
        <div class="col-md-8">
	        <h2><@spring.message "index.heading.title2"/></h2>
	        <p style="font-size: 120%;"><@spring.message "index.heading.body2"/></p>
      	</div>
    </div>

    <div class="row bgIndex">
		<div class="col-md-12">
    		<br/>
    		<br/>
    		<h2><span class="text-center">We take care of your careers.</span></h2><br/>
    		<br/>
    		<br/>
	    </div>
    </div>

    <div class="row fw-row" style="background-color: white;">
	    <div class="col-md-8"> 
		    <h2><@spring.message "index.heading.title3"/></h2>
		    <p style="font-size: 120%;"><@spring.message "index.heading.body3"/></p>
	    </div>
	    <div class="col-md-4 text-center">
			<h1 style="font-size: 300%; padding-top: 20px;"><span class="glyphicon glyphicon-refresh"></span></h1>
		</div>
	</div>

	<div class="row fw-row"> 
	  <div class="col-md-4 text-center">  
	  	<h1 style="font-size: 300%; padding-top: 30px;"><span class="glyphicon glyphicon-tags"></span></h1>
	  </div>
	  <div class="col-md-8">
		  <h2><@spring.message "index.heading.title3"/></h2>
		  <p style="font-size: 120%;"> Try to maintence your abilities in IT</p>
	  </div>
	</div>
	<br/>
	<div class="social">
		<a href="/home/request/" class="social__button mail"><i class="fa fa-envelope-o"></i></a>
		<a href="https://twitter.com/abilists" class="social__button facebook"><i class="fa fa-twitter"></i></a>
		<a href="#" class="social__button linkedin"><i class="fa fa-linkedin"></i></a>
		<a href="https://github.com/minziappa" class="social__button github"><i class="fa fa-github"></i></a>
	</div>

    <script src="${configBean.contextPath?if_exists}/static/lib/jquery/2.1.1/jquery.min.js"></script>
	<script src="${configBean.contextPath?if_exists}/static/lib/jquery-ui-1.12.1/jquery-ui.js"></script>
    <script src="${configBean.contextPath?if_exists}/static/lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>

    <script>
    $(document).ready(function(){
        $("#myCarousel").carousel({
            interval : 20000,
            pause: false
        });
    });
    </script>

</@layout.myLayout>