
<script type="text/javascript"> 

window.onload = function() {
	//var reports = document.getElementsByName("userReports");
	//selectUserReports(reports[5], '8')

	$('#loading').hide();
}

function removeReports() {
	// Call the modal for deleting
	$(window).ready(function(){
		$('#submitFormDeleteReports').modal('show')
	});
}

var ajaxLastNum = 0;

var urNoInput = document.getElementById("urNoId");
var urWorkDayInput = document.getElementById("udtUrWorkDayId");
var urWorkHourInput = document.getElementById("udtUrWorkHourId");
var urReportsInput = document.getElementById("udtUrReportsId");

function selectUserReports(x, day, userId) {

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
            data: '{ "urWorkDay" : "' + day + '", "forView" : "true", "userId" : "' + userId + '"}',
            cache: false,
            beforeSend: function(xhr, settings) {
            	console.log("before send");
            },
            success: function(data, textStatus, request) {
            	if(!isBlank(data)) {

            		// Sequence Number
            		urNoInput.value = data.userReports.urNo;

            		// Work Day
            		var workDay = new Date(data.userReports.urWorkDay);
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
            		urWorkDayInput.innerHTML = today;

            		// Reports for report
            		urReportsInput.innerHTML = data.userReports.urReport;
            		// Working hours
            		urWorkHourInput.innerHTML = data.userReports.urWorkHour;

            	}
            },
            complete: function(xhr, textStatus) {
            	console.log("complete");

            	// Set a reports title into Model
            	var dltReportsTileId = document.getElementById("dltReportsTileId");
            	dltReportsTileId.innerHTML = urWorkDayInput.innerHTML;

            	formSlideDown();
            	newFormCancel();

            	x.style.backgroundColor = "#9999CC";
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

function newFormCancel() {
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
function sbtDeleteFormReports() {
	document.updateForm.action = "dltReports";
	document.updateForm.submit();
}

//Auto complete
function changeItemBg(obj, parentId) {

	// Clear bg color.
	var nodes = clearBgColumn(parentId);

	var selectedNum=1;
	console.log(obj.options[obj.selectedIndex].text);
	if(obj.options[obj.selectedIndex].text == "<@spring.message 'user.title.id'/>") {
		selectedNum=2;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'reports.title.workday'/>") {
		selectedNum=3;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'reports.title.workhour'/>") {
		selectedNum=4;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'reports.title.reports'/>") {
		selectedNum=5;
	} else {
		selectedNum=2;
	}

	setBgColumn(nodes, selectedNum, '#eeeeee', 'DIV');
}

</script>
