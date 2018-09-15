<#macro myLayout title="Abilists.com">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<#include "abilistsWorksHeader.ftl"/>
	<body>
		<#include "/apps/common/abilistsLoading.ftl"/>
		<#include "abilistsNavi.ftl"/>
	    <div class="container">
			<#include "abilistsWorksMenu.ftl"/>

			<#nested/>

			<#include "/apps/common/abilistsFooder.ftl"/>
			<#include "/apps/common/footer.ftl">
	    </div><!-- /container -->

	</body>
</html>
</#macro>