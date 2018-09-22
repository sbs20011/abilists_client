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
	  	  <form id="contact_form" class="form-horizontal" action="udtChangingEmail" method="post" style="padding: 15px;">
	  	  	<div class="form-group">
	  			<label class="col-sm-3 control-label"><@spring.message "email.current.email"/></label>  
	  			<div class="col-sm-9">
	  				<div class="input-group">
	  					<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
	  					<span class="form-control" style="background-color: #ededed;">${user.userEmail?if_exists}</span>
  					</div>
  				</div>
	  		</div>
	  		<hr/>
	  	  	<div class="form-group">
	  			<label class="col-sm-3 control-label"><@spring.message "email.new.email"/></label>  
	  			<div class="col-sm-9">
	  				<div class="input-group">
	  					<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
	  					<input id="newUserEmailId" type="text" name="newUserEmail" class="form-control" placeholder="new email">
  					</div>
  				</div>
			</div>
	        <div class="form-group">
	        	<label class="col-sm-3 control-label"><@spring.message "email.current.password"/></label>
	        	<div class="col-sm-9">
		            <div class="input-group">
		                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
		                <input id="userPwdId" type="password" name="userPwd" class="form-control" placeholder="password" autocomplete="off" required>
		            </div>
	            </div>
	        </div>

            <div class="form-group">
            	<label class="col-sm-3 control-label"></label>
            	<div class="col-sm-9">
            		<button type="submit" class="btn btn-primary" onclick="return validateEmail();"><span class="glyphicon glyphicon-send"></span> <@spring.message "email.button.update"/></button>
            	</div>
            </div>
            <input type="hidden" name="token" value="<#if model??>${model.token?if_exists}</#if>" />
	      </form>

		</div><!-- /item-box-->

		<div class="item-box">
			You can change your email address.
		</div>

	  </div><!-- /col-sm-8 -->
	</div><!-- /row-->

  </div> <!-- /col-md-12 -->
</div><!-- /row -->

<#include "/apps/common/abilistsLoadJs.ftl"/>
<#include "js/introChangingEmailJs.ftl"/>
<#include "js/uploadImageAvatarJs.ftl"/>

</@layout.myLayout>