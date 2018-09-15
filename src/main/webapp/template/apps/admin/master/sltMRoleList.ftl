<#import "/apps/admin/layout/abilistsAdminLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box" style="margin-top: 15px;">
<div class="row">
	<div class="col-md-8">
	  <h3>
		<ol class="breadcrumb-std">
		  <li><a href="/admin/"><@spring.message "dashboard.title.home"/></a></li>
		  <li class="active"><@spring.message "admin.menu.mrole"/></li>
		</ol>
	  </h3>
	</div>
	<div class="col-md-4">
		<form name="sltForm" action="sltMRoleList" method="post">
		<select class="horizon-align" name="mlCode" onchange="return sltDataList(this);">
		<#if model.sltMRolePara??>
			<option value="" <#if model.sltMRolePara.mlCode?has_content><#if model.sltMRolePara.mlCode == "all">selected</#if></#if>><@spring.message "admin.button.all"/></option>
			<option value="en" <#if model.sltMRolePara.mlCode?has_content><#if model.sltMRolePara.mlCode == "en">selected</#if></#if>><@spring.message "admin.button.english"/></option>
			<option value="ko" <#if model.sltMRolePara.mlCode?has_content><#if model.sltMRolePara.mlCode == "ko">selected</#if></#if>><@spring.message "admin.button.korea"/></option>
			<option value="ja" <#if model.sltMRolePara.mlCode?has_content><#if model.sltMRolePara.mlCode == "ja">selected</#if></#if>><@spring.message "admin.button.japan"/></option>
		<#else>
			<option value=""><@spring.message "admin.button.all"/></option>
			<option value="en"><@spring.message "admin.button.english"/></option>
			<option value="ko"><@spring.message "admin.button.korea"/></option>
			<option value="ja"><@spring.message "admin.button.japan"/></option>
		</#if>

		</select>
		</form>
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
				<h4><@spring.message "admin.menu.mrole"/></h4>
			</div>
			<div class="col-md-8">
				<form id="searchForm" style="margin: 3px 10px 3px 0px;" action="srhForMRole" method="post" onkeydown="return captureReturnKey(event)">
			    <div id="search0" class="input-group">
					<select class="form-control" id="srhColumnId" name="srhColumn" style="width: 30%;background-color: #eeeeee;" onchange="changeItemBg(this, 'mRoleId')">
						<option value="mrName"><@spring.message "role.title.name"/></option>
						<option value="mrCode"><@spring.message "role.title.code"/></option>
						<option value="mrSkills"><@spring.message "role.title.skills"/></option>
						<option value="mrPrefers"><@spring.message "role.title.prefer"/></option>
				    </select>
				    <input name="srhContents" type="text" class="form-control" style="width: 70%;"
				    	value="" autocomplete="off" autocorrect="off" autocapitilize="off"
				    		data-toggle="popover" data-trigger="manual" data-placement="top" 
				    			title="Popover title" data-content="Default popover"
				    				placeholder="Search for Role Name" onkeydown="interverKeystroke(event, 0, 'srhForMRoleAjax','role' ,this, 'srhColumnId');">
				    <span class="input-group-btn">
				      <button class="btn btn-default" style="height: 34px;" type="submit">
				      	<i class="glyphicon glyphicon-search" style="top: 1px;"></i>
				      </button>
				    </span>
			    </div><!-- /input-group -->
			    </form>
			</div>
		</div>
	</div>

	<div class="item-box" id="newMdataFormId" style="display: none;">
	<form name="newForm" class="form-horizontal" action="istMRole" method="post" id="contact_form" onkeypress="return captureReturnKey(event);">
		<table id="newFormId">
			<tr>
				<td width="15%"><@spring.message "role.title.name"/></td>
				<td colspan="3">
					<input class="form-input" type="text" name="mrName"/>
				</td>
			</tr>
			<tr>
				<td width="15%"><@spring.message "role.title.code"/></td>
				<td>
					<input class="form-input" type="text" name="mrCode"/>
				</td>
				<td width="15%"><@spring.message "mindustry.title.country.code"/></td>
				<td>
					<select class="taForm" name="mlCode">
						<option value="">Choose Language</option>
					<#if commonBean??>
					<#if commonBean.mLanguageList?has_content>
						<#list commonBean.mLanguageList as mLanguage>
						<option value="${mLanguage.mlCode?if_exists}">${mLanguage.mlName?if_exists}</option>
						</#list>
					</#if>
					</#if>
					</select>
				</td>
			</tr>
			<tr>
				<td><@spring.message "role.title.explain"/></td>
				<td colspan="3">
					<textarea class="taForm" name="mrExplain" placeholder="Explian" ></textarea>
				</td>
			</tr>
			<tr>
				<td><@spring.message "role.title.skills"/></td>
				<td colspan="3">
					<textarea class="taForm" name="mrSkills" placeholder="Skills"></textarea>
				</td>
			</tr>
			<tr>
				<td><@spring.message "role.title.prefer"/></td>
				<td colspan="3">
					<textarea class="taForm" name="mrPrefers" placeholder="Prefers"></textarea>
				</td>
			</tr>
		</table>
		<br/>
		<p align="center">
			<button type="button" onclick="return confirmData('newFormId');" class="btn btn-primary" data-toggle="modal">
				<@spring.message "role.button.confirm"/>
			</button>
			<button class="btn btn-primary" type="button" onClick="newFormCancel();">
				<@spring.message "role.button.cancel"/>
			</button>
		</p>
	</form>
	</div>

	<div class="item-box" id="updateMdataFormId" style="background-color: #f7f5ff; display: none;">
	<form name="updateForm" class="form-horizontal" action="udtMRole" method="post" id="contact_form" onkeypress="return captureReturnKey(event);">
		<table id="updateForm">
			<tr>
				<td width="15%"><@spring.message "role.title.name"/></td>
				<td>
					<input id="mrNameId" class="form-input"" type="text" name="mrName"/>
				</td>
				<td>Remove</td>
				<td width="15%"><button type="button" class="btn btn-danger" onclick="javascript: removeProject();">
					<@spring.message "modal.button.delete"/></button>
				</td>
			</tr>
			<tr>
				<td><@spring.message "role.title.code"/></td>
				<td>
					<input id="mrCodeId" class="form-input" type="text" name="mrCode"/>
				</td>
				<td width="15%"><@spring.message "mindustry.title.country.code"/></td>
				<td width="10%">
					<select class="taForm" id="mlCodeId" name="mlCode">
						<option value="">Choose Language</option>
					<#if commonBean??>
					<#if commonBean.mLanguageList?has_content>
						<#list commonBean.mLanguageList as mLanguage>
						<option value="${mLanguage.mlCode?if_exists}">${mLanguage.mlName?if_exists}</option>
						</#list>
					</#if>
					</#if>
					</select>
				</td>
			</tr>
			<tr>
				<td><@spring.message "role.title.explain"/></td>
				<td colspan="4">
					<textarea id="mrExplainId" class="taForm" name="mrExplain" placeholder="Explian" ></textarea>
				</td>
			</tr>
			<tr>
				<td><@spring.message "role.title.skills"/></td>
				<td colspan="4">
					<textarea id="mrSkillsId" class="taForm" name="mrSkills" placeholder="Skills"></textarea>
				</td>
			</tr>
			<tr>
				<td><@spring.message "role.title.prefer"/></td>
				<td colspan="4">
					<textarea id="mrPrefersId" class="taForm" name="mrPrefers" placeholder="Prefers"></textarea>
				</td>
			</tr>
		</table>
		<input type="hidden" id="mrNoId" name="mrNo" />
		<br/>
		<p align="center">
			<button type="button" onclick="return confirmData('updateForm');" class="btn btn-primary" data-toggle="modal"><@spring.message "role.button.confirm"/></button>
			<button class="btn btn-primary" type="button" onClick="updateFormCancel();"><@spring.message "role.button.cancel"/></button>
		</p>
	</form>
	</div>


	<div id="mRoleId">
		<ul class="item-box ul-table ul-thead">
			<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">#</li>
			<li class="li-cell" style="border-width: 0px 1px 0px 1px; background-color:#eeeeee;"><@spring.message "role.title.name"/></li>
			<li class="li-cell"><@spring.message "role.title.code"/></li>
			<li class="li-cell"><@spring.message "role.title.skills"/></li>
			<li class="li-cell"><@spring.message "role.title.prefer"/></li>
			<li class="li-cell"><@spring.message "role.title.country.code"/></li>
			<li class="li-cell"><@spring.message "role.title.update"/></li>

		</ul>
	    <#if model??>
	    <#if model.mRoleList?has_content>
	    <#list model.mRoleList as mRole>
			<ul class="bgrow nthrow item-box ul-table" onmouseover="overChangeColor(this);"  onmouseout="outChangeColor(this);" onclick="selectMRole(this, '${mRole.mrNo?if_exists}');">
				<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">${mRole.mrNo?if_exists}</li>
				<li class="li-cell" style="border-width: 0px 1px 0px 1px; background-color:#eeeeee;">${mRole.mrName?if_exists}</li>
				<li class="li-cell">${mRole.mrCode?if_exists}</li>
				<li class="li-cell">
			     	<#if 20 < mRole.mrSkills?length >
					${mRole.mrSkills?if_exists[0..20]}...
					<#else>
					${mRole.mrSkills?if_exists}
					</#if>
				</li>
				<li class="li-cell">${mRole.mrPrefers?if_exists}</li>
				<li class="li-cell">${mRole.mlCode?if_exists}</li>
				<li class="li-cell">${mRole.updateTime?string('yyyy/MM/dd')?if_exists}</li>
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
			<li><a href="sltMRoleList?nowPage=${model.paging.prevPage.nowPage}&allCount=${model.paging.allCount?c}" title="Prev" accesskey="*">Prev</span></a></li>
			</#if>
			<#if model.paging.pagingInfoList?has_content>
				<#list model.paging.pagingInfoList as pageList>
					<#if model.paging.nowPage?if_exists == pageList.pageNumber?if_exists>
					<li class="active"><a href="#">${pageList.pageNumber} <span class="sr-only">(current)</span></a></li>
					<#else>
					<li><a href="sltMRoleList?nowPage=${pageList.pageNumber}&allCount=${model.paging.allCount?c}">${pageList.pageNumber}</a></li>
					</#if>
				</#list>
			</#if>
			<#if model.paging.nextPage?exists>
			<li><a href="sltMRoleList?nowPage=${model.paging.nextPage.nowPage}&allCount=${model.paging.allCount?c}" accesskey="#" title="Next">Next</a></li>
			</#if>
		</#if>
	  </#if>
      </ul>
    </nav><!-- end #nav -->

  </div><!-- #col-md-12 -->
</div><!-- end #content -->

<!-- Modal -->
<div class="modal fade" id="submitFormUserProjects" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel"><@spring.message "role.modal.title"/></h4>
      </div>

      <div id="confirmMessage" class="modal-body">
	      <table  id="t03" style="width:100%">
	      	<tr>
				<td width="15%"><@spring.message "role.title.name"/></td>
				<td colspan="3"></td>
			</tr>
	      	<tr>
				<td width="15%"><@spring.message "role.title.code"/></td>
				<td></td>
				<td width="10%"><@spring.message "mindustry.title.country.code"/></td>
				<td width="10%"></td>
			</tr>
			<tr>
				<td><@spring.message "role.title.explain"/></td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td><@spring.message "role.title.skills"/></td>
				<td colspan="3"></td>
			</tr>
			<tr>
				<td><@spring.message "role.title.prefer"/></td>
				<td colspan="3"></td>
			</tr>
		  </table>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">
        	<@spring.message "modal.button.close"/>
        </button>
        <button id="submitForm" type="button" class="btn btn-primary">
        	<@spring.message "modal.button.save"/>
        </button>
      </div>
    </div>
  </div>
</div>

<!-- Delete Modal -->
<div class="modal fade" id="submitFormDeleteMdataId" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="modal-title" id="dltMasterDataId"><@spring.message "projects.title.modal"/></h4>
    </div>

    <div id="confirmMessage" class="modal-body">
    	<@spring.message "projects.confirm.message.delete"/>
    </div>

    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal">
      	  <@spring.message "modal.button.close"/>
      </button>
      <button id="submitForm" type="button" class="btn btn-danger" onclick="javascript: submitFormDeleteMdata();">
      	  <@spring.message "modal.button.delete"/>
      </button>
    </div>
  </div>
</div>
</div>

<#include "/apps/common/abilistsAdminLoadJs.ftl"/>
<#include "js/sltMRoleListJs.ftl"/>

</@layout.myLayout>