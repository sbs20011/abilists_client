<#import "/apps/admin/layout/abilistsAdminLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box" style="margin-top: 15px;">
<div class="row">
	<div class="col-md-8">
		<h3>
			<ol class="breadcrumb-std">
			  <li><a href="/admin/"><@spring.message "dashboard.title.home"/></a></li>
			  <li class="active"><@spring.message "admin.menu.notification"/></li>
			</ol>
		</h3>
	</div>
	<div class="col-md-4">
		<span id="newToggleId" class="glyphicon glyphicon-chevron-down add-symbol" style="color:#337ab7;" aria-hidden="true" onClick="newFormToggle();"></span>
	</div>
</div>
</div>

<div class="row">
  <div class="col-md-12">

	<#include "/apps/common/errorMessage.ftl"/>
	<#include "/apps/common/abilistsSuccess.ftl"/>

	<div class="item-box" id="newMdataFormId" style="display: none;">
	<form name="newForm" class="form-horizontal" action="istNoti" method="post" id="contact_form" onkeypress="return captureReturnKey(event);">
		<table id="newFormId" style="width:100%">
			<tr>
				<td width="10%"><@spring.message "noti.title.title"/></td>
				<td>
					<input class="form-input" name="notiTitle" type="text" placeholder="title"/>
				</td>
				<td width="10%"><@spring.message "noti.title.kind"/></td>
			</tr>
			<tr>
				<td><@spring.message "noti.title.contents"/></td>
				<td>
					<textarea class="form-control" name="notiContents" placeholder="contents" rows="5"></textarea>
				</td>
				<td>
					<select class="taForm" name="notiKind">
						<option value='<@spring.message "noti.kind.all"/>'><@spring.message "noti.kind.all"/></option>
						<option value='<@spring.message "noti.kind.admin"/>'><@spring.message "noti.kind.admin"/></option>
						<option value='<@spring.message "noti.kind.info"/>'><@spring.message "noti.kind.info"/></option>
						<option value='<@spring.message "noti.kind.note"/>'><@spring.message "noti.kind.note"/></option>
					</select>
				</td>
			</tr>
		</table>
		<br/>
		<p align="center">
			<button type="button" onclick="return confirmData('newFormId');" class="btn btn-primary" data-toggle="modal">
				<@spring.message "noti.button.confirm"/>
			</button>
			<button class="btn btn-primary" type="button" onClick="newFormCancel();"><@spring.message "noti.button.cancel"/></button>
		</p>
	</form>
	</div>

	<div class="item-box" id="updateMdataFormId" style="background-color: #f7f5ff; display: none;">
	<form name="updateForm" class="form-horizontal" action="udtNoti" method="post" id="contact_form" onkeypress="return captureReturnKey(event);">

		<table id="updateForm" style="width:100%">
		<tr>
			<td width="10%"><@spring.message "noti.title.title"/></td>
			<td>
				<input class="form-input" id="notiTitleId" name="notiTitle" type="text" placeholder="title"/>
			</td>
			<td width="10%"><@spring.message "noti.title.kind"/></td>
		</tr>
		<tr>
			<td><@spring.message "noti.title.contents"/></td>
			<td>
				<textarea class="form-control" id="notiContentsId" name="notiContents" placeholder="contents" rows="5"></textarea>
			</td>
			<td>
				<select class="taForm" id="notiKindId" name="notiKind">
					<option value="">Kind</option>
					<option value="admin">admin</option>
					<option value="info">info</option>
					<option value="ad">ad</option>
				</select>
			</td>
		</tr>
		</table>
		<input type="hidden" id="notiNoId" name="notiNo" />
		<br/>
		<p align="center">
			<button type="button" onclick="return confirmData('updateForm');" class="btn btn-primary" data-toggle="modal">
				<@spring.message "noti.button.confirm"/>
			</button>
			<button class="btn btn-primary" type="button" onClick="updateFormCancel();">
				<@spring.message "noti.button.cancel"/>
			</button>
			<button type="button" class="btn btn-danger" style="width: 80px;" onclick="javascript: removeNoti();">
				<@spring.message "noti.button.delete"/>
			</button>
		</p>
	</form>
	</div>

	<div id="notiId">
		<ul class="item-box ul-table ul-thead">
			<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">#</li>
			<li class="li-cell"><@spring.message "noti.title.title"/></li>
			<li class="li-cell"><@spring.message "noti.title.contents"/></li>
			<li class="li-cell"><@spring.message "noti.title.kind"/></li>
			<li class="li-cell"><@spring.message "noti.title.udate"/></li>
		</ul>
	    <#if model??>
	    <#if model.notificationList?has_content>
	    <#list model.notificationList as noti>
			<ul class="bgrow nthrow item-box ul-table" onmouseover="overChangeColor(this);"  onmouseout="outChangeColor(this);" onclick="selectMTech(this, '${noti.notiNo?if_exists?c}');" >
				<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">${noti.notiNo?if_exists}</li>
				<li class="li-cell">${noti.notiTitle?if_exists}</li>
				<li class="li-cell">${noti.notiContents?if_exists}</li>
				<li class="li-cell">${noti.notiKind?if_exists}</li>
				<li class="li-cell">${noti.updateTime?string('yyyy/MM/dd')?if_exists}</li>
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

   </div><!-- #col-md-12 -->
</div><!-- end #content -->


<!-- Modal -->
<div class="modal fade" id="submitFormNoti" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel"><@spring.message "noti.modal.title"/></h4>
      </div>

      <div id="confirmMessage" class="modal-body">
      	<@spring.message "noti.modal.message"/>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "noti.button.close"/></button>
        <button id="submitForm" type="button" class="btn btn-primary"><@spring.message "noti.button.save"/></button>
      </div>
    </div>
  </div>
</div>

<!-- Delete Modal -->
<div class="modal fade" id="submitFormDeleteNotiId" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
      	  <@spring.message "noti.button.close"/>
      </button>
      <button id="submitForm" type="button" class="btn btn-danger" onclick="javascript: submitFormDeleteNoti();">
      	  <@spring.message "noti.button.delete"/>
      </button>
    </div>
  </div>
</div>
</div>

<#include "/apps/common/abilistsAdminLoadJs.ftl"/>
<#include "js/sltNotiListJs.ftl"/>

</@layout.myLayout>