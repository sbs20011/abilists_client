<#import "/apps/admin/layout/abilistsAdminLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box" style="margin-top: 15px;">
<div class="row">
	<div class="col-md-8">
		<h3>
			<ol class="breadcrumb-std">
			  <li><a href="/admin/"><@spring.message "dashboard.title.home"/></a></li>
			  <li class="active"><@spring.message "menu.side.memo.list"/></li>
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

	  <div class="caption mittle-size-title">

		<div class="row">
			<div class="col-md-4">
				<h4><@spring.message "menu.side.memo.list"/></h4>
			</div>
			<div class="col-md-8">
				<form id="searchForm" style="margin: 3px 10px 3px 0px;" action="srhForMemo" method="post" onkeydown="return captureReturnKey(event)">
			    <div id="search0" class="input-group">
					<select class="form-control" id="srhColumnId" name="srhColumn" style="width: 30%;background-color: #eeeeee;" onchange="changeItemBg(this, 'userMemoId')">
						<option value="userId"><@spring.message "user.title.id"/></option>
					    <option value="umMemo"><@spring.message "memo.title.memo"/></option>
				    </select>
				    <input name="srhContents" type="text" class="form-control" style="width: 70%;"
				    	value="" autocomplete="off" autocorrect="off" autocapitilize="off"
				    		data-toggle="popover" data-trigger="manual" data-placement="top" 
				    			title="Popover title" data-content="Default popover"
				    				placeholder="Search for Name" onkeydown="interverKeystroke(event, 0, 'srhForMemoAjax', 'memo', this, 'srhColumnId');">
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

	  <div class="item-box" id="udtMdataFormId" style="display: none;">
		  <form id="updateForm" name="updateForm" class="form-horizontal" action="udtMemo" method="post" id="updateFormId">
		  	<div class="row">
		  		<div class="col-sm-12 col-md-12">
		  			<label class="control-label">Memo</label>
	  				<div id="umMemoId" style="width: 100%; background-color: #ededed; height: 100px;overflow: hidden;overflow-y: auto;"></div>
		  		</div>
			</div>
			<input type="hidden" id="umNoId" name="umNo" />
			<br/>
			<p align="center">
		  	  <button class="btn btn-primary" type="button" onClick="udtFormCancel();"><@spring.message "project.button.close"/></button>
			  <button class="btn btn-danger" type="button" onclick="removeMemo()"><@spring.message "memo.title.delete"/></button>
			</p>

		  </form>
	  </div>

      <div id="userMemoId">
		<ul class="item-box ul-table ul-thead">
			<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">#</li>
			<li class="li-cell" style="width: 10%;"><@spring.message "projects.title.avatar"/></li>
			<li class="li-cell" style="width: 10%; border-width: 0px 1px 0px 1px; background-color:#eeeeee;"><@spring.message "user.title.id"/></li>
			<li class="li-cell"><@spring.message "memo.title.memo"/></li>
			<li class="li-cell" style="width: 15%;"><@spring.message "memo.title.update"/></li>
		</ul>
	    <#if model??>
	    <#if model.userMemoList?has_content>
	    <#list model.userMemoList as userMemo>
			<ul class="bgrow nthrow item-box ul-table" onmouseover="overChangeColor(this);"  onmouseout="outChangeColor(this);" onclick="sltUserMemo(this, '${userMemo.umNo?if_exists}', '${userMemo.userId?if_exists}');">
				<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">${userMemo.umNo?if_exists}</li>
				<li class="li-cell" style="width: 10%;"><img width="32px" alt="image" src="${userMemo.userImgAvatar?if_exists}"></li>
				<li class="li-cell" style="width: 10%; border-width: 0px 1px 0px 1px; background-color:#eeeeee;"><a href="/profile/${userMemo.userId?if_exists}">${userMemo.userId?if_exists}</a></li>
				<li class="li-cell line-break">
	                <#if userMemo.umMemo??>
						<#if 100 < userMemo.umMemo?length >
						${userMemo.umMemo?if_exists[0..100]}...
						<#else>
						${userMemo.umMemo?if_exists}
						</#if>
					</#if>
				</li>
				<li class="li-cell" style="width: 15%;">${userMemo.updateTime?string('yyyy-MM-dd')?if_exists}</li>
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


<!-- Delete Modal -->
<div class="modal fade" id="submitFormDeleteMemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="modal-title" id="dltMemoTileId">Memo</h4>
    </div>

    <div id="confirmMessage" class="modal-body">
    	<@spring.message "projects.confirm.message.delete"/>
    </div>

    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
      <button id="submitForm" type="button" class="btn btn-danger" onclick="javascript: sbtDeleteFormMemo();"><@spring.message "projects.button.delete"/></button>
    </div>
  </div>
</div>
</div>


<#include "/apps/common/abilistsAdminLoadJs.ftl"/>
<#include "js/sltMemoListJs.ftl"/>

</@layout.myLayout>