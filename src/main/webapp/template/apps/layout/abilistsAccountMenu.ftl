<#import "/spring.ftl" as spring/>
	<ul class="nav nav-tabs nav-top" role="tablist">
		<li <#if model??><#if model.menu??><#if model.menu == "settings">class="active"</#if></#if></#if>><a href="${configBean.baseURL?if_exists}/account/"><@spring.message "account.menu.settings"/></a></li>
	</ul>