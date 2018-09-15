<#macro myLayout title="Abilists.com">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<#include "abilistsUserHeader.ftl"/>
	<body>
		<#include "abilistsNavi.ftl"/>
	    <div class="container">
			<#include "abilistsMenu.ftl"/>

			<#nested/>

			<#include "/apps/common/footer.ftl">
	    </div><!-- /container -->
	</body>
</html>
</#macro>