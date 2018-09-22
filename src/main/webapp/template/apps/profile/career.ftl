<#import "/apps/layout/profile/abilistsProfileLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box">
	<nav class="breadcrumbs">
		<ul>
		<li><a href="/abilists">${model.users.userId?if_exists}</a></li>
		<li><a href="${configBean.baseURL?if_exists}/profile"><@spring.message "navi.title.profile"/></a></li>
		<li class="active"><a href="#"><@spring.message "profile.menu.career"/></a></li>
		</ul>
	</nav>
</div>

<div class="row">
	<div class="col-sm-3 right-col-cus sideImg">
<#include "/apps/common/abilistsProfile.ftl"/>
	</div>
	<div class="col-sm-9 left-col-cus">
		<div class="caption mittle-size-title">
			<h4><@spring.message "profile.career.summary"/>
				<span class="glyphicon glyphicon-pencil right-symbol-button" style="color:#337ab7;" aria-hidden="true" onclick="udtUserSummary();"></span>
			</h4>
		</div>
		<div align="center" id="updatedId" class="list-group-item list-group-item-info">success</div>
		<div class="item-box" style="height: 260px; overflow-x: hidden; overflow: auto;">
			${model.users.userSummary?if_exists}
		</div>
	</div>

</div>

<div id="skills" class="caption mittle-size-title">
	<h4> <@spring.message "profile.career.experience"/>
	<span id="newToggleId" class="glyphicon glyphicon-chevron-down right-symbol-button" style="color:#337ab7;" aria-hidden="true" onclick="newFormToggle();"></span>
	</h4>
</div>

<div class="row">
  <div class="col-md-12">

	<#include "/apps/common/errorMessageNoButton.ftl"/>
	<#include "/apps/common/abilistsSuccess.ftl"/>

	<div class="item-box" id="istFormUserCareer" style="display: none;">
		<form name="newForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/profile/istUserCareer" method="post" id="contact_form" onkeypress="return captureReturnKey(event);">
			<div class="checkbox" onclick="javascript: workHere('newUcPresentId', 0);">
		    	<label><input id="newUcPresentId" type="checkbox" name="ucPresent" /><@spring.message "profile.career.currently"/></label>
		    </div>
			<table id="newFormId" style="width:100%">
			<tr>
				<td width="10%"><@spring.message "profile.career.title"/></td>
				<td>
					<input class="form-input" type="text" name="ucTitle" />
				</td>
				<td width="10%"><@spring.message "profile.career.company"/></td>
				<td>
					<input class="form-input" type="text" name="ucCompanyName" />
				</td>
			</tr>
			<tr>
				<td><@spring.message "profile.career.from"/></td>
				<td>
					<select class="taForm" name="ucStartMonth">
						<option value="0">Month</option>
						<option value="01">January</option>
						<option value="02">February</option>
						<option value="03">March</option>
						<option value="04">April</option>
						<option value="05">May</option>
						<option value="06">June</option>
						<option value="07">July</option>
						<option value="08">August</option>
						<option value="09">September</option>
						<option value="10">October</option>
						<option value="11">November</option>
						<option value="12">December</option>
					</select>
					<select class="taForm" name="ucStartYear">
						<option value="0">Year</option>
						<option value="2017">2017</option>
						<option value="2016">2016</option>
						<option value="2015">2015</option>
						<option value="2014">2014</option>
						<option value="2013">2013</option>
						<option value="2012">2012</option>
						<option value="2011">2011</option>
						<option value="2010">2010</option>
						<option value="2009">2009</option>
						<option value="2008">2008</option>
						<option value="2007">2007</option>
						<option value="2006">2006</option>
						<option value="2005">2005</option>
						<option value="2004">2004</option>
						<option value="2003">2003</option>
						<option value="2002">2002</option>
						<option value="2001">2001</option>
						<option value="2000">2000</option>
						<option value="1999">1999</option>
						<option value="1998">1998</option>
						<option value="1997">1997</option>
						<option value="1996">1996</option>
						<option value="1995">1995</option>
						<option value="1994">1994</option>
						<option value="1993">1993</option>
						<option value="1992">1992</option>
						<option value="1991">1991</option>
						<option value="1990">1990</option>
						<option value="1989">1989</option>
						<option value="1988">1988</option>
						<option value="1987">1987</option>
						<option value="1986">1986</option>
						<option value="1985">1985</option>
						<option value="1984">1984</option>
						<option value="1983">1983</option>
						<option value="1982">1982</option>
						<option value="1981">1981</option>
					</select>
				</td>
				<td><@spring.message "profile.career.to"/></td>
				<td>
					<select id="newUcEndMonthId" class="taForm" name="ucEndMonth">
						<option value="0">Month</option>
						<option value="01">January</option>
						<option value="02">February</option>
						<option value="03">March</option>
						<option value="04">April</option>
						<option value="05">May</option>
						<option value="06">June</option>
						<option value="07">July</option>
						<option value="08">August</option>
						<option value="09">September</option>
						<option value="10">October</option>
						<option value="11">November</option>
						<option value="12">December</option>
					</select>
					<select id="newUcEndYearId" class="taForm" name="ucEndYear">
						<option value="0">Year</option>
						<option value="2017">2017</option>
						<option value="2016">2016</option>
						<option value="2015">2015</option>
						<option value="2014">2014</option>
						<option value="2013">2013</option>
						<option value="2012">2012</option>
						<option value="2011">2011</option>
						<option value="2010">2010</option>
						<option value="2009">2009</option>
						<option value="2008">2008</option>
						<option value="2007">2007</option>
						<option value="2006">2006</option>
						<option value="2005">2005</option>
						<option value="2004">2004</option>
						<option value="2003">2003</option>
						<option value="2002">2002</option>
						<option value="2001">2001</option>
						<option value="2000">2000</option>
						<option value="1999">1999</option>
						<option value="1998">1998</option>
						<option value="1997">1997</option>
						<option value="1996">1996</option>
						<option value="1995">1995</option>
						<option value="1994">1994</option>
						<option value="1993">1993</option>
						<option value="1992">1992</option>
						<option value="1991">1991</option>
						<option value="1990">1990</option>
						<option value="1989">1989</option>
						<option value="1988">1988</option>
						<option value="1987">1987</option>
						<option value="1986">1986</option>
						<option value="1985">1985</option>
						<option value="1984">1984</option>
						<option value="1983">1983</option>
						<option value="1982">1982</option>
						<option value="1981">1981</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="10%"><@spring.message "profile.career.business"/></td>
				<td>
				<select class="taForm" name="ucCodeIndustry">
					<option value="0"><@spring.message "projects.title.industy"/></option>
					<#if commonBean??>
					<#if commonBean.mIndustryMapList?has_content>
						<#if commonBean.mIndustryMapList["${lang?if_exists}"]??>
						<#list commonBean.mIndustryMapList["${lang?if_exists}"] as mIndustry>
							<option value="${mIndustry.miImgCode?if_exists}">${mIndustry.miLargeCategory?if_exists}</option>
						</#list>
						</#if>
					</#if>
					</#if>
				</select>
				</td>
				<td><@spring.message "profile.career.role"/></td>
				<td>
					<select class="taForm" name="ucCodeRole">
					<option value="0"><@spring.message "projects.title.role"/></option>
				    <#if commonBean??>
				    <#if commonBean.mRoleMap?has_content>
					    <#if commonBean.mRoleMap["${lang?if_exists}"]??>
					    <#list commonBean.mRoleMap["${lang?if_exists}"] as mRole>
					    	<option value="${mRole.mrCode?if_exists}">${mRole.mrName?if_exists}</option>
					    </#list>
					    </#if>
				    </#if>
				    </#if>
				    </select>
				</td>
			</tr>
			<tr>
				<td width="10%"><@spring.message "profile.career.contents"/></td>
				<td colspan='3'>
					<textarea class="taForm" style="height: 70px;" name="ucContents" placeholder="contents" rows="3"></textarea>
				</td>
			</tr>
			</table>
			<input type="hidden" name="token" value="<#if model??>${model.token?if_exists}</#if>" />
			<br/>
			<p align="center">
				<button type="button" onclick="return confirmData('newFormId');" class="btn btn-primary" data-toggle="modal"><@spring.message "projects.button.confirm"/></button>
				<button class="btn btn-primary" type="button" onClick="newFormCancel();"><@spring.message "projects.button.cancel"/></button>
			</p>
		</form>
	</div>

	<div class="item-box" id="udtDataFormId" style="display: none;">
		<form name="updateForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/profile/udtUserCareer" method="post" id="contact_form" onkeypress="return captureReturnKey(event);">
			<div class="checkbox" onclick="javascript: workHere('udtUcPresentId', 1);">
	    		<label>
	    			<input id="udtUcPresentId" type="checkbox" name="ucPresent">
	    			<@spring.message "profile.career.currently"/>
	    		</label>
	    	</div>
			<table id="updateForm" style="width:100%">
			<tr>
				<td width="10%"><@spring.message "profile.career.title"/></td>
				<td>
					<input class="form-input" id="ucTitleId" type="text" name="ucTitle" />
				</td>
				<td width="10%"><@spring.message "profile.career.company"/></td>
				<td>
					<input class="form-input" id="ucCompanyNameId" type="text" name="ucCompanyName" />
				</td>
			</tr>
			<tr>
				<td>From</td>
				<td>
					<select id="udtUcStartMonthId" class="taForm" name="ucStartMonth">
						<option value="0">Month</option>
						<option value="01">January</option>
						<option value="02">February</option>
						<option value="03">March</option>
						<option value="04">April</option>
						<option value="05">May</option>
						<option value="06">June</option>
						<option value="07">July</option>
						<option value="08">August</option>
						<option value="09">September</option>
						<option value="10">October</option>
						<option value="11">November</option>
						<option value="12">December</option>
					</select>
					<select id="udtUcStartYearId" class="taForm" name="ucStartYear">
						<option value="0">Year</option>
						<option value="2017">2017</option>
						<option value="2016">2016</option>
						<option value="2015">2015</option>
						<option value="2014">2014</option>
						<option value="2013">2013</option>
						<option value="2012">2012</option>
						<option value="2011">2011</option>
						<option value="2010">2010</option>
						<option value="2009">2009</option>
						<option value="2008">2008</option>
						<option value="2007">2007</option>
						<option value="2006">2006</option>
						<option value="2005">2005</option>
						<option value="2004">2004</option>
						<option value="2003">2003</option>
						<option value="2002">2002</option>
						<option value="2001">2001</option>
						<option value="2000">2000</option>
						<option value="1999">1999</option>
						<option value="1998">1998</option>
						<option value="1997">1997</option>
						<option value="1996">1996</option>
						<option value="1995">1995</option>
						<option value="1994">1994</option>
						<option value="1993">1993</option>
						<option value="1992">1992</option>
						<option value="1991">1991</option>
						<option value="1990">1990</option>
						<option value="1989">1989</option>
						<option value="1988">1988</option>
						<option value="1987">1987</option>
						<option value="1986">1986</option>
						<option value="1985">1985</option>
						<option value="1984">1984</option>
						<option value="1983">1983</option>
						<option value="1982">1982</option>
						<option value="1981">1981</option>
					</select>
				</td>
				<td>To</td>
				<td>
					<select id="udtUcEndMonthId" class="taForm" name="ucEndMonth">
						<option value="0">Month</option>
						<option value="01">January</option>
						<option value="02">February</option>
						<option value="03">March</option>
						<option value="04">April</option>
						<option value="05">May</option>
						<option value="06">June</option>
						<option value="07">July</option>
						<option value="08">August</option>
						<option value="09">September</option>
						<option value="10">October</option>
						<option value="11">November</option>
						<option value="12">December</option>
					</select>
					<select id="udtUcEndYearId" class="taForm" name="ucEndYear">
						<option value="0">Year</option>
						<option value="2017">2017</option>
						<option value="2016">2016</option>
						<option value="2015">2015</option>
						<option value="2014">2014</option>
						<option value="2013">2013</option>
						<option value="2012">2012</option>
						<option value="2011">2011</option>
						<option value="2010">2010</option>
						<option value="2009">2009</option>
						<option value="2008">2008</option>
						<option value="2007">2007</option>
						<option value="2006">2006</option>
						<option value="2005">2005</option>
						<option value="2004">2004</option>
						<option value="2003">2003</option>
						<option value="2002">2002</option>
						<option value="2001">2001</option>
						<option value="2000">2000</option>
						<option value="1999">1999</option>
						<option value="1998">1998</option>
						<option value="1997">1997</option>
						<option value="1996">1996</option>
						<option value="1995">1995</option>
						<option value="1994">1994</option>
						<option value="1993">1993</option>
						<option value="1992">1992</option>
						<option value="1991">1991</option>
						<option value="1990">1990</option>
						<option value="1989">1989</option>
						<option value="1988">1988</option>
						<option value="1987">1987</option>
						<option value="1986">1986</option>
						<option value="1985">1985</option>
						<option value="1984">1984</option>
						<option value="1983">1983</option>
						<option value="1982">1982</option>
						<option value="1981">1981</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="10%"><@spring.message "profile.career.business"/></td>
				<td>
				<select id="ucCodeIndustryId" class="taForm" name="ucCodeIndustry">
					<option value="0" selected><@spring.message "projects.title.industy"/></option>
					<#if commonBean??>
					<#if commonBean.mIndustryMapList?has_content>
						<#if commonBean.mIndustryMapList["${lang?if_exists}"]??>
						<#list commonBean.mIndustryMapList["${lang?if_exists}"] as mIndustry>
							<option value="${mIndustry.miImgCode?if_exists}">${mIndustry.miLargeCategory?if_exists}</option>
						</#list>
						</#if>
					</#if>
					</#if>
				</select>
				</td>
				<td><@spring.message "profile.career.role"/></td>
				<td>
					<select id="ucCodeRoleId" class="taForm" name="ucCodeRole">
					<option value="0" selected><@spring.message "projects.title.role"/></option>
				    <#if commonBean??>
				    <#if commonBean.mRoleMap?has_content>
					    <#if commonBean.mRoleMap["${lang?if_exists}"]??>
					    <#list commonBean.mRoleMap["${lang?if_exists}"] as mRole>
					    	<option value="${mRole.mrCode?if_exists}">${mRole.mrName?if_exists}</option>
					    </#list>
					    </#if>
				    </#if>
				    </#if>
				    </select>
				</td>
			</tr>
			<tr>
				<td width="10%"><@spring.message "profile.career.contents"/></td>
				<td colspan='3'>
					<textarea id="ucContentsId" class="taForm" style="height: 70px;" name="ucContents" placeholder="contents" rows="3"></textarea>
				</td>
			</tr>
			</table>
			<input type="hidden" id="ucNoId" name="ucNo" />
			<input type="hidden" id="tokenId" name="token" />
			<br/>
			<p align="center">
				<button type="button" onclick="return confirmData('updateForm');" class="btn btn-primary" data-toggle="modal"><@spring.message "projects.button.confirm"/></button>
				<button class="btn btn-primary" type="button" onClick="updateFormCancel();"><@spring.message "projects.button.cancel"/></button>
				<button type="button" class="btn btn-danger" style="width: 80px;" onclick="javascript: removeUserCareer();"><@spring.message "projects.button.delete"/></button>
			</p>
		</form>
	</div>

	<div id="careerId">
	<#if model??>
    <#if model.userCareerList?has_content>
    	<#list model.userCareerList as userCareer>
    	<div class="item-box bgrow" style="margin-bottom: 1px;" onmouseover="overChangeColor(this);" onmouseout="outChangeColor(this);" onclick="selectUserCareer(this, '${userCareer.ucNo?if_exists}', '${model.users.userId?if_exists}');">
	      	<h4>
	    		${userCareer.ucStartYear?if_exists}/${userCareer.ucStartMonth?if_exists} ~ ${userCareer.ucEndYear?if_exists}/${userCareer.ucEndMonth?if_exists} 
	    		${userCareer.ucCompanyName?if_exists}
	    	</h4>
			<div class="media">
				<div class="media-left">
					<a href="#">
						<div class="media-object text-center" style="width:64px; height:64px;">
							<h1 style="font-size: 300%;">
								<span class="glyphicon ${userCareer.ucCodeIndustry?if_exists}"></span>
							</h1>
						</div>
					</a>
				</div>
				<div class="media-body">
					<div>
					<h4 class="media-heading">${userCareer.ucTitle?if_exists}</h4>
					${userCareer.ucContents?if_exists}
					</div>
				</div>
			</div>
		</div>
		</#list>
	</#if>
	</#if>

	</div>
  </div><!-- col-md-12 -->
</div><!-- row -->

<!-- Updateb user summary Modal -->
<div class="modal fade" id="udtUserSummaryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">

	    <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span>
	      	<span class="sr-only">Close</span>
	      </button>
	      <h4 class="modal-title">User Summary</h4>
	    </div>

	    <div id="confirmMessage" class="modal-body">
	    <form name="udtUserSummaryForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/profile/udtUserSummary" method="post" id="contact_form" onkeypress="return captureReturnKey(event);">
	    	<textarea id="userSummaryId" class="taForm" style="height: 228px;" name="userSummary" placeholder="Your Summary">${model.users.userSummary?if_exists}</textarea>
	    	<input type="hidden" name="token" value="<#if model??>${model.token?if_exists}</#if>" />
	    </form>
	    </div>

	    <div class="modal-footer">
	      <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
	      <button type="button" class="btn btn-danger" onclick="javascript: sbtUpdateUserSummaryForm();">
	      	  Update
	      </button>
	    </div>

	  </div>
	</div>
</div>

<!-- Insert and Update Modal -->
<div class="modal fade" id="istUserCareerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span>
        	<span class="sr-only"><@spring.message "projects.button.close"/></span>
        </button>
        <h4 class="modal-title" id="myModalLabel"><@spring.message "projects.title.modal"/></h4>
      </div>
      <div id="confirmMessage" class="modal-body">
	    <label id="confirmUcPresentId"><@spring.message "profile.career.currently"/></label>
      	<table id="t03" style="width:100%">
		<tr>
			<td width="10%">Title</td>
			<td></td>
			<td width="10%">Company</td>
			<td></td>
		</tr>
		<tr>
			<td>From</td>
			<td></td>
			<td>To</td>
			<td></td>
		</tr>
		<tr>
			<td width="10%">Business</td>
			<td></td>
			<td>Position</td>
			<td></td>
		</tr>
		<tr>
			<td width="10%">Contents</td>
			<td colspan='3' style="word-break:break-all;"></td>
		</tr>
		</table>

      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
        <button id="submitFormId" type="button" class="btn btn-primary"><@spring.message "projects.button.save"/></button>
      </div>
    </div>
  </div>
</div>

<!-- Delete Modal -->
<div class="modal fade" id="dltUserCareerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
	  		
	    <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span>
	      	<span class="sr-only">Close</span>
	      </button>
	      <h4 class="modal-title" id="dltModalTitleId"><@spring.message "projects.title.modal"/></h4>
	    </div>
	
	    <div id="confirmMessage" class="modal-body">
	    	<@spring.message "projects.confirm.message.delete"/>
	    </div>
	
	    <div class="modal-footer">
	      <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
	      <button type="button" class="btn btn-danger" onclick="javascript: sbtDeleteFormUserCareer();">
	      	  <@spring.message "projects.button.delete"/>
	      </button>
	    </div>

	  </div>
	</div>
</div>

<#include "/apps/common/abilistsProfileLoadJs.ftl"/>
<#include "js/careerJs.ftl"/>

</@layout.myLayout>