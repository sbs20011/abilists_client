<#import "/apps/layout/abilistsProfileLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box">
	<nav class="breadcrumbs">
		<ul>
		<li><a href="#">${model.users.userId?if_exists}</a></li>
		<li><a href="${configBean.baseURL?if_exists}/profile"><@spring.message "navi.title.profile"/></a></li>
		<li class="active"><a href="#"><@spring.message "profile.menu.career"/></a></li>
		</ul>
	</nav>
</div>

<div class="row">
	<div class="col-sm-3 right-col-cus sideImg">
<#include "/apps/common/abilistsProfile.ftl"/>
	</div>
	<div class="col-sm-9 left-col-cus">
		<div class="caption mittle-size-title">
		<h4>Summary</h4>
		</div>
		<div class="item-box" style="height: 260px; overflow-x: hidden; overflow: auto;">
			${model.users.userSummary?if_exists}
		</div>
	</div>

</div>

<div id="skills" class="caption mittle-size-title">
	<h4> Experience</h4>
</div>

<div class="row">
  <div class="col-md-12">

	<#include "/apps/common/errorMessageNoButton.ftl"/>

	<div id="careerId">
	<#if model??>
    <#if model.userCareerList?has_content>
    	<#list model.userCareerList as userCareer>
    	<div id="compayId${userCareer?index}" class="item-box" style="margin-bottom: 1px;">
      	<h4>
    		${userCareer.ucStartYear?if_exists}/${userCareer.ucStartMonth?if_exists} ~ ${userCareer.ucEndYear?if_exists}/${userCareer.ucEndMonth?if_exists} 
    		${userCareer.ucCompanyName?if_exists}
    	</h4>
		<div class="media">
			<div class="media-left">
				<div class="media-object text-center" style="width:64px; height:64px;">
					<h1 style="font-size: 300%;">
						<span class="glyphicon ${userCareer.ucCodeIndustry?if_exists}"></span>
					</h1>
				</div>
			</div>
			<div class="media-body">
				<h4 class="media-heading">${userCareer.ucTitle?if_exists}</h4>
				${userCareer.ucContents?if_exists}
			</div>
		</div>
		</div>
		</#list>
	</#if>
	</#if>
	</div>

  </div><!-- col-md-12 -->
</div><!-- row -->

<#include "/apps/common/abilistsProfileLoadJs.ftl"/>
<#include "js/viewCareerJs.ftl"/>

</@layout.myLayout>