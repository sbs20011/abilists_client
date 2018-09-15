<#import "/apps/layout/abilistsWorksLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<link rel="stylesheet" href="${configBean.contextPath?if_exists}/static/apps/css/works/projects.css?20180207">
<style>
ul.body-posts-menu {
	left:-20px;
	min-width: 110px;
}
</style>

<div class="item-box">
	<div class="row">
		<div class="col-md-6" style="float:left;">
			<nav class="breadcrumbs">
			<ul>
			<li><a href="#">${model.users.userId?if_exists}</a></li>
			<li><a href="/works"><@spring.message "navi.title.works"/></a></li>
			<li class="active"><a href="#"><@spring.message "path.abilists.projects"/></a></li>
			</ul>
			</nav>
		</div>
		<div class="col-md-6">
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-2 right-col-cus sideImg">
		<div class="item-box">
			<img style="border-radius: 4px;" src="${model.users.userImgData?if_exists}" id="showImg" width="125" alt="your picture" />
	    </div>
	</div>
	<div class="col-sm-10">
		<div class="item-box">
			<canvas id="myTechBar" height="125px"/>
		</div>
	</div>
</div>

<div class="row">
  <div class="col-md-12">
  	<div class="caption mittle-size-title middle-works-bg">
  		<h4>
  			<@spring.message "navi.title.projects"/>
  			<span id="newToggleId" class="glyphicon glyphicon-chevron-down right-symbol-button" style="color:#337ab7;" aria-hidden="true" onClick="newFormToggle();"></span>
  		</h4>
  	</div>

	<#include "/apps/common/errorMessageNoButton.ftl"/>
	<#include "/apps/common/abilistsSuccess.ftl"/>

	<div class="item-box" id="udtMdataFormId" style="background-color: #f7f5ff; display: none;">
		<form id="updateForm" name="updateForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/works/udtProjects" method="post" onkeypress="return captureReturnKey(event);">

		  <div class="row">
			<div class="col-sm-4 col-md-4">		
				<@spring.message "projects.title.name"/>
				<input class="form-input taForm-disable" id="upNameId" type="text" name="upName" disabled/>
				<@spring.message "projects.title.team.number"/>
				<select id="upMembersId" class="taForm taForm-disable" name="upMembers" disabled>
					<option value="0"><@spring.message "projects.title.team.number"/></option>
					<option value="1">1</option>
					<option value="3">2-3</option>
					<option value="7">4-7</option>
					<option value="12">8-12</option>
					<option value="18">13-18</option>
					<option value="25">19-25</option>
					<option value="30">26-30</option>
					<option value="40">31-40</option>
					<option value="50"><@spring.message "projects.select.option1"/></option>
				</select>
				<@spring.message "projects.title.role"/>
				<select id="upCodeRoleId" class="taForm taForm-disable" name="upCodeRole" disabled>
					<option value="0"><@spring.message "projects.title.role"/></option>
				    <#if commonBean??>
				    <#if commonBean.mRoleMap?has_content>
					    <#if commonBean.mRoleMap["${lang?if_exists}"]??>
					    <#list commonBean.mRoleMap["${lang?if_exists}"] as mRole>
					    	<option value="${mRole.mrCode?if_exists}">${mRole.mrName?if_exists}</option>
					    </#list>
					    </#if>
				    </#if>
				    </#if>
				</select>
			    <@spring.message "projects.title.industy"/>
				<select id="upCodeIndustryId" class="taForm taForm-disable" name="upCodeIndustry" disabled>
					<option value="0"><@spring.message "projects.title.industy"/></option>
					<#if commonBean??>
					<#if commonBean.mIndustryMapList?has_content>
						<#if commonBean.mIndustryMapList["${lang?if_exists}"]??>
						<#list commonBean.mIndustryMapList["${lang?if_exists}"] as mIndustry>
							<option value="${mIndustry.miImgCode?if_exists}">${mIndustry.miLargeCategory?if_exists}</option>
						</#list>
						</#if>
					</#if>
					</#if>
				</select>
			    <@spring.message "file.title.projects"/>
			    <input id="filesId" class="taForm-disable" type="file" name="file" disabled/>
			</div>
			<div class="col-sm-8 col-md-8">
				<@spring.message "projects.title.explain"/>
				<textarea id="upExplainId" class="taForm taForm-disable" name="upExplain" style="height:180px;" placeholder="explian" disabled></textarea>
			    <@spring.message "file.title.projects"/>
			    <div id="projectsFileId"> 
			    </div>
			</div>
		  </div>
		  <input type="hidden" id="upNoId" name="upNo" />
		  <input type="hidden" id="tokenId" name="token" />
		  <br/>
		  <p align="center">
			<button class="btn btn-primary" type="button" onClick="updateFormCancel();"><@spring.message "projects.button.cancel"/></button>
			<a id="projectTechId" href="#" class="btn btn-success" style="width: 90px;" role="button" ><@spring.message "projects.button.tech.input"/></a>
		  </p>

		</form>
	</div>

	<div id="userProjectsId">

	    <#if model??>
	    <#if model.userProjectsFilesList?has_content>
	    <#list model.userProjectsFilesList as userProjectsFiles>	

		<div class="item-box item-bar bgrow ui-sortable-handle" 
			onmouseover="overChangeColor(this);" onmouseout="outChangeColor(this);" onclick="sltUserProjects(this, '${model.users.userId?if_exists}', '${userProjectsFiles.upNo?if_exists}');">
			<div class="contents">
			  	<ul style="list-style-type: none;width: 100%;display: table;padding-left: 0px; padding-right: 5px;margin-bottom: 0px;">
			  		<li class="header" style="width:75%;">
			  			<h4 class="media-heading"># ${userProjectsFiles.upName?if_exists}</h4>
			  		</li>
			  		<li class="header" style="width:10%;">
					<#if commonBean??>
					<#if commonBean.mIndustryMapList?has_content>
						<#if commonBean.mIndustryMapList["${lang?if_exists}"]??>
						<#list commonBean.mIndustryMapList["${lang?if_exists}"] as mIndustry>
							<#if userProjectsFiles.upCodeIndustry??>
							<#if userProjectsFiles.upCodeIndustry == "${mIndustry.miImgCode?if_exists}">
							${mIndustry.miLargeCategory?if_exists}
							</#if>
							</#if>
						</#list>
						</#if>
					</#if>
					</#if>
				  	</li>
				  	<li class="header" style="width:10%;">
						<#if commonBean??>
					    <#if commonBean.mRoleMap?has_content>
					    <#if commonBean.mRoleMap["${lang?if_exists}"]??>
					    <#list commonBean.mRoleMap["${lang?if_exists}"] as mRole>
							<#if userProjectsFiles.upCodeRole??>
				    		<#if userProjectsFiles.upCodeRole == "${mRole.mrCode?if_exists}">
				    			${mRole.mrName?if_exists}
				    		</#if>
				    		</#if>
					    </#list>
					    </#if>
					    </#if>
					    </#if>
				  	</li>
				  	<li class="header" style="width:5%;">
				  		<small>${userProjectsFiles.updateTime?string('yyyy/MM/dd')?if_exists}</small>
				  	</li>
				</ul>

				<#if userProjectsFiles.upExplain??>
			     	<#if 180 < userProjectsFiles.upExplain?length >
					${userProjectsFiles.upExplain?if_exists[0..180]}...
					<#else>
					${userProjectsFiles.upExplain?if_exists}
					</#if>
				</#if>
			</div>
			<div class="percent" style="float: right;">
				<#if userProjectsFiles.subUserFilesList??>
	    		<#if userProjectsFiles.subUserFilesList?has_content>
	    		<#list userProjectsFiles.subUserFilesList as subUserFiles>
	    			<#if subUserFiles.ufNum??>
					 	<img src="${configBean.baseURL?if_exists}/static/apps/img/files/file_${subUserFiles.ufName?split(".")[1]}.svg" alt="" height="64" width="64">
					</#if>
				</#list>
				</#if>
				</#if>
			</div>
			<input type="hidden" name="utNo" value="14">
		</div>

		</#list>
		</#if>
		</#if>

	</div>
	<br/>
    <nav class="text-center">
	    <ul class="pagination">
	    <#if model?exists>
      	<#if model.paging?exists>
			<#if model.paging.prevPage?exists>
			<li><a href="sltProjectsList?nowPage=${model.paging.prevPage.nowPage}&allCount=${model.paging.allCount?c}" title="Prev" accesskey="*">Prev</span></a></li>
			</#if>
			<#if model.paging.pagingInfoList?has_content>
				<#list model.paging.pagingInfoList as pageList>
					<#if model.paging.nowPage?if_exists == pageList.pageNumber?if_exists>
					<li class="active"><a href="#">${pageList.pageNumber} <span class="sr-only">(current)</span></a></li>
					<#else>
					<li><a href="sltProjectsList?nowPage=${pageList.pageNumber}&allCount=${model.paging.allCount?c}">${pageList.pageNumber}</a></li>
					</#if>
				</#list>
			</#if>
			<#if model.paging.nextPage?exists>
			<li><a href="sltProjectsList?nowPage=${model.paging.nextPage.nowPage}&allCount=${model.paging.allCount?c}" accesskey="#" title="Next">Next</a></li>
			</#if>
		</#if>
		</#if>
      	</ul>
    </nav><!-- end #nav -->

  </div><!-- col-md-12 -->
</div><!-- row -->

<#include "/apps/common/abilistsWorksLoadJs.ftl"/>
<#include "js/viewProjectsListJs.ftl"/>
<#include "js/uploadFileJs.ftl"/>

</@layout.myLayout>