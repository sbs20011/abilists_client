<#macro myLayout title="Abilists.com">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<#include "abilistsAccountHeader.ftl"/>
	<body>
		<#include "/apps/common/abilistsLoading.ftl"/>
		<#include "/apps/layout/abilistsNavi.ftl"/>
		<div id="bgImageId" class="bg-image">
		    <div class="container">
				<#include "abilistsAccountCrumbing.ftl"/>

				<#nested/>

				<#include "/apps/common/abilistsFooder.ftl"/>
				<#include "/apps/common/footer.ftl">
		    </div><!-- /container -->
	    </div>
	</body>
</html>
</#macro>