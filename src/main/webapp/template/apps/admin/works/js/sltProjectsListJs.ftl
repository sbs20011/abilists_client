
<script type="text/javascript"> 

window.onload = function() {
	//var task = document.getElementsByName("userTask");
	//selectUserTask(task[5], '8')

	$('#loading').hide();
}

function removeProject() {
	// Call the modal for deleting
	$(window).ready(function(){
		$('#submitFormDeleteProjectId').modal('show')
	});
}

function validateForm(tableName) {

	var blnPopover = true;
	var isError = true;

	var table = document.getElementById(tableName);

	var inputTag = table.getElementsByTagName("input")[0];
	if(!validateId(inputTag)) {
		return false;
	}

	var selectTag = table.getElementsByTagName("select");
	if(!validateField(selectTag)) {
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
		$('#submitFormUserProjects').modal('show');
	});

	var table1 = document.getElementById(tableName);
	// Create a table on Motal 
	var table3 = document.getElementById("t03");

	var row1, row3;
	var cell11, cell12, cell3, cell31, cell32, cell33;

	row11 = table1.rows[0];
	row12 = table1.rows[1];
	row13 = table1.rows[2];
	row31 = table3.rows[0];
	row32 = table3.rows[1];
	row33 = table3.rows[2];

	var inputUpNameHtml;
	var inputUpMembersHtml;
	var textareaUpExplainHtml;
	var selectUpCodeRoleHtml;
	var selectUpCodeIndustryHtml;

	inputUpNameHtml = row11.cells[1].getElementsByTagName("input")[0].value;
	row31.cells[1].innerHTML = inputUpNameHtml;
	inputUpMembersHtml = row11.cells[3].getElementsByTagName("select")[0].value;
	row31.cells[3].innerHTML = inputUpMembersHtml;

	textareaUpExplainHtml = row12.cells[1].getElementsByTagName("textarea")[0].value;
	row32.cells[1].innerHTML = textareaUpExplainHtml;
	selectUpCodeRoleHtml = row12.cells[3].getElementsByTagName("select")[0].value;
    <#if commonBean??>
    <#if commonBean.mRoleMap?has_content>
	    <#if commonBean.mRoleMap["${lang?if_exists}"]??>
	    <#list commonBean.mRoleMap["${lang?if_exists}"] as mRole>
			var mrCode = "${mRole.mrCode?if_exists}";
			if(mrCode == selectUpCodeRoleHtml) {
				selectUpCodeRoleHtml = "${mRole.mrName?if_exists}";
			}
	    </#list>
	    </#if>
    </#if>
    </#if>
	row32.cells[3].innerHTML = selectUpCodeRoleHtml;

	selectUpCodeIndustryHtml = row13.cells[1].getElementsByTagName("select")[0].value;
	<#if commonBean??>
	<#if commonBean.mIndustryMapList?has_content>
		<#if commonBean.mIndustryMapList["${lang?if_exists}"]??>
		<#list commonBean.mIndustryMapList["${lang?if_exists}"] as mIndustry>
			var miCode = "${mIndustry.miCode?if_exists}";
			if(miCode == selectUpCodeIndustryHtml) {
				selectUpCodeIndustryHtml = "${mIndustry.miLargeCategory?if_exists}";
			}
		</#list>
		</#if>
	</#if>
	</#if>
	row33.cells[1].innerHTML = selectUpCodeIndustryHtml;

	document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitNewFormProjects();" );

}

/*
 * Make the table on the Modal for confirming the data to update it.
 */
function confirmUpdateData(tableName) {

	// Call the modal
	$(window).ready(function(){
		$('#submitFormUserProjects').modal('show');
	});

	var table1 = document.getElementById(tableName);
	// Create a table on Motal 
	var table3 = document.getElementById("t03");

	var row1, row3;
	var cell11, cell12, cell31, cell32;

	row11 = table1.rows[0];
	row12 = table1.rows[1];
	row31 = table3.rows[0];
	row32 = table3.rows[1];

	var inputUpNameHtml;
	var selectUpCodeRoleHtml;
	var selectUpCodeIndustryHtml;

	inputUpNameHtml = row11.cells[1].getElementsByTagName("input")[0].value;
	row31.cells[1].innerHTML = inputUpNameHtml;

	selectUpCodeIndustryHtml = row12.cells[1].getElementsByTagName("select")[0].value;

	<#if commonBean??>
	<#if commonBean.mIndustryMapList?has_content>
		<#if commonBean.mIndustryMapList["${lang?if_exists}"]??>
		<#list commonBean.mIndustryMapList["${lang?if_exists}"] as mIndustry>
			var miCode = "${mIndustry.miCode?if_exists}";
			if(miCode == selectUpCodeIndustryHtml) {
				selectUpCodeIndustryHtml = "${mIndustry.miLargeCategory?if_exists}";
			}
		</#list>
		</#if>
	</#if>
	</#if>
	row32.cells[1].innerHTML = selectUpCodeIndustryHtml;

	selectUpCodeRoleHtml = row12.cells[3].getElementsByTagName("select")[0].value;
    <#if commonBean??>
    <#if commonBean.mRoleMap?has_content>
	    <#if commonBean.mRoleMap["${lang?if_exists}"]??>
	    <#list commonBean.mRoleMap["${lang?if_exists}"] as mRole>
			var mrCode = "${mRole.mrCode?if_exists}";
			if(mrCode == selectUpCodeRoleHtml) {
				selectUpCodeRoleHtml = "${mRole.mrName?if_exists}";
			}
	    </#list>
	    </#if>
    </#if>
    </#if>
	row32.cells[3].innerHTML = selectUpCodeRoleHtml;

	document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitUpdateFormProjects();" );

}

function validateUpdateForm(tableName) {

	var blnPopover = true;
	var isError = true;

	var table = document.getElementById(tableName);

	var selectTag = table.getElementsByTagName("select");
	if(!validateField(selectTag)) {
		return false;
	}

	return true;
}


var upNoInput = document.getElementById("upNoId");
var upNameInput = document.getElementById("upNameId");
var upMembersInput = document.getElementById("upMembersId");
var upCodeIndustryInput = document.getElementById("upCodeIndustryId");
var upExplainInput = document.getElementById("upExplainId");
var upCodeRoleInput = document.getElementById("upCodeRoleId");
var projectTechInput = document.getElementById("projectTechId");

var uptUpMembersInput = document.getElementById("uptUpMembersId");
var uptUpExplainInput = document.getElementById("uptUpExplainId");

function selectUserProjects(x, num) {

	clearBackGroundColorUl("uProjectsId");

	$("#updateMdataFormId").insertAfter($(x));

	$(document).ready(function() {
		var availableKeys;
        $.ajax({
            type: 'POST',
            url: 'sltProjectsAjax',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            data: 'body={ "upNo" : "' + num + '"}',
            cache: false,
            beforeSend: function(xhr, settings) {
            	console.log("before send");
            },
            success: function(data, textStatus, request) {
            	if(!isBlank(data.result)) {
            		availableKeys = data.result;
            		upNoInput.value = availableKeys.upNo;
            		upNameInput.value = availableKeys.upName;
            		upMembersInput.innerHTML = availableKeys.upMembers;
            		uptUpMembersInput.innerHTML = availableKeys.upMembers;

            		upCodeIndustryInput.value = availableKeys.upCodeIndustry;
            		upExplainInput.innerHTML = availableKeys.upExplain;
            		uptUpExplainInput.innerHTML = availableKeys.upExplain;

            		upCodeRoleInput.value = availableKeys.upCodeRole;
            		projectTechInput.href = "sltProjectTechList/" + availableKeys.upNo
            	}
            },
            complete: function(xhr, textStatus) {
            	console.log("complete");

            	// Set a project title into Model
            	var dltProjectTileId = document.getElementById("dltProjectTileId");
            	dltProjectTileId.innerHTML = upNameInput.value;

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

	upNoInput.value = "";
	upNameInput.value = "";
	upMembersInput.value = "";
	upCodeIndustryInput.value = "";
	upExplainInput.value = "";
	upCodeRoleInput.value = "";

	uptUpMembersInput = "";
	uptUpExplainInput = "";

	clearBackGroundColorUl("uProjectsId");
	updateFormCancel();
}

function formSlideDown() {
	$("#updateMdataFormId").slideDown("slow");
}

function newFormCancel() {
	$("#newMdataFormId").slideUp("slow");
	$("#newToggleId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	clearBackGroundColorUl("uProjectsId");
}

function updateFormCancel() {
	$("#updateMdataFormId").slideUp("slow");
	$("#newToggleId").addClass('add-symbol');
	clearBackGroundColorUl("uProjectsId");
}

function submitNewFormProjects() {
	document.newForm.submit();
}

function submitUpdateFormProjects() {
	document.updateForm.submit();
}

function submitFormDeleteProject() {
	document.updateForm.action = "dltProjects";
	document.updateForm.submit();
}

// Auto complete
function changeItemBg(obj, parentId) {

	// Clear bg color.
	var nodes = clearBgColumn(parentId);

	var selectedNum=1;
	console.log(obj.options[obj.selectedIndex].text);
	if(obj.options[obj.selectedIndex].text == "<@spring.message 'user.title.id'/>") {
		selectedNum=2;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'projects.title.name'/>") {
		selectedNum=3;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'projects.title.team.number'/>") {
		selectedNum=5;
	} else {
		selectedNum=5;
	}

	setBgColumn(nodes, selectedNum, '#eeeeee', 'DIV');
}

</script>
