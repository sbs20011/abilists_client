<#import "/apps/admin/layout/abilistsAdminLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<style>

.only-view {
	width: 100%; 
	background-color: #ededed; 
	border: 1px solid #ccc; 
	border-radius: 4px; 
	height: 155px;
	overflow: hidden; 
	overflow-y: auto;
}

</style>

<div class="item-box" style="margin-top: 15px;">
<div class="row">
	<div class="col-md-8">
		<h3>
			<ol class="breadcrumb-std">
			  <li><a href="/admin/"><@spring.message "dashboard.title.home"/></a></li>
			  <li class="active"><@spring.message "menu.side.tasks.list"/></li>
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
				<h4><@spring.message "menu.side.tasks.list"/></h4>
			</div>
			<div class="col-md-8">
				<form id="searchForm" style="margin: 3px 10px 3px 0px;" action="srhForTasks" method="post" onkeydown="return captureReturnKey(event)">
			    <div id="search0" class="input-group">
					<select class="form-control" id="srhColumnId" name="srhColumn" style="width: 30%;background-color: #eeeeee;" onchange="changeItemBg(this, 'userTasksId')">
						<option value="userId"><@spring.message "user.title.id"/></option>
					    <option value="utKind"><@spring.message "tasks.title.kind"/></option>
					    <option value="utProgress"><@spring.message "tasks.title.progress"/></option>
					    <option value="utTitle"><@spring.message "tasks.title.title"/></option>
				    </select>
				    <input name="srhContents" type="text" class="form-control" style="width: 70%;"
				    	value="" autocomplete="off" autocorrect="off" autocapitilize="off"
				    		data-toggle="popover" data-trigger="manual" data-placement="top" 
				    			title="Popover title" data-content="Default popover"
				    				placeholder="Search for Name" onkeydown="interverKeystroke(event, 0, 'srhForTasksAjax','tasks' ,this, 'srhColumnId');">
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

	  <div class="item-box" id="udtMdataFormId" style="background-color: #f7f5ff; display: none;">
		<form name="updateForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/works/udtTasks" method="post" id="updateFormId" onkeypress="return captureReturnKey(event);">

	  	  <div class="row">
	  		<div class="col-sm-4 col-md-4">
		      <div class="row">
		  	    <div class="col-sm-12" style="padding-right: 5px;">
			  	  	<label class="control-label"><@spring.message "home.title.reports.project"/></label>
					<select id="upNoId" class="taForm taForm-disable" name="upNo" disabled>
						<option value="0"><@spring.message "home.title.reports.project"/></option>
					<#if model.userProjectsList??>
						<#list model.userProjectsList as userProjects>
						<option value="${userProjects.upNo?if_exists}">${userProjects.upName?if_exists}</option>
						</#list>
					</#if>
						<option value="0">ETC</option>
				    </select>
				</div>
			  </div>

	  		  <div class="row">
	  			<div class="col-sm-6" style="padding-right: 0px;">
			      <label class="control-label">Status</label>
				  <select id="utStatusId" class="taForm taForm-disable" name="utStatus" disabled>
					<option value="0">Select Status</option>
					<option value="1">Stanby</option>
					<option value="2">Started</option>
					<option value="3">Progressing</option>
					<option value="4">Holding</option>
					<option value="5">Stoppted</option>
					<option value="6">Finished</option>
					<option value="7">Nothing</option>
				  </select>
				</div>
	  			<div class="col-sm-6" style="padding-left: 5px;padding-right: 5px;">
			    <label class="control-label">Progress</label>
				  <select id="utProgressId" class="taForm taForm-disable" name="utProgress" disabled>
					<option value="0">Select Progress</option>
					<option value="10">10%</option>
					<option value="20">20%</option>
					<option value="30">30%</option>
					<option value="40">40%</option>
					<option value="50">50%</option>
					<option value="60">60%</option>
					<option value="70">70%</option>
					<option value="80">80%</option>
					<option value="90">90%</option>
					<option value="100">100%</option>
				  </select>
				</div>
			  </div>
			  <div class="row">
			  	<div class="col-sm-6" style="padding-right: 0px;">
		  		  <label class="control-label">Start date</label>
		  		  <div class="input-group" style="float:right; width: 100%;">
		  		  	  <span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
		  		  	  <span id="utStartDayId" class="form-control input-height taForm-disable"></span>
		  		  </div>
		  		</div>
			  	<div class="col-sm-6" style="padding-left: 5px;padding-right: 5px;">
		  		  <label class="control-label">End date</label>
		  		  <div class="input-group" style="float:right; width: 100%;">
		  		  	<span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
		  		  	<span id="utEndDayId" class="form-control input-height taForm-disable"></span>
		  		  </div>
		  		</div>
	  		  </div>
			  <div class="row">
		  		<div class="col-sm-6" style="padding-right: 0px;">
		  			<label class="control-label">Working Hours</label>
		  			<div class="input-group" style="float:right; width: 100%;">
		  		  	  <span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-time" aria-hidden="true"></span></span>
		  		  	  <span id="utTaskHourId" class="form-control input-height taForm-disable"></span>
		  		  	</div>
		  		</div>
		  		<div class="col-sm-6" style="padding-left: 5px;padding-right: 5px;">
		  			<label class="control-label">Margin of Error</label>
		  			<div class="input-group" style="float:right; width: 100%;">
		  			  <span class="input-group-addon"><span style="font-size: 17px;">±</span></span>
		  		  	  <span id="utMarginHourId" class="form-control input-height taForm-disable"></span>
		  		    </div>
	  		  	</div>
	  		  </div>
	  		</div>
	  		<div class="col-sm-8 col-md-8">
	  		  <div class="row">
		  		<div class="col-sm-9" style="padding-right: 0px;">
		  		  <label class="control-label">Title</label>
		  		  <span id="utTitleId" class="form-control input-height taForm-disable"></span>
		  		</div>
		  		<div class="col-sm-3"> 
			  	  	<label class="control-label">Kind</label>
					<select id="utKindId" class="taForm taForm-disable" name="utKind" disabled>
						<option value="0">Select kind</option>
						<option value="1">Project</option>
						<option value="2">Email</option>
						<option value="3">Docoments</option>
						<option value="4">Meeting</option>
						<option value="5">Report</option>
						<option value="6">Event</option>
						<option value="7">ETC</option>
			       </select>
	  		  	</div>
	  		  </div>
	  		  <label class="control-label">Your tasks</label>
	  		  <div id="utTaskId" class="only-view"></div>
	  		</div>
	  	  </div>
		  <input type="hidden" id="utNoId" name="utNo" />
		  <input type="hidden" id="utSortId" name="utSort" />
		  <input type="hidden" id="tokenId" name="token" />
		  <br/>
		  <p align="center">
	        <button class="btn btn-primary" type="button" onClick="udtFormCancel();"><@spring.message "project.button.close"/></button>
	        <button class="btn btn-danger" type="button" onclick="removeTasks()"><@spring.message "tasks.title.delete"/></button>
		  </p>

		</form>
	  </div>

      <div id="userTasksId">
		<ul class="item-box ul-table ul-thead">
			<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">#</li>
			<li class="li-cell" style="width: 10%;"><@spring.message "projects.title.avatar"/></li>
			<li class="li-cell" style="width: 10%; border-width: 0px 1px 0px 1px; background-color:#eeeeee;"> 
      			<@spring.message "projects.title.userid"/>
      		</li>
			<li class="li-cell" style="width: 10%;"><@spring.message "tasks.title.kind"/></li>
			<li class="li-cell" style="width: 10%;"><@spring.message "tasks.title.progress"/></li>
			<li class="li-cell" style="width: 10%;"><@spring.message "tasks.title.title"/></li>
			<li class="li-cell"><@spring.message "tasks.title.task"/></li>
			<li class="li-cell" style="width: 15%;"><@spring.message "tasks.title.update"/></li>
		</ul>
	    <#if model??>
	    <#if model.userTasksList?has_content>
	    <#list model.userTasksList as userTasks>
			<ul class="bgrow nthrow item-box ul-table" onmouseover="overChangeColor(this);"  onmouseout="outChangeColor(this);" 
				onclick="selectUserTasks(this, '${userTasks.userId?if_exists}', '${userTasks.utNo?if_exists}');">
				<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">${userTasks.utNo?if_exists}</li>
				<li class="li-cell" style="width: 10%;"><img width="32px" alt="image" src="${userTasks.userImgAvatar?if_exists}"></li>
				<li class="li-cell" style="width: 10%; border-width: 0px 1px 0px 1px; background-color:#eeeeee;">${userTasks.userId?if_exists}</li>
				<li class="li-cell" style="width: 10%;">${userTasks.utKind?if_exists}</li>
				<li class="li-cell" style="width: 10%;">${userTasks.utProgress?if_exists}</li>
				<li class="li-cell" style="width: 10%;">${userTasks.utTitle?if_exists}</li>
				<li class="li-cell line-break">
	                <#if userTasks.utTask??>
						<#if 100 < userTasks.utTask?length >
						${userTasks.utTask?if_exists[0..100]}...
						<#else>
						${userTasks.utTask?if_exists}
						</#if>
					</#if>
				</li>
				<li class="li-cell" style="width: 15%;">${userTasks.updateTime?string('yyyy-MM-dd')?if_exists}</li>
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
<div class="modal fade" id="sbtFormDeleteTasks" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="modal-title" id="dltTasksTileId"><@spring.message "projects.title.modal"/></h4>
    </div>

    <div id="confirmMessage" class="modal-body">
    	<@spring.message "projects.confirm.message.delete"/>
    </div>

    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
      <button id="submitForm" type="button" class="btn btn-danger" onclick="javascript: sbtDeleteFormTasks();"><@spring.message "projects.button.delete"/></button>
    </div>
  </div>
</div>
</div>

<#include "/apps/common/abilistsAdminLoadJs.ftl"/>
<#include "js/sltTaskListJs.ftl"/>

</@layout.myLayout>