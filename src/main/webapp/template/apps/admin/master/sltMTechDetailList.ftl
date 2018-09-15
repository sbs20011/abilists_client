<#import "/apps/admin/layout/abilistsAdminLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<style>

/*
 * Change the modal size.
 */
@media screen and (min-width: 768px) {
	#myModal .modal-dialog  {width:900px;}
}

</style>

<div class="item-box" style="margin-top: 15px;">
<div class="row">
	<div class="col-md-8">
		<h3>
		<ol class="breadcrumb-std">
		  <li><a href="/admin"><@spring.message "dashboard.title.home"/></a></li>
		  <li><a href="/admin/master/sltMTechList"><@spring.message "admin.menu.mtech"/></a></li>
		  <li class="active"><@spring.message "admin.menu.mtech.detail"/></li>
		</ol>
		</h3>
	</div>
	<div class="col-md-4">
		<form name="sltForm" action="${configBean.baseURL?if_exists}/admin/master/sltMTechDetailList/<#if model.mTech??>${model.mTech.mtNo?if_exists?c}</#if>" method="post">
		<select class="horizon-align" name="mlCode" onchange="return sltDataList(this);">
			<option value="" <#if model.sltMTechDetailPara.mlCode?has_content><#if model.sltMTechDetailPara.mlCode == "all">selected</#if></#if>><@spring.message "admin.button.all"/></option>
			<option value="en" <#if model.sltMTechDetailPara.mlCode?has_content><#if model.sltMTechDetailPara.mlCode == "en">selected</#if></#if>><@spring.message "admin.button.english"/></option>
			<option value="ko" <#if model.sltMTechDetailPara.mlCode?has_content><#if model.sltMTechDetailPara.mlCode == "ko">selected</#if></#if>><@spring.message "admin.button.korea"/></option>
			<option value="ja" <#if model.sltMTechDetailPara.mlCode?has_content><#if model.sltMTechDetailPara.mlCode == "ja">selected</#if></#if>><@spring.message "admin.button.japan"/></option>
		</select>
		</form>
	</div>
</div>
</div>


<div class="row">
<div class="col-md-12">

		<#include "/apps/common/errorMessage.ftl"/>
		<#include "/apps/common/abilistsSuccess.ftl"/>

		<#if model.mTech??>
		<div class="caption" style="padding: 1px; padding-left: 10px;"><h4><@spring.message "admin.menu.mtech"/></h4></div>
		<div class="item-box">
			<table id="t01">
				<tr>
					<td><@spring.message "tech.title.skills"/></td>
					<td width="20%">
						${model.mTech.mtSkill?if_exists}
					</td>
					<td><@spring.message "tech.title.kind"/></td>
					<td width="20%">
						${model.mTech.mtKind?if_exists}
					</td>	
					<td><@spring.message "tech.title.version"/></td>
					<td width="20%">
						${model.mTech.mtVersion?if_exists}
					</td>
				</tr>
				<tr>
					<td><@spring.message "tech.title.name"/></td>
					<td colspan="3">
						${model.mTech.mtName?if_exists}
					</td>
					<td><@spring.message "tech.title.trend"/></td>
					<td>
						${model.mTech.mtTrend?if_exists}
					</td>
				</tr>
				<tr>
					<td><@spring.message "tech.title.explain"/></td>
					<td colspan="5">
						${model.mTech.mtExplain?if_exists}
					</td>
				</tr>
			</table>
		</div>
		</#if>

		<div class="caption" style="padding: 1px; padding-left: 10px;">
			<div class="row">
				<div class="col-md-8">
					<h4><@spring.message "admin.menu.mtech.detail"/></h4>
				</div>
				<div class="col-md-4">
					<span id="newToggleId" class="glyphicon glyphicon-chevron-down add-symbol" style="color:#337ab7;" aria-hidden="true" onClick="newFormToggle();"></span>
				</div>
			</div>
		</div>
		
		<div class="item-box" id="newMdataFormId" style="display: none;">
		<form name="newForm" action="${configBean.baseURL?if_exists}/admin/master/istMTechDetail" method="post" onkeypress="return captureReturnKey(event);">
		  	<table id="newFormId">
			  	<tr>
					<td><@spring.message "tech.detail.title.level"/></td>
					<td width="10%">
						<select class="taForm" name="mtdLevel">
							<option value="0"><@spring.message "tech.detail.title.value"/></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td>
					<td><@spring.message "tech.detail.title.explain"/></td>
					<td>
						<input class="form-input" type="text" name="mtdLevelExplain" placeholder="mtdLevelExplain" />
					</td>
					<td width="15%"><@spring.message "mindustry.title.country.code"/></td>
					<td width="20%">
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
			</table>
			<br/>
			<p align="center">
				<button type="button" onclick="return confirmData('newFormId');" class="btn btn-primary" data-toggle="modal">Confirm</button>
				<input class="btn btn-primary" type="button" onClick="newFormCancel();" value="Cancel">
			</p>
			<input type="hidden" name="mtNo" value="<#if model.mTech??>${model.mTech.mtNo?if_exists?c}</#if>"/>
			<input type="hidden" name="mtKind" value="<#if model.mTech??>${model.mTech.mtKind?if_exists}</#if>"/>
		</form>
		</div>

		<div class="item-box" id="updateMdataFormId" style="background-color: #f7f5ff; display: none;">
		<form name="updateForm" action="${configBean.baseURL?if_exists}/admin/master/udtMTechDetail" method="post" onkeypress="return captureReturnKey(event);">
			<table id="updateFormId">
			  	<tr>
					<td><@spring.message "tech.detail.title.level"/></td>
					<td width="10%">
						<select class="taForm" id="mtdLevelId" name="mtdLevel">
							<option value="0"><@spring.message "tech.detail.title.value"/></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td>
					<td><@spring.message "tech.detail.title.explain"/></td>
					<td>
						<input class="form-input" type="text" id="mtdLevelExplainId" name="mtdLevelExplain" placeholder="mtdLevelExplain"/>
					</td>
					<td width="10%"><@spring.message "mindustry.title.country.code"/></td>
					<td width="20%">
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
				<input type="hidden" name="mtNo" value="<#if model.mTech??>${model.mTech.mtNo?if_exists?c}</#if>"/>
				<input type="hidden" name="mtKind" value="<#if model.mTech??>${model.mTech.mtKind?if_exists}</#if>"/>
				<input type="hidden" id="mtdNoId" name="mtdNo" />
			</table>
			<br/>
			<p align="center">
				<button type="button" onclick="return confirmData('updateFormId');" class="btn btn-primary" data-toggle="modal">
					<@spring.message "tech.button.confirm"/>
				</button>
				<button class="btn btn-primary" type="button" onClick="updateFormCancel();">
					<@spring.message "tech.button.cancel"/>
				</button>
				<button type="button" class="btn btn-danger" style="width: 80px;" onclick="javascript: removeMTechDetail();">
					<@spring.message "tech.button.detail.delete"/>
				</button>
			</p>
		</form>
		</div>

		<div id="userProjectTechId">
		<ul class="item-box ul-table ul-thead">
			<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">#</li>
			<li class="li-cell"><@spring.message "tech.detail.title.level"/></li>
			<li class="li-cell"><@spring.message "tech.detail.title.explain"/></li>
			<li class="li-cell"><@spring.message "tech.detail.title.country.code"/></li>
			<li class="li-cell"><@spring.message "tech.detail.title.update"/></li>
		</ul>
		<#if model??>
		<#if model.mTechDetailList?has_content>
		<#list model.mTechDetailList as mTechDetail>
		<ul class="bgrow nthrow item-box ul-table" onmouseover="overChangeColor(this);"  onmouseout="outChangeColor(this);" onclick="selectMTechDetail(this, '${mTechDetail.mtdNo?if_exists?c}');" >
			<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">${mTechDetail.mtdNo?if_exists}</li>
			<li class="li-cell">${mTechDetail.mtdLevel?if_exists}</li>
			<li class="li-cell">${mTechDetail.mtdLevelExplain?if_exists}</li>
			<li class="li-cell">${mTechDetail.mlCode?if_exists}</li>
			<li class="li-cell">${mTechDetail.updateTime?string('yyyy/MM/dd')?if_exists}</li>
		</ul>
		</#list>
		</#if>
		</#if>
		</div>

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

  </div><!-- #col-md-12 -->
</div><!-- #row -->


<!-- Modal - start-->
<div class="modal fade" id="submitFormMTechDetailId" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel"><@spring.message "tech.modal.title"/></h4>
      </div>

      <div class="modal-body">
	  	<table id="t03">
	  		<tr>
			  <th><@spring.message "tech.detail.title.level"/></th>
			  <th><@spring.message "tech.detail.title.explain"/></th>
			</tr>
		</table>
      </div>

      <div class="modal-footer">
      	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="deleteTr('t03');">Close</button>
        <button id="submitForm" type="button" class="btn btn-primary" onclick="javascript: submitform();">Save Data</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal - end-->

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

<#include "/apps/common/abilistsAdminLoadJs.ftl"/>
<#include "js/sltMTechDetailListJs.ftl"/>

</@layout.myLayout>