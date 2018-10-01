
<script type="text/javascript">

$(document).ready(function(){
    $("#flip").click(function(){
        $("#newMdataFormId").slideUp("slow");
    });
});

function removeMTechDetail(obj) {
	document.updateForm.action = "${configBean.baseURL?if_exists}/admin/master/deletedMTechDetail";
	document.updateForm.submit();
}

/*
 * Check the validity of the data inputed.
 */
function validateForm(tableName) {

	var blnPopover = true;
	var isError = true;

	var table = document.getElementById(tableName);
	var selectTag = table.getElementsByTagName("select");

	if(!validateField(selectTag)) {
		return false;
	}
	var inputTag = table.getElementsByTagName("input");
	if(!validateField(inputTag)) {
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
		$('#submitFormMTechDetailId').modal('show')
	});

	var table1 = document.getElementById(tableName);
	// Create a table on Motal 
	var table3 = document.getElementById("t03");

	var mtdLevelHtml;
	var mtdLevelExplainHtml;

	var row1, row3;
	var cell31, cell32;

	row1 = table1.rows[0];
	row3 = table3.insertRow(1);

	// Create cells
	cell31 = row3.insertCell(0);
	cell32 = row3.insertCell(1);

	mtdLevelHtml = row1.cells[1].getElementsByTagName("select")[0].value;

	mtdLevelExplainHtml = row1.cells[3].getElementsByTagName("input")[0].value;

	cell31.innerHTML = mtdLevelHtml;
	cell32.innerHTML = mtdLevelExplainHtml;

	if(tableName == "newFormId") {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitNewFormMTechDetail();" );		  
	} else {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitUpdateFormMTechDetail();" );
	}

}

/*
 * Remove a tech information of a project.
 */
function removeProjectTech(obj) {
	document.updateForm.action = "/project/deletedUserProjectTech";
	document.updateForm.submit();
}

function removeMTechDetail() {
	// Call the modal for deleting
	$(window).ready(function(){
		$('#submitFormDeleteMdataId').modal('show')
	});
}

var ajaxLastNum = 0;

var table = document.getElementById("userProjectTechId");
var tr = table.getElementsByTagName("tr");

var mtdNoInput = document.getElementById("mtdNoId");
var mtdLevelInput = document.getElementById("mtdLevelId");
var mtdLevelExplainInput = document.getElementById("mtdLevelExplainId");
var mlCodeInput = document.getElementById("mlCodeId");

function selectMTechDetail(x, num) {

	clearBackGroundColorUl("userProjectTechId");

	$(document).ready(function() {

		var availableKeys;
		var currentAjaxNum = ajaxLastNum;

        $.ajax({
            type: 'POST',
            url: '${configBean.baseURL?if_exists}/admin/master/sltMTechDetailAjax',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            data: 'body={ "mtdNo" : "' + num + '"}',
            cache: false,
            beforeSend: function(xhr, settings) {
            	console.log("before send");
            },
            success: function(data, textStatus, request) {
            	if(!isBlank(data.result)) {
            		availableKeys = data.result;
            		console.log("mtdNo >> " + availableKeys.mtdNo);
            		mtdNoInput.value = availableKeys.mtdNo;
            		mtdLevelInput.value = availableKeys.mtdLevel;
            		mtdLevelExplainInput.value = availableKeys.mtdLevelExplain;
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
	mtdNoInput.value = "";
	mtdLevelInput.value = "";
	mtdLevelExplainInput.value = "";
	mlCodeInput.value = "";

	clearBackGroundColorUl("userProjectTechId");
	updateFormCancel();
}

function formSlideDown() {
	$("#updateMdataFormId").slideDown("slow");
}

function newFormCancel() {
	$("#newMdataFormId").slideUp("slow");
	$("#newToggleId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	clearBackGroundColorUl("userProjectTechId");
}

function updateFormCancel() {
	$("#updateMdataFormId").slideUp("slow");
	$("#newToggleId").addClass('add-symbol');
	clearBackGroundColorUl("userProjectTechId");
}

/* Change the next select list depending on the first select.*/
function changeSelect(form) {

	// This is the first select.
	var kindList = form.uptKind;
	// This is the second select.
	var mtNoList = form.mtNo;
	var userSelected = kindList.options[kindList.selectedIndex].value;

	// Delete the select's options
	while (mtNoList.options.length) {
		mtNoList.remove(0);
	}

	// Get a option of the first select.
	var mtechs = mtechList[userSelected];
	if (mtechs) {
		var i;
		for (i = 0; i < mtechs.length; i++) {
			var mtech = new Option(mtechs[i].mtName, mtechs[i].mtNo);
			mtNoList.options.add(mtech);
		}
	}

}

function submitNewFormMTechDetail() {
	document.newForm.submit();
}

function submitUpdateFormMTechDetail() {
	document.updateForm.submit();
}

//Delete mTech
function submitFormDeleteMdata() {
	document.updateForm.action = "${configBean.baseURL?if_exists}/admin/master/dltMTechDetail";
	document.updateForm.submit();
}

</script>