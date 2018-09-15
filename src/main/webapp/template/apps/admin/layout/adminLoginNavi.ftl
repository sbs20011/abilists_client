<#import "/spring.ftl" as spring/>
	<!-- Static navbar -->
    <nav class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${configBean.baseURL?if_exists}/">
          	<ul style="list-style:none;padding: 0;">
	          	<li style="float:left;display:inline;padding: 0px 5px 0px 0px;"><img src="${configBean.contextPath?if_exists}/static/apps/img/bi02.png" class="img-responsive" width="70" alt="abilists" /></li>
          	</ul>
          </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li <#if model??><#if model.navi??><#if model.navi == "products">class="active"</#if></#if></#if>><a href="${configBean.baseURL?if_exists}/abilists/">Abilists</a></li>
            <li <#if model??><#if model.navi??><#if model.navi == "getstart">class="active"</#if></#if></#if>><a href="${configBean.baseURL?if_exists}/home/getstart"><@spring.message "navi.title.get.start"/></a></li>
            <li <#if model??><#if model.navi??><#if model.navi == "blog">class="active"</#if></#if></#if>><a href="http://abilist.blogspot.jp"><@spring.message "navi.title.blog"/></a></li>
            <#if user??>
            	
            </#if>
          </ul>
      	  <ul class="nav navbar-nav navbar-right">
      	  	<#if user??>
      		  <#include "/admin/login/adminNaviLogin.ftl">
			<#else>
      		  <#include "/admin/login/adminNaviLogout.ftl">
	     	</#if>
<#include "/apps/common/abilistsLang.ftl"/>

      	  </ul>
        </div><!--/.nav-collapse -->
      </div><!--/container -->
    </nav><!--/navbar -->