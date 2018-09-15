		<div class="item-box">
			<img style="border-radius: 4px;" src="${model.users.userImgData?if_exists}" id="showImg" width="210" alt="your picture" />
		    <div style="margin-top: 7px;">
				<span class="glyphicon glyphicon-tags"></span>
				<#if model.users??>${model.users.userProfile?if_exists}</#if>
			</div>
			<hr class="margin-middle">
		    <div>
		    	<span class="glyphicon glyphicon-user"></span>
		    	<#if model.users??>${model.users.userName?if_exists}</#if>
		    </div>
		    <div>
		    	<span class="glyphicon glyphicon-envelope"></span>
		    	<#if model.users??>${model.users.userEmail?if_exists}</#if>
		    </div>
		</div>