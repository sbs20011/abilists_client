	<script type="text/javascript">
	
	window.onload = function() {
		$('#loading').hide();
	}

	$(document).ready(function(){
	    $("#flip").click(function(){
	        $("#newMdataFormId").slideUp("slow");
	    });
	});

	function removeTasks() {
		// Call the modal for deleting
		$(window).ready(function(){
			$('#submitFormDeleteTasks').modal('show')
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
			$('#sbtTasksModal').modal('show')
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
			document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitNewFormUserTasks();" );
		} else {
			document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitUpdateFormUserTasks();" );
		}
	
	}

	$(function() {
		var dateFormat = "yy-mm-dd",
			from = $( "#newUtStartDayId" ).datepicker({
				defaultDate: "+1w",
		        showButtonPanel: true, 
		        changeMonth: true,
			    currentText: '<@spring.message "calendar.day.today"/>', 
			    closeText: '<@spring.message "calendar.day.close"/>',
		        dateFormat: dateFormat,
			    nextText: '<@spring.message "calendar.day.next.month"/>',
			    prevText: '<@spring.message "calendar.day.previous.month"/>',
			    dayNames: [<@spring.message "calendar.day.name"/>],
			    dayNamesMin: [<@spring.message "calendar.day.name.min"/>],
		        numberOfMonths: 1
		      })
		      .on( "change", function() {
		        to.datepicker( "option", "minDate", getDate( this ) );
		      }),
		    to = $( "#newUtEndDayId" ).datepicker({
		        defaultDate: "+1w",
		        showButtonPanel: true, 
		        changeMonth: true,
			    currentText: '<@spring.message "calendar.day.today"/>', 
			    closeText: '<@spring.message "calendar.day.close"/>',
		        dateFormat: dateFormat,
			    nextText: '<@spring.message "calendar.day.next.month"/>',
			    prevText: '<@spring.message "calendar.day.previous.month"/>',
			    dayNames: [<@spring.message "calendar.day.name"/>],
			    dayNamesMin: [<@spring.message "calendar.day.name.min"/>],
		        numberOfMonths: 1
		      })
		      .on( "change", function() {
		        from.datepicker( "option", "maxDate", getDate( this ) );
		      });

		    function getDate( element ) {
		      var date;
		      try {
		        date = $.datepicker.parseDate( dateFormat, element.value );
		      } catch( error ) {
		        date = null;
		      }
		      return date;
		    }
		}
	);

	$(function() {
		var dateFormat = "yy-mm-dd",
			from = $( "#utStartDayId" ).datepicker({
				defaultDate: "+1w",
		        showButtonPanel: true, 
		        changeMonth: true,
			    currentText: '<@spring.message "calendar.day.today"/>', 
			    closeText: '<@spring.message "calendar.day.close"/>',
		        dateFormat: dateFormat,
			    nextText: '<@spring.message "calendar.day.next.month"/>',
			    prevText: '<@spring.message "calendar.day.previous.month"/>',
			    dayNames: [<@spring.message "calendar.day.name"/>],
			    dayNamesMin: [<@spring.message "calendar.day.name.min"/>],
		        numberOfMonths: 1
		      })
		      .on( "change", function() {
		        to.datepicker( "option", "minDate", getDate( this ) );
		      }),
		    to = $( "#utEndDayId" ).datepicker({
		        defaultDate: "+1w",
		        showButtonPanel: true, 
		        changeMonth: true,
			    currentText: '<@spring.message "calendar.day.today"/>', 
			    closeText: '<@spring.message "calendar.day.close"/>',
		        dateFormat: dateFormat,
			    nextText: '<@spring.message "calendar.day.next.month"/>',
			    prevText: '<@spring.message "calendar.day.previous.month"/>',
			    dayNames: [<@spring.message "calendar.day.name"/>],
			    dayNamesMin: [<@spring.message "calendar.day.name.min"/>],
		        numberOfMonths: 1
		      })
		      .on( "change", function() {
		        from.datepicker( "option", "maxDate", getDate( this ) );
		      });

		    function getDate( element ) {
		      var date;
		      try {
		        date = $.datepicker.parseDate( dateFormat, element.value );
		      } catch( error ) {
		        date = null;
		      }
		      return date;
		    }
		}
	);


	var ajaxLastNum = 0;
	
	var table = document.getElementById("userTasksId");
	var tr = table.getElementsByTagName("tr");
	
	function clearBackGroundColor() {
		for(var j=0; j< tr.length; j++) {
			tr[j].style.backgroundColor = "";
		}
	}

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
	            	
	            	// Set a tasks title into Model
	            	var dltTasksTileId = document.getElementById("dltTasksTileId");
	            	dltTasksTileId.innerHTML = utTitleInput.value;
	
	            	formSlideDown();
	            	newFormCancel();

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
	
		utNoInput.value = "";
		utStartDayInput.value = "";
		utEndDayInput.value = "";
		utTaskHourInput.value = "";
		utMarginHourInput.value = "";
		utTitleInput.value = "";
		utTaskInput.value = "";
		upNoInput.value = "";

		updateFormCancel();
	}

	function formSlideDown() {
		$("#udtMdataFormId").slideDown("slow");
	}
	
	function newFormCancel() {
		$("#newMdataFormId").slideUp("slow");
		$("#newToggleId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	}
	
	function updateFormCancel() {
		$("#udtMdataFormId").slideUp("slow");
	}
	
	function submitNewFormUserTasks() {
		document.newForm.submit();
	}
	
	function submitUpdateFormUserTasks() {
		document.updateForm.submit();
	}

	/*
	 * Remove a tasks
	 */
	function submitDeleteFormTasks() {
		document.updateForm.action = "/works/dltTasks";
		document.updateForm.submit();
	}

	/*
	 * Sort
	 */
	var utSortListId = document.getElementById("utSortListId");
	var newToken = document.getElementById("newTokenId");

	$( function() {
	  $( "#userTasksId" ).sortable({ 
		  cursor: "move", 
	      start: function (event, ui) {
	          ui.item.toggleClass("highlight");
		  },
		  stop: function (event, ui) {
		      ui.item.toggleClass("highlight");
		  },
		  change: function( event, ui ) {
			  utSortListId.style.display = "block"; 
		  }
	  });

	  $( "#userTasksId" ).disableSelection();
	} );

	</script>