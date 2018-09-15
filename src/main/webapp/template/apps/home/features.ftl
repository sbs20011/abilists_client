<#import "layout/homeLayout.ftl" as layout>
<#import "/spring.ftl" as spring/>
<@layout.myLayout>

<script>

function bigImage01() {
	$(window).ready(function(){
		$('#bigImg01').modal('show')
	});
}
function bigImage02() {
	$(window).ready(function(){
		$('#bigImg02').modal('show')
	});
}

</script>

    <div class="row fw-row" style="padding: 20px;">
	    <div class="col-md-6">
		    <h2>User Features</h2>
		    <p style="font-size: 120%;">Simplicity</p>
		    <p style="font-size: 120%;">Flexibility</p>
		    <p style="font-size: 120%;">Multilingual</p>
	    </div>
	    <div class="col-md-6 text-center">
    		<a href="#" onclick="bigImage01()">
				<img src="/static/apps/img/gallery/gallery01.png" width="100%" alt="your picture" />
			</a>
		</div>
	</div>
    <div class="row fw-row" style="background-color: white;padding: 20px;">
	    <div class="col-md-6">
			<img src="/static/apps/img/gallery/gallery02.png" width="100%" alt="your picture" />
		</div>
	    <div class="col-md-6">
	    	<img src="/static/apps/img/gallery/gallery03.png" width="100%" alt="your picture" />
	    </div>
	</div>
    <div class="row fw-row" style="padding: 20px;">
	    <div class="col-md-6">
		    <h2>Admin Features</h2>
		    <p style="font-size: 120%;">Management engineers and projects</p>
		    <p style="font-size: 120%;">Easy Understand engineers skills </p>
		    <p style="font-size: 120%;">Find good engineers</p>
	    </div>
	    <div class="col-md-6 text-center">
			<a href="#" onclick="bigImage02()">
				<img src="/static/apps/img/gallery/gallery05.png" width="100%" alt="your picture" />
			</a>
		</div>
	</div>

<!-- Picture Modal -->
<div class="modal fade" id="bigImg01" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div id="confirmMessage" class="modal-body">
    	<img src="/static/apps/img/gallery/gallery01.png" width="100%" alt="your picture" />
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    </div>
  </div>
</div>
</div>

<div class="modal fade" id="bigImg02" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div id="confirmMessage" class="modal-body">
    	<img src="/static/apps/img/gallery/gallery05.png" width="100%" alt="your picture" />
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    </div>
  </div>
</div>
</div>

</@layout.myLayout>