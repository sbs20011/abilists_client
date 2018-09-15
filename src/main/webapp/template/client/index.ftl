<#import "/client/layout/abilistsClientLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="row" style="margin-top: 65px;">
<div class="col-md-2 right-col-cus sideImg">
	<div class="item-box">
		<img style="border-radius: 4px;" src="${myPicture?if_exists}" id="showImg" width="125" alt="your picture" />
    </div>
</div>
<div class="col-sm-10 left-col-cus">
	<div class="item-box">
		<canvas id="myTechBar" height="125px"/>
	</div>
</div>
</div>

<#include "/apps/common/abilistsLoadJs.ftl"/>
<script type="text/javascript">
window.onload = function() {
	$('#loading').hide();
}
</script>

</@layout.myLayout>