<script type="text/javascript">

// Hide the new form
window.onload = function() {
	$('#loading').hide();
}

function removeSkills(skillsName) {
	// Call the modal for deleting
	$(window).ready(function(){
		$('#dltSkillsForm').modal('show')
	});

	var submitForm = document.getElementById("sbtDeleteButtonId");

	if(skillsName == "tech") {
		submitForm.setAttribute( "onClick", "javascript: sbtDeleteForm(document.updateSkillsForm);" );	
	} else if(skillsName == "lang") {
		submitForm.setAttribute( "onClick", "javascript: sbtDeleteForm(document.updateLangForm);" );
	} else if(skillsName == "certi") {
		submitForm.setAttribute( "onClick", "javascript: sbtDeleteForm(document.updateCertiForm);" ); 
	} else {
		console.log("---- error ----");
	}
}

/* Load select data from the server.*/
var skillsList = {};
<#if commonBean??>
<#if commonBean.getMtechMap("tech")?has_content>
	<#list commonBean.getMtechMap("tech")?keys as key>
	<#if key != "">
	skillsList['${key?if_exists}'] = [       
	    <#list commonBean.getMtechMap("tech")[key] as tech>
	    	{mtNo : "${tech.mtNo?if_exists?c}",mtName: "${tech.mtName?if_exists}"}<#if tech?has_next>,</#if>
	    </#list>
	];
	</#if>
	</#list>
</#if>
</#if>

var langList = {};
<#if commonBean??>
<#if commonBean.getMtechMap("lang")?has_content>
	<#list commonBean.getMtechMap("lang")?keys as key>
	<#if key != "">
	langList['${key?if_exists}'] = [       
	    <#list commonBean.getMtechMap("lang")[key] as tech>
	    	{mtNo : "${tech.mtNo?if_exists?c}",mtName: "${tech.mtName?if_exists}"}<#if tech?has_next>,</#if>
	    </#list>
	];
	</#if>
	</#list>
</#if>
</#if>

var certiList = {};
<#if commonBean??>
<#if commonBean.getMtechMap("certi")?has_content>
	<#list commonBean.getMtechMap("certi")?keys as key>
	<#if key != "">
	certiList['${key?if_exists}'] = [       
	    <#list commonBean.getMtechMap("certi")[key] as tech>
	    	{mtNo : "${tech.mtNo?if_exists?c}",mtName: "${tech.mtName?if_exists}"}<#if tech?has_next>,</#if>
	    </#list>
	];
	</#if>
	</#list>
</#if>
</#if>

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

function validateForm(tableName) {

	var blnPopover = true;
	var isError = true;

	var table = document.getElementById(tableName);
	var selectTag = table.getElementsByTagName("select");

	for (i=0; i < selectTag.length; i++) {
	    var x = selectTag[i].value;
	    if (x==null || x=="" || x=="0") {
	    	if(isError) {
	    		selectTag[i].focus();
	    		selectTag[i].scrollIntoView();
	    	}
	    	selectTag[i].style.border = "1px solid red";
	        isError = false;
	    } else {
	    	selectTag[i].style.border = "";
	    }
	}

	return isError;
}

/*
 * Make the table on the Modal for confirming the data.
 */
function confirmData(tableName, mtechList) {

	if(!validateForm(tableName)) {
		return;
	}

	  // Call the modal
	$(window).ready(function(){
		$('#submitFormUserSkills').modal('show')
	});

	var table1 = document.getElementById(tableName);
	// Create a table on Motal 
	var table3 = document.getElementById("t03");

	var row11 = table1.rows[0];
	var row12 = table1.rows[1];
	var row31 = table3.rows[0];
	var row32 = table3.rows[1];

	var selectUtKindHtml;
	var selectMtNoHtml;
	var selectUtLevelHtml;
	var selectUtDetailHtml;

	// Cell1
	selectUtKindHtml = row11.cells[1].getElementsByTagName("select")[0].value;
	row31.cells[1].innerHTML = selectUtKindHtml;

	// Cell3
	// Be mtechList in the page
	mtechs = mtechList[selectUtKindHtml];
	selectMtNoHtml = row11.cells[3].getElementsByTagName("select")[0].value;
	var j;
	for (j = 0; j < mtechs.length; j++) {
		if(selectMtNoHtml == mtechs[j].mtNo) {
			selectMtNoHtml = mtechs[j].mtName;
			break;
		}
	}
	row31.cells[3].innerHTML = selectMtNoHtml;

	// Cell5
	selectUtLevelElement = row11.cells[5].getElementsByTagName("select")[0];
	selectUtLevelHtml = selectUtLevelElement.options[selectUtLevelElement.selectedIndex].text;
	row31.cells[5].innerHTML = selectUtLevelHtml;

	selectUtDetailHtml = row12.cells[1].getElementsByTagName("textarea")[0].value;
	row32.cells[1].innerHTML = selectUtDetailHtml;

	if(tableName == "newSkillsFormId") {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitNew(newSkillsForm);" );	
	} else if(tableName == "newLangFormId") {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitNew(newLangForm);" );		  
	} else if(tableName == "newCertiFormId") {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitNew(newCertiForm);" );	
	} else if(tableName == "updateSkillsFormId") {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitUpdate(updateSkillsForm);" );
	} else if(tableName == "updateLangFormId") {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitUpdate(updateLangForm);" );
	} else if(tableName == "updateCertiFormId") {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitUpdate(updateCertiForm);" ); 
	} else {
		console.log("---- error ----");
	}

}

var usNoList = document.getElementsByName("usNo");
var usKindList = document.getElementsByName("usKind");
var mtNoList = document.getElementsByName("mtNo");
var usLevelList = document.getElementsByName("usLevel");
var usDetailList = document.getElementsByName("usDetail");

function sltUserSkills(x, userId,  num, formGroup, mtechList, numGroup) {
	clearBackGroundColorTr("tableSkillsListId");
	clearBackGroundColorTr("tableLangListId");
	clearBackGroundColorTr("tableCertiListId");
	$(document).ready(function() {

		var availableKeys;
        $.ajax({
            type: 'POST',
            url: 'sltSkillsAjax',
			contentType: "application/json",
			dataType: "json",
            data: '{ "usNo" : "' + num + '", "userId" : "' + userId + '"}',
            cache: false,
            async: false,
        	beforeSend: function(xhr, settings) {
	        	xhr.setRequestHeader("Accept", "application/json");
	        	xhr.setRequestHeader("Cache-Control","no-cache, must-revalidate");
	        	xhr.setRequestHeader("Pragma","no-cache");
	        	xhr.setRequestHeader("EXPIRES","-1");
        	},
            success: function(data, textStatus, request) {
            	console.log("success numGroup=>" + numGroup);

            	if(!isBlank(data)) {
            		
            		usNoList[numGroup].value = data.usNo;

            		// Set the first value
            		usKindList[numGroup].value = data.usKind;
            		
                	// Create the second values 
                	changeUtKindSelect(mtechList, numGroup);
                	// Set the second value
                	mtNoList[numGroup].value = data.mtNo;

            		// Create the third values
            		changeUtLevelSelect(numGroup);
            		// Set the third value
            		usLevelList[numGroup].value = data.usLevel

            		usDetailList[numGroup].value = data.usDetail;
            	}
            },
            complete: function(xhr, textStatus) {
            	console.log("complete");

            	// Set a project title into Model
            	var modalTile = document.getElementById("modalTitle");
            	// modalTile.innerHTML = usSkill;

            	var usSkillId = document.getElementById("usSkillId");
            	// usSkillId.value = usSkill;

            	if(formGroup == "updateSkillsForm") {
            		formSkillsSlideDown();
            	} else if (formGroup == "updateLangForm") {
            		formLangSlideDown();
            	} else if (formGroup == "updateCertiForm") {
            		formCertiSlideDown();
            	}

            	newFormSkillsCancel();
            	newFormLangCancel();
            	newFormCertiCancel();

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

	
/* Change the next select list depending on the first select.*/
function changeUtKindSelect(mtechList, changedNum) {
	// This is the first select.
	var usKindList = document.getElementsByName("usKind")[changedNum];
	// This is the second select.
	var mtNoList = document.getElementsByName("mtNo")[changedNum];

	if(usKindList.selectedIndex < 0) {
		return false;
	}
	var userSelected = usKindList.options[usKindList.selectedIndex].value;

	// Delete the select's options
	while (mtNoList.options.length) {
		mtNoList.remove(0);
	}

	// Get a option of the first select.
	var mtechs = mtechList[userSelected];
	if (mtechs) {
		var i;
		var mtech = new Option('<@spring.message "select.default.item"/>', '0');
		mtNoList.options.add(mtech);
		for (i = 0; i < mtechs.length; i++) {
			mtech = new Option(mtechs[i].mtName, mtechs[i].mtNo);
			mtNoList.options.add(mtech);
		}
	}
}

/* Change the next select list depending on the first select.*/
function changeUtLevelSelect(changedNum) {

	// This is the second select.
	var mtNoList = document.getElementsByName("mtNo")[changedNum];
	if(mtNoList.selectedIndex < 0) {
		return false;
	}

	var mtNoListSelected = mtNoList.options[mtNoList.selectedIndex].value;

	var cdata = '{ "mtNo" : "' + mtNoListSelected + '"}';
	var curl = "${configBean.baseURL?if_exists}/profile/sltMTechDetailListAjax";
	var cresult = requestbyAjax(curl,cdata);

	var usLevelList = document.getElementsByName("usLevel")[changedNum];

	// Delete the select's options
	while (usLevelList.options.length) {
		usLevelList.remove(0);
	}

	var mTechDetail = new Option('<@spring.message "select.default.proficiency"/>', '0');
	usLevelList.options.add(mTechDetail);
	if(cresult) {
		for (i = 0; i < cresult.mTechDetailList.length; i++) {
			var mTechDetail = new Option(cresult.mTechDetailList[i].mtdLevelExplain, cresult.mTechDetailList[i].mtdLevel);
			usLevelList.options.add(mTechDetail);
		}
	}
}

// Open the new skills form
function newFormSkills() {
	$("#newUserSkillsForm").slideToggle("slow");
	$("#newToggleSkillsId").toggleClass('glyphicon-chevron-down glyphicon-chevron-up');

	$("#newUserLangForm").slideUp("slow");
	$("#newToggleLangId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	$("#newUserCertiForm").slideUp("slow");
	$("#newToggleCertiId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');

	newFormToggle();
	var usKindList = document.getElementsByName("usKind")[0];
	// Delete the select's options
	while (usKindList.options.length) {
		usKindList.remove(0);
	}

	// Get a option of the first select.
	var skills = skillsList;
	if (skills) {
		var i;
		var skill = new Option('<@spring.message "select.default.item"/>', '0');
		usKindList.options.add(skill);
		for (var key in skills) {
			skill = new Option(key, key);
			usKindList.options.add(skill);
		    i++;
		}
	}

}

//Open the new Language form
function newFormLang() {
	$("#newUserLangForm").slideToggle("slow");
	$("#newToggleLangId").toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
	
	$("#newUserSkillsForm").slideUp("slow");
	$("#newToggleSkillsId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	$("#newUserCertiForm").slideUp("slow");
	$("#newToggleCertiId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');

	newFormToggle();

	var usKindList = document.getElementsByName("usKind")[2];
	// Delete the select's options
	while (usKindList.options.length) {
		usKindList.remove(0);
	}

	// Get a option of the first select.
	var langs = langList;
	if (langs) {
		var i;
		var lang = new Option('<@spring.message "select.default.item"/>', '0');
		usKindList.options.add(lang);
		for (var key in langs) {
			console.log("key=>" + key + ", langs[" + key + "].mtName" + langs[key].mtName);
			lang = new Option(key, key);
			usKindList.options.add(lang);
		    i++;
		}
	}

}

//Open the new Certificate form
function newFormCerti() {
	$("#newUserCertiForm").slideToggle("slow");
	$("#newToggleCertiId").toggleClass('glyphicon-chevron-down glyphicon-chevron-up');

	$("#newUserSkillsForm").slideUp("slow");
	$("#newToggleSkillsId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	$("#newUserLangForm").slideUp("slow");
	$("#newToggleLangId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	
	newFormToggle();

	var usKindList = document.getElementsByName("usKind")[4];
	// Delete the select's options
	while (usKindList.options.length) {
		usKindList.remove(0);
	}

	// Get a option of the first select.
	var certis = certiList;
	if (certis) {
		var i;
		var certi = new Option('<@spring.message "select.default.item"/>', '0');
		usKindList.options.add(certi);
		for (var key in certis) {
			console.log("key=>" + key + ", certis[" + key + "].mtName" + certis[key].mtName);
			certi = new Option(key, key);
			usKindList.options.add(certi);
		    i++;
		}
	}

}

/*
 * Clear color on table, and cancel the update forms
 */
function newFormToggle() {
	clearBackGroundColorTr("tableSkillsListId");
	clearBackGroundColorTr("tableLangListId");
	clearBackGroundColorTr("tableCertiListId");
	updateFormCancel();
}

function formSkillsSlideDown() {
	$("#updateUserSkillsForm").slideDown("slow");
	$("#updateUserLangForm").slideUp("slow");
	$("#updateUserCertiForm").slideUp("slow");

	$("#newUserSkillsForm").slideUp("up");
	$("#newUserLangForm").slideUp("up");
	$("#newUserCertiForm").slideUp("up");

	$("#newToggleSkillsId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	$("#newToggleLangId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	$("#newToggleCertiId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
}
function formLangSlideDown() {
	$("#updateUserSkillsForm").slideUp("slow");
	$("#updateUserLangForm").slideDown("slow");
	$("#updateUserCertiForm").slideUp("slow");

	$("#newUserSkillsForm").slideUp("up");
	$("#newUserLangForm").slideUp("up");
	$("#newUserCertiForm").slideUp("up");

	$("#newToggleSkillsId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	$("#newToggleLangId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	$("#newToggleCertiId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
}
function formCertiSlideDown() {
	$("#updateUserSkillsForm").slideUp("slow");
	$("#updateUserLangForm").slideUp("slow");
	$("#updateUserCertiForm").slideDown("slow");

	$("#newUserSkillsForm").slideUp("up");
	$("#newUserLangForm").slideUp("up");
	$("#newUserCertiForm").slideUp("up");

	$("#newToggleSkillsId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	$("#newToggleLangId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	$("#newToggleCertiId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
}

function newFormSkillsCancel() {
	$("#newUserSkillsForm").slideUp("slow");
	$("#newToggleSkillsId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	clearBackGroundColorTr("tableSkillsListId");
}

function newFormLangCancel() {
	$("#newUserLangForm").slideUp("slow");
	$("#newToggleLangId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	clearBackGroundColorTr("tableLangListId");
}
function newFormCertiCancel() {
	$("#newUserCertiForm").slideUp("slow");
	$("#newToggleCertiId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	clearBackGroundColorTr("tableCertiListId");
}

/*
 * Close the update form all
 */
function updateFormCancel() {
	$("#updateUserSkillsForm").slideUp("slow");
	$("#updateUserLangForm").slideUp("slow");
	$("#updateUserCertiForm").slideUp("slow");
	clearBackGroundColorTr("tableSkillsListId");
	clearBackGroundColorTr("tableLangListId");
	clearBackGroundColorTr("tableCertiListId");
}

/*
 * Submit a new form
 */
function submitNew(newForm) {
	newForm.submit();
}

/*
 * Submit the update form
 */
function submitUpdate(updateForm) {
	updateForm.submit();
}

/*
 * Remove a skill
 */
function sbtDeleteForm(dltForm) {
	dltForm.action = "${configBean.baseURL?if_exists}/profile/dltUserSkills";
	dltForm.submit();
}

</script>