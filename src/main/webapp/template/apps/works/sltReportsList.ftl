<#import "/apps/layout/abilistsWorksLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<link href="${configBean.contextPath?if_exists}/static/apps/css/works/reports.css?20180723" rel="stylesheet">

<style>
div.ui-datepicker{
	width: 270px;
}
ul li.header {
	list-style-type: none;
	display: table-cell;
}
</style>

<div class="item-box">
	<div class="row">
		<div class="col-md-6" style="float:left;">
			<nav class="breadcrumbs">
			<ul>
			<li><a href="#">${model.users.userId?if_exists}</a></li>
			<li><a href="/works"><@spring.message "navi.title.works"/></a></li>
			<li class="active"><a href="#"><@spring.message "path.abilists.reports"/></a></li>
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
			<img style="border-radius: 4px;" src="${myPicture?if_exists}" id="showImg" width="125" alt="your picture" />
	    </div>
	</div>
	<div class="col-sm-10">
		<div class="item-box">
			<canvas id="myReportsBar" height="125px"/>
		</div>
	</div>
</div>


<div class="row">
  <div class="col-md-12">
  	<div class="caption mittle-size-title middle-works-bg">
  		<h4>
  			<@spring.message "path.abilists.reports"/>
  			<span id="newToggleId" class="glyphicon glyphicon-chevron-down right-symbol-button" style="color:#337ab7;" aria-hidden="true" onClick="newFormToggle();"></span>
  		</h4>
  	</div>

	<#include "/apps/common/errorMessage.ftl"/>
	<#include "/apps/common/abilistsSuccess.ftl"/>

	  <div class="item-box" id="newMdataFormId" style="display: none;">

	  	<form name="newForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/works/istReports" method="post" id="newFormId" onkeypress="return captureReturnKey(event);">
	  	<div class="row">
	  		<div class="col-sm-3 col-md-3" style="padding-right: 5px;">
	  		  <div class="row">
	  			<div class="col-sm-12" style="padding-right: 5px;">
			  	  	<label class="control-label">Select your project</label>
					<select class="form-control" onchange="return addProjectName(this, 'newUrReportsId');">
						<option value="0">Select your project</option>
					<#if model.userProjectsList??>
						<#list model.userProjectsList as userProjects>
						<option value="${userProjects.upNo?if_exists}">${userProjects.upName?if_exists}</option>
						</#list>
					</#if>
					</select>
				</div>
			  </div>
  		  	  <div class="row">
  		  	    <div class="col-sm-12" style="padding-right: 5px;">
		  		  <label class="control-label">Select Calander</label>
		  		  <div class="input-group" style="float:right; width: 100%;">
		  		  	  <span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
		  		  	  <input type="text" class="form-control" id="newUrWorkDayId" name="urWorkDay">
		  		  </div>
		  		</div>
	  		  </div>
  		  	  <div class="row">
		  		<div class="col-sm-12" style="padding-right: 5px;">
		  			<label class="control-label">Working Hours</label>
		  			<div class="input-group" style="float:right; width: 100%;">
		  		  	  <span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-time" aria-hidden="true"></span></span>
		  		  	  <input class="form-control" type="text" name="urWorkHour" />
		  		    </div>
		  		</div>
	  		  </div>
	  		</div>
	  		<div class="col-sm-9 col-md-9">
	  			<label class="control-label">Today your reports</label>
	  			<textarea class="taForm" style="height: 155px;" id="newUrReportsId" name="urReport" placeholder="Detail" rows="35"></textarea>
	  		</div>
	  	</div>
	  	<input type="hidden" name="token" value="<#if model??>${model.token?if_exists}</#if>" />
	  	<br/>
		<p align="center">
			<button type="button" class="btn btn-primary" onclick="return confirmData('newFormId');" >Send</button>
			<button class="btn btn-primary" type="button" onClick="newFormCancel();">Cancel</button>
		</p>
		</form>

	  </div>

	  <div class="item-box" id="udtMdataFormId" style="background-color: #f7f5ff; display: none;">
		<form name="updateForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/works/udtReports" method="post" id="updateFormId" onkeypress="return captureReturnKey(event);">
	  	  <div class="row">
  		    <div class="col-sm-3 col-md-3" style="padding-right: 5px;">
  		      <div class="row">
		  	    <div class="col-sm-12" style="padding-right: 5px;">
			  	  	<label class="control-label">Select your project</label>
					<select class="form-control" onchange="return addProjectName(this, 'udtUrReportsId');">
						<option value="0">Select your project</option>
					<#if model.userProjectsList??>
						<#list model.userProjectsList as userProjects>
						<option value="${userProjects.upNo?if_exists}">${userProjects.upName?if_exists}</option>
						</#list>
					</#if>
				    </select>
				</div>
			  </div>
	  		  <div class="row">
	  		  	<div class="col-sm-12" style="padding-right: 5px;">
	  		  	  <label class="control-label">Select Calander</label>
			  	  <div class="input-group" style="float:right; width: 100%;">
			  	    <span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
			  		<input type="text" class="form-control" id="udtUrWorkDayId" name="urWorkDay">
			  	  </div>
			  	</div>
			  </div>
	  		  <div class="row">
			  	<div class="col-sm-12" style="padding-right: 5px;">
		  			<label class="control-label">Working Hours</label>
				  	<div class="input-group" style="float:right; width: 100%;">
				  		<span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-time" aria-hidden="true"></span></span>
				  		<input class="form-control" type="text" id="udtUrWorkHourId" name="urWorkHour" />
				  	</div>
		  		</div>
			  </div>
		  	</div>
		  	<div class="col-sm-9 col-md-9">
	  			<label class="control-label">Today your reports</label>
	  			<textarea class="taForm" style="height: 155px;" id="udtUrReportsId" name="urReport" placeholder="Detail" rows="25"></textarea>
		  	</div>
	  	  </div>
		  <input type="hidden" id="urNoId" name="urNo" />
		  <input type="hidden" id="tokenId" name="token" />
		  <br/>
			<p align="center">
		      <button type="button" onclick="return confirmData('updateFormId');" class="btn btn-primary" data-toggle="modal">
		      	<@spring.message "reports.button.confirm"/>
		      </button>
		      <button class="btn btn-primary" type="button" onClick="updateFormCancel();"><@spring.message "reports.button.cancel"/></button>
		      <button class="btn btn-danger" type="button" onclick="removeReports()"><@spring.message "reports.title.delete"/></button>
			</p>
		</form>
	  </div>

	  <div id="userReportsId">

	    <#if model??>
	    <#if model.userReportsList?has_content>
	    <#list model.userReportsList as userReports>

	    <#assign size=model.userReportsList?size - userReports?counter>
			<div class="item-box item-bar bgrow" 
				onclick="selectUserReports(this, '${model.users.userId?if_exists}', '${userReports.urWorkDay?string('yyyy-MM-dd')?if_exists}');">
				<div class="contents">
					<h4 class="media-heading">${userReports.urWorkDay?string('yyyy-MM-dd')?if_exists}</h4>
					<#if userReports.urReport??>
						<#if 180 < userReports.urReport?length >
						${userReports.urReport?if_exists[0..180]}...
						<#else>
						${userReports.urReport?if_exists}
						</#if>
					</#if>
				</div>
				<div class="bar" style="width:${userReports.urWorkHour?if_exists}0%; background-color: rgba(255, 233, 216, 0.${size});"></div>
				<#if userReports.urWorkHour??>
					<#if userReports.urWorkHour?number &gt; 8>
						<#assign percent=userReports.urWorkHour?number - 2>
					<#else>
						<#assign percent=userReports.urWorkHour>
					</#if>
				</#if>
				<div class="percent" style="left:${percent}0%;">${userReports.urWorkHour?if_exists}H</div>
				<input type="hidden" name="urNo" value="${userReports.urNo?if_exists}"/>
			</div>
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
			<li><a href="sltReportsList?nowPage=${model.paging.prevPage.nowPage}&allCount=${model.paging.allCount?c}" title="Prev" accesskey="*">Prev</span></a></li>
			</#if>
			<#if model.paging.pagingInfoList?has_content>
				<#list model.paging.pagingInfoList as pageList>
					<#if model.paging.nowPage?if_exists == pageList.pageNumber?if_exists>
					<li class="active"><a href="#">${pageList.pageNumber} <span class="sr-only">(current)</span></a></li>
					<#else>
					<li><a href="sltReportsList?nowPage=${pageList.pageNumber}&allCount=${model.paging.allCount?c}">${pageList.pageNumber}</a></li>
					</#if>
				</#list>
			</#if>
			<#if model.paging.nextPage?exists>
			<li><a href="sltReportsList?nowPage=${model.paging.nextPage.nowPage}&allCount=${model.paging.allCount?c}" accesskey="#" title="Next">Next</a></li>
			</#if>
		</#if>
		</#if>
      	</ul>
      </nav><!-- end #nav -->

	</div><!-- col-md-12 -->
</div><!-- row -->


<!-- Modal -->
<div class="modal fade" id="submitFormUserReports" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel"><@spring.message "reports.title.modal"/></h4>
      </div>

      <div id="confirmMessage" class="modal-body">
		<table id="t03" class="table-line-break">
		<tr>
			<td><@spring.message "reports.title.workday"/></td>
			<td><@spring.message "reports.title.reports"/></td>
		</tr>
		<tr>
			<td class="line-break"></td>
			<td class="line-break"></td>
		</tr>
		</table>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button id="submitForm" type="button" class="btn btn-primary">Save Data</button>
      </div>
    </div>
  </div>
</div>

<!-- Delete Modal -->
<div class="modal fade" id="submitFormDeleteReports" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="modal-title" id="dltReportsTileId"><@spring.message "projects.title.modal"/></h4>
    </div>

    <div id="confirmMessage" class="modal-body">
    	<@spring.message "projects.confirm.message.delete"/>
    </div>

    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
      <button id="submitForm" type="button" class="btn btn-danger" onclick="javascript: submitDeleteFormReports();"><@spring.message "projects.button.delete"/></button>
    </div>
  </div>
</div>
</div>

<#include "/apps/common/abilistsWorksLoadJs.ftl"/>
<#include "js/sltReportsListJs.ftl"/>

<script type="text/javascript">
<#include "charts/chartReports.ftl"/>
</script>

</@layout.myLayout>