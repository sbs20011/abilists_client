<#import "/apps/admin/layout/abilistsAdminLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box" style="margin-top: 15px;">
<div class="row">
	<div class="col-md-8">
		<h3>
			<ol class="breadcrumb-std">
			  <li><a href="/admin/"><@spring.message "dashboard.title.home"/></a></li>
			  <li><a href="/admin/works/sltProjectsList"><@spring.message "admin.menu.projects"/></a></li>
			  <li class="active"><@spring.message "admin.menu.projects.tech.list"/></li>
			</ol>
		</h3>
	</div>
	<div class="col-md-4">
	</div>
</div>
</div>

<div class="row">
	<div class="col-md-12">

		<#include "/apps/common/errorMessage.ftl"/>
		<#include "/apps/common/abilistsSuccess.ftl"/>

	<#if model.userProjects??>
		<div class="caption mittle-size-title"><h4><@spring.message "admin.menu.projects"/></h4></div>
		<div class="item-box">

			<table id="t01" class="table-line-break">
			<tr>
				<td><@spring.message "projects.title.name"/></td>
				<td>${model.userProjects.upName?if_exists}</td>
				<td><@spring.message "projects.title.team.number"/></td>
				<td></td>
			</tr>
			<tr>
				<td><@spring.message "projects.title.industy"/></td>
				<td>
					<#if commonBean??>
					<#if commonBean.mIndustryMapList?has_content>
						<#if commonBean.mIndustryMapList["${lang?if_exists}"]??>
						<#list commonBean.mIndustryMapList["${lang?if_exists}"] as mIndustry>
						<#if model.userProjects.upCodeIndustry??>
							<#if model.userProjects.upCodeIndustry == "${mIndustry.miImgCode?if_exists}">
							${mIndustry.miLargeCategory?if_exists}
							</#if>
						</#if>
						</#list>
						</#if>
					</#if>
					</#if>
				</td>
				<td><@spring.message "projects.title.role"/></td>
				<td>
				    <#if commonBean??>
				    <#if commonBean.mRoleList?has_content>
				    <#list commonBean.mRoleList as mRole>
				    	<#if model.userProjects.upCodeRole == "${mRole.mrCode?if_exists}">
				    		${mRole.mrName?if_exists}
				    	</#if>
				    </#list>
				    </#if>
				    </#if>
				</td>
			</tr>
			<tr>
				<td><@spring.message "projects.title.explain"/></td>
				<td colspan="3" class="line-break">
					${model.userProjects.upExplain?if_exists}
				</td>
			</tr>
			</table>

		</div>
	</#if>

		<div class="caption mittle-size-title">
			<div class="row">
				<div class="col-md-4">
					<h4><@spring.message "admin.menu.projects.tech.list"/></h4>
				</div>
				<div class="col-md-8">
					<#if model.userProjects??>
					<span id="newToggleSkillsId" class="glyphicon glyphicon-chevron-down add-symbol" style="color:#337ab7;" aria-hidden="true" onClick="newFormSkills();"></span>
					<#else>
					<form id="searchForm" style="margin: 3px 10px 3px 0px;" action="srhForProjectTech" method="post" onkeydown="return captureReturnKey(event)">
				    <div id="search0" class="input-group">
						<select class="form-control" id="srhColumnId" name="srhColumn" style="width: 30%;background-color: #eeeeee;" onchange="changeItemBg(this, 'uProjectTechId')">
							<option value="userId"><@spring.message "user.title.id"/></option>
						    <option value="uptKind"><@spring.message "tech.title.kind"/></option>
					    </select>
					    <input name="srhContents" type="text" class="form-control" style="width: 70%;"
					    	value="" autocomplete="off" autocorrect="off" autocapitilize="off"
					    		data-toggle="popover" data-trigger="manual" data-placement="top" 
					    			title="Popover title" data-content="Default popover"
					    				placeholder="Search for Name" onkeydown="interverKeystroke(event, 0, 'srhForProjectTechAjax','projectTech' ,this, 'srhColumnId');">
					    <span class="input-group-btn">
					      <button class="btn btn-default" style="height: 34px;" type="submit">
					      	<i class="glyphicon glyphicon-search" style="top: 1px;"></i>
					      </button>
					    </span>
				    </div><!-- /input-group -->
				    </form>
					</#if>
				</div>
			</div>
		</div>

		<#-- TODO:Have to change this logic, change localStorage-->
		<div class="item-box" id="newMdataFormId" style="display: none;">
			<form name="newFormId" class="form-horizontal" action="${configBean.baseURL?if_exists}/admin/works/istProjectTech" method="post" onkeypress="return captureReturnKey(event);">
				<table id="newFormId" style="width:100%">
				<tr>
					<td width="12%"><@spring.message "profile.menu.techs"/></td>
					<td>
						<select class="taForm" name="uptKind" onchange="changeUtKindSelect(skillsList, 0)">
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
					<td width="12%"><@spring.message "profile.menu.skills"/></td>
					<td>
						<select class="taForm" name="mtNo" onchange="changeUtLevelSelect(0)">
						</select>
					</td>
					<td width="12%"><@spring.message "profile.table.proficiency.title"/></td>
					<td>
						<select class="taForm" name="uptLevel" style="width: 100%;">
						</select>
					</td>
				</tr>
				<tr>
					<td width="12%"><@spring.message "profile.table.addition.title"/></td>
					<td colspan="5"><textarea class="taForm"  name="uptDetail" placeholder="Detail" rows="1"></textarea></td>
				</tr>
				<input type="hidden" name="cnt" value="0" id="cnt01" autocomplete="off" />
				<input type="hidden" name="upNo" value="<#if model??><#if model.userProjects??>${model.userProjects.upNo?if_exists}</#if></#if>"/>
				<input type="hidden" name="uptNo" />
				</table>

				<br/>
				<p align="center">
					<button type="button" onclick="return confirmData('newFormId', skillsList);" class="btn btn-primary" data-toggle="modal">
						<@spring.message "tech.button.confirm"/>
					</button>
					<button class="btn btn-primary" type="button" onClick="newFormSkillsCancel();">
						<@spring.message "tech.button.cancel"/>
					</button>
				</p>
			</form>
		</div>

		<div class="item-box" id="updateMdataFormId" style="background-color: #f7f5ff; display: none;">
		<form name="updateForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/admin/works/udtProjectTech" method="post" onkeypress="return captureReturnKey(event);">
			<table id="updateFormId" style="width:100%">
			<tr>
				<td width="12%"><@spring.message "profile.menu.techs"/></td>
				<td>
					<select id="uptKindId" name="uptKind" class="taForm" onchange="changeUtKindSelect(skillsList, 1)">
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
				<td width="12%"><@spring.message "profile.menu.skills"/></td>
				<td>
					<select id="mtNoId" name="mtNo" class="taForm" onchange="changeUtLevelSelect(1)">
					</select>
				</td>
				<td width="12%"><@spring.message "profile.table.proficiency.title"/></td>
				<td>
					<select id="uptLevelId" name="uptLevel" class="taForm">
					</select>
				</td>
			</tr>
			<tr>
				<td width="12%"><@spring.message "profile.table.addition.title"/></td>
				<td colspan="5">
					<textarea class="taForm" id="uptDetailId" name="uptDetail" placeholder="Detail" rows="1"></textarea>
				</td>
			</tr>
			<input type="hidden" name="cnt" value="0" id="cnt01" autocomplete="off" />
			<input type="hidden" name="upNo" value="<#if model.userProjects??>${model.userProjects.upNo?if_exists}</#if>"/>
			<input type="hidden" id="uptNoId" name="uptNo" />
			</table>
			<br/>
			<p align="center">
				<button type="button" onclick="return confirmData('updateFormId', skillsList);" class="btn btn-primary" data-toggle="modal">
					<@spring.message "tech.button.confirm"/>
				</button>
				<button class="btn btn-primary" type="button" onClick="updateFormCancel();">
					<@spring.message "tech.button.cancel"/>
				</button>
				<button type="button" class="btn btn-danger" style="width: 80px;" onclick="javascript: removeProjectTech();">
					<@spring.message "projects.button.delete"/>
				</button>
			</p>
		</form>
		</div>

		<div id="uProjectTechId">
			<ul class="item-box ul-table ul-thead">
				<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">#</li>
				<li class="li-cell" style="width: 10%;"><@spring.message "projects.title.avatar"/></li>
				<li class="li-cell" style="border-width: 0px 1px 0px 1px; background-color:#eeeeee;"><@spring.message "projects.title.userid"/></li>
				<li class="li-cell"><@spring.message "tech.title.kind"/></li>
				<li class="li-cell"><@spring.message "tech.title.tech"/></li>
				<li class="li-cell"><@spring.message "tech.title.level"/></li>
				<li class="li-cell"><@spring.message "tech.title.update"/></li>
			</ul>
			<#if model??>
			<#if model.userProjectTechList?has_content>
			<#list model.userProjectTechList as userProjectTech>
				<ul class="bgrow nthrow item-box ul-table" onmouseover="overChangeColor(this);" onmouseout="outChangeColor(this);"
						onclick="selectUserProjectTech(this, '${userProjectTech.uptNo?if_exists}', '${userProjectTech.mtNo?if_exists}', '${userProjectTech.userId?if_exists}', skillsList);">
								
					<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">${userProjectTech.uptNo?if_exists}</li>
					<li class="li-cell" style="width: 10%;"><img width="32px" alt="image" src="${userProjectTech.userImgAvatar?if_exists}"></li>
					<li class="li-cell" style="border-width: 0px 1px 0px 1px; background-color:#eeeeee;">${userProjectTech.userId?if_exists}</li>
					<li class="li-cell">${userProjectTech.uptKind?if_exists}</li>
					<li class="li-cell">
						<#if commonBean??>
						<#if commonBean.getMtechMap("tech")?has_content>
							<#list commonBean.getMtechMap("tech")[userProjectTech.uptKind] as tech>
								<#if tech.mtNo == userProjectTech.mtNo>
									${tech.mtName?if_exists}
								</#if>
							</#list>
						</#if>
						</#if>
					</li>					
					<li class="li-cell">
						<#if commonBean??>
						<#if commonBean.mTechDetailMap[userProjectTech.mtNo?string]??>
							<#list commonBean.mTechDetailMap[userProjectTech.mtNo?string] as techDetail>
								<#if techDetail.mtdLevel == userProjectTech.uptLevel>
								<#if techDetail.mlCode == lang?if_exists>
									${techDetail.mtdLevelExplain?if_exists}
								</#if>
								</#if>
							</#list>
						</#if>
						</#if>
					</li>
					<li class="li-cell">${userProjectTech.updateTime?string('yyyy/MM/dd')?if_exists}</li>
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
<div class="modal fade" id="sbtFormUserProjectTech" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">
        	<span aria-hidden="true">&times;</span>
        	<span class="sr-only"><@spring.message "projects.button.close"/></span>
        </button>
        <h4 class="modal-title" id="udtProjectTechTileId"><@spring.message "tech.title.input"/></h4>
      </div>

		<div id="confirmMessage" class="modal-body">
			<table id="t03" style="width:100%">
				<tr>
					<td width="12%"><@spring.message "tech.title.skills"/></td>
					<td></td>
					<td width="12%"><@spring.message "tech.title.skills"/></td>
					<td></td>
					<td width="12%"><@spring.message "tech.title.level"/></td>
					<td></td>
				</tr>
				<tr>
					<td width="12%"><@spring.message "tech.title.detail"/></td>
					<td colspan="5"></td>
				</tr>
			</table>
		</div>

      <div class="modal-footer">
      	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="deleteTr('t03');">
      		<@spring.message "tech.button.close"/>
      	</button>
        <button id="submitForm" type="button" class="btn btn-primary" onclick="javascript: submitUdtFormProjectTech();">
        	<@spring.message "tech.button.save"/>
        </button>
      </div>
    </div>
  </div>
</div>


<!-- Delete Modal -->
<div class="modal fade" id="sbtFormDeleteProjectTech" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="modal-title" id="dltProjectTechTileId"><@spring.message "projects.title.modal"/></h4>
    </div>

    <div id="confirmMessage" class="modal-body">
    	<@spring.message "projects.confirm.message.delete"/>
    </div>

    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
      <button id="submitForm" type="button" class="btn btn-danger" onclick="javascript: submitDeleteFormProjectTech();">
      	  <@spring.message "projects.button.delete"/>
      </button>
    </div>
  </div>
</div>
</div>


<#include "/apps/common/abilistsAdminLoadJs.ftl"/>
<#include "js/sltProjectTechListJs.ftl"/>

</@layout.myLayout>