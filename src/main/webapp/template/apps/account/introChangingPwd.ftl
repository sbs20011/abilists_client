<#import "/apps/layout/account/abilistsAccountLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="row">
  <div class="col-md-12">

		<#include "/apps/common/abilistsSuccess.ftl"/>

		<div class="row">
		  <div class="col-sm-3 right-col-cus">
		  	<div class="item-box">
		  	  <#include "sidebar.ftl"/>
		  	</div>
		  </div>

		  <div class="col-sm-9 left-col-cus">

		    <div class="item-box">
		  	  <form id="contact_form" class="form-horizontal" action="udtChangingPwd" method="post" style="padding: 15px;">
		  	  	<#include "/apps/common/errorMessageNoButton.ftl"/>
		  	  	<div class="form-group">
		  			<label class="col-sm-3 control-label"><@spring.message "password.current.password"/></label>  
		  			<div class="col-sm-9">
		  				<div class="input-group">
		  					<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
		  					<input id="currentPwdId" class="form-control" type="password" name="currentPwd" autocomplete="off" 
		  						placeholder="Current password">
	  					</div>
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
	        </div>

			<div class="item-box">
			  You can change your password.
			</div>

		  </div><!-- /col-md-8-->
		</div><!-- /row -->

    </div><!-- /col-md-12-->
</div> <!-- /row -->

<#include "/apps/common/abilistsLoadJs.ftl"/>
<script src="${configBean.contextPath?if_exists}/static/apps/js/validatePassword.js"></script>

<#include "js/introChangingPwdJs.ftl"/>
<#include "js/uploadImageAvatarJs.ftl"/>

</@layout.myLayout>