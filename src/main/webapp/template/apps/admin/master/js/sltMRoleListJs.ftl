
<script type="text/javascript">

$(document).ready(function(){
    $("#flip").click(function(){
        $("#newMdataFormId").slideUp("slow");
    });
});

function removeProject() {
	// Call the modal for deleting
	$(window).ready(function(){
		$('#submitFormDeleteMdataId').modal('show')
	});
}

function validateForm(tableName) {

	var blnPopover = true;
	var isError = true;

	var table = document.getElementById(tableName);

	// Validate input tag
	var inputTag = table.getElementsByTagName("input");
	if(!validateField(inputTag)) {
		isError = false;
	}

	// Validate select tag
	selectTag = table.getElementsByTagName("select");
	if(!validateField(selectTag)) {
		isError = false;
	}

	return isError;
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
		$('#submitFormUserProjects').modal('show')
	});

	var table1 = document.getElementById(tableName);
	// Create a table on Motal 
	var table3 = document.getElementById("t03");

	var row1, row3;
	var cell31, cell32, cell33, cell34

	var row11 = table1.rows[0];
	var row12 = table1.rows[1];
	var row13 = table1.rows[2];
	var row14 = table1.rows[3];
	var row15 = table1.rows[4];

	var row31 = table3.rows[0];
	var row32 = table3.rows[1];
	var row33 = table3.rows[2];
	var row34 = table3.rows[3];
	var row35 = table3.rows[4];

	var inputMrNameHtml;
	var selectMlCodeHtml;
	var textareaMrExplainHtml;
	var textareaMrSkillsHtml;
	var textareaMrPrefersHtml;

	inputMrNameHtml = row11.cells[1].getElementsByTagName("input")[0].value;
	row31.cells[1].innerHTML = inputMrNameHtml;
	inputMrCodeHtml = row12.cells[1].getElementsByTagName("input")[0].value;
	row32.cells[1].innerHTML = inputMrCodeHtml;
	selectMlCodeHtml = row12.cells[3].getElementsByTagName("select")[0].value;
	row32.cells[3].innerHTML = selectMlCodeHtml;
	textareaMrExplainHtml = row13.cells[1].getElementsByTagName("textarea")[0].value;
	row33.cells[1].innerHTML = textareaMrExplainHtml;

	textareaMrSkillsHtml = row14.cells[1].getElementsByTagName("textarea")[0].value;
	row34.cells[1].innerHTML = textareaMrSkillsHtml;
	textareaMrPrefersHtml = row15.cells[1].getElementsByTagName("textarea")[0].value;
	row35.cells[1].innerHTML = textareaMrPrefersHtml;

	if(tableName == "newFormId") {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitNewMdata();" );		  
	} else {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitUpdateMdata();" );
	}

}

var ajaxLastNum = 0;

var mrNoInput = document.getElementById("mrNoId");
var mrNameInput = document.getElementById("mrNameId");
var mrCodeInput = document.getElementById("mrCodeId");
var mrExplainInput = document.getElementById("mrExplainId");
var mrSkillsInput = document.getElementById("mrSkillsId");
var mrPrefersInput = document.getElementById("mrPrefersId");
var mlCodeInput = document.getElementById("mlCodeId");


function selectMRole(x, num) {

	clearBackGroundColorUl("mRoleId");

	$("#updateMdataFormId").insertAfter($(x));

	$(document).ready(function() {

		var availableKeys;
		var currentAjaxNum = ajaxLastNum;

        $.ajax({
            type: 'POST',
            url: 'sltMRoleAjax',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            data: 'body={ "mrNo" : "' + num + '"}',
            cache: false,
            beforeSend: function(xhr, settings) {
            	console.log("before send");
            },
            success: function(data, textStatus, request) {
            	if(!isBlank(data.result)) {
            		availableKeys = data.result;

            		mrNoInput.value = availableKeys.mrNo;
            		mrNameInput.value = availableKeys.mrName;
            		mrCodeInput.value = availableKeys.mrCode;
            		mrExplainInput.value = availableKeys.mrExplain;
            		mrSkillsInput.value = availableKeys.mrSkills;
            		mrPrefersInput.value = availableKeys.mrPrefers;
            		mlCodeInput.value = availableKeys.mlCode;
            	}
            },
            complete: function(xhr, textStatus) {
            	console.log("complete");
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

function newFormToggle() {

	$("#newMdataFormId").slideToggle("slow");
	$("#newToggleId").toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
	mrNoInput.value = "";
	mrNameInput.value = "";
	mrCodeInput.value = "";
	mrExplainInput.value = "";
	mrSkillsInput.value = "";
	mlCodeInput.value = "";

	clearBackGroundColorUl("mRoleId");
	updateFormCancel();
}

function formSlideDown() {
	$("#updateMdataFormId").slideDown("slow");
}

function newFormCancel() {
	$("#newMdataFormId").slideUp("slow");
	$("#newToggleId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	clearBackGroundColorUl("mRoleId");
}

function updateFormCancel() {
	$("#updateMdataFormId").slideUp("slow");
	$("#newToggleId").addClass('add-symbol');
	clearBackGroundColorUl("mRoleId");
}

function submitNewMdata() {
	document.newForm.submit();
}

function submitUpdateMdata() {
	document.updateForm.submit();
}

//Delete mTech
function submitFormDeleteMdata() {
	document.updateForm.action = "dltMRole";
	document.updateForm.submit();
}

// Auto complete
function changeItemBg(obj, parentId) {
	// Clear bg color.
	var nodes = clearBgColumn(parentId);

	var selectedNum=1;
	console.log(obj.options[obj.selectedIndex].text);
	if(obj.options[obj.selectedIndex].text == "<@spring.message 'role.title.name'/>") {
		selectedNum=1;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'role.title.code'/>") {
		selectedNum=2;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'role.title.skills'/>") {
		selectedNum=3;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'role.title.prefer'/>") {
		selectedNum=4;
	} else {
		selectedNum=4;
	}

	setBgColumn(nodes, selectedNum, '#eeeeee', 'DIV');
}

</script>
