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
	  <#if model??>
	  <#if model.users?has_content>

	  	<form class="form-horizontal" action="${configBean.baseURL?if_exists}/account/udtInfo" method="post" style="padding: 15px;">
	  		<div class="form-group">
	  			<label class="col-sm-3 control-label"><@spring.message "info.user.id"/></label>  
	  			<div class="col-sm-9">
	  				<div class="input-group">
	  					<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	  					<span class="form-control" style="background-color: #ededed;">${model.users.userId?if_exists}</span>
	  				</div>
	  			</div>
	  		</div>
	  		<div class="form-group">
	  			<label class="col-sm-3 control-label"><@spring.message "info.user.auth"/></label>  
	  			<div class="col-sm-9">
	  				<div class="input-group">
	  					<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	  					<span class="form-control" style="background-color: #ededed;">
	  						<#if model.users.userAuth??>
	  							<#if model.users.userAuth == "1">
									<@spring.message "auth.select.user"/>
								<#elseif model.users.userAuth == "2">
									<@spring.message "auth.select.semi.admin"/>
								<#elseif model.users.userAuth == "3">
									<@spring.message "auth.select.super.admin"/>
								<#else>
									
								</#if>
							<#else>
								<@spring.message "auth.select.user"/>
							</#if>
	  					</span>
	  				</div>
	  			</div>
	  		</div>

	  		<div class="form-group">
	        	<label class="col-sm-3 control-label"><@spring.message "info.user.name"/></label>  
	        	<div class="col-sm-9">
	        		<div class="input-group">
		        		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
		        		<input name="userName" placeholder="user name" class="form-control"  type="text" value="${model.users.userName?if_exists}"/>
	        		</div>
		        </div>
		    </div>

		    <div class="form-group">
		    	<label class="col-sm-3 control-label"><@spring.message "info.user.sex"/></label>
		    	<div class="col-sm-9">
	         		<div class="radio">
	         			<label>
	         				<input type="radio" name="userSex" value="1" <#if model.users.userSex??><#if model.users.userSex == "1">checked="checked"</#if></#if>/> <@spring.message "info.user.man"/>
	         			</label>
	         			<label>
	         				<input type="radio" name="userSex" value="2" <#if model.users.userSex??><#if model.users.userSex == "2">checked="checked"</#if></#if>/> <@spring.message "info.user.woman"/>
	         			</label>
	         		</div>
         		</div>
         	</div>

            <div class="form-group">
            	<label class="col-sm-3 control-label"><@spring.message "info.user.ages"/></label>  
            	<div class="col-sm-9">
            		<div class="input-group">
            			<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			            <select class="form-control" name="userAges" style="width: 100%;">
		                <option value="10" <#if model.users.userAges??><#if model.users.userAges == "10">selected</#if></#if>><@spring.message "ages.select.10"/></option>
		                <option value="20" <#if model.users.userAges??><#if model.users.userAges == "20">selected</#if></#if>><@spring.message "ages.select.20"/></option>
		                <option value="30" <#if model.users.userAges??><#if model.users.userAges == "30">selected</#if></#if>><@spring.message "ages.select.30"/></option>
		                <option value="40" <#if model.users.userAges??><#if model.users.userAges == "40">selected</#if></#if>><@spring.message "ages.select.40"/></option>
		                <option value="50" <#if model.users.userAges??><#if model.users.userAges == "50">selected</#if></#if>><@spring.message "ages.select.50"/></option>
		                <option value="60" <#if model.users.userAges??><#if model.users.userAges == "60">selected</#if></#if>><@spring.message "ages.select.60"/></option>
		                </select>
            		</div>
            	</div>
            </div>
            <div class="form-group">
            	<label class="col-sm-3 control-label"><@spring.message "info.user.profile"/></label>
            	<div class="col-sm-9">
            		<div class="input-group">
            			<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
            			<textarea class="form-control" name="userProfile" placeholder="user profile">${model.users.userProfile?if_exists}</textarea>
            		</div>
            	</div>
            </div>
            <div class="form-group">
            	<label class="col-sm-3 control-label"></label>
            	<div class="col-sm-9">
            		<button type="submit" class="btn btn-primary" ><span class="glyphicon glyphicon-send"></span> <@spring.message "info.user.button.update"/></button>
            	</div>
            </div>
            <input type="hidden" name="token" value="<#if model??>${model.token?if_exists}</#if>" />
        </form>
            
        </#if>
        </#if>
        </div><!-- /item-box -->

		<div class="item-box">
			You can change your information.
		</div>

      </div><!-- /col-md-8 -->
	</div><!-- /row -->

  </div><!-- /col-md-12 -->
</div><!-- /row -->

<#include "/apps/common/abilistsLoadJs.ftl"/>
<#include "js/uploadImageAvatarJs.ftl"/>

</@layout.myLayout>