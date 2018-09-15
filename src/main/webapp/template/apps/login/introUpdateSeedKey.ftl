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
		<h2>Set your seed key.</h2>
		<p style="font-size: 120%;"> A seed key is very important.</p>
		<p style="font-size: 120%;"> User's personal data are encrypted by your seed key.</p>
	</div>
	<div class="col-md-4 text-center" style="vertical-align: baseline;">
		<h1 style="font-size: 300%;"><span class="glyphicon glyphicon-tags"></span></h1>
	</div>
</div>

<div class="row fw-row" style="background-color: white;">
	<div class="col-sm-4 text-center" style="vertical-align: baseline; padding-top: 50px;">
		<h1 style="font-size: 300%;"><span class="glyphicon glyphicon-cog"></span></h1>
	</div>

	<div class="col-sm-8">
		<form class="form-horizontal" action="udtSeedKey" method="post" id="contact_form">

		<div class="form-group">	
			<div class="col-sm-3"></div>  
			<div class="col-sm-9">
				<label class="control-label"><#include "/apps/common/errorMessageNoButton.ftl"/></label>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label">Seed Key</label>
			<div class="col-sm-9">
		      <div class="input-group">
		          <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
		          <input id="seedKeyId" name="seedKey" maxlength="16" size="16" type="text" class="form-control" 
						placeholder="New seedKey" autocomplete="off" onkeyup="validateSeedKey(this, 'pwdId1');" >
		      </div>
		      <p id="pwdId1" class="form-control-static" style="display: none;"></p>
		    </div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label">Seed Key for confirm</label>  
			<div class="col-sm-9">
	  		<div class="input-group">
	      		<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	  			<input  id="seedKey2Id" name="seedKey2" maxlength="16" size="16" type="text" class="form-control" 
	  				data-toggle="popover" data-trigger="manual" data-placement="bottom" 
	  					title="seedKeys Do Not Match!" data-content="Please, check new seedKey" onclick="releasPopover(this);"
	  						autocomplete="off" placeholder="For confirmation" onkeyup="validateSeedKey(this, 'pwdId2');">
	  		</div>
	  		<p id="pwdId2" class="form-control-static" style="display: none;"></p>
		  	</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-3 control-label"></label>
			<div class="col-sm-9">
				<button type="submit" class="btn btn-primary" onclick="return validateConfirmeSeedKey();">
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
<script src="${configBean.contextPath?if_exists}/static/apps/js/validateSeedKey.js"></script>

</@layout.myLayout>