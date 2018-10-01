function viewReports(day) {
	// Call the modal
	$(window).ready(function(){
		// Only ones
		//$('div.modal').modal({remote : 'abilists/viewProjects/' + num});
		// Not only one
		$("#popupView").load("${configBean.baseURL?if_exists}/abilists/viewReports/" + day, function() {
			$('div.modal').modal('show');
		});
	});
}

function viewNoti(num) {
	// Call the modal
	$(window).ready(function(){
		// Only ones
		//$('div.modal').modal({remote : 'abilists/viewProjects/' + num});
		$("#popupView").load("${configBean.baseURL?if_exists}/abilists/viewNoti/" + num, function() {
			$('div.modal').modal('show');
		});
	});
}

function viewProject(num) {
	// Call the modal
	$(window).ready(function(){
		$("#popupView").load("${configBean.baseURL?if_exists}/abilists/viewProjects/" + num, function() {
			$('div.modal').modal('show');
		});
	});
}

$( function() {
  $( "#urWorkDayId" ).datepicker({
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


function addProjectName(x) {
	var urReportsId = document.getElementById("urReportsId");
	var project = "[" + x.options[x.selectedIndex].text + "] \r\r" +urReportsId.value;
	urReportsId.value = project;
}

function clearReports() {
	var urReportsId = document.getElementById("urReportsId");
	urReportsId.value = "";
}


function validateForm(formName) {

	var blnPopover = true;
	var isError = true;
	var table = document.getElementById(formName);
	var inputTag = table.getElementsByTagName("input");

	var $input = $(inputTag);
	
	if(!validateField(inputTag)) {
		return false;
	}
	// Check number
	if(!validateNumTag(inputTag)) {
		return false;
	}
	var selectTag = table.getElementsByTagName("textarea");
	if(!validateField(selectTag)) {
		return false;
	}

	return true;
}

/*
 * Make the table on the Modal for confirming the data.
 */
function confirmData(formName) {

	if(!validateForm(formName)) {
		return false;
	}
	var reportsForm = document.getElementById(formName);
	reportsForm.submit();
}

/* Not used */
function clearPopover(tagName) {
	var tags = document.getElementsByTagName(tagName);
	
	for (i=0; i < tags.length; i++) {
	    var x = tags[i];
		$jevent = $(x);
		$jevent.popover('destroy');
	}
}
/* Tool tip functions */
function showPopover(local, tagName) {
	$jlocal = $(local);
	$jlocal.popover('show');
}

function destroyPopover(event) {
	$jevent = $(event);
	$jevent.popover('destroy');
}

/* Input Text size */
var errorText = "<@spring.message "input.text.size.max"/>";
$('textarea').textcounter({
	max:2500, counterText:"Total Count: %d/2500", maximumErrorText:errorText,
	stopInputAtMaximum:false, countSpaces:true, twoCharCarriageReturn:false, countExtendedCharacters:true
});
