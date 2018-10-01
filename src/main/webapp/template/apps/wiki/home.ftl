<#import "/apps/layout/abilistsWikiLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box">
	<div class="row">
		<div class="col-md-6">
			<nav class="breadcrumbs">
			<ul>
			<li><a href="${configBean.baseURL?if_exists}/wiki"><@spring.message "navi.title.wiki"/></a></li>
			<li class="active"><a href="#"><@spring.message "navi.title.wiki.home"/></a></li>
			</ul>
			</nav>
		</div>
		<div class="col-md-6">
			
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-12">

	<#include "/apps/common/errorMessageNoButton.ftl"/>
	<#include "/apps/common/abilistsSuccess.ftl"/>

		<div class="item-box">
			Coming soon
		</div>
	</div>
</div>

</@layout.myLayout>