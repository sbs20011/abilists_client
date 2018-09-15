	
	<script type="text/javascript">
	
	window.onload = function() {
		$('#loading').hide();
	}
	
	/* Load select data from the server.*/
	var mtechList = {};
	<#if commonBean??>
	<#if commonBean.getMtechMap("tech")?has_content>
		<#list commonBean.getMtechMap("tech")?keys as key>
		<#if key != "">
		mtechList['${key?if_exists}'] = [       
		    <#list commonBean.getMtechMap("tech")[key] as tech>
		    	{mtNo : "${tech.mtNo?if_exists?c}",mtName: "${tech.mtName?if_exists}"}<#if tech?has_next>,</#if>
		    </#list>
		];
		</#if>
		</#list>
	</#if>
	</#if>
	
	function newFormToggle() {
		$("#srhFormUserList").slideToggle("slow");
		$("#newToggleId").toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
	
	}
	function newFormCancel() {
		$("#srhFormUserList").slideUp("slow");
		$("#newToggleId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	}
	
	</script>
