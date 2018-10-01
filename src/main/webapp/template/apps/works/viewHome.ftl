<#import "/apps/layout/works/abilistsWorksLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<!-- Time Line -->
<link href="${configBean.contextPath?if_exists}/static/apps/css/timeline.css" rel="stylesheet">
<link href="${configBean.contextPath?if_exists}/static/apps/css/abilists/index.css?2017122702" rel="stylesheet">
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

<div class="row">
	<div class="col-sm-12">
		<div class="caption mittle-size-title middle-works-bg"><h4><@spring.message "navi.title.works.reports"/>[<@spring.message "reports.title.workhour"/>]</h4></div>
		<div class="item-box">
			<canvas id="myWorkingHourBar" height="90px"/>
		</div>
	</div>
</div>

<div class="row nav-top">
	<div class="col-md-6 right-col-cus">
		<div class="caption mittle-size-title middle-works-bg"><h4><@spring.message "navi.title.projects"/>[<@spring.message "profile.graph.industry"/>]</h4></div>
		<div class="item-box">
			<canvas id="myIndustryPie" height="160px"/>
		</div>
		<div class="caption mittle-size-title middle-works-bg"><h4><@spring.message "navi.title.projects"/>[<@spring.message "profile.graph.role"/>]</h4></div>
		<div class="item-box">
			<canvas id="myRolePie" height="160px"/>
		</div>
	</div><!-- col-md-6 right-col-cus -->

	<div class="col-md-6 left-col-cus">
		<div class="caption mittle-size-title"><h4><@spring.message "home.title.reports.timeline"/></h4></div>
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

<#include "/apps/common/abilistsWorksLoadJs.ftl"/>

<script type="text/javascript">

<#include "home/chartTech.ftl"/>
<#include "home/chartWorkingHours.ftl"/>
<#include "home/chartRole.ftl"/>
<#include "home/chartIndustry.ftl"/>

</script>

</@layout.myLayout>