<#import "/apps/admin/layout/abilistsAdminLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box" style="margin-top: 15px;">
<div class="row">
	<div class="col-md-8">
		<h3>Charts 1</h3>
	</div>
	<div class="col-md-4">
	</div>
</div>
</div>

<div class="row">
  <div class="col-md-12">

	  <#include "/apps/common/errorMessage.ftl"/>
	  <div class="item-box">

	  	Charts 1

	  </div>

  </div><!-- #col-md-12 -->
</div><!-- #row -->

<script type="text/javascript">
	window.onload = function() {
		$('#loading').hide();
	}
</script>
<#include "/apps/common/abilistsAdminLoadJs.ftl"/>

</@layout.myLayout>