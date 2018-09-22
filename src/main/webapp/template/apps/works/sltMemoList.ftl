<#import "/apps/layout/works/abilistsWorksLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<link rel="stylesheet" href="${configBean.contextPath?if_exists}/static/apps/css/works/memo.css?20180206">

<style>

</style>

<div class="item-box">
	<div class="row">
		<div class="col-md-6">
			<nav class="breadcrumbs">
			<ul>
			<li><a href="/works"><@spring.message "navi.title.works"/></a></li>
			<li class="active"><a href="#"><@spring.message "navi.title.works.memo"/></a></li>
			</ul>
			</nav>
		</div>
		<div class="col-md-6">
			<form id="searchForm" action="srhForMemo" method="post" onkeydown="return captureReturnKey(event)">
		    <div id="search0" class="input-group">
			    <input name="srhContents" type="text" class="form-control" style="width: 100%; height: 28px;"
			    	value="" autocomplete="off" autocorrect="off" autocapitilize="off"
			    		data-toggle="popover" data-trigger="manual" data-placement="top" 
			    			title="Popover title" data-content="Default popover"
			    				placeholder="Search for Name" onkeydown="interverKeystroke(event, 0, 'srhForMemoAjax', this);">
			    <span class="input-group-btn">
			      <button class="btn btn-default" style="height: 28px;" type="submit">
			      	<i class="glyphicon glyphicon-search" style="top: 1px;"></i>
			      </button>
			    </span>
		    </div><!-- /input-group -->
		    </form>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-2 right-col-cus sideImg">
		<div class="item-box">
			<img style="border-radius: 4px;" src="${model.users.userImgAvatar?if_exists}" id="showImg" width="125" alt="your picture" />
	    </div>
	</div>
	<div class="col-sm-10">
		<div class="item-box">
			<canvas id="myMemoLine" height="125px"/>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-12">
	  	<div class="caption mittle-size-title middle-works-bg">
	  		<h4>
	  			<@spring.message "navi.title.works.memo"/>
	  			<span class="glyphicon glyphicon-plus right-symbol-button" style="color:#337ab7;" aria-hidden="true" onClick="istUserMemo();"></span>
	  		</h4>
	  	</div>
		<#include "/apps/common/errorMessageNoButton.ftl"/>
		<#include "/apps/common/abilistsSuccess.ftl"/>

	  <div class="item-box">
		  <ul id="memoUiId" class="memo">
		    <#if model??>
		    <#if model.userMemoList?has_content>
			    <#list model.userMemoList as userMemo>
			    <li>
				  <a href="#" style="<#if userMemo??>background:${userMemo.umBgColor?if_exists};</#if>" 
					  onclick="udtUserMemo(this, '${userMemo.umNo?if_exists}', '${userMemo.umBgColor?if_exists}'); return false;">${userMemo.umMemo?if_exists}</a><input type="hidden" name="umNoOrder" value="${userMemo.umNo?if_exists}"/>
			    </li>
				<input type="hidden" name="umSortOrder" value="${userMemo.umSort?if_exists}"/>
				</#list>
			</#if>
			</#if>
		  </ul>
		  <div style="text-align: center;"> 
		    <button id="pageMoreId" type="button" class="btn btn-default" style="width:98%;" onclick="pageMore('${model.users.userId?if_exists}');">
		      <span class="glyphicon glyphicon-option-horizontal" style="font-size: 200%;" />
		    </button>
	      </div>
	  </div>

	</div>
</div>

<!-- Insert user memo Modal -->
<div class="modal fade" id="istUserMemoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div id="modalContentId" class="modal-content" style="background-color: #fffeed;">

	    <div id="confirmMessage" class="modal-body">
	    <form name="istUserMemoForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/works/istMemo" method="post" onkeypress="return captureReturnKey(event);">
	    	<textarea id="umMemoId" style="height: 228px; width: 100%; background-color: #fffeed; border-style:none;" name="umMemo" placeholder="Your memo"></textarea>
	    	<input type="hidden" id="newTokenId" name="token" value="<#if model??>${model.token?if_exists}</#if>" />
	    	<input type="hidden" id="umBgColorId" name="umBgColor"/>
	    </form>
	    </div>

	    <div class="modal-footer">
	      <ul id="colorId" class="memo-bg-color">
          	  <li style="background:#fffeed;" onClick="return changeBcColor(this,'colorId');"></li>
	          <li style="background:#ffeded;" onClick="return changeBcColor(this,'colorId');"></li>
	          <li style="background:#edfcff;" onClick="return changeBcColor(this,'colorId');"></li>
	          <li style="background:#ededff;" onClick="return changeBcColor(this,'colorId');"></li>
	          <li style="background:#fbedff;" onClick="return changeBcColor(this,'colorId');"></li>
	          <li style="background:#edffed;" onClick="return changeBcColor(this,'colorId');"></li>
          </ul>
	      <button type="button" class="btn btn-primary" onclick="javascript: sbtIstUserMemoForm();"><@spring.message "works.button.close"/></button>
	      <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
	    </div>

	  </div>
	</div>
</div>

<!-- Update user memo Modal -->
<div class="modal fade" id="udtUserMemoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div id="udtModalContentId" class="modal-content" style="background-color: #ffc;">

	    <div id="confirmMessage" class="modal-body">
	    <form name="udtUserMemoForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/works/udtMemo" method="post" onkeypress="return captureReturnKey(event);">
	    	<textarea id="udtUmMemoId" style="height: 228px; width: 100%; background-color: #fffeed; border-style:none;" name="umMemo" placeholder="Your memo"></textarea>
	    	<input type="hidden" name="token" value="<#if model??>${model.token?if_exists}</#if>" />
	    	<input type="hidden" id="umNoId" name="umNo" />
	    	<input type="hidden" id="udtUmBgColorId" name="umBgColor" />
	    </form>
	    </div>

	    <div class="modal-footer">
	      <ul id="udtColorId" class="memo-bg-color">
	      	  <li style="background:#fffeed;" onClick="return udtChangeBcColor(this,'udtColorId');"></li>
	          <li style="background:#ffeded;" onClick="return udtChangeBcColor(this,'udtColorId');"></li>
	          <li style="background:#edfcff;" onClick="return udtChangeBcColor(this,'udtColorId');"></li>
	          <li style="background:#ededff;" onClick="return udtChangeBcColor(this,'udtColorId');"></li>
	          <li style="background:#fbedff;" onClick="return udtChangeBcColor(this,'udtColorId');"></li>
	          <li style="background:#edffed;" onClick="return udtChangeBcColor(this,'udtColorId');"></li>
          </ul>

	      <button type="button" class="btn btn-primary" onclick="javascript: sbtUdtUserMemoForm();"><@spring.message "works.button.update"/></button>
	      <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
	      <button type="button" class="btn btn-danger" onclick="removeMemo()"><@spring.message "reports.title.delete"/></button>
	    </div>

	  </div>
	</div>
</div>

<#include "/apps/common/abilistsWorksLoadJs.ftl"/>
<script src="${configBean.contextPath?if_exists}/static/apps/js/search.js?2018051912"></script>
<#include "js/sltMemoListJs.ftl"/>

<script type="text/javascript">
<#include "charts/chartMemo.ftl"/>
</script>

</@layout.myLayout>