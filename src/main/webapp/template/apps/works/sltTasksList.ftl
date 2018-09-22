<#import "/apps/layout/works/abilistsWorksLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<link href="${configBean.contextPath?if_exists}/static/apps/css/works/tasks.css?20180723" rel="stylesheet">

<style>

div.ui-datepicker{
	width: 270px;
}
.highlight {
    border: 1px solid #d886a1;
    background-color: lightblue;
}

.input-height {
	height: 32px;
}

canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}

</style>

<div class="item-box">
	<div class="row">
		<div class="col-md-6" style="float:left;">
			<nav class="breadcrumbs">
			<ul>
			<li><a href="/works"><@spring.message "navi.title.works"/></a></li>
			<li class="active"><a href="#"><@spring.message "path.abilists.tasks"/></a></li>
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
			<img style="border-radius: 4px;" src="${myImgAvatar?if_exists}" id="showImg" width="125" alt="your picture" />
	    </div>
	</div>
	<div class="col-sm-10">
		<div class="item-box">
			<canvas id="myTasksBar" height="125px"/>
		</div>
	</div>
</div>

<div class="row">
  <div class="col-md-12">
  	<div class="caption mittle-size-title middle-works-bg">
  		<h4>
  			<@spring.message "path.abilists.tasks"/>
  			<span id="newToggleId" class="glyphicon glyphicon-chevron-down right-symbol-button" style="color:#337ab7;" aria-hidden="true" onClick="newFormToggle();"></span>
  		</h4>
  	</div>

	<#include "/apps/common/errorMessage.ftl"/>
	<#include "/apps/common/abilistsSuccess.ftl"/>

	  <div class="item-box" id="newMdataFormId" style="display: none;">

	  	<form name="newForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/works/istTasks" method="post" id="newFormId" onkeypress="return captureReturnKey(event);">
	  	<div class="row">
	  		<div class="col-sm-4 col-md-4">
		      <div class="row">
		  	    <div class="col-sm-12" style="padding-right: 5px;">
			  	  	<label class="control-label"><@spring.message "home.title.reports.project"/></label>
					<select class="taForm" name="upNo">
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
			      <label class="control-label"><@spring.message "tasks.title.status"/></label>
				  <select class="taForm" name="utStatus">
					<option value="0"><@spring.message "tasks.select.status.default"/></option>
					<option value="1">Progressing</option>
					<option value="2">Holding</option>
					<option value="3">Completed</option>
				  </select>
				</div>
	  			<div class="col-sm-6" style="padding-left: 5px;padding-right: 5px;">
			    <label class="control-label"><@spring.message "tasks.title.progress"/></label>
				  <select class="taForm" name="utProgress">
					<option value="0">0%</option>
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
		  		  <label class="control-label"><@spring.message "tasks.title.start.day"/></label>
		  		  <div class="input-group" style="float:right; width: 100%;">
		  		  	  <span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
		  		  	  <input type="text" class="form-control" id="newUtStartDayId" name="utStartDay">
		  		  </div>
		  		</div>
  		  	    <div class="col-sm-6" style="padding-left: 5px;padding-right: 5px;">
		  		  <label class="control-label"><@spring.message "tasks.title.end.day"/></label>
		  		  <div class="input-group" style="float:right; width: 100%;">
		  		  	  <span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
		  		  	  <input type="text" class="form-control" id="newUtEndDayId" name="utEndDay">
		  		  </div>
		  		</div>
	  		  </div>
  		  	  <div class="row">
		  		<div class="col-sm-6" style="padding-right: 0px;">
		  			<label class="control-label"><@spring.message "tasks.title.task.hour"/></label>
		  			<div class="input-group" style="float:right; width: 100%;">
		  		  	  <span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-time" aria-hidden="true"></span></span>
		  		  	  <input class="form-control" type="text" name="utTaskHour" />
		  		    </div>
		  		</div>
		  		<div class="col-sm-6" style="padding-left: 5px;padding-right: 5px;">
		  			<label class="control-label"><@spring.message "tasks.title.margin.hour"/></label>
		  			<div class="input-group" style="float:right; width: 100%;">
		  			  <span class="input-group-addon"><span style="font-size: 20px;">±</span></span>
		  		  	  <input class="form-control" type="text" name="utMarginHour" />
		  		    </div>
	  		  	</div>
	  		  </div>
	  		</div>
	  		<div class="col-sm-8 col-md-8">
  		  	  <div class="row">
		  		<div class="col-sm-9" style="padding-right: 0px;">
		  		  <label class="control-label"><@spring.message "tasks.title.title"/></label>
		  		  <input class="form-control" type="text" name="utTitle" />
		  		</div>
		  		<div class="col-sm-3"> 
			  	  	<label class="control-label"><@spring.message "tasks.title.kind"/></label>
					<select class="form-control" name="utKind">
						<option value="0"><@spring.message "tasks.select.kind.default"/></option>
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
	  		  <label class="control-label"><@spring.message "tasks.title.task"/></label>
	  		  <textarea class="taForm" style="height: 155px;" id="newUtTasksId" name="utTask" placeholder="Detail" rows="35"></textarea>
	  		</div>
	  	</div>
	  	<input id="newTokenId" type="hidden" name="token" value="<#if model??>${model.token?if_exists}</#if>" />
	  	<br/>
		<p align="center">
			<button type="button" class="btn btn-primary" onclick="return confirmData('newFormId');" >Send</button>
			<button class="btn btn-primary" type="button" onClick="newFormCancel();">Cancel</button>
		</p>
		</form>

	  </div>

	  <div class="item-box" id="udtMdataFormId" style="background-color: #f7f5ff; display: none;">
		<form name="updateForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/works/udtTasks" method="post" id="updateFormId" onkeypress="return captureReturnKey(event);">

	  	  <div class="row">
	  		<div class="col-sm-4 col-md-4">
		      <div class="row">
		  	    <div class="col-sm-12" style="padding-right: 5px;">
			  	  	<label class="control-label"><@spring.message "home.title.reports.project"/></label>
					<select id="upNoId" class="taForm" name="upNo">
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
			      <label class="control-label"><@spring.message "tasks.title.status"/></label>
				  <select id="utStatusId" class="taForm" name="utStatus">
					<option value="0"><@spring.message "tasks.select.status.default"/></option>
					<option value="1">Progressing</option>
					<option value="2">Holding</option>
					<option value="3">Completed</option>
				  </select>
				</div>
	  			<div class="col-sm-6" style="padding-left: 5px;padding-right: 5px;">
			    <label class="control-label"><@spring.message "tasks.title.progress"/></label>
				  <select id="utProgressId" class="taForm" name="utProgress">
					<option value="0"><@spring.message "tasks.select.progress.default"/></option>
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
		  		  <label class="control-label"><@spring.message "tasks.title.start.day"/></label>
		  		  <div class="input-group" style="float:right; width: 100%;">
		  		  	  <span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
		  		  	  <input id="utStartDayId" type="text" class="form-control input-height" name="utStartDay">
		  		  </div>
		  		</div>
			  	<div class="col-sm-6" style="padding-left: 5px;padding-right: 5px;">
		  		  <label class="control-label"><@spring.message "tasks.title.end.day"/></label>
		  		  <div class="input-group" style="float:right; width: 100%;">
		  		  	  <span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
		  		  	  <input id="utEndDayId" type="text" class="form-control input-height" name="utEndDay">
		  		  </div>
		  		</div>
	  		  </div>
			  <div class="row">
		  		<div class="col-sm-6" style="padding-right: 0px;">
		  			<label class="control-label"><@spring.message "tasks.title.task.hour"/></label>
		  			<div class="input-group" style="float:right; width: 100%;">
		  		  	  <span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-time" aria-hidden="true"></span></span>
		  		  	  <input id="utTaskHourId" class="form-control input-height" type="text" name="utTaskHour" />
		  		    </div>
		  		</div>
		  		<div class="col-sm-6" style="padding-left: 5px;padding-right: 5px;">
		  			<label class="control-label"><@spring.message "tasks.title.margin.hour"/></label>
		  			<div class="input-group" style="float:right; width: 100%;">
		  			  <span class="input-group-addon"><span style="font-size: 17px;">±</span></span>
		  		  	  <input id="utMarginHourId" class="form-control input-height" type="text" name="utMarginHour" />
		  		    </div>
	  		  	</div>
	  		  </div>
	  		</div>
	  		<div class="col-sm-8 col-md-8">
	  		  <div class="row">
		  		<div class="col-sm-9" style="padding-right: 0px;">
		  		  <label class="control-label"><@spring.message "tasks.title.title"/></label>
		  		  <input id="utTitleId" class="form-control input-height" type="text" name="utTitle" />
		  		</div>
		  		<div class="col-sm-3"> 
			  	  	<label class="control-label"><@spring.message "tasks.title.kind"/></label>
					<select id="utKindId" class="form-control input-height" name="utKind">
						<option value="0"><@spring.message "tasks.select.kind.default"/></option>
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
	  		  <label class="control-label"><@spring.message "tasks.title.task"/></label>
	  		  <textarea id="utTaskId" class="taForm" style="height: 155px;" name="utTask" placeholder="Detail" rows="35"></textarea>
	  		</div>
	  	  </div>
		  <input type="hidden" id="utNoId" name="utNo" />
		  <input type="hidden" id="utSortId" name="utSort" />
		  <input type="hidden" id="tokenId" name="token" />
		  <br/>
		  <p align="center">
	        <button type="button" onclick="return confirmData('updateFormId');" class="btn btn-primary" data-toggle="modal">
	         <@spring.message "tasks.button.confirm"/>
	        </button>
	        <button class="btn btn-primary" type="button" onClick="updateFormCancel();"><@spring.message "tasks.button.cancel"/></button>
	        <button class="btn btn-danger" type="button" onclick="removeTasks()"><@spring.message "tasks.title.delete"/></button>
		  </p>

		</form>
	  </div>

	  <form name="udtSortForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/works/udtTasksSort" method="post">
      <button id="utSortListId" type="submit" class="btn btn-primary" style="width: 100%;display: none;height: 50px;"> 
		<@spring.message "tasks.button.sort"/>
	　</button>

	  <div id="userTasksId"> 
	    <#if model??>
	    <#if model.userTasksList?has_content>
	    <#list model.userTasksList as userTasks> 
	    <#assign size=model.userTasksList?size - userTasks?counter>
			<div id="sort_${userTasks.utSort?if_exists}" class="item-box item-bar bgrow" 
				onclick="selectUserTasks(this, '${model.users.userId?if_exists}', '${userTasks.utNo?if_exists}');">
				<div class="contents">
					<h4 class="media-heading">${userTasks.utTitle?if_exists} <small>${userTasks.utStartDay?string('yyyy/MM/dd')?if_exists} ~ ${userTasks.utEndDay?string('yyyy/MM/dd')?if_exists}</small></h4>
					<#if userTasks.utTask??>
						<#if 180 < userTasks.utTask?length >
						${userTasks.utTask?if_exists[0..180]}...
						<#else>
						${userTasks.utTask?if_exists}
						</#if>
					</#if>
				</div>
				<div class="bar" style="width:${userTasks.utProgress?if_exists}%; background-color: rgba(255, 233, 216, 0.${size});"></div>
				<#if userTasks.utProgress??>
					<#if userTasks.utProgress?number &gt; 80>
						<#assign percent=userTasks.utProgress?number - 20>
					<#else>
						<#assign percent=userTasks.utProgress>
					</#if>
				</#if>
				<div class="percent" style="left:${percent}%;">${userTasks.utProgress?if_exists}%</div>
				<input type="hidden" name="utNo" value="${userTasks.utNo?if_exists}"/>
			</div>
			<input type="hidden" name="utSort" value="${userTasks.utSort?if_exists}"/>
		</#list>
		</#if>
		</#if>
		<input type="hidden" name="token" value="<#if model??>${model.token?if_exists}</#if>" />

	  </form>
	  </div>
	  
	  <br/>
	  
      <nav class="text-center">
	    <ul class="pagination">
	    <#if model?exists>
      	<#if model.paging?exists>
			<#if model.paging.prevPage?exists>
			<li><a href="sltTasksList?nowPage=${model.paging.prevPage.nowPage}&allCount=${model.paging.allCount?c}" title="Prev" accesskey="*">Prev</span></a></li>
			</#if>
			<#if model.paging.pagingInfoList?has_content>
				<#list model.paging.pagingInfoList as pageList>
					<#if model.paging.nowPage?if_exists == pageList.pageNumber?if_exists>
					<li class="active"><a href="#">${pageList.pageNumber} <span class="sr-only">(current)</span></a></li>
					<#else>
					<li><a href="sltTasksList?nowPage=${pageList.pageNumber}&allCount=${model.paging.allCount?c}">${pageList.pageNumber}</a></li>
					</#if>
				</#list>
			</#if>
			<#if model.paging.nextPage?exists>
			<li><a href="sltTasksList?nowPage=${model.paging.nextPage.nowPage}&allCount=${model.paging.allCount?c}" accesskey="#" title="Next">Next</a></li>
			</#if>
		</#if>
		</#if>
      	</ul>
      </nav><!-- end #nav -->

	</div><!-- col-md-12 -->
</div><!-- row -->

<!-- Modal -->
<div class="modal fade" id="sbtTasksModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel"><@spring.message "tasks.title.modal"/></h4>
      </div>

      <div id="confirmMessage" class="modal-body">
		<table id="t03" class="table-line-break">
		<tr>
			<td><@spring.message "tasks.title.title"/></td>
			<td><@spring.message "tasks.title.task"/></td>
		</tr>
		<tr>
			<td class="line-break"></td>
			<td class="line-break"></td>
		</tr>
		</table>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
        <button id="submitForm" type="button" class="btn btn-primary"><@spring.message "projects.button.delete"/></button>
      </div>
    </div>
  </div>
</div>

<!-- Delete Modal -->
<div class="modal fade" id="submitFormDeleteTasks" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
      <button id="submitForm" type="button" class="btn btn-danger" onclick="javascript: submitDeleteFormTasks();">
      	<@spring.message "projects.button.delete"/>
      </button>
    </div>
  </div>
</div>
</div>

<#include "/apps/common/abilistsWorksLoadJs.ftl"/>
<#include "js/sltTasksListJs.ftl"/>

<script>
<#include "charts/chartTasks.ftl"/>
</script>

</@layout.myLayout>