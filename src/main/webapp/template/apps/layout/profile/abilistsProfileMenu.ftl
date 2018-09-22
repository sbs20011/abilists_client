<#import "/spring.ftl" as spring/>
	<ul class="nav nav-tabs nav-top" role="tablist">
		<li <#if model.menu??><#if model.menu == "overview">class="active"</#if></#if>><a href="${configBean.baseURL?if_exists}/profile/<#if model.users??>${model.users.userId?if_exists}</#if>"><@spring.message "profile.menu.overview"/></a></li>
		<li <#if model.menu??><#if model.menu == "skills">class="active"</#if></#if>><a href="${configBean.baseURL?if_exists}/profile/<#if model.users??>${model.users.userId?if_exists}/skills</#if>"><@spring.message "profile.menu.skills"/></a></li>
		<li <#if model.menu??><#if model.menu == "career">class="active"</#if></#if>><a href="${configBean.baseURL?if_exists}/profile/<#if model.users??>${model.users.userId?if_exists}/career</#if>"><@spring.message "profile.menu.career"/></a></li>
	</ul>