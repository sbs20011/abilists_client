<#import "/spring.ftl" as spring/>
	<ul class="nav nav-tabs nav-top" role="tablist">
		<li <#if model.menu??><#if model.menu == "profile">class="active"</#if></#if>><a href="${configBean.baseURL?if_exists}/list/profile"><@spring.message "navi.title.profile"/></a></li>
		<li <#if model.menu??><#if model.menu == "works">class="active"</#if></#if>><a href="${configBean.baseURL?if_exists}/list/works"><@spring.message "navi.title.works"/></a></li>
	</ul>