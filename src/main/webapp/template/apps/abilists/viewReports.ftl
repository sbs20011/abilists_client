<#import "/spring.ftl" as spring/>

<style>
	.dl-horizontal dd {
	    margin-left: 110px;
	}

	.dl-horizontal dt {
	    width: 100px;
	}
</style>

  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">
    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
    <h4 class="modal-title" id="myModalLabel"><@spring.message "home.title.reports"/></h4>
  </div>

  <div id="confirmMessage" class="modal-body">

	<#if model.userReports??>
	<dl class="dl-horizontal">
		<dt><@spring.message "reports.title.workday"/></dt>
		<dd>${model.userReports.urWorkDay?string('yyyy-MM-dd')?if_exists}</dd>
		<dt><@spring.message "reports.title.reports"/></dt>
		<dd class="line-break">
			<#if model.userReports.urReport??>
			${model.userReports.urReport?string?if_exists}
			</#if>
		</dd>
		<dt><@spring.message "reports.title.update"/></dt>
		<dd>${model.userReports.updateTime?string('yyyy-MM-dd')?if_exists}</dd>
	</dl>
	</#if>

  </div>

  <div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
  </div>