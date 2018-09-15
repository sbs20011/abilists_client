<#macro myLayout title="Abilists.com">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<#include "/apps/layout/abilistsHeader.ftl"/>
	<body id="bodyId">
		<#include "/apps/common/abilistsLoading.ftl"/>
		<#include "abilistsClientNavi.ftl"/>
	    <div class="container">

			<#nested/>

			<#include "/apps/common/abilistsFooder.ftl"/>
			<#include "/apps/common/footer.ftl">
	    </div><!-- /container -->
	</body>
</html>
</#macro>