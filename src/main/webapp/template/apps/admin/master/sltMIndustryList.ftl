<#import "/apps/admin/layout/abilistsAdminLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<style>
.bs-glyphicons-list {
    padding-left: 0;
    list-style: none;
}

@media (min-width: 768px) {
	.bs-glyphicons li {
	    width: 12.5%;
	    font-size: 12px;
	}
}

.bs-glyphicons li {
    float: left;
    width: 25%;
    height: 115px;
    padding: 10px;
    font-size: 12px;
    line-height: 1.4;
    text-align: center;
    background-color: #f9f9f9;
    border: 1px solid #fff;
}

.bs-glyphicons .glyphicon {
    margin-top: 5px;
    margin-bottom: 10px;
    font-size: 24px;
}

.bs-glyphicons .glyphicon-class {
    display: block;
    text-align: center;
    word-wrap: break-word;
}

.bs-glyphicons li:hover {
	  color: #fff;
	  background-color: #563d7c;
}

</style>

<div class="item-box" style="margin-top: 15px;">
<div class="row">
	<div class="col-md-8">
	  <h3>
		<ol class="breadcrumb-std">
		  <li><a href="/admin/"><@spring.message "dashboard.title.home"/></a></li>
		  <li class="active"><@spring.message "admin.menu.mindustry"/></li>
		</ol>
	  </h3>
	</div>
	<div class="col-md-4">
		<form name="sltForm" action="sltMIndustryList" method="post">
		<select class="horizon-align" name="mlCode" onchange="return sltDataList(this);">
			<#if model.sltMIndustryPara??>
				<option value="" <#if model.sltMIndustryPara.mlCode?has_content><#if model.sltMIndustryPara.mlCode == "all">selected</#if></#if>><@spring.message "admin.button.all"/></option>
				<option value="en" <#if model.sltMIndustryPara.mlCode?has_content><#if model.sltMIndustryPara.mlCode == "en">selected</#if></#if>><@spring.message "admin.button.english"/></option>
				<option value="ko" <#if model.sltMIndustryPara.mlCode?has_content><#if model.sltMIndustryPara.mlCode == "ko">selected</#if></#if>><@spring.message "admin.button.korea"/></option>
				<option value="ja" <#if model.sltMIndustryPara.mlCode?has_content><#if model.sltMIndustryPara.mlCode == "ja">selected</#if></#if>><@spring.message "admin.button.japan"/></option>
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
				<h4><@spring.message "admin.menu.mindustry"/></h4>
			</div>
			<div class="col-md-8">
				<form id="searchForm" style="margin: 3px 10px 3px 0px;" action="srhForMIndustry" method="post" onkeydown="return captureReturnKey(event)">
			    <div id="search0" class="input-group">
					<select class="form-control" id="srhColumnId" name="srhColumn" style="width: 30%;background-color: #eeeeee;" onchange="changeItemBg(this, 'mIndustryId')">
						<option value="miLargeCategory"><@spring.message "mindustry.title.large.name"/></option>
						<option value="miMiddleCategory"><@spring.message "mindustry.title.middle.name"/></option>
						<option value="miCode"><@spring.message "mindustry.title.code"/></option>
					</select>
				    <input name="srhContents" type="text" class="form-control" style="width: 70%;"
				    	value="" autocomplete="off" autocorrect="off" autocapitilize="off"
				    		data-toggle="popover" data-trigger="manual" data-placement="top" 
				    			title="Popover title" data-content="Default popover"
				    				placeholder="Search for Detail Name" 
				    						onkeydown="interverKeystroke(event, 0, 'srhForMIndustryAjax' ,'industry' ,this, 'srhColumnId');">
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
	<form name="newForm" class="form-horizontal" action="istMIndustry" method="post" id="contact_form" onkeypress="return captureReturnKey(event);">
		<table id="newFormId">
			<tr>
				<td width="15%"><@spring.message "mindustry.title.large.name"/></td>
				<td>
					<input class="form-input" type="text" name="miLargeCategory"  placeholder="industry name"/>
				</td>
				<td width="15%"><@spring.message "mindustry.title.middle.name"/></td>
				<td>
					<input class="form-input" type="text" name="miMiddleCategory" placeholder="detail name"/>
				</td>
				<td width="10%"><@spring.message "mindustry.title.code"/></td>
				<td>
					<input class="form-input" type="text" name="miCode" placeholder="code"/>
				</td>
			</tr>
			<tr>
				<td><@spring.message "mindustry.title.imgcode"/></td>
				<td colspan="3">
					<div style="display: table; width:100%;">
						<input class="form-input" id="newMiImgCodeId" name="miImgCode" type="text" placeholder="Image Code"/>
						<div style="display: table-cell; padding-left: 10px;">
							<a href="javascript:viewGlyphsModel();" class="btn btn-info" >Glyphs</a>
						</div>
					</div>
				</td>
				<td><@spring.message "mindustry.title.country.code"/></td>
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
		</table>
		<br/>
		<p align="center">
			<button type="button" onclick="return confirmData('newFormId');" class="btn btn-primary" data-toggle="modal">
				<@spring.message "mindustry.button.confirm"/>
			</button>
			<button class="btn btn-primary" type="button" onClick="newFormCancel();">
				<@spring.message "mindustry.button.cancel"/>
			</button>
		</p>
	</form>
	</div>

	<div class="item-box" id="updateMdataFormId" style="background-color: #f7f5ff; display: none;">
	<form name="updateForm" class="form-horizontal" action="udtMIndustry" method="post" id="contact_form" onkeypress="return captureReturnKey(event);">
		<table id="updateForm" style="width:100%">
			<tr>
				<td><@spring.message "mindustry.title.large.name"/></td>
				<td width="20%">
					<input class="form-input" id="miLargeCategoryId" style="width:100%" type="text" name="miLargeCategory"/>
				</td>
				<td><@spring.message "mindustry.title.middle.name"/></td>
				<td width="20%">
					<input class="form-input" id="miMiddleCategoryId" style="width:100%" type="text" name="miMiddleCategory"/>
				</td>
				<td><@spring.message "mindustry.title.code"/></td>
				<td>
					<input class="form-input" id="miCodeId" style="width:100%" type="text" name="miCode"/>
				</td>
			</tr>
			<tr>
				<td><@spring.message "mindustry.title.imgcode"/></td>
				<td colspan="3">
					<div style="display: table; width:100%;">
						<input id="uptMiImgCodeId" class="form-input" name="miImgCode" type="text" placeholder="Image Code"/>
						<div style="display: table-cell; padding-left: 10px;">
							<a href="javascript:viewGlyphsModel();" class="btn btn-info">Glyphs</a>
						</div>
					</div>
				</td>
				<td><@spring.message "mindustry.title.country.code"/></td>
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
		</table>
		<input type="hidden" id="miNoId" name="miNo" />
		<br/>
		<p align="center">
			<button type="button" onclick="return confirmData('updateForm');" class="btn btn-primary" data-toggle="modal"><@spring.message "mindustry.button.confirm"/></button>
			<button class="btn btn-primary" type="button" onClick="updateFormCancel();"><@spring.message "mindustry.button.cancel"/></button>
			<button type="button" class="btn btn-danger" style="width: 80px;" onclick="javascript: removeIndustry();">
				<@spring.message "tech.button.detail.delete"/>
			</button>
		</p>
	</form>
	</div>

	<div id="mIndustryId">
		<ul class="item-box ul-table ul-thead">
			<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">#</li>
			<li class="li-cell" style="width: 10%;"><@spring.message "mindustry.title.imgcode"/></li>
			<li class="li-cell" style="border-width: 0px 1px 0px 1px; background-color:#eeeeee;"><@spring.message "mindustry.title.large.name"/></li>
			<li class="li-cell"><@spring.message "mindustry.title.middle.name"/></li>
			<li class="li-cell"><@spring.message "mindustry.title.code"/></li>
			<li class="li-cell" style="width: 5%;"><@spring.message "mindustry.title.country.code"/></li>
			<li class="li-cell"><@spring.message "mindustry.title.update"/></li>
		</ul>
	    <#if model??>
	    <#if model.mIndustryList?has_content>
	    <#list model.mIndustryList as mIndustry>
			<ul class="bgrow nthrow item-box ul-table" onmouseover="overChangeColor(this);"  onmouseout="outChangeColor(this);" onclick="selectMIndustry(this, '${mIndustry.miNo?if_exists?c}');" >
				<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">${mIndustry.miNo?if_exists}</li>
				<li class="li-cell" style="width: 10%;"><span class="glyphicon ${mIndustry.miImgCode?if_exists}"></span></li>
				<li class="li-cell" style="border-width: 0px 1px 0px 1px; background-color:#eeeeee;">${mIndustry.miLargeCategory?if_exists}</li>
				<li class="li-cell">${mIndustry.miMiddleCategory?if_exists}</li>
				<li class="li-cell">${mIndustry.miCode?if_exists}</li>
				<li class="li-cell" style="width: 5%;">${mIndustry.mlCode?if_exists}</li>
				<li class="li-cell">${mIndustry.updateTime?string('yyyy/MM/dd')?if_exists}</li>
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
			<li><a href="sltMIndustryList?nowPage=${model.paging.prevPage.nowPage}&allCount=${model.paging.allCount?c}" title="Prev" accesskey="*">Prev</span></a></li>
			</#if>
			<#if model.paging.pagingInfoList?has_content>
				<#list model.paging.pagingInfoList as pageList>
					<#if model.paging.nowPage?if_exists == pageList.pageNumber?if_exists>
					<li class="active"><a href="#">${pageList.pageNumber} <span class="sr-only">(current)</span></a></li>
					<#else>
					<li><a href="sltMIndustryList?nowPage=${pageList.pageNumber}&allCount=${model.paging.allCount?c}">${pageList.pageNumber}</a></li>
					</#if>
				</#list>
			</#if>
			<#if model.paging.nextPage?exists>
			<li><a href="sltMIndustryList?nowPage=${model.paging.nextPage.nowPage}&allCount=${model.paging.allCount?c}" accesskey="#" title="Next">Next</a></li>
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
        <h4 class="modal-title" id="myModalLabel"><@spring.message "mindustry.modal.title"/></h4>
      </div>

      <div id="confirmMessage" class="modal-body">
      	<@spring.message "mindustry.modal.message"/>
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
      	  <@spring.message "projects.button.close"/>
      </button>
      <button id="submitForm" type="button" class="btn btn-danger" onclick="javascript: submitFormDeleteMdata();">
      	  <@spring.message "projects.button.delete"/>
      </button>
    </div>
  </div>
</div>
</div>

<div class="modal fade" id="viewGlyphsModalId" tabindex="-1" role="dialog" aria-labelledby="myGlyphsModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span>
        	<span class="sr-only"><@spring.message "projects.button.close"/></span>
        </button>
        <h4 class="modal-title" id="myModalLabel">Glyphs</h4>
      </div>
<#include "glyphs.ftl"/>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
      </div>

    </div>
  </div>
</div>

<#include "/apps/common/abilistsAdminLoadJs.ftl"/>
<#include "js/sltMIndustryListJs.ftl"/>

</@layout.myLayout>