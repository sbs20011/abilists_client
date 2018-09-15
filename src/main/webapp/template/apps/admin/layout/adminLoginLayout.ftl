<#macro myLayout title="Abilists.com">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<#include "adminLoginHeader.ftl"/>
	<body>
		<#include "/apps/common/abilistsLoading.ftl"/>
		<#include "abilistsAdminNavi.ftl"/>
	    <div class="container">

	    	<#nested/>
			<#include "abilistsAdminFooter.ftl">
	    </div><!-- /container -->
	</body>
</html>
</#macro>