	<script type="text/javascript">
	
	window.onload = function() {
		$('#loading').hide();
	}

	$(document).ready(function(){
	    $("#flip").click(function(){
	        // $("#sampleForm").slideUp("slow");
	    });
	});
	
	function notiCanel() {
		$("#viewNotiId").slideUp("slow");
		clearBackGroundColorUl("notiListId");
	}
	
	function formSlideDown() {
		$("#viewNotiId").slideDown("slow");
	}

	var ajaxLastNum = 0;
	
	var table = document.getElementById("notiListId");
	var tr = table.getElementsByTagName("tr");
	
	function clearBackGroundColor() {
		for(var j=0; j< tr.length; j++) {
			tr[j].style.backgroundColor = "";
		}
	}
	
	var notiNoInput = document.getElementById("notiNoId");
	var notiTitleInput = document.getElementById("notiTitleId");
	var notiContentsInput = document.getElementById("notiContentsId");
	 var notiKindInput = document.getElementById("notiKindId");
	// var notiStartInput = document.getElementById("notiStartId");
	// var notiEndInput = document.getElementById("notiEndId");
	
	function selectMTech(x, num) {
	
		clearBackGroundColorUl("notiListId");
		$("#viewNotiId").insertAfter($(x));
	
		var paraJson = '{"notiNo" : "' + num + '"}';
	
		$(document).ready(function() {
	
			var availableKeys;
			var currentAjaxNum = ajaxLastNum;
	
	        $.ajax({
	            type: 'POST',
	            url: 'sltNotiAjax',
	            contentType: "application/json",
	            dataType: "json",
	            data: paraJson,
	            cache: false,
	            beforeSend: function(xhr, settings) {
	            	console.log("before send");
	            },
	            success: function(data, textStatus, request) {
	
	            	if(!isBlank(data)) {
	            		notiNoInput.innerHTML = data.notiNo;
	            		notiTitleInput.innerHTML = data.notiTitle;
	            		notiContentsInput.innerHTML = data.notiContents;
	            		notiKindInput.innerHTML = data.notiKind;
	
	//            		var startDate = new Date(data.notiStart);
	//            		notiStartInput.innerHTML = startDate.toISOString().substr(0,10);
	//            		var endDate = new Date(data.notiEnd);
	//            		notiEndInput.innerHTML = endDate.toISOString().substr(0,10);
	            		//notiEndInput.value = endDate.toISOString().substr(0,10).replace(/-/g, '/');
	            	}
	            },
	            complete: function(xhr, textStatus) {
	            	console.log("complete");
	            	formSlideDown();
	
	            	x.style.backgroundColor = "#9999CC";
	            	x.style.color= "#fff";
	            },
	            error: function(xhr, status) {
	            	console.log("error >> " + xhr.responseText);
	            }
	        });
		});
	}
	</script>
