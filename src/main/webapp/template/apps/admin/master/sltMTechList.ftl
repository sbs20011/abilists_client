<#import "/apps/admin/layout/abilistsAdminLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box" style="margin-top: 15px;">
<div class="row">
	<div class="col-md-8">
	<h3>
		<ol class="breadcrumb-std">
		  <li><a href="/admin"><@spring.message "dashboard.title.home"/></a></li>
		  <li class="active"><@spring.message "admin.menu.skills"/></li>
		</ol>
	</h3>
	</div>
	<div class="col-md-4">
	<form name="sltForm" action="sltMTechList" method="post">
		<select class="horizon-align" name="mtSkill" onchange="return sltDataList(this);">
			<#if model.sltMTechPara??>
				<option value="" <#if model.sltMTechPara.mtSkill?has_content><#if model.sltMTechPara.mtSkill == "all">selected</#if></#if>><@spring.message "tech.button.all"/></option>
				<option value="tech" <#if model.sltMTechPara.mtSkill?has_content><#if model.sltMTechPara.mtSkill == "techs">selected</#if></#if>><@spring.message "tech.button.techs"/></option>
				<option value="lang" <#if model.sltMTechPara.mtSkill?has_content><#if model.sltMTechPara.mtSkill == "lang">selected</#if></#if>><@spring.message "tech.button.lang"/></option>
				<option value="certi" <#if model.sltMTechPara.mtSkill?has_content><#if model.sltMTechPara.mtSkill == "certi">selected</#if></#if>><@spring.message "tech.button.certi"/></option>
			<#else>
				<option value=""><@spring.message "tech.button.all"/></option>
				<option value="tech"><@spring.message "tech.button.techs"/></option>
				<option value="lang"><@spring.message "tech.button.lang"/></option>
				<option value="certi"><@spring.message "tech.button.certi"/></option>
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
				<h4><@spring.message "admin.menu.skills"/></h4>
			</div>
			<div class="col-md-8">
				<form id="searchForm" style="margin: 3px 10px 3px 0px;" action="srhForMTechs" method="post" onkeydown="return captureReturnKey(event)">
			    <div id="search0" class="input-group">
					<select class="form-control" id="srhColumnId" name="srhColumn" style="width: 30%;background-color: #eeeeee;" onchange="changeItemBg(this, 'mTechId')">
						<option value="mtSkill"><@spring.message "tech.title.skills"/></option>
					    <option value="mtKind"><@spring.message "tech.title.kind"/></option>
					    <option value="mtName"><@spring.message "tech.title.name"/></option>
					    <option value="mtVersion"><@spring.message "tech.title.version"/></option>
					    <option value="mtExplain"><@spring.message "tech.title.explain"/></option>
				    </select>
				    <input name="srhContents" type="text" class="form-control" style="width: 70%;"
				    	value="" autocomplete="off" autocorrect="off" autocapitilize="off"
				    		data-toggle="popover" data-trigger="manual" data-placement="top" 
				    			title="Popover title" data-content="Default popover"
				    				placeholder="Search for Name" onkeydown="interverKeystroke(event, 0, 'srhForMTechsAjax','tech' ,this, 'srhColumnId');" >
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
	<form name="newForm" class="form-horizontal" action="istMTech" method="post" id="contact_form" onkeypress="return captureReturnKey(event);">
		<table id="newFormId">
		<tr>
			<td width="10%"><@spring.message "tech.title.techs"/></td>
			<td>
				<select class="taForm" name="mtSkill">
				<option value="0">Select Skill</option>
			    <#if configBean??>
			    <#if configBean.techSkillBean.skillTitleList?has_content>
				    <#list configBean.techSkillBean.skillTitleList as skillTitle>
				    	<option value="${skillTitle?if_exists}">${skillTitle?if_exists}</option>
				    </#list>
			    </#if>
			    </#if>
			    </select>
			</td>
			<td width="10%"><@spring.message "tech.title.kind"/></td>
			<td>
				<input class="form-input" type="text" name="mtKind"/>
			</td>
			<td width="10%"><@spring.message "tech.title.version"/></td>
			<td>
				<input class="form-input" type="text" name="mtVersion"/>
			</td>
		</tr>
		<tr>
			<td><@spring.message "tech.title.name"/></td>
			<td colspan="3">
				<input class="form-input" type="text" name="mtName"/>
			</td>
			<td><@spring.message "tech.title.trend"/></td>
			<td>
				<input class="form-input" type="text" name="mtTrend"/>
			</td>
		</tr>
		<tr>
			<td><@spring.message "tech.title.explain"/></td>
			<td colspan="5">
				<input class="form-input" name="mtExplain" type="text" placeholder="explian"/>
			</td>
		</tr>
		</table>
		<br/>
		<p align="center">
			<button type="button" onclick="return confirmData('newFormId');" class="btn btn-primary" data-toggle="modal"><@spring.message "tech.button.confirm"/></button>
			<button class="btn btn-primary" type="button" onClick="newFormCancel();"><@spring.message "tech.button.cancel"/></button>
		</p>
	</form>
	</div>

	<div class="item-box" id="updateMdataFormId" style="background-color: #f7f5ff; display: none;">
	<form name="updateForm" class="form-horizontal" action="udtMTech" method="post" id="contact_form" onkeypress="return captureReturnKey(event);">
		<table id="updateForm">
		<tr>
			<td width="10%"><@spring.message "tech.title.techs"/></td>
			<td>
				<select class="taForm" id="mtSkillId" name="mtSkill">
				<option value="0">Select Skill</option>
			    <#if configBean??>
			    <#if configBean.techSkillBean.skillTitleList?has_content>
				    <#list configBean.techSkillBean.skillTitleList as skillTitle>
				    	<option value="${skillTitle?if_exists}">${skillTitle?if_exists}</option>
				    </#list>
			    </#if>
			    </#if>
			    </select>
			</td>
			<td width="10%"><@spring.message "tech.title.kind"/></td>
			<td>
				<input class="form-input" id="mtKindId" type="text" name="mtKind"/>
			</td>
			<td><@spring.message "tech.title.version"/></td>
			<td width="20%">
				<input class="form-input" id="mtVersionId" type="text" name="mtVersion"/>
			</td>	
		</tr>
		<tr>
			<td><@spring.message "tech.title.name"/></td>
			<td colspan="3">
				<input class="form-input" id="mtNameId" type="text" name="mtName"/>
			</td>	
			<td><@spring.message "tech.title.trend"/></td>
			<td>
				<input class="form-input" id="mtTrendId" type="text" name="mtTrend"/>
			</td>
		</tr>
		<tr>
			<td><@spring.message "tech.title.explain"/></td>
			<td colspan="5">
				<input id="mtExplainId" class="form-input" name="mtExplain" type="text" placeholder="explian"/>
			</td>
		</tr>
		</table>
		<input type="hidden" id="mtNoId" name="mtNo" />
		<br/>
		<p align="center">
			<button type="button" onclick="return confirmData('updateForm');" class="btn btn-primary" data-toggle="modal"><@spring.message "tech.button.confirm"/></button>
			<button class="btn btn-primary" type="button" onClick="updateFormCancel();"><@spring.message "tech.button.cancel"/></button>
			<a id="mTechDetailId" href="#" class="btn btn-success" style="width: 95px;" role="button" ><@spring.message "tech.button.input.detail"/></a>
			<button type="button" class="btn btn-danger" style="width: 80px;" onclick="javascript: dltMdata();"><@spring.message "tech.button.detail.delete"/></button>
		</p>
	</form>
	</div>

	<div id="mTechId">
		<ul class="item-box ul-table ul-thead">
			<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">#</li>
			<li class="li-cell" style="border-width: 0px 1px 0px 1px; background-color:#eeeeee;"><@spring.message "tech.title.skills"/></li>
			<li class="li-cell"><@spring.message "tech.title.kind"/></li>
			<li class="li-cell"><@spring.message "tech.title.name"/></li>
			<li class="li-cell"><@spring.message "tech.title.version"/></li>
			<li class="li-cell"><@spring.message "tech.title.explain"/></li>
			<li class="li-cell"><@spring.message "tech.title.trend"/></li>
			<li class="li-cell"><@spring.message "tech.title.update"/></li>
		</ul>
	    <#if model??>
	    <#if model.mTechList?has_content>
	    <#list model.mTechList as mTech>
		<ul class="bgrow nthrow item-box ul-table" onmouseover="overChangeColor(this);"  onmouseout="outChangeColor(this);" onclick="selectMTech(this, '${mTech.mtNo?if_exists?c}');" >
			<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">${mTech.mtNo?if_exists}</li>
			<li class="li-cell" style="border-width: 0px 1px 0px 1px; background-color:#eeeeee;">${mTech.mtSkill?if_exists}</li>
			<li class="li-cell">${mTech.mtKind?if_exists}</li>
			<li class="li-cell">${mTech.mtName?if_exists}</li>
			<li class="li-cell">${mTech.mtVersion?if_exists}</li>
			<li class="li-cell">${mTech.mtExplain?if_exists}</li>
			<li class="li-cell">${mTech.mtTrend?if_exists}</li>
			<li class="li-cell">${mTech.updateTime?string('yyyy/MM/dd')?if_exists}</li>
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
			<li><a href="sltMTechList?nowPage=${model.paging.prevPage.nowPage}&allCount=${model.paging.allCount?c}<#if model.sltMTechPara.mtSkill??>&mtSkill=${model.sltMTechPara.mtSkill?if_exists}</#if>" title="Prev" accesskey="*">Prev</span></a></li>
			</#if>
			<#if model.paging.pagingInfoList?has_content>
				<#list model.paging.pagingInfoList as pageList>
					<#if model.paging.nowPage?if_exists == pageList.pageNumber?if_exists>
					<li class="active"><a href="#">${pageList.pageNumber} <span class="sr-only">(current)</span></a></li>
					<#else>
					<li><a href="sltMTechList?nowPage=${pageList.pageNumber}&allCount=${model.paging.allCount?c}<#if model.sltMTechPara.mtSkill??>&mtSkill=${model.sltMTechPara.mtSkill?if_exists}</#if>">${pageList.pageNumber}</a></li>
					</#if>
				</#list>
			</#if>
			<#if model.paging.nextPage?exists>
			<li><a href="sltMTechList?nowPage=${model.paging.nextPage.nowPage}&allCount=${model.paging.allCount?c}<#if model.sltMTechPara.mtSkill??>&mtSkill=${model.sltMTechPara.mtSkill?if_exists}</#if>" accesskey="#" title="Next">Next</a></li>
			</#if>
		</#if>
	  </#if>
      </ul>
    </nav><!-- end #nav -->

  </div><!-- #col-md-12 -->
</div><!-- #row -->

<!-- Update Modal -->
<div class="modal fade" id="submitFormMTech" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel"><@spring.message "tech.modal.title"/></h4>
      </div>

      <div id="confirmMessage" class="modal-body">
		<table id="t03" style="width:100%">
		<tr>
			<td width="10%"><@spring.message "tech.title.techs"/></td>
			<td></td>
			<td width="10%"><@spring.message "tech.title.kind"/></td>
			<td></td>
			<td width="10%"><@spring.message "tech.title.version"/></td>
			<td></td>
		</tr>
		<tr>
			<td><@spring.message "tech.title.name"/></td>
			<td colspan="3"></td>
			<td><@spring.message "tech.title.trend"/></td>
			<td></td>
		</tr>
		<tr>
			<td><@spring.message "tech.title.explain"/></td>
			<td colspan="5"></td>
		</tr>
		</table>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">
        	<@spring.message "projects.button.close"/>
        </button>
        <button id="submitForm" type="button" class="btn btn-primary">
        	<@spring.message "tech.button.save"/>
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
      	  <@spring.message "projects.button.close"/>
      </button>
      <button id="submitForm" type="button" class="btn btn-danger" onclick="javascript: submitFormDeleteMdata();">
      	  <@spring.message "projects.button.delete"/>
      </button>
    </div>
  </div>
</div>
</div>


<script>


</script>
<#include "/apps/common/abilistsAdminLoadJs.ftl"/>
<#include "js/sltMTechListJs.ftl"/>

</@layout.myLayout>