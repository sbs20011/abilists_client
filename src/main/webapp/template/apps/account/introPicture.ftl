<#import "/apps/layout/account/abilistsAccountLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="row">
  <div class="col-md-12">

	<#include "/apps/common/abilistsSuccess.ftl"/>

	<div class="row">
	  <div class="col-sm-3 right-col-cus">
	  	<div class="item-box">
		<#include "sidebar.ftl"/>
	  	</div>
	  </div>

	  <div class="col-sm-9 left-col-cus">

		<#include "uploadImageBg.ftl"/>

	  	<div class="item-box">
	  		Change your profile photo
		</div><!-- /item-box-->

	  </div><!-- /col-sm-8 left-col-cus8-->
	</div><!-- /row-->

  </div><!-- /col-md-12-->
</div><!-- /row -->

<#include "/apps/common/abilistsLoadJs.ftl"/>

<script type="text/javascript">

window.onload = function() {
	$('#loading').hide();
}
</script>

<#include "js/uploadImageAvatarJs.ftl"/>
<#include "js/uploadImageBgJs.ftl"/>

</@layout.myLayout>