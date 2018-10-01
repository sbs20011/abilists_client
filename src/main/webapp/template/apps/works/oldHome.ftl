<#import "/apps/layout/works/abilistsWorksLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box">
	<div class="row">
		<div class="col-md-6">
			<nav class="breadcrumbs">
			<ul>
			<li><a href="#">${model.users.userId?if_exists}</a></li>
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
		<div class="caption mittle-size-title"><h4><@spring.message "navi.title.works.reports"/>[<@spring.message "reports.title.workhour"/>]</h4></div>
		<div class="item-box">
			<canvas id="myWorkingHourBar" height="102px"/>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-6 right-col-cus">
		<div class="caption mittle-size-title"><h4><@spring.message "navi.title.projects"/>[<@spring.message "profile.graph.industry"/>]</h4></div>
		<div class="item-box">
			<canvas id="myIndustryPie" height="160px"/>
	  </div>
	</div>
	<div class="col-md-6 left-col-cus">
		<div class="caption mittle-size-title"><h4><@spring.message "navi.title.projects"/>[<@spring.message "profile.graph.role"/>]</h4></div>
		<div class="item-box">
			<canvas id="myRolePie" height="160px"/>
	  </div>
	</div>
</div>

<#include "/apps/common/abilistsWorksLoadJs.ftl"/>
<!-- Chart.js -->
<script src="${configBean.contextPath?if_exists}/static/apps/lib/chart-2.7/Chart.bundle.min.js?2017092301"></script>
<script src="${configBean.contextPath?if_exists}/static/apps/lib/chart-2.7/Chart.min.js?2017092301"></script>
<script src="${configBean.contextPath?if_exists}/static/apps/lib/utils.js?2017092302"></script>

<script type="text/javascript">

<#include "home/chartTech.ftl"/>
<#include "home/chartWorkingHours.ftl"/>
<#include "home/chartRole.ftl"/>
<#include "home/chartIndustry.ftl"/>

</script>

</@layout.myLayout>