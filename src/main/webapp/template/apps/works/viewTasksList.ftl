<#import "/apps/layout/abilistsWorksLayout.ftl" as layout>
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

</style>

<div class="item-box">
	<div class="row">
		<div class="col-md-6" style="float:left;">
			<nav class="breadcrumbs">
			<ul>
			<li><a href="#">${model.users.userId?if_exists}</a></li>
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
			<img style="border-radius: 4px;" src="${model.users.userImgData?if_exists}" id="showImg" width="125" alt="your picture" />
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
  		</h4>
  	</div>

	<#include "/apps/common/errorMessage.ftl"/>
	<#include "/apps/common/abilistsSuccess.ftl"/>

	  <div class="item-box" id="udtMdataFormId" style="background-color: #f7f5ff; display: none;">
	  	  <div class="row">
	  		<div class="col-sm-4 col-md-4">
		      <div class="row">
		  	    <div class="col-sm-12" style="padding-right: 5px;">
			  	  	<label class="control-label">Select your project</label>
					<select id="upNoId" class="taForm taForm-disable" name="upNo" disabled>
						<option value="0">Select your project</option>
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
		  		  	  <input id="utStartDayId" type="text" class="form-control input-height" name="utStartDay" disabled>
		  		  </div>
		  		</div>
			  	<div class="col-sm-6" style="padding-left: 5px;padding-right: 5px;">
		  		  <label class="control-label">End date</label>
		  		  <div class="input-group" style="float:right; width: 100%;">
		  		  	  <span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
		  		  	  <input id="utEndDayId" type="text" class="form-control input-height" name="utEndDay" disabled>
		  		  </div>
		  		</div>
	  		  </div>
			  <div class="row">
		  		<div class="col-sm-6" style="padding-right: 0px;">
		  			<label class="control-label">Working Hours</label>
		  			<div class="input-group" style="float:right; width: 100%;">
		  		  	  <span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-time" aria-hidden="true"></span></span>
		  		  	  <input id="utTaskHourId" class="form-control input-height" type="text" name="utTaskHour" disabled/>
		  		    </div>
		  		</div>
		  		<div class="col-sm-6" style="padding-left: 5px;padding-right: 5px;">
		  			<label class="control-label">Margin of Error</label>
		  			<div class="input-group" style="float:right; width: 100%;">
		  			  <span class="input-group-addon"><span style="font-size: 17px;">±</span></span>
		  		  	  <input id="utMarginHourId" class="form-control input-height" type="text" name="utMarginHour" disabled/>
		  		    </div>
	  		  	</div>
	  		  </div>
	  		</div>
	  		<div class="col-sm-8 col-md-8">
	  		  <div class="row">
		  		<div class="col-sm-9" style="padding-right: 0px;">
		  		  <label class="control-label">Title</label>
		  		  <input id="utTitleId" class="form-control input-height" type="text" name="utTitle" disabled/>
		  		</div>
		  		<div class="col-sm-3"> 
			  	  	<label class="control-label">Kind</label>
					<select id="utKindId" class="form-control input-height" name="utKind" disabled>
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
	  		  <textarea id="utTaskId" class="taForm" style="height: 155px;" name="utTask" placeholder="Detail" rows="35" disabled></textarea>
	  		</div>
	  	  </div>
		  <input type="hidden" id="utNoId" name="utNo" />
		  <input type="hidden" id="utSortId" name="utSort" />
		  <input type="hidden" id="tokenId" name="token" />
		  <br/>
		  <p align="center">
	        <button class="btn btn-primary" type="button" onClick="updateFormCancel();"><@spring.message "tasks.button.cancel"/></button>
		  </p>
	  </div>

	  <div>
	    <#if model??>
	    <#if model.userTasksList?has_content>
	    <#list model.userTasksList as userTasks> 
	    <#assign size=model.userTasksList?size - userTasks?counter>
			<div id="sort_${userTasks.utSort?if_exists}" class="item-box item-bar bgrow" style="margin-bottom: 2px;cursor: pointer;" onclick="selectUserTasks(this, '${model.users.userId?if_exists}', '${userTasks.utNo?if_exists}');">
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
				<#assign size=model.userTasksList?size - userTasks?counter>
				<div class="percent" style="left:${percent}%;">${userTasks.utProgress?if_exists}%</div>
				<input type="hidden" name="utNo" value="${userTasks.utNo?if_exists}"/>
			</div>
			<input type="hidden" name="utSort" value="${userTasks.utSort?if_exists}"/>
		</#list>
		</#if>
		</#if>
		<input type="hidden" name="token" value="<#if model??>${model.token?if_exists}</#if>" />

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

<#include "/apps/common/abilistsWorksLoadJs.ftl"/>
<#include "js/viewTasksListJs.ftl"/>

<script>
<#include "charts/chartTasks.ftl"/>
</script>

</@layout.myLayout>