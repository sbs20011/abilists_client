	<script type="text/javascript">

	$(document).ready(function(){
	    $("#flip").click(function(){
	        $("#newMdataFormId").slideUp("slow");
	    });
	});
	
	function removeReports() {
		// Call the modal for deleting
		$(window).ready(function(){
			$('#submitFormDeleteReports').modal('show')
		});
	}
	
	function validateForm(tableName) {
	
		var blnPopover = true;
		var isError = true;
	
		var table = document.getElementById(tableName);
	
		var inputTag = table.getElementsByTagName("input");
		if(!validateField(inputTag)) {
			return false;
		}
		var textareaTag = table.getElementsByTagName("textarea");
		if(!validateField(textareaTag)) {
			return false;
		}
	
		return true;
	}
	
	/*
	 * Make the table on the Modal for confirming the data.
	 */
	function confirmData(tableName) {
	
		if(!validateForm(tableName)) {
			return;
		}
	
		// Call the modal
		$(window).ready(function(){
			$('#submitFormUserReports').modal('show')
		});

		var table1 = document.getElementById(tableName);
		// Create a table on Motal 
		var table3 = document.getElementById("t03");
	
		var tagInput, tagTextarea;
		var row3;
		var cell31, cell32
	
		var tagInput = table1.getElementsByTagName("input");
		var tagTextarea = table1.getElementsByTagName("textarea");
	
		row32 = table3.rows[1];
	
		row32.cells[0].innerHTML = tagInput[0].value;
		row32.cells[1].innerHTML = tagTextarea[0].value.replace(/\n|\r/g, "<br/>");
	
		if(tableName == "newFormId") {
			document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitNewFormUserReports();" );
		} else {
			document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitUpdateFormUserReports();" );
		}
	
	}
	
	function addProjectName(x, tagId) {
		var urReportsId = document.getElementById(tagId);
		var project = "[" + x.options[x.selectedIndex].text + "] \r\r" +urReportsId.value;
		urReportsId.value = project;
	}
	
	function clearReports() {
		var urReportsId = document.getElementById("urReportsId");
		urReportsId.value = "";
	}
	
	$( function() {
		  $( "#newUrWorkDayId" ).datepicker({
		      showButtonPanel: true, 
		      currentText: '<@spring.message "calendar.day.today"/>', 
		      closeText: '<@spring.message "calendar.day.close"/>',
		      dateFormat: "yy-mm-dd",
		      nextText: '<@spring.message "calendar.day.next.month"/>',
		      prevText: '<@spring.message "calendar.day.previous.month"/>',
		      dayNames: [<@spring.message "calendar.day.name"/>],
		      dayNamesMin: [<@spring.message "calendar.day.name.min"/>]
		  });
		});

	$( function() {
		  $( "#udtUrWorkDayId" ).datepicker({
		      showButtonPanel: true, 
		      currentText: '<@spring.message "calendar.day.today"/>', 
		      closeText: '<@spring.message "calendar.day.close"/>',
		      dateFormat: "yy-mm-dd",
		      nextText: '<@spring.message "calendar.day.next.month"/>',
		      prevText: '<@spring.message "calendar.day.previous.month"/>',
		      dayNames: [<@spring.message "calendar.day.name"/>],
		      dayNamesMin: [<@spring.message "calendar.day.name.min"/>]
		  });
		});
	
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
	            	
	            	// Set a reports title into Model
	            	var dltReportsTileId = document.getElementById("dltReportsTileId");
	            	dltReportsTileId.innerHTML = urWorkDayInput.value;
	
	            	formSlideDown();
	            	newFormCancel();
	
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
	
	function newFormToggle() {
		$("#newMdataFormId").slideToggle("slow");
		$("#newToggleId").toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
	
		urNoInput.value = "";
		urWorkDayInput.value = "";
		urReportsInput.value = "";
	
		clearBackGroundColorUl("userReportsId");
		updateFormCancel();
	}
	
	function formSlideDown() {
		$("#udtMdataFormId").slideDown("slow");
	}
	
	function newFormCancel() {
		$("#newMdataFormId").slideUp("slow");
		$("#newToggleId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
		clearBackGroundColorUl("userReportsId");
	}
	
	function updateFormCancel() {
		$("#udtMdataFormId").slideUp("slow");
		clearBackGroundColorUl("userReportsId");
	}
	
	function submitNewFormUserReports() {
		document.newForm.submit();
	}
	
	function submitUpdateFormUserReports() {
		document.updateForm.submit();
	}
	
	/*
	 * Remove a reports
	 */
	function submitDeleteFormReports() {
		document.updateForm.action = "/works/dltReports";
		document.updateForm.submit();
	}

	/* Input Text size */
	var errorText = "<@spring.message "input.text.size.max"/>";
	$('textarea').textcounter({
		max:2500, counterText:"Total Count: %d/2500", maximumErrorText:errorText,
		stopInputAtMaximum:false, countSpaces:true, twoCharCarriageReturn:false, countExtendedCharacters:true
	});

	</script>