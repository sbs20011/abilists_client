<#import "/apps/layout/abilistsLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<link rel="stylesheet" href="${configBean.contextPath?if_exists}/static/apps/css/works/memo.css?20180205">
<link rel="stylesheet" href="${configBean.contextPath?if_exists}/static/apps/css/abilists/posts.css?20180207">

<style>
</style>

<div id="divBodyId" class="row" style="margin-top: 65px;">
<div class="col-md-2 right-col-cus sideImg">
	<div class="item-box">
		<img style="border-radius: 4px;" src="${myPicture?if_exists}" id="showImg" width="125" alt="your picture" />
    </div>
</div>
<div class="col-sm-10 left-col-cus">
	<div class="item-box">
		<a href="http://www.abilists.com/" target="_blank">
			<img src="/static/apps/img/abilists/adBanner01.png" width="810px" height="125px" alt="www.abilists.com">
		</a>
	</div>
</div>
</div>

<div class="row nav-top">
	<div class="col-md-2 right-col-cus">

		<div id="memoDivId" class="item-box memo-fix">
		  	<ul style="list-style-type: none;width: 100%;display: table;padding-left: 5px; padding-right: 5px;">
		  		<li style="list-style-type: none;display: table-cell;">
			  		<h5 class="media-heading">My Memo</h5>
			  	</li>
			  	<li style="list-style-type: none;display: table-cell;">
			  		<a href="${configBean.baseURL?if_exists}/works/<#if user??>${user.userId?if_exists}/sltMemoList</#if>">
			  		<span class="glyphicon glyphicon-th" style="float: right; font-size: 18px;" aria-hidden="true" onclick=""></span>
			  		</a>
			  	</li>
		  	</ul>
		  <ul id="memoUiId" class="memo" style="position:relative;">
		  <#if model??>
		  <#if model.userMemoList?has_content>
		  <#list model.userMemoList as userMemo>

		  	<li style="margin: 5px;">
			  <a href="#" style="background:${userMemo.umBgColor?if_exists}; width: 125px; height: 125px;" 
				  onclick="udtUserMemo(this, '${userMemo.umNo?if_exists}', '${userMemo.umBgColor?if_exists}'); return false;">${userMemo.umMemo?if_exists}</a>
		    </li>

		  </#list>
		  </#if>
		  </#if>
		  </ul>
		</div>
	</div>

	<div class="col-md-7  right-col-cus left-col-cus"> 

	<div id="postsDivId">
	<#if model??>
	<#if model.postsBeanList?has_content>
	<#list model.postsBeanList as postsBean> 
		<div id="p${postsBean.upsNo?if_exists}" class="item-box posts main-posts">
			<div class="media">
			  <div class="media-left media-top">
			    <a href="${configBean.baseURL?if_exists}/profile/${postsBean.userId?if_exists}">
			    	<img style="border-radius: 4px;" src="${postsBean.userImgData?if_exists}" id="showImg" width="64" alt="your picture" />
			    </a>
			  </div>
			  <div class="media-body">
			  	<ul class="body-posts">
			  		<li class="body-posts-name">
			  			${postsBean.userName?if_exists}@${postsBean.userId?if_exists}
				  		<h5 class="media-heading"><b>${postsBean.upsTitle?if_exists}</b></h5>
				  	</li>
				  	<li class="dropdown body-posts-contents">
				  		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">
				  		<#if postsBean.userId == user.userId>
				  			<span class="glyphicon glyphicon-option-horizontal" style="color:#337ab7;float: right; font-size: 18px;" aria-hidden="true"></span>
				  		</#if>
				  		</a>
				        <ul class="dropdown-menu body-posts-menu">
				            <li><a href="#" onclick="dltPosts('${postsBean.upsNo?if_exists}'); return false;">Delete</a></li>
				        </ul>
				  	</li>
				</ul>

				<div id="c${postsBean.upsNo?if_exists}" 
					class="<#if postsBean.upsPost??><#if 250 < postsBean.upsPost?length >show-more/#else>show-more-out</#if></#if>">
					${postsBean.upsPost?if_exists}
				</div>

			  	<ul class="body-posts">
			  		<li>
				  	</li>
				  	<li>
					<#if postsBean.upsPost??>
				     	<#if 250 < postsBean.upsPost?length >
					  		<a href="#" onclick="showMore(this, 'c${postsBean.upsNo?if_exists}'); return false;">
					  			<span class="show-more-button">Show more</span>
					  		</a>
						</#if>
					</#if>
				  	</li>
				</ul>
				
			  </div>
			</div>

			<div class="posts-link">
			  <a href="${configBean.baseURL?if_exists}/${postsBean.urlPath?if_exists}">
				<span class="glyphicon glyphicon-eye-open" style="top: 3px;" aria-hidden="true"></span> See More
			  </a>

<#--
				<span class="glyphicon glyphicon-share" style="margin-left: 15px;font-size: 16px;" aria-hidden="true" onclick=""></span> Repost
-->

			</div>
		</div>
	</#list>
	</#if>
	</#if>
	</div>
    <button id="pageMoreId" type="button" class="btn btn-default" style="width:100%;" onclick="pageMore();">
      <span class="glyphicon glyphicon-option-horizontal" style="font-size: 200%;" />
    </button>
	</div>
	
	<div class="col-md-3 left-col-cus">
		<div id="usersDivId" class="item-box users-fix"> 
		  	<ul style="list-style-type: none;width: 100%;display: table;padding-left: 0px; padding-right: 5px;">
		  		<li style="list-style-type: none;display: table-cell;">
			  		<h5 class="media-heading">User List</h5>
			  	</li>
			  	<li style="list-style-type: none;display: table-cell;">
			  		<a href="${configBean.baseURL?if_exists}/list">
			  		<span class="glyphicon glyphicon-list" style="float: right; font-size: 18px;" aria-hidden="true" onclick=""></span>
			  		</a>
			  	</li>
		  	</ul>

		  	<#if model??>
		  	<#if model.usersList?has_content>
		  	<#list model.usersList as users>

				<div style="margin-bottom: 10px; padding-top: 10px; border-top: 1px solid #efefef;">
		 			<div class="media">
					  <div class="media-left media-top">
					  	<img style="border-radius: 4px;" src="${users.userImgData?if_exists}" id="showImg" width="48px" alt="your picture" />
					  </div>
					  <div class="media-body">
					  	<a href="${configBean.baseURL?if_exists}/profile/${users.userId?if_exists}">
					  	<h5 class="media-heading">${users.userId?if_exists}</h5>
					  	${users.userProfile?if_exists}
					  	</a>
					  </div>
					</div>
				</div>

		  	</#list>
		  	</#if>
		  	</#if>

			  	<div style="margin-bottom: 10px; padding-top: 10px; border-top: 1px solid #efefef;">
				About Help Center Terms Abilities Service for User <br/>
				Copyright © 2018 Abilists.com
				</div>
			</div>

	</div>
</div><!-- row -->

<!-- view user memo Modal -->
<div class="modal fade" id="udtUserMemoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div id="udtModalContentId" class="modal-content" style="background-color: #ffc;">

	    <div id="confirmMessage" class="modal-body">
	    <form name="udtUserMemoForm" class="form-horizontal" action="${configBean.baseURL?if_exists}/works/udtMemo" method="post" onkeypress="return captureReturnKey(event);">
	    	<textarea id="udtUmMemoId" style="height: 228px; width: 100%; background-color: #ffffcc; border-style:none;" name="umMemo" placeholder="Your memo" disabled></textarea>
	    	<input type="hidden" id="umNoId" name="umNo" />
	    </form>
	    </div>

	    <div class="modal-footer">
	      <ul style="float: left;padding: 0px;">
	      	<a class="btn btn-link" href="${configBean.baseURL?if_exists}/works/<#if user??>${user.userId?if_exists}/sltMemoList</#if>"><span class="glyphicon glyphicon-triangle-right" aria-hidden="true"></span>View all</a>
          </ul>

          <button type="button" class="btn btn-default" data-dismiss="modal"><@spring.message "projects.button.close"/></button>
	    </div>

	  </div>
	</div>
</div>

<#include "/apps/common/abilistsLoadJs.ftl"/>
<script src="${configBean.contextPath?if_exists}/static/apps/lib/jquery-ui-1.12.1/jquery-ui.min.js"></script>

<#include "js/indexJs.ftl"/>

<script type="text/javascript">

</script>

</@layout.myLayout>