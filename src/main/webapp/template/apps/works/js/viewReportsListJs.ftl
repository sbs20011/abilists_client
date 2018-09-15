	<script type="text/javascript">
	
	window.onload = function() {
		$('#loading').hide();
	}

	var ajaxLastNum = 0;
	
	var table = document.getElementById("userReportsId");
	var tr = table.getElementsByTagName("tr");
	
	function clearBackGroundColor() {
		for(var j=0; j< tr.length; j++) {
			tr[j].style.backgroundColor = "";
		}
	}
	
	var urNoInput = document.getElementById("urNoId");
	var urWorkDayInput = document.getElementById("udtUrWorkDayId");
	var urWorkHourInput = document.getElementById("udtUrWorkHourId");
	var urReportsInput = document.getElementById("udtUrReportsId");
	var tokenInput = document.getElementById("tokenId");
	
	function selectUserReports(x, userId, day) {
	
		clearBackGroundColorUl("userReportsId");
		$("#udtMdataFormId").insertAfter($(x));

		$(document).ready(function() {
	
			var availableKeys;
			var currentAjaxNum = ajaxLastNum;
	
	        $.ajax({
	            type: 'POST',
	            url: 'sltReportsAjax',
	            contentType: "application/json",
	            dataType: "json",
	            data: '{ "userId" : "' + userId + '", "urWorkDay" : "' + day + '"}',
	            cache: false,
	            beforeSend: function(xhr, settings) {
	            	console.log("before send");
	            },
	            success: function(data, textStatus, request) {
	            	if(!isBlank(data)) {
	            		
	            		// Sequence Number
	            		urNoInput.value = data.urNo;
	
	            		// Work Day
	            		var workDay = new Date(data.urWorkDay);
	            		// urWorkDayInput.value = workDay.toISOString().substr(0,10);
	            		var dd = workDay.getDate();
	            		// January is 0!
	            		var mm = workDay.getMonth()+1;
	            		var yyyy = workDay.getFullYear();
	            		if(dd<10){
	            		    dd='0'+dd
	            		} 
	            		if(mm<10){
	            		    mm='0'+mm
	            		} 
	            		var today = yyyy + '-' + mm + '-' + dd;
	            		urWorkDayInput.value = today;
	            		// Working hours
	            		urWorkHourInput.value = data.urWorkHour;
	
	            		// Reports for report
	            		urReportsInput.value = data.urReport;
	            		tokenInput.value = data.token;
	            	}
	            },
	            complete: function(xhr, textStatus) {
	            	console.log("complete");

	            	formSlideDown();

	            	// x.style.backgroundColor = "#9999CC";
	            	x.style.color= "#fff";
	            },
	            error: function(xhr, status) {
	            	console.log("error >> " + xhr.responseText);
	                var contentType = xhr.getResponseHeader("Content-Type");
	                if (xhr.status === 200 && contentType.toLowerCase().indexOf("text/html") >= 0) {
	                    // Login has expired - reload our current page
	                    window.location.reload();
	                }
	            }
	        });
		});
	}

	function formSlideDown() {
		$("#udtMdataFormId").slideDown("slow");
	}

	function updateFormCancel() {
		$("#udtMdataFormId").slideUp("slow");
		clearBackGroundColorUl("userReportsId");
	}

	</script>