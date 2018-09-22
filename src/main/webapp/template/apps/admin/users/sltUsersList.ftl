<#import "/apps/admin/layout/abilistsAdminLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box" style="margin-top: 15px;">
<div class="row">
	<div class="col-md-6">
	  <h3>
		<ol class="breadcrumb-std">
		  <li><a href="/admin"><@spring.message "dashboard.title.home"/></a></li>
		  <li class="active"><@spring.message "admin.menu.users"/></li>
		</ol>
	  </h3>
	</div>
	<div class="col-md-6">

	</div>
</div>
</div>

<div class="row">
  <div class="col-md-12">

	<#include "/apps/common/errorMessage.ftl"/>
	<#include "/apps/common/abilistsSuccess.ftl"/>

	<div class="caption mittle-size-title">

		<div class="row">
			<div class="col-md-4">
				<h4><@spring.message "admin.menu.users"/></h4>
			</div>
			<div class="col-md-8">
				<form id="searchForm" style="margin: 3px 10px 3px 0px;" action="srhForUsers" method="post" onkeydown="return captureReturnKey(event)">
			    <div id="search0" class="input-group">
					<select class="form-control" id="srhColumnId" name="srhColumn" style="width: 30%;background-color: #eeeeee;" onchange="changeItemBg(this, 'uUsersId')">
						<option value="userId"><@spring.message "user.title.id"/></option>
					    <option value="userName"><@spring.message "user.title.name"/></option>
					    <option value="userAuth"><@spring.message "user.title.auth"/></option>
					    <option value="userSex"><@spring.message "user.title.sex"/></option>
					    <option value="userEmail"><@spring.message "user.title.email"/></option>
					    <option value="userStatus"><@spring.message "user.title.status"/></option>
				    </select>
				    <input name="srhContents" type="text" class="form-control" style="width: 70%;"
				    	value="" autocomplete="off" autocorrect="off" autocapitilize="off"
				    		data-toggle="popover" data-trigger="manual" data-placement="top" 
				    			title="Popover title" data-content="Default popover"
				    				placeholder="Search for Name" onkeydown="interverKeystroke(event, 0, 'srhForUsersAjax','users' ,this, 'srhColumnId');">
				    <span class="input-group-btn">
				      <button class="btn btn-default" style="height: 34px;" type="submit">
				      	<i class="glyphicon glyphicon-search" style="top: 1px;"></i>
				      </button>
				    </span>
			    </div><!-- /input-group -->
			    </form>
			</div>
		</div>

	</div>

	<div class="item-box" id="udtMdataFormId" style="background-color: #f7f5ff; display: none;">
	<form id="udtMdataFormId" name="updateForm" class="form-horizontal" action="udtUsers" method="post" id="contact_form" onkeypress="return captureReturnKey(event);">

		<table id="updateTable" style="width:100%">
			<tr>
				<td rowspan="5" width="210">
					<img style="border-radius: 4px;" src="" id="userImgDataId" width="210" alt="your picture" />
				</td>
			</tr>
			<tr>
				<td width="10%"><@spring.message "user.title.id"/></td>
				<td><span id="userIdId"></span></td>
				<td><@spring.message "user.title.name"/></td>
				<td><span id="userNameId"></span></td>
				<td><@spring.message "user.title.insertTime"/></td>
				<td><span id="insertTimeId"></span></td>
			</tr>
			<tr>
				<td><@spring.message "user.title.email"/></td>
				<td colspan="3"><span id="userEmailId"></span></td>
				<td><@spring.message "user.title.auth"/></td>
				<td>
		            <select class="taForm" id="userAuthId" name="userAuth" style="width: 100%;">
			            <option value="1"><@spring.message "auth.select.user"/></option>
			            <option value="2"><@spring.message "auth.select.semi.admin"/></option>
			            <option value="3"><@spring.message "auth.select.super.admin"/></option>
		            </select>
				</td>
			</tr>
			<tr>
				<td><@spring.message "user.title.sex"/></td>
				<td><span id="userSexId"></span></td>
				<td><@spring.message "user.title.ages"/></td>
				<td><span id="userAgesId"></span></td>
				<td><@spring.message "user.title.status"/></td>
				<td>
		            <select class="taForm" id="userStatusId" name="userStatus" style="width: 100%;">
		            	<option value="0"><@spring.message "user.status.use"/></option>
			            <option value="1"><@spring.message "user.status.sleep"/></option>
			            <option value="2"><@spring.message "user.status.stop"/></option>
		            </select>
		        </td>
			</tr>
			<tr>
				<td>Profile</td>
				<td colspan="5"><span id="userProfileId"></span></td>
			</tr>
			<input type="hidden" id="inputUserId" name="userId" />
		</table>
		<br/>
		<p align="center">
			<button type="button" onclick="return confirmData('updateTable');" class="btn btn-primary" data-toggle="modal">
				<@spring.message "noti.button.confirm"/>
			</button>
			<button class="btn btn-primary" type="button" onClick="updateFormCancel();">
				<@spring.message "noti.button.cancel"/>
			</button>
		</p>

	</form>
	</div>

	<div id="uUsersId">
		<ul class="item-box ul-table ul-thead">
			<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">#</li>
			<li class="li-cell">Image</li>
			<li class="li-cell" style="border-width: 0px 1px 0px 1px; background-color:#eeeeee;"><@spring.message "user.title.id"/></li>
			<li class="li-cell"><@spring.message "user.title.name"/></li>
			<li class="li-cell"><@spring.message "user.title.auth"/></li>
			<li class="li-cell"><@spring.message "user.title.sex"/></li>
			<li class="li-cell"><@spring.message "user.title.email"/></li>
			<li class="li-cell"><@spring.message "user.title.status"/></li>
			<li class="li-cell"><@spring.message "tech.title.update"/></li>
		</ul>
	    <#if model??>
	    <#if model.usersList?has_content>
	    <#list model.usersList as user>
	    	<ul class="bgrow nthrow item-box ul-table" onmouseover="overChangeColor(this);"  onmouseout="outChangeColor(this);" onclick="sltUsers(this, '${user.userId?if_exists}');" >
				<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">${user.userNo?if_exists}</li>
				<li class="li-cell"><img width="32px" alt="image" src="${user.userImgAvatar?if_exists}"></li>
				<li class="li-cell" style="border-width: 0px 1px 0px 1px; background-color:#eeeeee;"><a href="/profile/${user.userId?if_exists}">${user.userId?if_exists}</a></li>
				<li class="li-cell">${user.userName?if_exists}</li>
				<li class="li-cell">
		        	<#if user.userAuth??>
		        		<#if user.userAuth == "2">
		        		<@spring.message "auth.select.semi.admin"/>
		        		<#elseif user.userAuth == "3">
		        		<@spring.message "auth.select.super.admin"/>
		        		<#else>
		        		<@spring.message "auth.select.user"/>
		        		</#if>
	        		</#if>
				</li>
				<li class="li-cell">
					<#if user.userSex??>
		              <#if user.userSex == "1">
		              	<@spring.message "user.sex.man"/>
		              <#elseif user.userSex == "2">
		              	<@spring.message "user.sex.woman"/>
		              <#else>
		              </#if>
		            </#if>
	            </li>
				<li class="li-cell">${user.userEmail?if_exists}</li>
				<li class="li-cell">
					<#if user.userStatus??>
		        		<#if user.userStatus == "1">
		        		<@spring.message "user.status.sleep"/>
		        		<#elseif user.userStatus == "2">
		        		<@spring.message "user.status.stop"/>
		        		<#else>
		        		<@spring.message "user.status.use"/>
		        		</#if>
	        		</#if>
				</li>
				<li class="li-cell">${user.updateTime?string('yyyy/MM/dd')?if_exists}</li>
			</ul>
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
			<li><a href="?nowPage=${model.paging.prevPage.nowPage}&allCount=${model.paging.allCount?c}" title="Prev" accesskey="*">Prev</span></a></li>
			</#if>
			<#if model.paging.pagingInfoList?has_content>
				<#list model.paging.pagingInfoList as pageList>
					<#if model.paging.nowPage?if_exists == pageList.pageNumber?if_exists>
					<li class="active"><a href="#">${pageList.pageNumber} <span class="sr-only">(current)</span></a></li>
					<#else>
					<li><a href="?nowPage=${pageList.pageNumber}&allCount=${model.paging.allCount?c}">${pageList.pageNumber}</a></li>
					</#if>
				</#list>
			</#if>
			<#if model.paging.nextPage?exists>
			<li><a href="?nowPage=${model.paging.nextPage.nowPage}&allCount=${model.paging.allCount?c}" accesskey="#" title="Next">Next</a></li>
			</#if>
		</#if>
	  </#if>
	  	</ul>
	  </nav><!-- end #nav -->

  </div><!-- #col-md-12 -->
</div><!-- #row -->

<!-- Modal -->
<div class="modal fade" id="submitFormUsers" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel"><@spring.message "users.title.modal"/></h4>
      </div>

      <div id="confirmMessage" class="modal-body">
		<table id="t03" style="width:100%">
		<tr>
			<td>Auth</td>
			<td></td>
		</tr>
		<tr>
			<td>Status</td>
			<td></td>
		</tr>
		</table>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">
        	<@spring.message "user.button.close"/>
        </button>
        <button id="submitForm" type="button" class="btn btn-primary" onClick="javascript: submitUpdateFormUser();">
        	<@spring.message "user.button.save"/>
        </button>
      </div>
    </div>
  </div>
</div>

<#include "/apps/common/abilistsAdminLoadJs.ftl"/>
<#include "js/sltUsersListJs.ftl"/>

</@layout.myLayout>