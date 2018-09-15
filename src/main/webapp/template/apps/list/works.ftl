<#import "/apps/layout/abilistsListLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box">
	<div class="row">
		<div class="col-md-6" style="float:left;">
			<nav class="breadcrumbs">
			<ul>
			<li><a href="#"><@spring.message "profile.menu.list"/></a></li>
			<li class="active"><a href="#"><@spring.message "navi.title.works"/></a></li>
			</ul>
			</nav>
		</div>
		<div class="col-md-6">
			<span id="newToggleId" class="glyphicon glyphicon-chevron-down add-symbol" style="color:#337ab7;" aria-hidden="true" onClick="newFormToggle();"></span>
		</div>
	</div>
</div>

<#include "/apps/common/abilistsSuccess.ftl"/>

<div class="item-box" id="srhFormUserList" style="display: none;">

	<form name="newForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/list/srhForUserWorks" method="post" onkeypress="return captureReturnKey(event);">
		<table id="newFormId" style="width:100%">
		<tr>
			<td width="10%">Project Name</td>
			<td>
				<input class="form-input" style="width:100%" name="userId" />
			</td>
			<td width="10%">Task Name</td>
			<td>
				<input class="form-input" type="text" name="userName" />
			</td>
		</tr>
		<tr>
			<td><@spring.message "profile.list.search.industry"/></td>
			<td>
			<select class="taForm" name="upCodeIndustry">
				<option value="0"><@spring.message "projects.title.industy"/></option>
				<#if commonBean??>
				<#if commonBean.mIndustryMapList?has_content>
					<#if commonBean.mIndustryMapList["${lang?if_exists}"]??>
					<#list commonBean.mIndustryMapList["${lang?if_exists}"] as mIndustry>
						<option value="${mIndustry.miNo?if_exists}">${mIndustry.miLargeCategory?if_exists}</option>
					</#list>
					</#if>
				</#if>
				</#if>
			</select>
			</td>
			<td>Task Date</td>
			<td>
				<input class="form-input" style="width:100%" name="utkWorkDay" />
			</td>
		</tr>
		<tr>
			<td><@spring.message "profile.list.search.skills"/></td>
			<td>
			<select id="usKindId" name="usKind" class="taForm">
			<option value="0"><@spring.message "tech.select.default.tech"/></option>
			<#if commonBean??>
			<#if commonBean.getMtechMap("tech")?has_content>
				<#list commonBean.getMtechMap("tech")?keys as key>
				<option value="${key?if_exists}">${key?if_exists}</option>
				</#list>
			</#if>
			</#if>
			</select>
			</td>
			<td>Memo</td>
			<td>
				<input class="form-input" style="width:100%" name="umMemo" />
			</td>
		</tr>
		</table>

		<br/>
		<p align="center">
			<button type="submit" class="btn btn-primary" data-toggle="modal"><@spring.message "profile.list.search.title"/></button>
			<button class="btn btn-primary" type="button" onClick="newFormCancel();"><@spring.message "projects.button.cancel"/></button>
		</p>
	</form>
</div>



<#if model.userProjectsList?? && model.userProjectsList?has_content>

	<div class="caption mittle-size-title middle-works-bg">
		<h4><@spring.message "profile.list.search.result.works"/></h4>
	</div>
	<div style="margin-bottom: 20px;">
	<#list model.userProjectsList as userProjects>
		<#if userProjects_index % 2 == 0>
			<div class="row">
		</#if>

			<#if userProjects_index % 2 == 0>
				<div class="col-md-6" style="padding-right: 1px;">
			<#else>
				<div class="col-md-6" style="padding-left: 1px;">
			</#if>
				  	<div class="item-box bgrow" style="margin-bottom:2px;padding: 5px 5px 5px 5px;" onmouseover="overChangeColor(this);" onmouseout="outChangeColor(this);" onClick="window.location.href='${configBean.baseURL?if_exists}/works/${userProjects.userId?if_exists}';">
						<div class="media">
							<div class="media-left">
								<a href="${configBean.baseURL?if_exists}/works/${userProjects.userId?if_exists}">
									<div class="media-object text-center">
										<img width="64px" alt="image" src="${userProjects.userImgData?if_exists}">
									</div>
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">${userProjects.upName?if_exists} <small>${userProjects.updateTime?string('yyyy/MM/dd')?if_exists}</small></h4>
								
								<#if userProjects.upExplain??>
									<#if 100 < userProjects.upExplain?length >
									${userProjects.upExplain?if_exists[0..100]}...
									<#else>
									${userProjects.upExplain?if_exists}
									</#if>
							  	</#if>

							</div>
						</div>
					</div>
				</div>

			<#if userProjects?is_last>
				</div><!-- // row 1 -->
			<#else>
				<#if userProjects_index % 2 == 1>
					</div><!-- // row 2 -->
				</#if>
			</#if>

	</#list>
	</div><!-- //3 row -->
</#if>


<#if model.userSkillsList?? && model.userSkillsList?has_content>
	<div class="caption mittle-size-title">
		<h4><@spring.message "profile.list.search.result.skills"/></h4>
	</div>
	<div style="margin-bottom: 20px;">
	<#list model.userSkillsList as userSkills>
		<#if userSkills?index % 2 == 0>
			<div class="row">
		</#if>
			<#if userSkills_index % 2 == 0>
				<div class="col-md-6" style="padding-right: 1px;">
			<#else>
				<div class="col-md-6" style="padding-left: 1px;">
			</#if>
				  	<div class="item-box bgrow" style="margin-bottom:2px;padding: 5px 5px 5px 5px;" onmouseover="overChangeColor(this);" onmouseout="outChangeColor(this);" onClick="window.location.href='${configBean.baseURL?if_exists}/works/${userSkills.userId?if_exists}/skills';">
						<div class="media">
							<div class="media-left">
								<a href="${configBean.baseURL?if_exists}/works/${userSkills.userId?if_exists}/skills">
									<div class="media-object text-center">
										<img width="64px" alt="image" src="${userSkills.userImgData?if_exists}">
									</div>
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">${userSkills.userId?if_exists}<small>${userSkills.updateTime?string('yyyy/MM/dd')?if_exists}</small></h4>
								${userSkills.usKind?if_exists} : 
								<#if userSkills.usDetail??>
									<#if 100 < userSkills.usDetail?length >
									${userSkills.usDetail?if_exists[0..100]}...
									<#else>
									${userSkills.usDetail?if_exists}
									</#if>
							  	</#if>
							</div>
						</div>
					</div>
				</div><!-- //col-md-6 -->

		<#if userSkills?is_last>
			</div><!-- // row 1 -->
		<#else>
			<#if userSkills_index % 2 == 1>
				</div><!-- // row 2 -->
			</#if>
		</#if>
		
	</#list>
	</div>
</#if>

<#include "/apps/common/abilistsLoadJs.ftl"/>
<#include "js/worksJs.ftl"/>

</@layout.myLayout>