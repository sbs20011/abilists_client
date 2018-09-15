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
			<canvas id="myProjectsBar" height="125px"/>
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

	<div class="item-box" id="newMdataFormId" style="display: none;">
	  <form id="newFormId" name="newForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/works/istProjects" method="post" onkeypress="return captureReturnKey(event);"> 
		<div class="row">
			<div class="col-sm-4 col-md-4">		
				<@spring.message "projects.title.name"/>
				<input class="form-input" type="text" name="upName" />
				<@spring.message "projects.title.team.number"/>
				<select class="taForm" name="upMembers">
					<option value="0"><@spring.message "projects.title.team.number"/></option>
					<option value="1">1</option>
					<option value="3">2-3</option>
					<option value="7">4-7</option>
					<option value="12">8-12</option>
					<option value="18">13-18</option>
					<option value="25">19-25</option>
					<option value="30">26-30</option>
					<option value="40">31-40</option>
					<option value="50">more than 41</option>
				</select>
				<@spring.message "projects.title.role"/>
				<select class="taForm" name="upCodeRole">
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
				<select class="taForm" name="upCodeIndustry">
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
			</div>
			<div class="col-sm-8 col-md-8">
				<@spring.message "projects.title.explain"/>
				<textarea class="taForm" name="upExplain" style="height:180px;" placeholder="explian" rows="2"></textarea>
			</div>
		</div>
		<input type="hidden" name="token" value="<#if model??>${model.token?if_exists}</#if>" />
		<br/>
		<p align="center">
			<button type="button" onclick="return confirmData('newFormId');" class="btn btn-primary" data-toggle="modal"><@spring.message "projects.button.confirm"/></button>
			<button class="btn btn-primary" type="button" onClick="newFormCancel();"><@spring.message "projects.button.cancel"/></button>
		</p>
	  </form>
	</div>

	<div class="item-box" id="udtMdataFormId" style="background-color: #f7f5ff; display: none;">
		<form id="updateForm" name="updateForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/works/udtProjects" method="post" onkeypress="return captureReturnKey(event);">

		  <div class="row">
			<div class="col-sm-4 col-md-4">		
				<@spring.message "projects.title.name"/>
				<input class="form-input" id="upNameId" type="text" name="upName"/>
				<@spring.message "projects.title.team.number"/>
				<select id="upMembersId" class="taForm" name="upMembers">
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
				<select id="upCodeRoleId" class="taForm" name="upCodeRole">
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
				<select id="upCodeIndustryId" class="taForm" name="upCodeIndustry">
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
			    <input id="filesId" type="file" name="file"/>
			</div>
			<div class="col-sm-8 col-md-8">
				<@spring.message "projects.title.explain"/>
				<textarea id="upExplainId" class="taForm" name="upExplain" style="height:180px;" placeholder="explian" ></textarea>
			    <@spring.message "file.title.projects"/>
			    <div id="projectsFileId"> 
			    </div>
			</div>
		  </div>
		  <input type="hidden" id="upNoId" name="upNo" />
		  <input type="hidden" id="tokenId" name="token" />
		  <br/>
		  <p align="center">
			<button type="button" onclick="return confirmData('updateForm');" class="btn btn-primary" data-toggle="modal"><@spring.message "projects.button.confirm"/></button>
			<button class="btn btn-primary" type="button" onClick="updateFormCancel();"><@spring.message "projects.button.cancel"/></button>
			<a id="projectTechId" href="#" class="btn btn-success" style="width: 90px;" role="button" ><@spring.message "projects.button.tech.input"/></a>
			<button type="button" class="btn btn-danger" style="width: 80px;" onclick="javascript: removeProject();"><@spring.message "projects.button.delete"/></button>
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
					 	<img src="${configBean.baseURL?if_exists}/static/apps/img/files/file_${subUserFiles.ufExt?if_exists}.svg" alt="" height="64" width="64">
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

<!-- Insert and Update Modal -->
<div class="modal fade" id="submitFormUserProjects" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span>
        	<span class="sr-only"><@spring.message "projects.button.close"/></span>
        </button>
        <h4 class="modal-title" id="myModalLabel"><@spring.message "projects.title.modal"/></h4>
      </div>

      <div id="confirmMessage" class="modal-body">

		<table id="t03" class="table-line-break">
		<tr>
			<td width="20%"><@spring.message "projects.title.name"/></td>
			<td><@spring.message "projects.title.explain"/></td>
		</tr>
		<tr>
			<td></td>
			<td class="line-break" rowspan="7"></td>
		</tr>
		<tr>
			<td><@spring.message "projects.title.team.number"/></td>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td><@spring.message "projects.title.role"/></td>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td><@spring.message "projects.title.industy"/></td>
		</tr>
		<tr>
			<td></td>
		</tr>
		</table>

      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
        <button id="submitForm" type="button" class="btn btn-primary"><@spring.message "projects.button.save"/></button>
      </div>
    </div>
  </div>
</div>

<!-- Delete Modal -->
<div class="modal fade" id="submitFormDeleteProjects" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span>
      	<span class="sr-only">Close</span>
      </button>
      <h4 class="modal-title" id="dltProjectTileId"><@spring.message "projects.title.modal"/></h4>
    </div>

    <div id="confirmMessage" class="modal-body">
    	<@spring.message "projects.confirm.message.delete"/>
    </div>

    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
      <button id="submitForm" type="button" class="btn btn-danger" onclick="javascript: submitDeleteFormProjects();">
      	  <@spring.message "projects.button.delete"/>
      </button>
    </div>
  </div>
</div>
</div>

<#include "/apps/common/abilistsWorksLoadJs.ftl"/>
<#include "js/sltProjectsListJs.ftl"/>
<#include "js/uploadFileJs.ftl"/>

<script type="text/javascript">
<#include "charts/chartProjects.ftl"/>
</script>
</@layout.myLayout>