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
			<@spring.message "profile.menu.skills"/>
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
		<div class="caption mittle-size-title"><h4>${model.users.userId?if_exists}<@spring.message "profile.graph.title.user"/></h4></div>
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
			<@spring.message "profile.menu.techs"/>
			<span id="newToggleSkillsId" class="glyphicon glyphicon-chevron-down right-symbol-button" style="color:#337ab7;" aria-hidden="true" onclick="newFormSkills();"></span>
  		</h4>
  	</div>

  	<!-- skills form - start -->
	<div class="item-box" id="newUserSkillsForm"  style="margin-bottom: 1px; display: none;">
		<form name="newSkillsForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/profile/istUserSkills" method="post" id="contact_form" onkeypress="return captureReturnKey(event);">
			<table id="newSkillsFormId" style="width:100%">
			<tr>
				<td width="12%"><@spring.message "profile.menu.techs"/></td>
				<td>
					<select class="taForm" name="usKind" onchange="changeUtKindSelect(skillsList, 0)">
						<option value="0"><@spring.message "select.default.tech"/></option>
					<#if commonBean??>
					<#if commonBean.getMtechMap("tech")?has_content>
						<#list commonBean.getMtechMap("tech")?keys as key>
						<option value="${key?if_exists}">${key?if_exists}</option>
						</#list>
					</#if>
					</#if>
					</select>
				</td>
				<td width="12%"><@spring.message "profile.menu.skills"/></td>
				<td>
					<select class="taForm" name="mtNo" onchange="changeUtLevelSelect(0)">
					</select>
				</td>
				<td width="12%"><@spring.message "profile.table.proficiency.title"/></td>
				<td>
					<select class="taForm" name="usLevel" style="width: 100%;">
					</select>
				</td>
			</tr>
			<tr>
				<td width="12%"><@spring.message "profile.table.addition.title"/></td>
				<td colspan="5"><textarea class="taForm"  name="usDetail" placeholder="explian" rows="1"></textarea></td>
			</tr>
			</table>

			<br/>
			<p align="center">
				<button class="btn btn-primary" type="button" onclick="return confirmData('newSkillsFormId', skillsList);" data-toggle="modal"><@spring.message "projects.button.confirm"/></button>
				<button class="btn btn-primary" type="button" onClick="newFormSkillsCancel();"><@spring.message "projects.button.cancel"/></button>
			</p>
			<input type="hidden" name="usNo" value=""/>
			<input type="hidden" name="usSkill" value="${configBean.techSkillBean.skillTitleList[0]?if_exists}"/>
		</form>
	</div>
	<div class="item-box" id="updateUserSkillsForm" style="margin-bottom: 1px;background-color: #f7f5ff; display: none;">
		<form name="updateSkillsForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/profile/udtUserSkills" method="post" onkeypress="return captureReturnKey(event);">
			<table id="updateSkillsFormId" style="width:100%">
			<tr>
				<td width="12%"><@spring.message "profile.menu.techs"/></td>
				<td>
					<select class="taForm" name="usKind" onchange="changeUtKindSelect(skillsList,1)">
						<option value="0"><@spring.message "select.default.tech"/></option>
					<#if commonBean??>
					<#if commonBean.getMtechMap("tech")?has_content>
						<#list commonBean.getMtechMap("tech")?keys as key>
						<option value="${key?if_exists}">${key?if_exists}</option>
						</#list>
					</#if>
					</#if>
					</select>
				</td>
				<td width="12%"><@spring.message "profile.menu.skills"/></td>
				<td>
					<select class="taForm" name="mtNo" onchange="changeUtLevelSelect(1)">
						<option value="0"><@spring.message "select.default.skill"/></option>
					</select>
				</td>
				<td width="12%"><@spring.message "profile.table.proficiency.title"/></td>
				<td>
					<select class="taForm" name="usLevel" style="width: 100%;">
					</select>
				</td>
			</tr>
			<tr>
				<td width="12%"><@spring.message "profile.table.addition.title"/></td>
				<td colspan="5"><textarea class="taForm" id="idUtDetail" name="usDetail" placeholder="explian" rows="1"></textarea></td>
			</tr>
			</table>
			<br/>
			<p align="center">
				<button class="btn btn-primary" type="button" onclick="return confirmData('updateSkillsFormId', skillsList);" data-toggle="modal"><@spring.message "role.button.confirm"/></button>
				<button class="btn btn-primary" type="button" onClick="updateFormCancel();"><@spring.message "role.button.cancel"/></button>
				<button class="btn btn-danger" type="button" onclick="removeSkills('${configBean.techSkillBean.skillTitleList[0]?if_exists}')"><@spring.message "reports.title.delete"/></button>
			</p>
			<input type="hidden" name="usNo" value=""/>
			<input type="hidden" name="usSkill" value="${configBean.techSkillBean.skillTitleList[0]?if_exists}"/>
		</form>
	</div>
  	<!-- skills form - end -->

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
			<tr onmouseover="overChangeColor(this);"  onmouseout="outChangeColor(this);" onclick="sltUserSkills(this, '${model.users.userId?if_exists}', '${userSkills.usNo?if_exists}', 'updateSkillsForm', skillsList, 1);">
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
			<span id="newToggleLangId" class="glyphicon glyphicon-chevron-down right-symbol-button" style="color:#337ab7;" aria-hidden="true" onclick="newFormLang();"></span>
  		</h4>
  	</div>

  	<!-- lang form - start -->
	<div class="item-box" id="newUserLangForm"  style="margin-bottom: 1px; display: none;">
		<form name="newLangForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/profile/istUserSkills" method="post" id="contact_form" onkeypress="return captureReturnKey(event);">
			<table id="newLangFormId" style="width:100%">
			<tr>
				<td width="12%"><@spring.message "profile.menu.techs"/></td>
				<td>
					<select class="taForm" name="usKind" onchange="changeUtKindSelect(langList, 2)">
						<option value="0"><@spring.message "select.default.tech"/></option>
					<#if commonBean??>
					<#if commonBean.getMtechMap("lang")?has_content>
						<#list commonBean.getMtechMap("lang")?keys as key>
						<option value="${key?if_exists}">${key?if_exists}</option>
						</#list>
					</#if>
					</#if>
					</select>
				</td>
				<td width="12%"><@spring.message "profile.menu.skills"/></td>
				<td>
					<select class="taForm" name="mtNo" onchange="changeUtLevelSelect(2)">
					</select>
				</td>
				<td width="12%"><@spring.message "profile.table.proficiency.title"/></td>
				<td>
					<select class="taForm" name="usLevel" style="width: 100%;">
					</select>
				</td>
			</tr>
			<tr>
				<td width="12%"><@spring.message "profile.table.addition.title"/></td>
				<td colspan="5"><textarea class="taForm"  name="usDetail" placeholder="explian" rows="1"></textarea></td>
			</tr>
			</table>

			<br/>
			<p align="center">
				<button class="btn btn-primary" type="button" onclick="return confirmData('newLangFormId', langList);" data-toggle="modal"><@spring.message "projects.button.confirm"/></button>
				<button class="btn btn-primary" type="button" onClick="newFormLangCancel();"><@spring.message "projects.button.cancel"/></button>
			</p>
			<input type="hidden" name="usNo" value=""/>
			<input type="hidden" name="usSkill" value="${configBean.techSkillBean.skillTitleList[1]?if_exists}"/>
		</form>
	</div>
	<div class="item-box" id="updateUserLangForm" style="margin-bottom: 1px;background-color: #f7f5ff; display: none;">
		<form name="updateLangForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/profile/udtUserSkills" method="post" onkeypress="return captureReturnKey(event);">
			<table id="updateLangFormId" style="width:100%">
			<tr>
				<td width="12%"><@spring.message "profile.menu.techs"/></td>
				<td>
					<select class="taForm" name="usKind" onchange="changeUtKindSelect(langList, 3)">
						<option value="0"><@spring.message "select.default.tech"/></option>
					<#if commonBean??>
					<#if commonBean.getMtechMap("lang")?has_content>
						<#list commonBean.getMtechMap("lang")?keys as key>
						<option value="${key?if_exists}">${key?if_exists}</option>
						</#list>
					</#if>
					</#if>
					</select>
				</td>
				<td width="12%"><@spring.message "profile.menu.skills"/></td>
				<td>
					<select class="taForm" name="mtNo" onchange="changeUtLevelSelect(3)">
						<option value="0"><@spring.message "select.default.skill"/></option>
					</select>
				</td>
				<td width="12%"><@spring.message "profile.table.proficiency.title"/></td>
				<td>
					<select class="taForm" name="usLevel" style="width: 100%;">
					</select>
				</td>
			</tr>
			<tr>
				<td width="12%"><@spring.message "profile.table.addition.title"/></td>
				<td colspan="5"><textarea class="taForm" name="usDetail" placeholder="explian" rows="1"></textarea></td>
			</tr>
			</table>
			<br/>
			<p align="center">
				<button class="btn btn-primary" type="button" onclick="return confirmData('updateLangFormId', langList);" data-toggle="modal"><@spring.message "role.button.confirm"/></button>
				<button class="btn btn-primary" type="button" onClick="updateFormCancel();"><@spring.message "role.button.cancel"/></button>
				<button class="btn btn-danger" type="button" onclick="removeSkills('${configBean.techSkillBean.skillTitleList[1]?if_exists}')"><@spring.message "reports.title.delete"/></button>
			</p>
			<input type="hidden" name="usNo" value=""/>
			<input type="hidden" name="usSkill" value="${configBean.techSkillBean.skillTitleList[1]?if_exists}"/>
		</form>
	</div>
  	<!-- lang form - end -->

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
		<tr onmouseover="overChangeColor(this);"  onmouseout="outChangeColor(this);" onclick="sltUserSkills(this, '${model.users.userId?if_exists}', '${userSkills.usNo?if_exists}', 'updateLangForm' , langList, 3);">
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
			<span id="newToggleCertiId" class="glyphicon glyphicon-chevron-down right-symbol-button" style="color:#337ab7;" aria-hidden="true" onclick="newFormCerti();"></span>
  		</h4>
  	</div>

  	<!-- certi form - start -->
	<div class="item-box" id="newUserCertiForm"  style="margin-bottom: 1px; display: none;">
		<form name="newCertiForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/profile/istUserSkills" method="post" id="contact_form" onkeypress="return captureReturnKey(event);">
			<table id="newCertiFormId" style="width:100%">
			<tr>
				<td width="12%"><@spring.message "profile.menu.techs"/></td>
				<td>
					<select class="taForm" name="usKind" onchange="changeUtKindSelect(certiList, 4)">
						<option value="0"><@spring.message "select.default.tech"/></option>
					<#if commonBean??>
					<#if commonBean.getMtechMap("certi")?has_content>
						<#list commonBean.getMtechMap("certi")?keys as key>
						<option value="${key?if_exists}">${key?if_exists}</option>
						</#list>
					</#if>
					</#if>
					</select>
				</td>
				<td width="12%"><@spring.message "profile.menu.skills"/></td>
				<td>
					<select class="taForm" name="mtNo" onchange="changeUtLevelSelect(4)">
					</select>
				</td>
				<td width="12%"><@spring.message "profile.table.proficiency.title"/></td>
				<td>
					<select class="taForm" name="usLevel" style="width: 100%;">
					</select>
				</td>
			</tr>
			<tr>
				<td width="12%"><@spring.message "profile.table.addition.title"/></td>
				<td colspan="5"><textarea class="taForm" name="usDetail" placeholder="explian" rows="1"></textarea></td>
			</tr>
			</table>

			<br/>
			<p align="center">
				<button class="btn btn-primary" type="button" onclick="return confirmData('newCertiFormId', certiList);" data-toggle="modal"><@spring.message "projects.button.confirm"/></button>
				<button class="btn btn-primary" type="button" onClick="newFormCertiCancel();"><@spring.message "projects.button.cancel"/></button>
			</p>
			<input type="hidden" name="usNo" value=""/>
			<input type="hidden" name="usSkill" value="${configBean.techSkillBean.skillTitleList[2]?if_exists}"/>
		</form>
	</div>
	<div class="item-box" id="updateUserCertiForm" style="margin-bottom: 1px;background-color: #f7f5ff; display: none;">
		<form name="updateCertiForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/profile/udtUserSkills" method="post" onkeypress="return captureReturnKey(event);">
			<table id="updateCertiFormId" style="width:100%">
			<tr>
				<td width="12%"><@spring.message "profile.menu.techs"/></td>
				<td>
					<select class="taForm" name="usKind" onchange="changeUtKindSelect(certiList,5)">
						<option value="0"><@spring.message "select.default.tech"/></option>
					<#if commonBean??>
					<#if commonBean.getMtechMap("certi")?has_content>
						<#list commonBean.getMtechMap("certi")?keys as key>
						<option value="${key?if_exists}">${key?if_exists}</option>
						</#list>
					</#if>
					</#if>
					</select>
				</td>
				<td width="12%"><@spring.message "profile.menu.skills"/></td>
				<td>
					<select class="taForm" name="mtNo" onchange="changeUtLevelSelect(5)">
						<option value="0"><@spring.message "select.default.skill"/></option>
					</select>
				</td>
				<td width="12%"><@spring.message "profile.table.proficiency.title"/></td>
				<td>
					<select class="taForm" name="usLevel" style="width: 100%;">
					</select>
				</td>
			</tr>
			<tr>
				<td width="12%"><@spring.message "profile.table.addition.title"/></td>
				<td colspan="5"><textarea class="taForm" id="idUtDetail" name="usDetail" placeholder="explian" rows="1"></textarea></td>
			</tr>
			</table>
			<br/>
			<p align="center">
				<button class="btn btn-primary" type="button" onclick="return confirmData('updateCertiFormId', certiList);" data-toggle="modal"><@spring.message "role.button.confirm"/></button>
				<button class="btn btn-primary" type="button" onClick="updateFormCancel();"><@spring.message "role.button.cancel"/></button>
				<button class="btn btn-danger" type="button" onclick="removeSkills('${configBean.techSkillBean.skillTitleList[2]?if_exists}')"><@spring.message "reports.title.delete"/></button>
			</p>
			<input type="hidden" name="usNo" value=""/>
			<input type="hidden" name="usSkill" value="${configBean.techSkillBean.skillTitleList[2]?if_exists}"/>
		</form>
	</div>
  	<!-- certi form - end -->

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
		<tr onmouseover="overChangeColor(this);"  onmouseout="outChangeColor(this);" onclick="sltUserSkills(this, '${model.users.userId?if_exists}', '${userSkills.usNo?if_exists}', 'updateCertiForm', certiList, 5);">
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

<!-- Insert And Update Modal -->
<div class="modal fade" id="submitFormUserSkills" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="modalTitle"><@spring.message "profile.menu.techs"/></h4>
      </div>

		<div id="confirmMessage" class="modal-body">
			<table id="t03" style="width:100%">
				<tr>
					<td width="12%"><@spring.message "profile.menu.techs"/></td>
					<td></td>
					<td width="12%"><@spring.message "profile.menu.skills"/></td>
					<td></td>
					<td width="12%"><@spring.message "profile.table.proficiency.title"/></td>
					<td></td>
				</tr>
				<tr>
					<td width="12%"><@spring.message "profile.table.addition.title"/></td>
					<td colspan="5"></td>
				</tr>
			</table>
		</div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">
        	<@spring.message "modal.button.close"/>
        </button>
        <button id="submitForm" type="button" class="btn btn-primary">
        	<@spring.message "modal.button.save"/>
        </button>
      </div>
    </div>
  </div>
</div>

<!-- Delete Modal -->
<div class="modal fade" id="dltSkillsForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="modal-title" id="dltTaskTileId"><@spring.message "projects.title.modal"/></h4>
    </div>

    <div id="confirmMessage" class="modal-body">
    	<@spring.message "projects.confirm.message.delete"/>
    </div>

    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
      <button id="sbtDeleteButtonId" type="button" class="btn btn-danger" onclick="javascript: sbtDeleteForm('updateUserCertiForm');"><@spring.message "projects.button.delete"/></button>
    </div>
  </div>
</div>
</div>


<#include "/apps/common/abilistsProfileLoadJs.ftl"/>
<#include "js/skillsJs.ftl"/>

<#include "skills/skillsChart.ftl"/>

</@layout.myLayout>