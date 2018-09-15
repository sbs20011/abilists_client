<#import "/apps/admin/layout/abilistsAdminLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<script type="text/javascript">

window.onload = function() {
	$('#loading').hide();
}

</script>

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header" style="margin: 15px 0 00px;"><@spring.message "dashboard.title.home"/></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>

    <div class="row">
        <div class="col-md-6 right-col-cus">
        	<div class="caption mittle-size-title"><h4><@spring.message "dashboard.title.user"/></h4></div>
        	<div class="item-box">
	            <canvas id="myUserBar" height="150px"/>
        	</div>
        </div>
        <div class="col-md-6 left-col-cus">
        	<div class="caption mittle-size-title"><h4><@spring.message "dashboard.title.projects"/></h4></div>
        	<div class="item-box">
        		<canvas id="myProjectBar" height="150px"/>
        	</div>
        </div>
    </div>

    <!-- /.row -->
    <div class="row">
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading" onmouseover="overChangeColor(this);" onClick="window.location.href='${configBean.baseURL?if_exists}/admin/master/sltMTechList';">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-cog fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">${model.techsSum?if_exists}</div>
                            <div><@spring.message "admin.menu.mtech"/></div>
                        </div>
                    </div>
                </div>
                <a href="master/sltMTechList">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>

        <div class="col-lg-3 col-md-6">
            <div class="panel panel-green">
                <div class="panel-heading" onmouseover="overChangeColor(this);" onClick="window.location.href='${configBean.baseURL?if_exists}/admin/master/sltMIndustryList';">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-industry fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">${model.industrySum?if_exists}</div>
                            <div><@spring.message "admin.menu.mindustry"/></div>
                        </div>
                    </div>
                </div>
                <a href="master/sltMIndustryList">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>

        <div class="col-lg-3 col-md-6">
            <div class="panel panel-yellow">
                <div class="panel-heading" onmouseover="overChangeColor(this);" onClick="window.location.href='${configBean.baseURL?if_exists}/admin/master/sltMRoleList';">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-id-card-o fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">${model.rolesSum?if_exists}</div>
                            <div><@spring.message "admin.menu.mrole"/></div>
                        </div>
                    </div>
                </div>
                <a href="master/sltMRoleList">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>

        <div class="col-lg-3 col-md-6">
            <div class="panel panel-red">
                <div class="panel-heading" onmouseover="overChangeColor(this);" onClick="window.location.href='${configBean.baseURL?if_exists}/admin/noti/sltNotiList';">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-envelope-open-o fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">${model.notiSum?if_exists}</div>
                            <div><@spring.message "admin.menu.notification"/></div>
                        </div>
                    </div>
                </div>
                <a href="noti/sltNotiList">
                    <div class="panel-footer">
                        <span class="pull-left">View Details</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <!-- /.row -->

    <div class="row">
    	<div class="col-md-7 right-col-cus">
    	<div class="caption mittle-size-title"><h4><@spring.message "dashboard.title.user.reports"/></h4></div>

		<#if model??>
		<#if model.reportsBeanList?has_content>
		<#list model.reportsBeanList as reportsBean>
			<div class="item-box bgrow" style="margin-bottom:2px;padding: 5px 5px 5px 5px;" onmouseover="overChangeColor(this);" onmouseout="outChangeColor(this);" onClick="window.location.href='/profile/${reportsBean.userReports.userId?if_exists}';">
				<div class="media">
					<div class="media-left">
						<a href="${configBean.baseURL?if_exists}/profile/${reportsBean.userReports.userId?if_exists}">
							<div class="media-object text-center">
								<img width="64px" id="showImg" alt="image" src="${reportsBean.userImgData?if_exists}" />
							</div>
						</a>
					</div>
					<div class="media-body">
					    <div class="row">
					        <div class="col-md-6">
							<h4 class="media-heading"> 
								${reportsBean.userReports.urWorkDay?string('yyyy-MM-dd')?if_exists}
							</h4>
							<small>
								<#if reportsBean.userReports.urReport??>
									<#if 50 < reportsBean.userReports.urReport?length >
									${reportsBean.userReports.urReport?if_exists[0..50]}...
									<#else>
									${reportsBean.userReports.urReport?if_exists}
									</#if>
								</#if>
								
								
							</small>
					        </div>
					        <div class="col-md-6">
					        <div><canvas id="myReportsBoundaries${reportsBean_index}" height="65px"/></div>
					        </div>
						</div>
					</div>
				</div>
			</div>

		</#list>
		</#if>
		</#if>

		</div><!-- /.col-lg-7 -->

		<div class="col-md-5 left-col-cus">
			<div class="caption mittle-size-title"><h4><@spring.message "dashboard.title.user.skill"/></h4></div>
			<#if model??>
			<#if model.skillsLevelBean?has_content>				
				<#list model.skillsLevelBean.mTechJoinUserSkillsLevelList as mTechJoinUserSkillsLevel>
				<div class="item-box" style="margin-bottom: 0px;">
					<div class="progress" style="margin-bottom: 0px;">
						<div class="progress-bar progress-bar-info progress-bar-striped"
								role="progressbar" aria-valuenow="${mTechJoinUserSkillsLevel.skillLevel?c}" aria-valuemin="0" 
									aria-valuemax="100" style='width: ${mTechJoinUserSkillsLevel.sumLevel?c}%'>${mTechJoinUserSkillsLevel.sumLevel?c}%<span class="sr-only">${mTechJoinUserSkillsLevel.sumLevel?c}% Complete</span>
						</div>
						<div>
							${mTechJoinUserSkillsLevel.mtName?if_exists}
						</div>
					</div>
				</div>
				</#list>
			</#if>
			</#if>
        </div><!-- /.col-lg-6 -->
    </div><!-- /.row -->

<#include "/apps/common/abilistsAdminLoadJs.ftl"/>

<script>

<#include "index/chartUsers.ftl"/>
<#include "index/chartProjects.ftl"/>
<#include "index/chartUserReports.ftl"/>

function goToDetail(userId, urNo) {
	window.location.href="project/sltReportsList";
}

//////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////

</script>

</@layout.myLayout>