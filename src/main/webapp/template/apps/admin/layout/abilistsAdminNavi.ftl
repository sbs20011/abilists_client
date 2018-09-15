        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${configBean.baseURL?if_exists}/admin/">Admin</a>
                <a class="navbar-brand" href="${configBean.baseURL?if_exists}/abilists"><img src="${configBean.contextPath?if_exists}/static/apps/img/bi02.png" class="img-responsive" width="70" alt="abilists" /></a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">
					<img style="border-radius: 4px;" src="${myPicture?if_exists}" height="25" width="25" alt="my picture" /><span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="${configBean.baseURL?if_exists}/profile"><i class="fa fa-user fa-fw"></i> <#if user??>${user.userName?if_exists} <@spring.message "profile.menu.profile"/> </#if></a></li>
						<li><a href="${configBean.baseURL?if_exists}/account"><i class="fa fa-gear fa-fw"></i> <@spring.message "account.menu.settings"/></a></li>
						<li class="divider"></li>
						<li><a href="${configBean.baseURL?if_exists}/admin/login/logout"><i class="fa fa-sign-out fa-fw"></i> <@spring.message "login.sign.out"/><span class="sr-only">(current)</span></a></li>
					</ul>
				</li>

				<#include "/apps/common/abilistsLang.ftl"/>

            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="${configBean.baseURL?if_exists}/admin/"><i class="fa fa-dashboard fa-fw"></i> <@spring.message "menu.side.dashboard"/></a>
                        </li>
                        <li <#if model??><#if model.navi??><#if model.navi == "project">class="active"</#if></#if></#if>>
	                        <a href="#"><i class="fa fa-files-o fa-fw"></i> <@spring.message "admin.menu.works"/><span class="fa arrow"></span></a>
	                        <ul class="nav nav-second-level">
	                          <li><a href="${configBean.baseURL?if_exists}/admin/works/sltProjectsList" <#if model??><#if model.menu??><#if model.menu == "sltProjectsList">class="active"</#if></#if></#if>><@spring.message "menu.side.projects.list"/></a></li>
	                          <li><a href="${configBean.baseURL?if_exists}/admin/works/sltProjectTechList" <#if model??><#if model.menu??><#if model.menu == "sltProjectTechList">class="active"</#if></#if></#if>><@spring.message "menu.side.tech.list"/></a></li>
	                          <li><a href="${configBean.baseURL?if_exists}/admin/works/sltTasksList" <#if model??><#if model.menu??><#if model.menu == "sltTasksList">class="active"</#if></#if></#if>><@spring.message "menu.side.tasks.list"/></a></li>
	                          <li><a href="${configBean.baseURL?if_exists}/admin/works/sltReportsList" <#if model??><#if model.menu??><#if model.menu == "sltReportsList">class="active"</#if></#if></#if>><@spring.message "menu.side.reports.list"/></a></li>
	                          <li><a href="${configBean.baseURL?if_exists}/admin/works/sltMemoList" <#if model??><#if model.menu??><#if model.menu == "sltMemoList">class="active"</#if></#if></#if>><@spring.message "menu.side.memo.list"/></a></li>
	                        </ul>
                        </li>
                        <li>
	                        <a href="#"><i class="fa fa-id-card-o fa-fw"></i> <@spring.message "menu.side.users"/> <span class="fa arrow"></span></a>
	                        <ul class="nav nav-second-level">
	                          <li><a href="${configBean.baseURL?if_exists}/admin/users/sltUsersList"><@spring.message "menu.side.users.list"/></a></li>
	                        </ul>
                        </li>
                        <li <#if model??><#if model.navi??><#if model.navi == "master">class="active"</#if></#if></#if>>
	                        <a href="#"><i class="fa fa-database fa-fw"></i> <@spring.message "admin.menu.mdata"/> <span class="fa arrow"></span></a>
	                        <ul class="nav nav-second-level">
	                          <li><a href="${configBean.baseURL?if_exists}/admin/master/sltMTechList" <#if model??><#if model.menu??><#if model.menu == "mTechList">class="active"</#if></#if></#if>><@spring.message "admin.menu.skills"/></a></li>
	                          <li><a href="${configBean.baseURL?if_exists}/admin/master/sltMRoleList" <#if model??><#if model.menu??><#if model.menu == "mRoleList">class="active"</#if></#if></#if>><@spring.message "admin.menu.mrole"/></a></li>
	                          <li><a href="${configBean.baseURL?if_exists}/admin/master/sltMIndustryList" <#if model??><#if model.menu??><#if model.menu == "mIndustryList">class="active"</#if></#if></#if>><@spring.message "admin.menu.mindustry"/></a></li>
	                        </ul>
                        </li>
                        <li>
            				<a href="${configBean.baseURL?if_exists}/admin/noti/sltNotiList"><i class="fa fa-envelope-open-o fa-fw"></i> <@spring.message "admin.menu.notification"/></a>
            			</li>

<#--
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="${configBean.baseURL?if_exists}/admin/charts/sltCharts1">Charts 1</a>
                                </li>
                                <li>
                                    <a href="${configBean.baseURL?if_exists}/admin/charts/sltCharts2">Charts 2</a>
                                </li>
                            </ul>
                        </li>
-->

                        <li>
                        	<a href="#"><i class="fa fa-refresh fa-fw"></i> <@spring.message "menu.side.reload"/><span class="fa arrow"></span></a>
	                        <ul class="nav nav-second-level">
	                          <li><a href="${configBean.baseURL?if_exists}/admin/reloadMaster"><@spring.message "menu.side.master"/></a></li>
	                        </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->

            </div>
            <!-- /.navbar-static-side -->
        </nav>