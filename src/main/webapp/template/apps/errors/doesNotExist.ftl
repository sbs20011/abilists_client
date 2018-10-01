<#import "/apps/layout/abilistsLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<div class="item-box left-line-box">
	<nav class="breadcrumbs">
		<ul>
		<li><a href="#"><@spring.message "path.abilists.profile"/></a></li>
		<li class="active"><a href="#"><@spring.message "profile.menu.overview"/></a></li>
		</ul>
	</nav>
</div>


<div class="row fw-row"> 
  <div class="col-md-4 text-center">  
  </div>
  <div class="col-md-8">
	  <h2>Sorry</h2>
	  <p style="font-size: 120%;"> That page doesn’t exist! </p>
  </div>
</div>

<#include "/apps/common/abilistsLoadJs.ftl"/>

</@layout.myLayout>