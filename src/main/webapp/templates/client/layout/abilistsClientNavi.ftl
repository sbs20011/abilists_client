<#import "/spring.ftl" as spring/>
	<!-- Static navbar -->
    <nav id="myNavbar" class="navbar navbar-default navbar-static-top" style="position: fixed; width: 100%;">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${configBean.baseURL?if_exists}/abilists"><img src="${configBean.contextPath?if_exists}/static/apps/img/bi02.png" class="img-responsive" width="70" alt="abilists" /></a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <#if user??>
    			<li <#if model??><#if model.navi??><#if model.navi == "list">class="active"</#if></#if></#if>><a href="${configBean.baseURL?if_exists}/list"><@spring.message "profile.menu.list"/></a></li>
            	<li <#if model??><#if model.navi??><#if model.navi == "profile">class="active"</#if></#if></#if>><a href="${configBean.baseURL?if_exists}/profile"><@spring.message "navi.title.profile"/></a></li>
            	<li <#if model??><#if model.navi??><#if model.navi == "works">class="active"</#if></#if></#if>><a href="${configBean.baseURL?if_exists}/works"><@spring.message "navi.title.works"/></a></li>
                <li class="dropdown<#if model??><#if model.navi??><#if model.navi == 'plugins'> active</#if></#if></#if>">
	              <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #586b92; font-weight: bold;" role="button" aria-haspopup="true" aria-expanded="false"> <@spring.message "plugins.navi.title"/> <span class="glyphicon glyphicon-plus"></span> <span class="caret"></span></a>
	              <ul class="dropdown-menu">
	                <li <#if model??><#if model.navi??><#if model.navi == "plugins">class="active"</#if></#if></#if>><a href="${configBean.baseURL?if_exists}/plugins"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span> <@spring.message "plugins.navi.title"/></a></li>
	                <li><a href="http://www.abilists.com/home/help/helpDevelop" target="_blank"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span> <@spring.message "plugins.navi.guide.development"/> </a></li>
	              	<li role="separator" class="divider"></li>
	                <li <#if model??><#if model.navi??><#if model.navi == "host">class="active"</#if></#if></#if>><a href="${configBean.baseURL?if_exists}/host"><span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span> <@spring.message "client.contact.us"/></a></li>
	              </ul>
	            </li>
	        <#else>
	            <li <#if model??><#if model.navi??><#if model.navi == "abilists">class="active"</#if></#if></#if>><a href="${configBean.baseURL?if_exists}/abilists/"><@spring.message "navi.title.abilists"/></a></li>
	            <li <#if model??><#if model.navi??><#if model.navi == "blog">class="active"</#if></#if></#if>><a href="http://abilist.blogspot.jp" target="_blank"><@spring.message "navi.title.blog"/></a></li>
            </#if>
          </ul>

      	  <ul class="nav navbar-nav navbar-right">
      	  	<#if user??>
      		  <#include "/apps/login/naviLogin.ftl">
			<#else>
      		  <#include "/apps/login/naviLogout.ftl">
	     	</#if>

<#include "/apps/common/abilistsLang.ftl"/>

      	  </ul>
        </div><!--/.nav-collapse -->
      </div><!--/container -->
    </nav><!--/navbar -->