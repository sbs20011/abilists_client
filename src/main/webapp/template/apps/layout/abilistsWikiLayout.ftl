<#macro myLayout title="Abilists.com">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<#include "abilistsWikiHeader.ftl"/>
	<body>
		<#include "abilistsNavi.ftl"/>
	    <div class="container">
			<#include "abilistsWikiMenu.ftl"/>

			<#nested/>

			<#include "/apps/common/footer.ftl">
	    </div><!-- /container -->
		<#include "/apps/common/abilistsFooder.ftl"/>
	</body>
</html>
</#macro>