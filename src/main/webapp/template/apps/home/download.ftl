<#import "layout/homeLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

	<div class="row fw-row">
	    <div class="col-md-4 text-center">
	    	<h3><@spring.message "download.title.name"/></h3>
	    	<h2 style="font-size: 250%;"><span class="glyphicon glyphicon-download-alt"></span></h2>
	
	    </div>
	    <div class="col-md-8 text-center" style="padding-top: 30px;">
		    <a class="btn btn-primary btn-lg" href="https://github.com/minziappa/abilists_apps/raw/product/webapps/h2db.zip">Download H2 Database</a>
		    <a class="btn btn-primary btn-lg" href="https://github.com/minziappa/abilists_apps/raw/product/webapps/ROOT.war">Download Abilists</a>
		</div>
	</div>

    <div class="row fw-row" style="background-color: white;">
	    <div class="col-md-8">
	    	<span style="font-size: 120%;"><@spring.message "download.install.step1"/></span>
		    <div class="vim01">
	    		$ mv ./h2db.zip ~/
		    </div>
	    	<span style="font-size: 120%;"><@spring.message "download.install.step2"/></span>
		    <div class="vim01">
	    		$ unzip ~/h2db.zip
		    </div>
	    	<span style="font-size: 120%;"><@spring.message "download.install.step3"/></span>
		    <div class="vim01">
	    		$ mv ~/ROOT.war %TOMCAT_HOME%/webapps/
		    </div>
		    <span style="font-size: 120%;">Just start tomcat, and login id:<b>admin</b>, password:<b>admin</b></span>
	    </div>
	    <div class="col-md-4 text-center">
			<h3>Linux</h3>
	    	<h2 style="font-size: 250%;"><span class="glyphicon glyphicon-cog"></span></h2>
	    	<h3><@spring.message "download.how.title"/></h3>
		</div>
	</div>

	<div class="row fw-row">
	    <div class="col-md-4 text-center">
	    	<h3>Windows</h3>
	    	<h2 style="font-size: 250%;"><span class="glyphicon glyphicon-cog"></span></h2>
			<h3><@spring.message "download.how.title"/></h3>
	    </div>
	    <div class="col-md-8">
	    	<span style="font-size: 120%;"><@spring.message "download.install.step1"/></span>
		    <div class="vim01">
				$ cd C:\Users\[your account]\Downloads
			</div>
		    <div class="vim01">
	    		$ move h2db.zip ../
		    </div>
	    	<span style="font-size: 120%;"><@spring.message "download.install.step2"/></span>
		    <div class="vim01">
	    		$ 7z e h2db.zip
		    </div>
	    	<span style="font-size: 120%;"><@spring.message "download.install.step3"/></span>
		    <div class="vim01">
				$ cd C:\Users\[your account]\Downloads
			</div>
		    <div class="vim01">
	    		$ move ROOT.war %TOMCAT_HOME%/webapps/
		    </div>
		    <span style="font-size: 120%;">Just start tomcat, and login id:<b>admin</b>, password:<b>admin</b></span>
		</div>
	</div>

</@layout.myLayout>