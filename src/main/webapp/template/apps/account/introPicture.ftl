<#import "/apps/layout/abilistsAccountLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<link href="${configBean.contextPath?if_exists}/static/apps/lib/cropper-v3.0.0-rc.2/cropper.css" rel="stylesheet">
<link href="${configBean.contextPath?if_exists}/static/apps/css/cropping.css?201706212171" rel="stylesheet">

<div class="row">
  <div class="col-md-12">

	<#include "/apps/common/abilistsSuccess.ftl"/>

	<div class="row">
	  <div class="col-sm-4 right-col-cus">
	  	<div class="item-box">
		<#include "sidebar.ftl"/>
	  	</div>
	  </div>

	  <div class="col-sm-8 left-col-cus">

<#include "modalUploadImage.ftl"/>

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

<script src="${configBean.contextPath?if_exists}/static/apps/lib/cropper-v3.0.0-rc.2/cropper.js"></script>
<script src="${configBean.contextPath?if_exists}/static/apps/js/cropping.js?201706212181"></script>

<#include "js/modalUploadImageJs.ftl"/>

</@layout.myLayout>