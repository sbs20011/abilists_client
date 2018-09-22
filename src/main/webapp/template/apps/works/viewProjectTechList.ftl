<#import "/apps/layout/works/abilistsWorksLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box">
<div class="row">
	<div class="col-md-6">
		<nav class="breadcrumbs">
		<ul>
		<li><a href="/abilists">${model.users.userId?if_exists}</a></li>
		<li><a href="/works"><@spring.message "navi.title.works"/></a></li>
		<li><a href="/works/${model.users.userId?if_exists}/sltProjectsList"><@spring.message "navi.title.works.projects"/></a></li>
		<li class="active"><a href="#"><@spring.message "navi.title.project.tech"/>[${model.userProjects.upName?if_exists}]</a></li>
		</ul>
		</nav>
	</div>
	<div class="col-md-6">
		
	</div>
</div>
</div>

<div class="row">
	<div class="col-md-12">

		<#include "/apps/common/errorMessage.ftl"/>
		<#include "/apps/common/abilistsSuccess.ftl"/>

		<div class="caption mittle-size-title"><h4><@spring.message "admin.menu.projects"/></h4></div>
		<div class="item-box" style="background:#fbfbfb;">
		<#if model.userProjects??>
			<table id="t01" class="table-line-break">
			<tr>
				<td><@spring.message "projects.title.name"/></td>
				<td>${model.userProjects.upName?if_exists}</td>
				<td><@spring.message "projects.title.team.number"/></td>
				<td>${model.userProjects.upMembers?if_exists}</td>
			</tr>
			<tr>
				<td><@spring.message "projects.title.industy"/></td>
				<td>
					<#if commonBean??>
					<#if commonBean.mIndustryMapList?has_content>
						<#if commonBean.mIndustryMapList["${lang?if_exists}"]??>
						<#list commonBean.mIndustryMapList["${lang?if_exists}"] as mIndustry>
							<#if model.userProjects.upCodeIndustry??>
								<#if model.userProjects.upCodeIndustry == "${mIndustry.miImgCode?if_exists}">
								${mIndustry.miLargeCategory?if_exists}
								</#if>
							</#if>
						</#list>
						</#if>
					</#if>
					</#if>
				</td>
				<td><@spring.message "projects.title.role"/></td>
				<td>
				    <#if commonBean??>
				    <#if commonBean.mRoleMap?has_content>
				    	<#if commonBean.mRoleMap["${lang?if_exists}"]??>					    
					    <#list commonBean.mRoleMap["${lang?if_exists}"] as mRole>
					    	<#if model.userProjects.upCodeRole??>
						    	<#if model.userProjects.upCodeRole == "${mRole.mrCode?if_exists}">
						    		${mRole.mrName?if_exists}
						    	</#if>
					    	</#if>
					    </#list>
					    </#if>
					    
				    </#if>
				    </#if>
				</td>
			</tr>
			<tr>
				<td><@spring.message "projects.title.explain"/></td>
				<td colspan="3" class="line-break">${model.userProjects.upExplain?if_exists}</td>
			</tr>
			</table>

		</#if>
		</div>

		<div class="caption mittle-size-title middle-works-bg">
			<div class="row">
				<div class="col-md-6" style="float:left;">
					<h4><@spring.message "admin.menu.projects.tech.list"/></h4>
				</div>
				<div class="col-md-6">
				</div>
			</div>
		</div>

		<div class="item-box" id="udtMdataFormId" style="background-color: #f7f5ff; display: none;">
		<form name="updateForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/works/udtProjectTech" method="post" onkeypress="return captureReturnKey(event);">
			<table id="updateFormId" style="width:100%">
			<tr>
				<td width="12%"><@spring.message "profile.menu.techs"/></td>
				<td>
					<select id="uptKindId" name="uptKind" class="taForm" onchange="changeUtKindSelect(skillsList, 1)">
						<option value="0"><@spring.message "tech.select.default.tech"/></option>
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
					<select id="mtNoId" name="mtNo" class="taForm" onchange="changeUtLevelSelect(1)">
					</select>
				</td>
				<td width="12%"><@spring.message "profile.table.proficiency.title"/></td>
				<td>
					<select id="uptLevelId" name="uptLevel" class="taForm">
					</select>
				</td>
			</tr>
			<tr>
				<td width="12%"><@spring.message "profile.table.addition.title"/></td>
				<td colspan="5">
					<textarea class="taForm" id="uptDetailId" name="uptDetail" placeholder="Detail" rows="1"></textarea>
				</td>
			</tr>
			<input type="hidden" name="cnt" value="0" id="cnt01" autocomplete="off" />
			<input type="hidden" name="upNo" value="<#if model.userProjects??>${model.userProjects.upNo?if_exists}</#if>"/>
			<input type="hidden" id="uptNoId" name="uptNo" />
			<input type="hidden" id="tokenId" name="token" />
			</table>
			<br/>
			<p align="center">
				<button class="btn btn-primary" type="button" onClick="updateFormCancel();">
					<@spring.message "noti.button.close"/>
				</button>
			</p>
		</form>
		</div>

		<div id="uProjectTechId">
		<ul class="item-box ul-table ul-thead">
			<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">#</li>
			<li class="li-cell"><@spring.message "tech.title.kind"/></li>
			<li class="li-cell"><@spring.message "tech.title.tech"/></li>
			<li class="li-cell"><@spring.message "tech.title.level"/></li>
			<li class="li-cell"><@spring.message "tech.title.detail"/></li>
			<li class="li-cell"><@spring.message "tech.title.update"/></li>
		</ul>
		<#if model??>
	    <#if model.userProjectTechList?has_content>
	    <#list model.userProjectTechList as userProjectTech>
			<ul class="bgrow nthrow item-box ul-table">

				<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">${userProjectTech.uptNo?if_exists}</li>
				<li class="li-cell">${userProjectTech.uptKind?if_exists}</li>
				
				<li class="li-cell">
					<#if commonBean??>
					<#if commonBean.getMtechMap("tech")?has_content>
					<#list commonBean.getMtechMap("tech")[userProjectTech.uptKind] as tech>
						<#if tech.mtNo == userProjectTech.mtNo>
							${tech.mtName?if_exists}
						</#if>
					</#list>
					</#if>
					</#if>
				</li>
				<li class="li-cell">
					<#if commonBean??>
					<#if commonBean.mTechDetailMap[userProjectTech.mtNo?c?string]??>
						<#list commonBean.mTechDetailMap[userProjectTech.mtNo?c?string] as techDetail>
							<#if techDetail.mtdLevel == userProjectTech.uptLevel>
							<#if techDetail.mlCode == lang?if_exists>
								${techDetail.mtdLevelExplain?if_exists}
							</#if>
							</#if>
						</#list>
					</#if>
					</#if>
				</li>					
				<li class="li-cell">${userProjectTech.uptDetail?if_exists}</li>
				<li class="li-cell">${userProjectTech.updateTime?string('yyyy/MM/dd')?if_exists}</li>
			</ul>
		</#list>
		</#if>
		</#if>
		</div>

    <nav class="text-center">
	    <ul class="pagination">
    <#if model?exists>
    	<#if model.paging?exists>
			<#if model.paging.prevPage?exists>
			<li><a href="sltProjectTechList?nowPage=${model.paging.prevPage.nowPage}&allCount=${model.paging.allCount?c}" title="Prev" accesskey="*">Prev</span></a></li>
			</#if>
			<#if model.paging.pagingInfoList?has_content>
				<#list model.paging.pagingInfoList as pageList>
					<#if model.paging.nowPage?if_exists == pageList.pageNumber?if_exists>
					<li class="active"><a href="#">${pageList.pageNumber} <span class="sr-only">(current)</span></a></li>
					<#else>
					<li><a href="sltProjectTechList?nowPage=${pageList.pageNumber}&allCount=${model.paging.allCount?c}">${pageList.pageNumber}</a></li>
					</#if>
				</#list>
			</#if>
			<#if model.paging.nextPage?exists>
			<li><a href="sltProjectTechList?nowPage=${model.paging.nextPage.nowPage}&allCount=${model.paging.allCount?c}" accesskey="#" title="Next">Next</a></li>
			</#if>
		</#if>
	  </#if>
    	</ul>
    </nav><!-- end #nav -->

  </div><!-- col-md-12 -->
</div><!-- row -->

<!-- Insert And Update Modal -->
<div class="modal fade" id="sbtFormUserProjectTech" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">
        	<span aria-hidden="true">&times;</span>
        	<span class="sr-only"><@spring.message "projects.button.close"/></span>
        </button>
        <h4 class="modal-title" id="udtProjectTechTileId"><@spring.message "tech.title.input"/></h4>
      </div>

		<div id="confirmMessage" class="modal-body">
			<table id="t03" style="width:100%">
				<tr>
					<td width="12%"><@spring.message "tech.title.skills"/></td>
					<td></td>
					<td width="12%"><@spring.message "tech.title.skills"/></td>
					<td></td>
					<td width="12%"><@spring.message "tech.title.level"/></td>
					<td></td>
				</tr>
				<tr>
					<td width="12%"><@spring.message "tech.title.detail"/></td>
					<td colspan="5"></td>
				</tr>
			</table>
		</div>

      <div class="modal-footer">
      	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="deleteTr('t03');">
      		<@spring.message "tech.button.close"/>
      	</button>
        <button id="submitForm" type="button" class="btn btn-primary" onclick="javascript: submitUdtFormProjectTech();">
        	<@spring.message "tech.button.save"/>
        </button>
      </div>
    </div>
  </div>
</div>

<!-- Delete Modal -->
<div class="modal fade" id="sbtFormDeleteProjectTech" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      <h4 class="modal-title" id="dltProjectTechTileId"><@spring.message "projects.title.modal"/></h4>
    </div>

    <div id="confirmMessage" class="modal-body">
    	<@spring.message "projects.confirm.message.delete"/>
    </div>

    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
      <button id="submitForm" type="button" class="btn btn-danger" onclick="javascript: submitDeleteFormProjectTech();">
      	  <@spring.message "projects.button.delete"/>
      </button>
    </div>
  </div>
</div>
</div>

<#include "/apps/common/abilistsWorksLoadJs.ftl"/>
<#include "js/viewProjectTechListJs.ftl"/>

</@layout.myLayout>