
<script type="text/javascript">

$(document).ready(function(){
    $("#flip").click(function(){
        $("#newMdataFormId").slideUp("slow");
    });
});

function dltMdata() {
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
	
	if(!validateId(inputTag[0])) {
		isError = false;
	}
	if(!validateId(inputTag[1])) {
		isError = false;
	}
	if(!validateId(inputTag[3])) {
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
		$('#submitFormMTech').modal('show')
	});

	// the source table
	var table1 = document.getElementById(tableName);
	// Create a table on modal 
	var table3 = document.getElementById("t03");

	var row11, row12, row13, row31, row32, row33;

	row11 = table1.rows[0];
	row12 = table1.rows[1];
	row13 = table1.rows[2];
	row31 = table3.rows[0];
	row32 = table3.rows[1];
	row33 = table3.rows[2];

	var inputMtSkillHtml;
	var inputMtKindHtml;
	var inputMtVersionHtml;
	var inputMtNameHtml;
	var inputMtTrendHtml;
	var inputMtExplainHtml;

	inputMtSkillHtml = row11.cells[1].getElementsByTagName("select")[0].value;
	row31.cells[1].innerHTML = inputMtSkillHtml;
	inputMtKindHtml = row11.cells[3].getElementsByTagName("input")[0].value;
	row31.cells[3].innerHTML = inputMtKindHtml;
	inputMtVersionHtml = row11.cells[5].getElementsByTagName("input")[0].value;
	row31.cells[5].innerHTML = inputMtVersionHtml;

	inputMtVersionHtml = row12.cells[1].getElementsByTagName("input")[0].value;
	row32.cells[1].innerHTML = inputMtVersionHtml;
	inputMtTrendHtml = row12.cells[3].getElementsByTagName("input")[0].value;
	row32.cells[3].innerHTML = inputMtTrendHtml;

	inputMtExplainHtml = row13.cells[1].getElementsByTagName("input")[0].value;
	row33.cells[1].innerHTML = inputMtExplainHtml;

	if(tableName == "newFormId") {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitNewMdata();" );		  
	} else {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitUpdateMdata();" );
	}

}

var ajaxLastNum = 0;              

var mtNoInput = document.getElementById("mtNoId");
var mtSkillInput = document.getElementById("mtSkillId");
var mtKindInput = document.getElementById("mtKindId");
var mtNameInput = document.getElementById("mtNameId");
var mtVersionInput = document.getElementById("mtVersionId");
var mtExplainInput = document.getElementById("mtExplainId");
var mtTrendInput = document.getElementById("mtTrendId");
var mTechDetailInput = document.getElementById("mTechDetailId");

function selectMTech(x, num) {

	clearBackGroundColorUl("mTechId");

	$("#updateMdataFormId").insertAfter($(x));

	$(document).ready(function() {

		var availableKeys;
		var currentAjaxNum = ajaxLastNum;

        $.ajax({
            type: 'POST',
            url: 'sltMTechAjax',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            data: 'body={ "mtNo" : "' + num + '"}',
            cache: false,
            beforeSend: function(xhr, settings) {
            	console.log("before send");
            },
            success: function(data, textStatus, request) {
            	if(!isBlank(data.result)) {
            		availableKeys = data.result;
            		mtNoInput.value = availableKeys.mtNo;
            		mtSkillInput.value = availableKeys.mtSkill;
            		mtKindInput.value = availableKeys.mtKind;
            		mtNameInput.value = availableKeys.mtName;
            		mtVersionInput.value = availableKeys.mtVersion;
            		mtExplainInput.value = availableKeys.mtExplain;
            		mtTrendInput.value = availableKeys.mtTrend;
            		mTechDetailInput.href = "sltMTechDetailList/" + availableKeys.mtNo
            	}
            },
            complete: function(xhr, textStatus) {
            	console.log("complete");

            	// Set a project title into Model
            	var dltMasterDataId = document.getElementById("dltMasterDataId");
            	dltMasterDataId.innerHTML = mtNameInput.value;

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
	mtNoInput.value = "";
	mtSkillInput.value = "";
	mtKindInput.value = "";
	mtNameInput.value = "";
	mtVersionInput.value = "";
	mtExplainInput.value = "";
	mtTrendInput.value = "";

	clearBackGroundColorUl("mTechId");
	updateFormCancel();

}

function formSlideDown() {
	$("#updateMdataFormId").slideDown("slow");
}

function newFormCancel() {
	$("#newMdataFormId").slideUp("slow");
	$("#newToggleId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	clearBackGroundColorUl("mTechId");
}

function updateFormCancel() {
	$("#updateMdataFormId").slideUp("slow");
	$("#newToggleId").addClass('add-symbol');
	clearBackGroundColorUl("mTechId");
}

// Insert a new mTech
function submitNewMdata() {
	document.newForm.submit();
}

// Update mTech
function submitUpdateMdata() {
	document.updateForm.submit();
}

// Delete mTech
function submitFormDeleteMdata() {
	document.updateForm.action = "dltMTech";
	document.updateForm.submit();
}

// Auto complete
function changeItemBg(obj, parentId) {

	// Clear bg color.
	var nodes = clearBgColumn(parentId);

	var selectedNum=1;
	console.log(obj.options[obj.selectedIndex].text);
	if(obj.options[obj.selectedIndex].text == "<@spring.message 'tech.title.skills'/>") {
		selectedNum=1;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'tech.title.kind'/>") {
		selectedNum=2;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'tech.title.name'/>") {
		selectedNum=3;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'tech.title.version'/>") {
		selectedNum=4;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'tech.title.explain'/>") {
		selectedNum=5;
	} else {
		selectedNum=5;
	}

	setBgColumn(nodes, selectedNum, '#eeeeee', 'DIV');
}

</script>