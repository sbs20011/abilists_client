<#import "/apps/layout/indexLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>
<script src='https://www.google.com/recaptcha/api.js'></script>

	<div align="center" id="completeId" class="list-group-item list-group-item-danger" style="display: none;">success</div>

    <div class="row fw-row home">
	    <div class="col-md-8">
		    <h2>Reqeust</h2>
		    <form class="form-horizontal" action="${configBean.baseURL?if_exists}/home/emailRequest" method="post">
		    <p style="font-size: 120%;">Email address</p>
		    <p style="font-size: 120%;"><input name="reqEmailAddress" placeholder="Your Email address" class="form-control" type="text" /></p>
		    <p style="font-size: 120%;">Name</p>
		    <p style="font-size: 120%;"><input name="reqName" placeholder="Your Name" class="form-control" type="text" /></p>
		    <p style="font-size: 120%;">Company</p>
		    <p style="font-size: 120%;"><input name="reqCompanyName" placeholder="Your company name" class="form-control" type="text" /></p>
		    <p style="font-size: 120%;">Contents</p>
		    <p style="font-size: 120%;"><textarea name="reqContents" placeholder="Your Contents" class="form-control"></textarea></p>
		    <p style="font-size: 120%;">
		    	<button type="submit" class="btn btn-primary" style="float:right; margin-top:20px;"><span class="glyphicon glyphicon-send"></span> Send </button>
		    </p>
		    </form>
		    <div class="g-recaptcha" style="transform:scale(0.8);-webkit-transform:scale(0.8);transform-origin:0 0;-webkit-transform-origin:0 0;" data-theme="light" data-sitekey="6LdzpRMUAAAAAH9BGMUPohJsZ0FdWfb6UZgLyqi8"></div>
	    </div>
	    <div class="col-md-4 text-center">
	    	<br/>
	    	<br/>
	    	<h1 style="font-size: 300%; padding-top: 20px;"><span class="glyphicon glyphicon-exclamation-sign"></span></h1>
	    	<br/>
	    	<br/>
		</div>
	</div>

<#include "/apps/common/abilistsFooder.ftl"/>
<script src="${configBean.contextPath?if_exists}/static/apps/lib/jquery/2.1.1/jquery.min.js"></script>
<script src="${configBean.contextPath?if_exists}/static/apps/lib/jquery-ui-1.12.1/jquery-ui.js"></script>
<script src="${configBean.contextPath?if_exists}/static/apps/lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>

</@layout.myLayout>