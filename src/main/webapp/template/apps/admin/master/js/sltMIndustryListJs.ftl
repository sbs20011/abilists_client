
<script type="text/javascript">

$(document).ready(function(){
    $("#flip").click(function(){
        $("#newMdataFormId").slideUp("slow");
    });
});

function removeIndustry() {
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
	// Image Code
	if(!validateId(inputTag[3])) {
		isError = false;
	}

	// Validate select tag
	selectTag = table.getElementsByTagName("select");
	if(!validateId(selectTag[0])) {
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

	if(tableName == "newFormId") {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitNewFormUserProjects();" );		  
	} else {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitUpdateFormUserProjects();" );
	}

}

var ajaxLastNum = 0;

var miNoInput = document.getElementById("miNoId");
var miLargeCategoryInput = document.getElementById("miLargeCategoryId");
var miMiddleCategoryInput = document.getElementById("miMiddleCategoryId");
var miCodeInput = document.getElementById("miCodeId");
var uptMiImgCodeInput = document.getElementById("uptMiImgCodeId");
var mlCodeInput = document.getElementById("mlCodeId");
var miStatusInput = document.getElementById("miStatusId");

function selectMIndustry(x, num) {

	clearBackGroundColorUl("mIndustryId");

	$("#updateMdataFormId").insertAfter($(x));

	$(document).ready(function() {

		var availableKeys;
		var currentAjaxNum = ajaxLastNum;

        $.ajax({
            type: 'POST',
            url: 'sltMIndustryAjax',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            data: 'body={ "miNo" : "' + num + '"}',
            cache: false,
            beforeSend: function(xhr, settings) {
            	console.log("before send");
            },
            success: function(data, textStatus, request) {
            	if(!isBlank(data.result)) {
            		availableKeys = data.result;
            		miNoInput.value = availableKeys.miNo;
            		miLargeCategoryInput.value = availableKeys.miLargeCategory;
            		miMiddleCategoryInput.value = availableKeys.miMiddleCategory;
            		miCodeInput.value = availableKeys.miCode;
            		uptMiImgCodeInput.value = availableKeys.miImgCode;
            		mlCodeInput.value = availableKeys.mlCode;
            	}
            },
            complete: function(xhr, textStatus) {
            	console.log("complete");
            	
            	// Set a project title into Model
            	var dltMasterDataId = document.getElementById("dltMasterDataId");
            	dltMasterDataId.innerHTML = miLargeCategoryInput.value;

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
	miNoInput.value = "";
	miLargeCategoryInput.value = "";
	miMiddleCategoryInput.value = "";
	miCodeInput.value = "";
	uptMiImgCodeInput.value = "";
	mlCodeInput.value = "";

	clearBackGroundColorUl("mIndustryId");
	updateFormCancel();

}

function formSlideDown() {
	$("#updateMdataFormId").slideDown("slow");
}

function newFormCancel() {
	$("#newMdataFormId").slideUp("slow");
	$("#newToggleId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	clearBackGroundColorUl("mIndustryId");
}

function updateFormCancel() {
	$("#updateMdataFormId").slideUp("slow");
	$("#newToggleId").addClass('add-symbol');
	clearBackGroundColorUl("mIndustryId");
}

function submitNewFormUserProjects() {
	document.newForm.submit();
}

function submitUpdateFormUserProjects() {
	document.updateForm.submit();
}

//Delete mTech
function submitFormDeleteMdata() {
	document.updateForm.action = "dltMIndustry";
	document.updateForm.submit();
}

function viewGlyphsModel() {
	$("#viewGlyphsModalId").modal('show');
}

function selectGlyphs(ojb) {
	var newMiImgCodeInput = document.getElementById("newMiImgCodeId");
	var uptMiImgCodeInput = document.getElementById("uptMiImgCodeId");

	// TODO : separate new input and update input 
	var miImgCode = ojb.childNodes[1].innerHTML;
	var glyphs = miImgCode.split(" ");

	uptMiImgCodeInput.value = glyphs[1];
	newMiImgCodeInput.value = glyphs[1];
}

function changeItemBg(obj, parentId) {

	// Clear bg color.
	var nodes = clearBgColumn(parentId);

	var selectedNum=2;
	console.log(obj.options[obj.selectedIndex].text);
	if(obj.options[obj.selectedIndex].text == "<@spring.message 'mindustry.title.large.name'/>") {
		selectedNum=2;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'mindustry.title.middle.name'/>") {
		selectedNum=3;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'mindustry.title.code'/>") {
		selectedNum=4;
	} else {
		selectedNum=4;
	}

	setBgColumn(nodes, selectedNum, '#eeeeee', 'DIV');

}
</script>
