	<script type="text/javascript">
	
	window.onload = function() {
		$('#loading').hide();
	}

	var ajaxLastNum = 0;

	var utNoInput = document.getElementById("utNoId");
	var utSortInput = document.getElementById("utSortId");
	var utStatusInput = document.getElementById("utStatusId");
	var utProgressInput = document.getElementById("utProgressId");
	var utStartDayInput = document.getElementById("utStartDayId");
	var utEndDayInput = document.getElementById("utEndDayId");
	var utTaskHourInput = document.getElementById("utTaskHourId");
	var utMarginHourInput = document.getElementById("utMarginHourId");
	var utKindInput = document.getElementById("utKindId");
	var utTitleInput = document.getElementById("utTitleId");
	var utTaskInput = document.getElementById("utTaskId");
	var upNoInput = document.getElementById("upNoId");
	var tokenInput = document.getElementById("tokenId");

	function selectUserTasks(x, userId, utNo) {

		$("#udtMdataFormId").insertAfter($(x));

		$(document).ready(function() {

			var availableKeys;
			var currentAjaxNum = ajaxLastNum;

	        $.ajax({
	            type: 'POST',
	            url: 'sltTasksAjax',
	            contentType: "application/json",
	            dataType: "json",
	            data: '{ "userId" : "' + userId + '", "utNo" : "' + utNo + '"}',
	            cache: false,
	            beforeSend: function(xhr, settings) {
	            	console.log("before send");
	            },
	            success: function(data, textStatus, request) {
	            	if(!isBlank(data)) {

	            		// Sequence Number
	            		utNoInput.value = data.utNo;
	            		utSortInput.value = data.utSort;

	            		utStatusInput.value = data.utStatus;
	            		utProgressInput.value = data.utProgress;

	            		// Start Day
	            		var workDay = new Date(data.utStartDay);

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
	            		var startDay = yyyy + '-' + mm + '-' + dd;
	            		utStartDayInput.value = startDay;

	            		// End Day
	            		workDay = new Date(data.utEndDay);
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
	            		var endDay = yyyy + '-' + mm + '-' + dd;
	            		utEndDayInput.value = endDay;

	            		// Task hours
	            		utTaskHourInput.value = data.utTaskHour;
	            		// Margin hours
	            		utMarginHourInput.value = data.utMarginHour;

	            		// Title
	            		utTitleInput.value = data.utTitle;
	            		// Task
	            		utTaskInput.value = data.utTask;
	            		tokenInput.value = data.token;
	            	}
	            },
	            complete: function(xhr, textStatus) {
	            	console.log("complete");

	            	formSlideDown();

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
	}

	</script>