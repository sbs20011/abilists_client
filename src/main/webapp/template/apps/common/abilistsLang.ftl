			<li class="dropdown">
     		<#if lang?? && lang == "ko">
     			<a href="?lang=ko" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"><span class="glyphicon glyphicon-globe" aria-hidden="true"></span> <@spring.message "navi.lang.ko"/><span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="?lang=en"><@spring.message "navi.lang.en"/></a></li>
					<li><a href="?lang=ja"><@spring.message "navi.lang.ja"/></a></li>
				</ul>
     		<#elseif lang?? && lang == "ja">
				<a href="?lang=ja" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"><span class="glyphicon glyphicon-globe" aria-hidden="true"></span> <@spring.message "navi.lang.ja"/><span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="?lang=ko"><@spring.message "navi.lang.ko"/></a></li>
					<li><a href="?lang=en"><@spring.message "navi.lang.en"/></a></li>
				</ul>
     		<#else>
				<a href="?lang=en" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"><span class="glyphicon glyphicon-globe" aria-hidden="true"></span> <@spring.message "navi.lang.en"/><span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="?lang=ko"><@spring.message "navi.lang.ko"/></a></li>
					<li><a href="?lang=ja"><@spring.message "navi.lang.ja"/></a></li>
				</ul>
     		</#if>
			</li>