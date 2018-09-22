<#import "/apps/layout/profile/abilistsProfileLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box">
<nav class="breadcrumbs">
	<ul>
	<li><a href="/abilists">${model.users.userId?if_exists}</a></li>
	<li><a href="${configBean.baseURL?if_exists}/profile"><@spring.message "navi.title.profile"/></a></li>
	<li class="active">
		<a href="#">
			<@spring.message "profile.menu.techs"/>
		</a>
	</li>
	</ul>
</nav>
</div>

<div class="row">
	<div class="col-sm-3 right-col-cus sideImg">
<#include "/apps/common/abilistsProfile.ftl"/>
	</div>
	<div class="col-sm-9 left-col-cus">
		<div class="caption mittle-size-title"><h4><@spring.message "profile.menu.skills"/> <@spring.message "profile.menu.list"/></h4></div>
		<div class="item-box">
			<canvas id="myChart" height="230px" width="700px"></canvas>
		</div>
	</div>
</div>

<div class="row">
<div class="col-md-12">
	<#include "/apps/common/errorMessage.ftl"/>
	<#include "/apps/common/abilistsSuccess.ftl"/>

  	<div id="skills" class="caption mittle-size-title">
  		<h4>
			<@spring.message "profile.menu.skills"/>
  		</h4>
  	</div>

	<div class="item-box">
		<table id="tableSkillsListId" class="table table-striped">
			<tr style="background-color: #eeeeec;">
				<th class="my_profile">
				<@spring.message "profile.table.tech.title"/>
				</th>
				<th class="my_profile">
			  	<@spring.message "profile.table.skill.title"/>
				</th>
				<th class="my_profile">
			  	<@spring.message "profile.table.proficiency.title"/>
				</th>
				<th class="my_profile">
			  	<@spring.message "profile.table.addition.title"/>
				</th>
			</tr>
		<#if model??>
		<#if model.userSkillsList?has_content>
			<#list model.userSkillsList as userSkills>
			<#if userSkills.usSkill == "${configBean.techSkillBean.skillTitleList[0]?if_exists}">
			<tr>
				<td>${userSkills.usKind?if_exists}</td>
				<td>
					<#if commonBean??>
					<#if commonBean.getMtechMap("tech")?has_content>
						<#list commonBean.getMtechMap("tech")?keys as key>
							<#if userSkills.usKind == "${key?if_exists}">
							<#list commonBean.getMtechMap("tech")[key] as tech>
								<#if userSkills.mtNo == tech.mtNo>
								${tech.mtName?if_exists}
								</#if>
							</#list>
							</#if>
						</#list>
					</#if>
					</#if>
				</td>
				<td>
				<#if commonBean??>
				<#if commonBean.mTechDetailMap?has_content>
					<#list commonBean.mTechDetailMap?keys as key>
						<#if userSkills.mtNo?c?string = "${key?if_exists}">
							<#list commonBean.mTechDetailMap[key] as techDetail>
								<#if techDetail.mlCode?has_content>
								<#if techDetail.mlCode == "${lang?if_exists}">
									<#if userSkills.usLevel?string == techDetail.mtdLevel?string>
										${techDetail.mtdLevelExplain?if_exists}
									</#if>
								</#if>
								</#if>
							</#list>
						</#if>
					</#list>
				</#if>
				</#if>
				</td>
				<td>${userSkills.usDetail?if_exists}</td>
			</tr>
			</#if>
			</#list>
		</#if>
		</#if>
		</table>
	</div>

  	<div id="lang" class="caption mittle-size-title">
  		<h4>
			<@spring.message "profile.menu.lang"/>
  		</h4>
  	</div>

	<div class="item-box">
	<table id="tableLangListId" class="table table-striped">
		<tr style="background-color: #eeeeec;">
			<th class="my_profile">
			<@spring.message "profile.table.tech.title"/>
			</th>
			<th class="my_profile">
		  	<@spring.message "profile.table.skill.title"/>
			</th>
			<th class="my_profile">
		  	<@spring.message "profile.table.proficiency.title"/>
			</th>
			<th class="my_profile">
		  	<@spring.message "profile.table.addition.title"/>
			</th>
		</tr>
	<#if model??>
	<#if model.userSkillsList?has_content>
		<#list model.userSkillsList as userSkills>
		<#if userSkills.usSkill == "${configBean.techSkillBean.skillTitleList[1]?if_exists}">
		<tr>
			<td>${userSkills.usKind?if_exists}</td>
			<td>
				<#if commonBean??>
				<#if commonBean.getMtechMap("lang")?has_content>
					<#list commonBean.getMtechMap("lang")?keys as key>
						<#if userSkills.usKind == "${key?if_exists}">
						<#list commonBean.getMtechMap("lang")[key] as tech>
							<#if userSkills.mtNo == tech.mtNo>
							${tech.mtName?if_exists}
							</#if>
						</#list>
						</#if>
					</#list>
				</#if>
				</#if>
			</td>
			<td>
			<#if commonBean??>
			<#if commonBean.mTechDetailMap?has_content>
				<#list commonBean.mTechDetailMap?keys as key>
					<#if userSkills.mtNo?c?string = "${key?if_exists}">
						<#list commonBean.mTechDetailMap[key] as techDetail>
							<#if techDetail.mlCode?has_content>
							<#if techDetail.mlCode == "${lang?if_exists}">
								<#if userSkills.usLevel?string == techDetail.mtdLevel?string>
									${techDetail.mtdLevelExplain?if_exists}
								</#if>
							</#if>
							</#if>
						</#list>
					</#if>
				</#list>
			</#if>
			</#if>
			</td>
			<td>${userSkills.usDetail?if_exists}</td>
		</tr>
		</#if>
		</#list>
	</#if>
	</#if>
	</table>
	</div>

  	<div id="certi" class="caption mittle-size-title">
  		<h4>
			<@spring.message "profile.menu.certi"/>
  		</h4>
  	</div>

	<div class="item-box">
	<table id="tableCertiListId" class="table table-striped">
		<tr style="background-color: #eeeeec;">
			<th class="my_profile">
			<@spring.message "profile.table.tech.title"/>
			</th>
			<th class="my_profile">
		  	<@spring.message "profile.table.skill.title"/>
			</th>
			<th class="my_profile">
		  	<@spring.message "profile.table.proficiency.title"/>
			</th>
			<th class="my_profile">
		  	<@spring.message "profile.table.addition.title"/>
			</th>
		</tr>
	<#if model??>
	<#if model.userSkillsList?has_content>
		<#list model.userSkillsList as userSkills>
		<#if userSkills.usSkill == "${configBean.techSkillBean.skillTitleList[2]?if_exists}">
		<tr>
			<td>${userSkills.usSkill?if_exists}</td>
			<td>
			<#if commonBean??>
			<#if commonBean.getMtechMap("certi")?has_content>
				<#list commonBean.getMtechMap("certi")?keys as key>
					<#if userSkills.usKind == "${key?if_exists}">
					<#list commonBean.getMtechMap("certi")[key] as tech>
						<#if userSkills.mtNo == tech.mtNo>
						${tech.mtName?if_exists}
						</#if>
					</#list>
					</#if>
				</#list>
			</#if>
			</#if>
			</td>
			<td>
			<#if commonBean??>
			<#if commonBean.mTechDetailMap?has_content>
				<#list commonBean.mTechDetailMap?keys as key>
					<#if userSkills.mtNo?c?string = "${key?if_exists}">
						<#list commonBean.mTechDetailMap[key] as techDetail>
							<#if techDetail.mlCode?has_content>
							<#if techDetail.mlCode == "${lang?if_exists}">
								<#if userSkills.usLevel?string == techDetail.mtdLevel?string>
									${techDetail.mtdLevelExplain?if_exists}
								</#if>
							</#if>
							</#if>
						</#list>
					</#if>
				</#list>
			</#if>
			</#if>
			</td>
			<td>${userSkills.usDetail?if_exists}</td>
		</tr>
		</#if>
		</#list>
	</#if>
	</#if>
	</table>
	</div>

  </div><!-- col-sm-12 -->
</div><!-- row -->

<#include "/apps/common/abilistsProfileLoadJs.ftl"/>
<#include "js/viewSkillsJs.ftl"/>

<#include "skills/skillsChart.ftl"/>

</@layout.myLayout>