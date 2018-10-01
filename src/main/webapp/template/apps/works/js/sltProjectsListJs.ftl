<script type="text/javascript">

$(document).ready(function(){
    $("#flip").click(function(){
        $("#newMdataFormId").slideUp("slow");
    });
});

function removeProject() {
	// Call the modal for deleting
	$(window).ready(function(){
		$('#submitFormDeleteProjects').modal('show')
	});
}

function validateForm(tableName) {
	var blnPopover = true;
	var isError = true;

	var table = document.getElementById(tableName);

	var inputTag = table.getElementsByTagName("input");
	if(!validateTag(inputTag)) {
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

	var row31, row32, row33;

	var tagInput = table1.getElementsByTagName("input");
	var tagSelect = table1.getElementsByTagName("select");
	var tagTextarea = table1.getElementsByTagName("textarea");

	row32 = table3.rows[1];
	row33 = table3.rows[2];
	row34 = table3.rows[3];
	row35 = table3.rows[4];
	row36 = table3.rows[5];
	row37 = table3.rows[6];
	row38 = table3.rows[7];

	var inputUpNameHtml;
	var inputUpMembersHtml;
	var textareaUpExplainHtml;
	var selectUpCodeRoleHtml;
	var selectUpCodeIndustryHtml;

	row32.cells[0].innerHTML = tagInput[0].value;
	row32.cells[1].innerHTML = tagTextarea[0].value;
	row34.cells[0].innerHTML = tagSelect[0].value;

	selectUpCodeRoleHtml = tagSelect[1].value;
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
    row36.cells[0].innerHTML = selectUpCodeRoleHtml;

	selectUpCodeIndustryHtml = tagSelect[2].value;
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
	row38.cells[0].innerHTML = selectUpCodeIndustryHtml;

	if(tableName == "newFormId") {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: sbtNewFormProjects();" );
	} else {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: sbtUpdateFormProjects();" );
	}
}

var table = document.getElementById("userProjectsId");
var tr = table.getElementsByTagName("tr");

function clearBackGroundColor() {
	for(var j=0; j< tr.length; j++) {
		tr[j].style.backgroundColor = "";
	}
}

var upNoInput = document.getElementById("upNoId");
var upNameInput = document.getElementById("upNameId");
var upMembersInput = document.getElementById("upMembersId");
var upCodeIndustryInput = document.getElementById("upCodeIndustryId");
var upExplainInput = document.getElementById("upExplainId");
var upCodeRoleInput = document.getElementById("upCodeRoleId");
var projectTechInput = document.getElementById("projectTechId");
var tokenInput = document.getElementById("tokenId");

var projectsFileId = document.getElementById("projectsFileId");

var tagAStart;
var tagSpan = '<span class="glyphicon glyphicon-file" aria-hidden="true"></span>';
var tagAEnd = '</a>';
var fileLink;
function sltUserProjects(x, userId, num) {

	clearBackGroundColorDiv("userProjectsId");

	$("#udtMdataFormId").insertAfter($(x));

	$(document).ready(function() {

		var availableKeys;

        $.ajax({
            type: 'POST',
            url: 'sltProjectsAjax',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            data: 'body={ "upNo" : "' + num + '", "userId" : "' + userId + '"}',
            cache: false,
            beforeSend: function(xhr, settings) {
            	console.log("before send");
            },
            success: function(data, textStatus, request) {
            	if(!isBlank(data.result)) {
            		availableKeys = data.result;

            		upNoInput.value = availableKeys.upNo;
            		upNameInput.value = availableKeys.upName;
            		upMembersInput.value = availableKeys.upMembers;
            		upCodeIndustryInput.value = availableKeys.upCodeIndustry;
            		upExplainInput.value = availableKeys.upExplain;
            		upCodeRoleInput.value = availableKeys.upCodeRole;
            		projectTechInput.href = "sltProjectTechList/" + availableKeys.upNo;

            		tokenInput.value = availableKeys.token;
            	}
        		// Delete child tag
        		while (projectsFileId.hasChildNodes()) {   
        			projectsFileId.removeChild(projectsFileId.firstChild);
        		}
            	if(!isBlank(data.fileList)) {
            		file = data.fileList;
            		// Add child tag
            		for (i=0; i < file.length; i++) {
            			var tagA = document.createElement("a");
            			tagA.href = "#";
            			tagA.setAttribute('id', 'f' + file[i].ufNo);
            			tagA.setAttribute('class', 'dropdown-toggle thumbnail-hover');
            			tagA.setAttribute('data-toggle', 'dropdown');
            			tagA.setAttribute('role', 'button');
            			tagA.setAttribute('aria-haspopup', 'true');
            			tagA.setAttribute('aria-expanded', 'true');

            			// From file name
            			// var ext = file[i].ufName.substr(file[i].ufName.lastIndexOf('.') + 1);
            			console.log(i + "=" + file[i].ufExt);
            			
            			var tagImg = document.createElement("img");
            			tagImg.setAttribute('src', '${configBean.baseURL?if_exists}/static/apps/img/files/file_' + file[i].ufExt + '.svg');
            			tagImg.setAttribute('style', 'margin: 5px;');
            			tagImg.setAttribute('alt', '');
            			tagImg.setAttribute('height', '32');
            			tagImg.setAttribute('width', '32');
            			tagA.appendChild(tagImg);

            			var tagUl = document.createElement("ul");
            			tagUl.setAttribute('class', 'dropdown-menu body-posts-menu');
            			tagUl.innerHTML = '<li><a href="${configBean.baseURL?if_exists}/works/downloadProjectFile?ufNo=' + file[i].ufNo + '&ufNum=' + file[i].ufNum + '">Download</a></li>';

            			if (file[i].userId == "${user.userId?if_exists}") {
	            			tagUl.innerHTML = tagUl.innerHTML + '<li><a href="#" onclick="dltProjectsFile(' + file[i].ufNo + '); return false;">Delete</a></li>';
            			}

            			projectsFileId.appendChild(tagA);
            			projectsFileId.appendChild(tagUl);
            		}
            	}
            },
            complete: function(xhr, textStatus) {
            	console.log("complete");

            	// Set a project title into Model
            	var dltProjectTile = document.getElementById("dltProjectTileId");
            	dltProjectTile.innerHTML = upNameInput.value;

            	formSlideDown();
            	newFormCancel();

            	x.style.backgroundColor = "#f0f2ff";
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

function dltProjectsFile(ufNo) {

	var cdata = '{ "ufNo":"' + ufNo + '"}';
	var curl = "${configBean.baseURL?if_exists}/works/dltProjectFileAjax";
	var cresult = requestbyAjax(curl,cdata);

	if(cresult) {
		$("#f"+ufNo).fadeOut();
	}

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

	clearBackGroundColorDiv("userProjectsId");
	updateFormCancel();
}

function formSlideDown() {
	$("#udtMdataFormId").slideDown("slow");
}

function newFormCancel() {
	$("#newMdataFormId").slideUp("slow");
	$("#newToggleId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	clearBackGroundColorDiv("userProjectsId");
}

function updateFormCancel() {
	$("#udtMdataFormId").slideUp("slow");
	clearBackGroundColorDiv("userProjectsId");
}

function sbtNewFormProjects() {
	document.newForm.submit();
}

function sbtUpdateFormProjects() {
	document.updateForm.submit();
}

function submitDeleteFormProjects() {
	document.updateForm.action = "dltProjects";
	document.updateForm.submit();
}

/* Input Text size */
var errorText = "<@spring.message "input.text.size.max"/>";
$('textarea').textcounter({
	max:2500, counterText:"Total Count: %d/2500", maximumErrorText:errorText,
	stopInputAtMaximum:false, countSpaces:true, twoCharCarriageReturn:false, countExtendedCharacters:true
});

</script>
