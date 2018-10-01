<#macro myLayout title="Abilists.com">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<#include "abilistsAdminHeader.ftl"/>
	<body>
    	<#include "/apps/common/abilistsLoading.ftl"/>
	    <#include "abilistsAdminNavi.ftl"/>
    	<div id="page-wrapper">

		<#nested/>

		<#include "abilistsAdminFooter.ftl">
	    </div><!-- /#page-wrapper -->
		<#include "/apps/common/abilistsFooder.ftl"/>
	  </body>
</html>
</#macro>

