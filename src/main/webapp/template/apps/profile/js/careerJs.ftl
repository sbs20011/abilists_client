
	<script type="text/javascript">

	var miNoMap = new Map();
	<#if commonBean??>
	<#if commonBean.mIndustryMapList?has_content>
		<#if commonBean.mIndustryMapList["${lang?if_exists}"]??>
		<#list commonBean.mIndustryMapList["${lang?if_exists}"] as mIndustry>
		miNoMap.set(${mIndustry.miNo?if_exists}, "${mIndustry.miLargeCategory?if_exists}");
		</#list>
		</#if>
	</#if>
	</#if>

	window.onload = function() {
		$('#loading').hide();
	}

	function udtUserSummary() {

		var summaryTa = document.getElementById("userSummaryId");
		var sar = summaryTa.value.replace(/<br\s*\/?>/mg, "\n");
		summaryTa.value = sar;

		// Call the modal for deleting
		$(window).ready(function(){
			$('#udtUserSummaryModal').modal('show');
		});

	}

	function removeUserCareer() {
		// Call the modal for deleting
		$(window).ready(function(){
			$('#dltUserCareerModal').modal('show')
		});
	}

	/*
	 * Make the table on the Modal for confirming the data.
	 */
	function confirmData(tableName) {
	
		// Call the modal
		$(window).ready(function(){
			$('#istUserCareerModal').modal('show');
		});
	
		var table1 = document.getElementById(tableName);
		// Create a table on Motal 
		var table3 = document.getElementById("t03");
	
		var row11, row12, row13, row31, row32, row33;
	
		row11 = table1.rows[0];
		row12 = table1.rows[1];
		row13 = table1.rows[2];
		row14 = table1.rows[3];
	
		row31 = table3.rows[0];
		row32 = table3.rows[1];
		row33 = table3.rows[2];
		row34 = table3.rows[3];
	
		var selectStartMonthHtml;
		var selectStartYearHtml;
		var selectEndMonthHtml;
		var selectEndYearHtml;
	
		// UcTitle
		row31.cells[1].innerHTML = row11.cells[1].getElementsByTagName("input")[0].value;
		// UcCompanyName
		row31.cells[3].innerHTML = row11.cells[3].getElementsByTagName("input")[0].value;
		// Start Date
		selectStartMonthHtml = row12.cells[1].getElementsByTagName("select")[0].value;
		selectStartYearHtml = row12.cells[1].getElementsByTagName("select")[1].value;
		row32.cells[1].innerHTML = selectStartMonthHtml + "/" + selectStartYearHtml;
		// End Date
		selectEndMonthHtml = row12.cells[3].getElementsByTagName("select")[0].value;
		selectEndYearHtml = row12.cells[3].getElementsByTagName("select")[1].value;
		row32.cells[3].innerHTML = selectEndMonthHtml + "/" + selectEndYearHtml;
		// Business
		var miNoElement = row13.cells[1].getElementsByTagName("select")[0];
		var selectMiNoHtml = miNoElement.options[miNoElement.selectedIndex].text;
		row33.cells[1].innerHTML = selectMiNoHtml;
		// Role
		var ucCodeRoleElement = row13.cells[3].getElementsByTagName("select")[0];
		var selectMrNoHtml = ucCodeRoleElement.options[ucCodeRoleElement.selectedIndex].text;
		row33.cells[3].innerHTML = selectMrNoHtml;
		// Contents
		row34.cells[1].innerHTML = row14.cells[1].getElementsByTagName("textarea")[0].value;
	
		if(tableName == "newFormId") {
			document.getElementById("confirmUcPresentId").innerHTML = document.getElementById("udtUcPresentId").checked;
			document.getElementById("submitFormId").setAttribute( "onClick", "javascript: sbtNewFormUserCareer();" );
		} else {
			// I currently work here
			document.getElementById("confirmUcPresentId").innerHTML = document.getElementById("newUcPresentId").checked;
			document.getElementById("submitFormId").setAttribute( "onClick", "javascript: sbtUpdateFormUserCareer();" );
		}
	
	}
	
	// Return value of the mater by key
	function getMiLargeCategory(miNo) {
		return miNoMap.get(miNo)
	}
	
	
	function sbtUpdateUserSummary() {
		document.updateForm.action = "dltUserCareer";
		document.updateForm.submit();
	}
	
	var ucNoInput = document.getElementById("ucNoId");
	var ucTitleInput = document.getElementById("ucTitleId");
	var ucCompanyNameInput = document.getElementById("ucCompanyNameId");
	var ucStartMonthInput = document.getElementById("udtUcStartMonthId");
	var ucStartYearInput = document.getElementById("udtUcStartYearId");
	var ucEndMonthInput = document.getElementById("udtUcEndMonthId");
	var ucEndYearInput = document.getElementById("udtUcEndYearId");
	var ucCodeIndustryIdInput = document.getElementById("ucCodeIndustryId");
	var ucCodeRoleInput = document.getElementById("ucCodeRoleId");
	var ucPresentInput = document.getElementById("udtUcPresentId");
	var ucContentsInput = document.getElementById("ucContentsId");
	var tokenInput = document.getElementById("tokenId");

	function selectUserCareer(x, num, userId) {
	
		clearBackGroundColorDiv("careerId");
	
		$("#udtDataFormId").insertAfter($(x));
	
		// To find next object from self
		// x.nextElementSibling
	
		$(document).ready(function() {
	
			var availableKeys;
	
	        $.ajax({
	            type: 'POST',
	            url: 'sltCareerAjax',
				contentType: "application/json",
				dataType: "json",
	            data: '{ "ucNo" : "' + num + '", "userId" : "' + userId + '"}',
	            cache: false,
	            async: false,
	        	beforeSend: function(xhr, settings) {
		        	xhr.setRequestHeader("Accept", "application/json");
		        	xhr.setRequestHeader("Cache-Control","no-cache, must-revalidate");
		        	xhr.setRequestHeader("Pragma","no-cache");
		        	xhr.setRequestHeader("EXPIRES","-1");
	        	},
	            success: function(data, textStatus, request) {
	            	if(!isBlank(data)) {
	            		ucNoInput.value = data.ucNo;
	            		ucTitleInput.value = data.ucTitle;
	            		ucCompanyNameInput.value = data.ucCompanyName;
	            		ucStartMonthInput.value = data.ucStartMonth;
	            		ucStartYearInput.value = data.ucStartYear;
	            		ucEndMonthInput.value = data.ucEndMonth;
	            		ucEndYearInput.value = data.ucEndYear;
	            		ucCodeIndustryIdInput.value = data.ucCodeIndustry;
	            		ucCodeRoleInput.value = data.ucCodeRole;
	            		// 1 is the current work here.
	            		if(data.ucPresent == "1") {
	            			ucPresentInput.checked = true;
	            			ucEndYearInput.disabled = true;
	            	    	ucEndMonthInput.disabled = true;
	            	    	ucEndYearInput.style.backgroundColor = "#ededed";
	            	    	ucEndMonthInput.style.backgroundColor = "#ededed";
	            		} else {
	            			ucPresentInput.checked = false;
	            			ucEndYearInput.disabled = false;
	            	    	ucEndMonthInput.disabled = false;
	            	    	ucEndYearInput.style.backgroundColor = "";
	            	    	ucEndMonthInput.style.backgroundColor = "";
	            		}
	            		ucContentsInput.value = data.ucContents;
	            		tokenInput.value = data.token;
	            	}
	            },
	            complete: function(xhr, textStatus) {
	            	console.log("complete");
	
	            	// Set a project title into Modal
	            	var dltTitleModal = document.getElementById("dltModalTitleId");
	            	dltTitleModal.innerHTML = ucTitleInput.value;
	
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
	
		$("#istFormUserCareer").slideToggle("slow");
		$("#newToggleId").toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
	
		ucNoInput.value = "";
		ucTitleInput.value = "";
		ucCompanyNameInput.value = "";
		ucStartMonthInput.value = "";
		ucStartYearInput.value = "";
		ucEndMonthInput.value = "";
		ucEndYearInput.value = "";
		ucCodeIndustryIdInput.value = "";
		ucCodeRoleInput.value = "";
		ucPresentInput.value = "";

		updateFormCancel();
	}
	
	function newFormCancel() {
		$("#istFormUserCareer").slideUp("slow");
		$("#newToggleId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
		clearBackGroundColorDiv("careerId");
	}
	
	function updateFormCancel() {
		$("#udtDataFormId").slideUp("slow");
		clearBackGroundColorDiv("careerId");
	}
	
	function formSlideDown() {
		$("#udtDataFormId").slideDown("slow");
	}
	
	function formSlideUp() {
		$("#udtDataFormId").slideUp("slow");
		$("#udtDataFormId").one("animationend", 
			function(){ 
				formSlideDown();
		 	}
		);
	}
	
	// Update user summary
	function sbtUpdateUserSummaryForm() {
		document.udtUserSummaryForm.submit();
	}
	
	function sbtNewFormUserCareer() {
		document.newForm.submit();
	}
	
	function sbtUpdateFormUserCareer() {
		document.updateForm.submit();
	}
	
	function sbtDeleteFormUserCareer() {
		document.updateForm.action = "dltUserCareer";
		document.updateForm.submit();
	}

	/* Show the complete message to update for user summary.*/
	var summary = document.getElementById("updatedId");
	<#if updated??>
		<#if "completed" == "${updated?if_exists}">
		function fadeOutUpdated() {
			fadeOut(summary);
		}
		addLoadEvent(fadeOutUpdated);
		</#if>
	<#else>
		summary.style.display = "none";
	</#if>
	
	function workHere(cbId, num) {

		var cbId = document.getElementById(cbId);
		var ucEndYearId = document.getElementsByName("ucEndYear")[num];
		var ucEndMonthId = document.getElementsByName("ucEndMonth")[num];

	    if (cbId.checked == true) {
	    	ucEndYearId.disabled = true;
	    	ucEndMonthId.disabled = true;
	    	ucEndYearId.style.backgroundColor = "#ededed";
	    	ucEndMonthId.style.backgroundColor = "#ededed";
	    } else {
	    	ucEndYearId.disabled = false;
	    	ucEndMonthId.disabled = false;
	    	ucEndYearId.style.backgroundColor = "";
	    	ucEndMonthId.style.backgroundColor = "";
	    }
	}

	</script>
