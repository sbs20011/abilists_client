<#import "/apps/layout/loginLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<style>
.fw-row {
    margin-left: 0;
    margin-right: 0;
    overflow: hidden;
	background-color: #eee;
	padding: 50px;
}
</style>

<div class="row fw-row"> 
	<div class="col-md-8">  
		<h2>Change the initial password.</h2>
		<p style="font-size: 120%;"> You should change the initial password[admin] for your passowrd.</p>
	</div>
	<div class="col-md-4 text-center" style="vertical-align: baseline;">
		<h1 style="font-size: 300%;"><span class="glyphicon glyphicon-tags"></span></h1>
	</div>
</div>

<div class="row fw-row" style="background-color: white;">
	<div class="col-sm-4 text-center" style="vertical-align: baseline; padding-top: 100px;">
		<h1 style="font-size: 300%;"><span class="glyphicon glyphicon-edit"></span></h1>
	</div>

	<div class="col-sm-8">
		<form class="form-horizontal" action="udtPwd" method="post" id="contact_form">

		<div class="form-group">	
			<div class="col-sm-3"></div>  
			<div class="col-sm-9">
				<label class="control-label"><#include "/apps/common/errorMessageNoButton.ftl"/></label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label"><@spring.message "password.current.password"/></label>  
			<div class="col-sm-9">
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
					<input id="currentPwdId" class="form-control" type="password" name="currentPwd" autocomplete="off" 
						placeholder="Current password">
				</div>
				The initial password is <b>admin</b>
			</div>
		</div>
		<hr/>
		<div class="form-group">
			<label class="col-sm-3 control-label"><@spring.message "password.new.password"/></label>
			<div class="col-sm-9">
		      <div class="input-group">
		          <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
		          <input id="passwordId" name="password" type="password" class="form-control" 
						placeholder="New password" autocomplete="off" onkeyup="validatePassword(this, 'pwdId1');" >
		      </div>
		      <p id="pwdId1" class="form-control-static" style="display: none;"></p>
		    </div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-3 control-label"><@spring.message "password.new.confirm.password"/></label>  
			<div class="col-sm-9">
	  		<div class="input-group">
	      		<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	  			<input  id="password2Id" name="password2" type="password" class="form-control" 
	  				data-toggle="popover" data-trigger="manual" data-placement="bottom" 
	  					title="Passwords Do Not Match!" data-content="Please, check new password" onclick="releasPopover(this);"
	  						autocomplete="off" placeholder="For confirmation" onkeyup="validatePassword(this, 'pwdId2');">
	  		</div>
	  		<p id="pwdId2" class="form-control-static" style="display: none;"></p>
		  	</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-3 control-label"></label>
			<div class="col-sm-9">
				<button type="submit" class="btn btn-primary" onclick="return validateConfirmePassword();">
					<span class="glyphicon glyphicon-send"></span> <@spring.message "password.button.update"/>
						</button>
			</div>
		</div>
		<input type="hidden" name="token" value="<#if model??>${model.token?if_exists}</#if>" />

		</form>
	</div><!-- //col-md-8-->
</div><!-- //row-->

<script src="${configBean.contextPath?if_exists}/static/apps/lib/jquery/2.1.1/jquery.min.js"></script>
<script src="${configBean.contextPath?if_exists}/static/apps/lib/jquery-ui-1.12.1/jquery-ui.js"></script>
<script src="${configBean.contextPath?if_exists}/static/apps/lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>

<!-- To validate password -->
<script src="${configBean.contextPath?if_exists}/static/apps/js/validatePassword.js"></script>

</@layout.myLayout>