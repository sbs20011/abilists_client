<#import "/apps/layout/abilistsNotiLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box" style="margin-top: 65px;">
	<div class="row">
		<div class="col-md-6">
			<nav class="breadcrumbs">
			<ul>
			<li class="active"><a href="#">Notification</a></li>
			</ul>
			</nav>
		</div>
		<div class="col-md-6">
		</div>
	</div>
</div>

<div class="row">
  <div class="col-md-12">

	<div class="item-box" id="viewNotiId" style="display: none;">
		<table id="updateForm" style="width:100%">
			<tr>
				<td width="15%"><@spring.message "noti.view.title.tile"/></td>
				<td><span id="notiTitleId"></span></td>
				<td width="15%"><@spring.message "noti.view.title.kind"/></td>
			</tr>
			<tr>
				<td><@spring.message "noti.view.title.contents"/></td>
				<td><span id="notiContentsId"></span></td>
				<td><span id="notiKindId"></span></td>
			</tr>
		</table>
		<input type="hidden" id="notiNoId" name="notiNo" />
		<br/>
		<p align="center">
			<button type="button" onClick="notiCanel();" class="btn btn-primary">Close</button>
		</p>
	</div>

	<div id="notiListId">
	<ul class="item-box ul-table ul-thead">
		<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">#</li>
		<li class="li-cell"><@spring.message "noti.view.title.tile"/></li>
		<li class="li-cell"><@spring.message "noti.view.title.contents"/></li>
		<li class="li-cell"><@spring.message "noti.view.title.kind"/></li>
		<li class="li-cell"><@spring.message "noti.view.title.udate"/></li>
	</ul>
    <#if model??>
    <#if model.notificationList?has_content>
    <#list model.notificationList as noti>
		<ul class="bgrow nthrow item-box ul-table" onmouseover="overChangeColor(this);"  onmouseout="outChangeColor(this);" onclick="selectMTech(this, '${noti.notiNo?if_exists}');" >
			<li class="li-cell" style="border-width: 1px 1px 1px 1px; width: 5%;">${noti.notiNo?if_exists}</li>
			<li class="li-cell">${noti.notiTitle?if_exists}</li>
			<li class="li-cell">${noti.notiContents?if_exists}</li>
			<li class="li-cell">${noti.notiKind?if_exists}</li>
			<li class="li-cell">${noti.updateTime?string('yyyy/MM/dd')?if_exists}</li>
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
				<li><a href="sltNotiForUserList?nowPage=${model.paging.prevPage.nowPage}&allCount=${model.paging.allCount?c}" title="Prev" accesskey="*">Prev</span></a></li>
				</#if>
				<#if model.paging.pagingInfoList?has_content>
					<#list model.paging.pagingInfoList as pageList>
						<#if model.paging.nowPage?if_exists == pageList.pageNumber?if_exists>
						<li class="active"><a href="#">${pageList.pageNumber} <span class="sr-only">(current)</span></a></li>
						<#else>
						<li><a href="sltNotiForUserList?nowPage=${pageList.pageNumber}&allCount=${model.paging.allCount?c}">${pageList.pageNumber}</a></li>
						</#if>
					</#list>
				</#if>
				<#if model.paging.nextPage?exists>
				<li><a href="sltNotiForUserList?nowPage=${model.paging.nextPage.nowPage}&allCount=${model.paging.allCount?c}" accesskey="#" title="Next">Next</a></li>
				</#if>
			</#if>
		  </#if>
      	</ul>
	</nav><!-- end #nav -->

	</div><!-- end #col-md-12 -->
</div><!-- end #row -->

<#include "/apps/common/abilistsLoadJs.ftl"/>
<#include "js/sltNotiForUserListJs.ftl"/>

</@layout.myLayout>