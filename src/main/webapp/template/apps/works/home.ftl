<#import "/apps/layout/works/abilistsWorksLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<!-- Time Line -->
<link href="${configBean.contextPath?if_exists}/static/apps/css/timeline.css" rel="stylesheet">
<link href="${configBean.contextPath?if_exists}/static/apps/css/abilists/index.css?2017122701" rel="stylesheet">
<!-- Jquery UI -->
<link rel="stylesheet" href="${configBean.contextPath?if_exists}/static/apps/lib/jquery-ui-1.12.1/jquery-ui.css">

<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" id="popupView" >
    </div>
  </div>
</div>

<div class="item-box">
<div class="row">
	<div class="col-md-6">
		<nav class="breadcrumbs">
		<ul>
		<li><a href="${configBean.baseURL?if_exists}/works"><@spring.message "navi.title.works"/></a></li>
		<li class="active"><a href="#"><@spring.message "navi.title.works.home"/></a></li>
		</ul>
		</nav>
	</div>
	<div class="col-md-6">
		
	</div>
</div>
</div>

<div class="row">
<div class="col-md-3 right-col-cus sideImg">
	<div class="item-box">
		<img style="border-radius: 4px;" src="${model.users.userImgAvatar?if_exists}" id="showImg" width="210" alt="your picture" />
    </div>
</div>
<div class="col-sm-9">
	<div class="item-box">
		<canvas id="myTechBar" height="88px"/>
	</div>
</div>
</div>

<div class="row nav-top">
	<div class="col-md-6 right-col-cus">

		<div class="caption mittle-size-title middle-works-bg"><h4><@spring.message "home.title.reports"/></h4></div>
		<div class="item-box">
			<form id="reportsFormId" class="form-horizontal" action="${configBean.baseURL?if_exists}/works/udtReports" method="post">

		        <div>
		        	<label><@spring.message "home.title.reports.project"/></label>
		        </div>
		        <div>
		        	<div>
						<select class="form-control" onchange="return addProjectName(this);">
						<#if model.userProjectsList??>
							<#list model.userProjectsList as userProjects>
							<option value="${userProjects.upNo?if_exists}">${userProjects.upName?if_exists}</option>
							</#list>
						</#if>
						</select>
					</div>
		        </div>
		        <div>
		        	<div class="input-group" style="float:left; width: 45%;">
		        		<span class="input-group-addon"><span id="workHourId" class="glyphicon glyphicon-time" aria-hidden="true"></span></span>
			  			<input class="form-control" type="text" name="urWorkHour" placeholder="Working Hours" onmouseover="showPopover(this);" onmouseout="destroyPopover(this)"
			  				data-toggle="popover" data-trigger="manual" data-placement="top" title="Working time" data-content="Please fill out your working time" 
			  					value="<#if model.userReports??>${model.userReports.urWorkHour?if_exists}</#if>"/>
					</div>
					<div class="input-group" style="float:left; width: 55%;">
						<span class="input-group-addon"><span id="calendarId" class="glyphicon glyphicon-calendar" aria-hidden="true"></span></span>
						<input class="form-control" type="text" id="urWorkDayId" name="urWorkDay" value="<#if model.userReports??>${model.userReports.urWorkDay?string('yyyy-MM-dd')?if_exists}</#if>">
					</div>
				</div>
		        <div>
		        	<textarea class="taForm" style="height: 200px;" id="urReportsId" name="urReport" placeholder="Today working" rows="25"
		        		data-toggle="popover" data-trigger="manual" data-placement="top" title="User reports" data-content="Please fill out your reports"><#if model.userReports??>${model.userReports.urReport?if_exists}</#if></textarea>
		        </div>

			<input type="hidden" name="token" value="<#if model??>${model.token?if_exists}</#if>" />
			<p align="center">
				<button class="btn btn-primary" type="button" data-toggle="tooltip" title="Tooltip on left" 
					onclick="return confirmData('reportsFormId');"><@spring.message "home.title.reports.send"/></button>
				<button class="btn btn-primary" type="button" onClick="clearReports();"><@spring.message "home.title.reports.clear"/></button>
			</p>
			</form>
		</div><!-- item-box -->

		<div class="caption mittle-size-title middle-works-bg"><h4><@spring.message "home.title.profile"/></h4></div>
		<div class="item-box">
		<#if model??>
		<#if model.usersList?has_content>
		<ul style="padding: 0;" class="list-unstyled top_profiles">
			<#list model.usersList as user>
	            <li class="media" style="margin-top: 5px;">
	                <div class="pull-left thumbnail-hover">
	                    <div class="overflow-hidden">
	                        <img width="50" alt="image" src="${user.userImgAvatar?if_exists}">
	                    </div>
	                </div>
	                <div style="float: left">
		                <a href="${configBean.baseURL?if_exists}/works/${user.userId?if_exists}" class="title">${user.userId?if_exists}</a>
		                <p>${user.userName?if_exists} ${user.updateTime?string('yyyy/MM/dd')?if_exists}</p>
	                </div>
	                <a href="${configBean.baseURL?if_exists}/works/${user.userId?if_exists}" class="div-right profile-div-right">
	                	<span class="glyphicon glyphicon-option-horizontal"></span>
                    </a>
	            </li>
	        </#list>
	    </ul>
		</#if>
		</#if>
		</div>
	</div><!-- col-md-6 right-col-cus -->

	<div class="col-md-6 left-col-cus">

		<div class="caption mittle-size-title middle-works-bg"><h4><@spring.message "home.title.reports.timeline"/></h4></div>
		<div class="item-box">
	      <#if model??>
	      <#if model.userReportsList?has_content>
	      <ul class="timeline">
	      	<#list model.userReportsList as userReports>

	      		<#if (userReports_index % 2) == 0 >
	      			<li>
		                <div class="timeline-badge" style="background-color: #4670b5;">
	                	<span class="glyphicon glyphicon-chevron-left" style="line-height: 2.5;" aria-hidden="true"></span>
	                	</div>
	      		<#else>
	      			<li class="timeline-inverted">
		                <div class="timeline-badge" style="background-color: #46b562;">
	                	<span class="glyphicon glyphicon-chevron-right" style="line-height: 2.5;" aria-hidden="true"></span>
	                	</div>
	      		</#if>
	                <div class="timeline-panel">
	                    <div class="timeline-heading">
	                        <h5 class="timeline-title">
	                		<a href="#" onclick="viewReports('${userReports.urWorkDay?string('yyyy-MM-dd')?if_exists}'); return false;">
	                        	${userReports.urWorkDay?string('yyyy-MM-dd')?if_exists}
	                        </a>
	                        </h5>
	                    </div>
	                    <div class="timeline-body">
	                        <p>
	                          <#if userReports.urReport??>
								<#if 50 < userReports.urReport?length >
								${userReports.urReport?if_exists[0..50]}...
								<#else>
								${userReports.urReport?if_exists}
								</#if>
							  </#if>
	                        </p>
	                    </div>
	                </div>
                </li>

			</#list>
	      </ul>
	      </#if>
	      </#if>
		</div>

	</div>
</div><!-- row -->

<#--
<div class="row">
<div class="col-md-8 right-col-cus">
	<div class="caption mittle-size-title middle-works-bg"><h4><@spring.message "home.title.reports.timeline"/></h4></div>
	<div class="item-box">
	</div>
</div>
<div class="col-md-4 left-col-cus">
<div class="caption mittle-size-title middle-works-bg"><h4><@spring.message "home.title.notification"/></h4></div>
	<div class="item-box">
		<#include "temp/noti.ftlo"/>
	</div>
</div>
</div>
-->

<#include "/apps/common/abilistsWorksLoadJs.ftl"/>

<#include "js/homeJs.ftl"/>

<script type="text/javascript">

window.onload = function() {
	$('#loading').hide();
}

<#include "home/chartTech.ftl"/>

</script>

</@layout.myLayout>