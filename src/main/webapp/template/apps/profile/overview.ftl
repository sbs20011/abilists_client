<#import "/apps/layout/profile/abilistsProfileLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<!-- Jquery UI -->
<link rel="stylesheet" href="${configBean.contextPath?if_exists}/static/apps/lib/jquery-ui-1.12.1/jquery-ui.css">

<style>

ul.center {
	display: inline-block;
	list-style: none;
	overflow: hidden; 
	width:100%; 
	padding-left:0px;
	margin: 0px;
}

ul li.overview{
	float:left;
	width: 48.5%;
	max-width:100%;
	background: #fff none repeat scroll 0 0;
	margin: 5px;
}

</style>

	<div class="item-box">
		<nav class="breadcrumbs">
			<ul>
			<li><a href="/abilists">${model.users.userId?if_exists}</a></li>
			<li><a href="${configBean.baseURL?if_exists}/profile"><@spring.message "navi.title.profile"/></a></li>
			<li class="active"><a href="#"><@spring.message "profile.menu.overview"/></a></li>
			</ul>
		</nav>
	</div>

	<div class="row">
		<div class="col-md-3 right-col-cus sideImg">
<#include "/apps/common/abilistsProfile.ftl"/>
		</div>
		<div class="col-md-9 left-col-cus">
			<div class="caption mittle-size-title"><h5><@spring.message "profile.graph.career"/></h5></div>
			<div class="item-box">
				<canvas id="myCareerBar" height="102px"/>
			</div>
		</div>
	</div>

	<div style="width: 101%;">
		<ul id="chartId" class="center">
		  <li class="overview">
			<div class="caption mittle-size-title"><h5><@spring.message "profile.graph.industry"/></h5></div>
			<canvas id="myIndustryDoughnut"/>
		  </li>
		  <li class="overview">
			<div class="caption mittle-size-title"><h5><@spring.message "profile.graph.role"/></h5></div>
			<canvas id="myRoleBar"/>
		  </li>
		  <li class="overview">
			<div class="caption mittle-size-title"><h5><@spring.message "profile.graph.tech"/></h5></div>
			<canvas id="myTechBar"/>
		  </li>
		  <li class="overview">
			<div class="caption mittle-size-title"><h5><@spring.message "profile.graph.language"/></h5></div>
			<canvas id="myLangBar"/>
		  </li>
		  <li class="overview">
			<div class="caption mittle-size-title"><h5><@spring.message "profile.graph.certificate"/></h5></div>
			<canvas id="myCertiBar"/>
		  </li>
		  <li class="overview">
		    <div class="caption mittle-size-title"><h5><@spring.message "profile.graph.skills"/></h5></div>
			<canvas id="mySkillsBar"/>
		  </li>
		</ul>
	</div>

	<#include "/apps/common/abilistsProfileLoadJs.ftl"/>
	<script src="/static/apps/lib/jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<#include "js/overviewJs.ftl"/>

	<script type="text/javascript">
	<#include "overview/chartCareer.ftl"/>
	<#include "overview/chartIndustry.ftl"/>
	<#include "overview/chartSkills.ftl"/>
	<#include "overview/chartTech.ftl"/>
	<#include "overview/chartLang.ftl"/>
	<#include "overview/chartCerti.ftl"/>
	<#include "overview/chartRole.ftl"/>

	/////////////////////////////////////////////////////////////////////////////////////
	// This is sample
	/*
	var data = {
		datasets: [{
			data: [
				<#if model??>
				<#if model.userSkillsSumBySkillList?has_content>
					<#list model.userSkillsSumBySkillList as userSkillsSumBySkill>
						"${userSkillsSumBySkill.cntUsSkill?if_exists?c}"<#if userSkillsSumBySkill?has_next>,</#if>
					</#list>
				</#if>
				</#if>
				],
			label: 'Left dataset',
			yAxisID: 'left-y-axis'
		}, {
			data: [0.1, 0.5, 1.0, 2.0, 1.5, 0],
			label: 'Right dataset',
			yAxisID: 'right-y-axis'
		}],
		labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']
	};
	
	var option = {
		responsive: true,
		scales: {
	        yAxes: [{
	            id: 'left-y-axis',
	            type: 'linear',
	            position: 'left'
	        }, {
	            id: 'right-y-axis',
	            type: 'linear',
	            position: 'right'
	        }]
	    }
	};
	var ctx = document.getElementById("myTest").getContext("2d");
	var myTest = new Chart(ctx, {
	    type: 'line',
	    data: data,
	    options: option
	});
	*/

	</script>

</@layout.myLayout>