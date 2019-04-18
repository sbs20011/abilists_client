<#import "/client/layout/abilistsClientLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<link rel="stylesheet" href="${configBean.contextPath?if_exists}/static/apps/css/home/home.css?2017102207">
<link rel="stylesheet" href="${configBean.contextPath?if_exists}/static/apps/css/home/social.css?20170827">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

img.border-line {
	border-style: solid;
	border-width: 1px 1px 1px 1px;
	border-color: #eeeeee;	
}
.download-title { 
	position: absolute; 
	top: 7%; 
	left: 40%;; 
	width: 50%; 
}
</style>

	<div class="row" style="margin-top: 65px;">
		<div class="col-md-2 right-col-cus sideImg">
			<div class="item-box">
				<img style="border-radius: 4px;" src="${myImgAvatar?if_exists}" id="showImg" width="125" alt="your picture" />
		    </div>
		</div>
		<div class="col-sm-10 left-col-cus">
			<div class="item-box">
				<a href="http://www.abilists.com/" target="_blank">
					<img style="border: 0.5px solid #dadada; box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.1);" src="/static/apps/img/abilists/adBanner01.png?2019010101" width="100%" height="125px" alt="www.abilists.com">
		    	    <div class="download-title" style="color: #4363a2;">
						<h2>Platform for Experts</h2>
						<p style="color: #5a5a5a;">Abilists is a talent management system that grasps the current technology and growth trends from an objective point of view.</p>
					</div>
				</a>
			</div>
		</div>
	</div>

	<div class="row fw-row" style="background-color: white;">
		<div class="col-md-8">
			<img class="border-line" src="static/client/img/client03.png?201808290841"  width="100%" alt="profile">
		</div>
		<div class="col-md-4 text-center">
			<h3>You can add your menu and page, you also can develop your business page.</h3>
		</div>
	</div>

	<div class="row fw-row" style="padding: 35px;">
		<div class="col-md-12 text-center">
			<h3>What Makes Our Abilists Service the Best Choice for You?</h3>
			<h4>With Abilists, you get your great service what you want exactly. It doesn't matter how experienced you are. We support you prefer to have page built for you, Try to request to Abilists. With Abilists, you get the tool package, including Abilists basic service, reliable service qulities, top security, and the best way for your business.</h4>
			<br/>
			<h3><a href="http://www.abilists.com/home/request/">Make an enquire</a></h3>
		</div>
	</div>

	<div class="row fw-row" style="background-color: white;">
		<div class="col-md-8">
			<img class="border-line" src="static/client/img/client01.png?201808290841"  width="100%" alt="profile">
		</div>
		<div class="col-md-4">
			<h3>You have your style <b>charts</b> or you can use the default charts.</h3>
		</div>
	</div>

	<div class="row fw-row">
		<div class="col-md-12  text-center">
			<h3>Spechially Client Service</h3>
			<h4>You’ll love how fast you can get your extra service based on Abilists service. Answer a few simple questions and Abilists will design a stunning page with our dedicated Support Team.</h4>
			<br/>
			<h3><a href="http://www.abilists.com/home/request/">Make an enquire</a></h3>
		</div>
	</div>

	<div class="row fw-row" style="background-color: white;">
		<div class="col-md-8">
			<img class="border-line" src="static/client/img/client02.png?201808290841"  width="100%" alt="profile">
		</div>
		<div class="col-md-4">
			<h3>You have your special <b>desgin</b> or you can use the default design.</h3>
		</div>
	</div>

	<div class="row fw-row">
		<div class="col-md-12  text-center">
			<h3>How to create your extra page</h3>
			<h3>Don't hesitate, <a href="http://www.abilists.com/home/request/">Just make an enquire.</a></h3>
		</div>
	</div>

	<!-- Placed at the end of the document so the pages load faster -->
    <script src="${configBean.contextPath?if_exists}/static/apps/lib/jquery/2.1.4/jquery.min.js"></script>
    <script src="${configBean.contextPath?if_exists}/static/apps/lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">

</script>

</@layout.myLayout>