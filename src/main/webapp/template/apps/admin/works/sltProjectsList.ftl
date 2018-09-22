<#import "/apps/admin/layout/abilistsAdminLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box" style="margin-top: 15px;">
<div class="row">
	<div class="col-md-6">
		<h3>
			<ol class="breadcrumb-std">
			  <li><a href="/admin/"><@spring.message "dashboard.title.home"/></a></li>
			  <li class="active"><@spring.message "admin.menu.projects"/></li>
			</ol>
		</h3>
	</div>
	<div class="col-md-6">
		<span id="newToggleId" class="glyphicon glyphicon-chevron-down add-symbol" style="color:#337ab7;" aria-hidden="true" onClick="newFormToggle();"></span>
	</div>
</div>
</div>

<div class="row">
  <div class="col-md-12">

	<#include "/apps/common/errorMessage.ftl"/>
	<#include "/apps/common/abilistsSuccess.ftl"/>

	<div class="caption mittle-size-title">
		
		<div class="row">
			<div class="col-md-4">
				<h4><@spring.message "admin.menu.projects"/></h4>
			</div>
			<div class="col-md-8">
				<form id="searchForm" style="margin: 3px 10px 3px 0px;" action="srhForProjects" method="post" onkeydown="return captureReturnKey(event)">
			    <div id="search0" class="input-group">
					<select class="form-control" id="srhColumnId" name="srhColumn" style="width: 30%;background-color: #eeeeee;" onchange="changeItemBg(this, 'uProjectsId')">
						<option value="userId"><@spring.message "user.title.id"/></option>
					    <option value="upName"><@spring.message "projects.title.name"/></option>
					    <option value="upMembers"><@spring.message "projects.title.team.number"/></option>
				    </select>
				    <input name="srhContents" type="text" class="form-control" style="width: 70%;"
				    	value="" autocomplete="off" autocorrect="off" autocapitilize="off"
				    		data-toggle="popover" data-trigger="manual" data-placement="top" 
				    			title="Popover title" data-content="Default popover"
				    				placeholder="Search for Name" onkeydown="interverKeystroke(event, 0, 'srhForProjectsAjax','projects' ,this, 'srhColumnId');">
				    <span class="input-group-btn">
				      <button class="btn btn-default" style="height: 34px;" type="submit">
				      	<i class="glyphicon glyphicon-search" style="top: 1px;"></i>
				      </button>
				    </span>
			    </div>
			    </form>
			</div>
		</div>

	</div>

	<div class="item-box" id="newMdataFormId" style="display: none;">
	<form name="newForm" class="form-horizontal" action="istProjects" method="post" onkeypress="return captureReturnKey(event);">
		<table id="newFormId" style="width:100%">
		<tr>
			<td width="12%"><@spring.message "projects.title.name"/></td>
			<td>
				<input class="form-input" type="text" name="upName" />
			</td>
			<td width="12%"><@spring.message "projects.title.team.number"/></td>
			<td width="15%">
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
			</td>
		</tr>
		<tr>
			<td rowspan="2"><@spring.message "projects.title.explain"/></td>
			<td rowspan="2">
				<textarea class="taForm" name="upExplain" placeholder="explian" rows="1"></textarea>
			</td>
			<td><@spring.message "projects.title.role"/></td>
			<td>
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
			</td>
		</tr>
		<tr>
			<td><@spring.message "projects.title.industy"/></td>
			<td>
				<select class="taForm" name="upCodeIndustry">
					<option value="0"><@spring.message "projects.title.industy"/></option>
					<#if commonBean??>
					<#if commonBean.mIndustryMapList?has_content>
						<#if commonBean.mIndustryMapList["${lang?if_exists}"]??>
						<#list commonBean.mIndustryMapList["${lang?if_exists}"] as mIndustry>
							<option value="${mIndustry.miCode?if_exists}">${mIndustry.miLargeCategory?if_exists}</option>
						</#list>
						</#if>
					</#if>
					</#if>
			    </select>
			</td>
		</tr>
		</table>
		<br/>
		<p align="center">
			<button type="button" onclick="return confirmData('newFormId');" class="btn btn-primary" data-toggle="modal">
				<@spring.message "projects.button.confirm"/>
			</button>
			<button class="btn btn-primary" type="button" onClick="newFormCancel();">
				<@spring.message "projects.button.cancel"/>
			</button>
		</p>
	  </form>
	  </div>

	  <div class="item-box" id="updateMdataFormId" style="background-color: #f7f5ff; display: none;">
	  	<form name="updateForm" class="form-horizontal" action="udtProjects" method="post" onkeypress="return captureReturnKey(event);">
			<table id="updateForm" class="table-line-break">
			<tr>
				<td><@spring.message "projects.title.name"/></td>
				<td><input class="form-input" id="upNameId" type="text" name="upName"/></td>
				<td><@spring.message "projects.title.team.number"/></td>
				<td><span id="upMembersId"></span></td>
			</tr>
			<tr>
				<td><@spring.message "projects.title.industy"/></td>
				<td>
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
				</td>
				<td><@spring.message "projects.title.role"/></td>
				<td>
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
				</td>
			</tr>
			<tr>
				<td><@spring.message "projects.title.explain"/></td>
				<td colspan="3" class="line-break">
					<span id="upExplainId"></span>
				</td>
			</tr>
			</table>
			<br/>
			<input type="hidden" id="upNoId" name="upNo" />
			<p align="center">
				<button type="button" onclick="return confirmUpdateData('updateForm');" class="btn btn-primary" data-toggle="modal">
					<@spring.message "projects.button.confirm"/>
				</button>
				<button class="btn btn-primary" type="button" onClick="updateFormCancel();">
					<@spring.message "project.button.close"/>
				</button>
				<a id="projectTechId" href="#" class="btn btn-success" style="width: 90px;" role="button" >
					<@spring.message "projects.button.tech.input"/>
				</a>
				<button type="button" class="btn btn-danger" style="width: 90px;" onclick="javascript: removeProject();">
					<@spring.message "projects.button.delete"/>
				</button>
			</p>
		</form>
	  </div>

	  <div id="uProjectsId">
		<ul class="item-box ul-table ul-thead">
			<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">#</li>
			<li class="li-cell" style="width: 10%;"><@spring.message "projects.title.avatar"/></li>
			<li class="li-cell" style="border-width: 0px 1px 0px 1px; background-color:#eeeeee;"><@spring.message "projects.title.userid"/></li>
			<li class="li-cell"><@spring.message "projects.title.name"/></li>
			<li class="li-cell"><@spring.message "projects.title.industy"/></li>
			<li class="li-cell"><@spring.message "projects.title.team.number"/></li>
			<li class="li-cell"><@spring.message "projects.title.role"/></li>
			<li class="li-cell"><@spring.message "projects.title.update"/></li>
		</ul>
	    <#if model??>
	    <#if model.userProjectsList?has_content>
	    <#list model.userProjectsList as userProjects>
			<ul class="bgrow nthrow item-box ul-table" onmouseover="overChangeColor(this);"  onmouseout="outChangeColor(this);" onclick="selectUserProjects(this, '${userProjects.upNo?if_exists?c}');" >
				<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">${userProjects.upNo?if_exists}</li>
				<li class="li-cell" style="width: 10%;"><img width="32px" alt="image" src="${userProjects.userImgAvatar?if_exists}"></li>
				<li class="li-cell" style="border-width: 0px 1px 0px 1px; background-color:#eeeeee;">${userProjects.userId?if_exists}</li>
				<li class="li-cell">${userProjects.upName?if_exists}</li>
				<li class="li-cell">
					<#if commonBean??>
						<#if commonBean.mIndustryMapList?has_content>
						<#if commonBean.mIndustryMapList["${lang?if_exists}"]??>
						<#list commonBean.mIndustryMapList["${lang?if_exists}"] as mIndustry>
						<#if userProjects.upCodeIndustry??>
							<#if userProjects.upCodeIndustry == "${mIndustry.miImgCode?if_exists}">
							${mIndustry.miLargeCategory?if_exists}
							</#if>
						</#if>
						</#list>
						</#if>
						</#if>
					</#if>
				</li>
				<li class="li-cell">${userProjects.upMembers?if_exists}</li>
				<li class="li-cell">
					<#if commonBean??>
					    <#if commonBean.mRoleMap?has_content>
					    <#if commonBean.mRoleMap["${lang?if_exists}"]??>
					    <#list commonBean.mRoleMap["${lang?if_exists}"] as mRole>
					    	<#if userProjects.upCodeRole??>
				    		<#if userProjects.upCodeRole == "${mRole.mrCode?if_exists}">
				    			${mRole.mrName?if_exists}
				    		</#if>
				    		</#if>
					    </#list>
					    </#if>
					    </#if>
				    </#if>
			    </li>
				<li class="li-cell">${userProjects.updateTime?string('yyyy/MM/dd')?if_exists}</li>
			</ul>
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
			<li><a href="?nowPage=${model.paging.prevPage.nowPage}&allCount=${model.paging.allCount?c}" title="Prev" accesskey="*">Prev</span></a></li>
			</#if>
			<#if model.paging.pagingInfoList?has_content>
				<#list model.paging.pagingInfoList as pageList>
					<#if model.paging.nowPage?if_exists == pageList.pageNumber?if_exists>
					<li class="active"><a href="#">${pageList.pageNumber} <span class="sr-only">(current)</span></a></li>
					<#else>
					<li><a href="?nowPage=${pageList.pageNumber}&allCount=${model.paging.allCount?c}">${pageList.pageNumber}</a></li>
					</#if>
				</#list>
			</#if>
			<#if model.paging.nextPage?exists>
			<li><a href="?nowPage=${model.paging.nextPage.nowPage}&allCount=${model.paging.allCount?c}" accesskey="#" title="Next">Next</a></li>
			</#if>
		</#if>
		</#if>
      	</ul>
      </nav><!-- end #nav -->

	</div><!-- col-md-12 -->
</div><!-- row -->

<!-- Insert And Update Modal -->
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
			<td><@spring.message "projects.title.name"/></td>
			<td></td>
			<td><@spring.message "projects.title.team.number"/></td>
			<td><span id="uptUpMembersId"></span></td>
		</tr>
		<tr>
			<td><@spring.message "projects.title.industy"/></td>
			<td></td>
			<td><@spring.message "projects.title.role"/></td>
			<td></td>
		</tr>
		<tr>
			<td><@spring.message "projects.title.explain"/></td>
			<td colspan="3" class="line-break">
				<span id="uptUpExplainId"></span>
			</td>
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
<div class="modal fade" id="submitFormDeleteProjectId" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="modal-title" id="dltProjectTileId"><@spring.message "projects.title.modal"/></h4>
    </div>

    <div id="confirmMessage" class="modal-body">
    	<@spring.message "projects.confirm.message.delete"/>
    </div>

    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
      <button id="submitForm" type="button" class="btn btn-danger" onclick="javascript: submitFormDeleteProject();">
      	  <@spring.message "projects.button.delete"/>
      </button>
    </div>
  </div>
</div>
</div>

<#include "/apps/common/abilistsAdminLoadJs.ftl"/>
<#include "js/sltProjectsListJs.ftl"/>

</@layout.myLayout>