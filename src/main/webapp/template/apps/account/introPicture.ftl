<#import "/apps/layout/account/abilistsAccountLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>
<link href="${configBean.contextPath?if_exists}/static/apps/css/croppingBg.css?201706212175" rel="stylesheet">

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
	  		You can change your back ground image
	  		<!--
	  		<label class="radio-inline">
		  	  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
		  	  <img src="/static/apps/img/defaultBg01.png" alt="backGround" width="200px" height="120px" />
		  	</label>
		  	<label class="radio-inline">
		  	  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
		  	  <img src="/static/apps/img/defaultBg01.png" alt="backGround" width="200px" height="120px" />
		  	</label>
		  	<label class="radio-inline">
		  	  <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
		  	  <img src="/static/apps/img/defaultBg01.png" alt="backGround" width="200px" height="120px" />
		  	</label>
		  	-->
		</div><!-- /item-box-->

	  </div><!-- /col-sm-8 left-col-cus8-->
	</div><!-- /row-->

  </div><!-- /col-md-12-->
</div><!-- /row -->

<#include "/apps/common/abilistsLoadJs.ftl"/>

<#include "js/uploadImageAvatarJs.ftl"/>
<#include "js/uploadImageBgJs.ftl"/>

</@layout.myLayout>