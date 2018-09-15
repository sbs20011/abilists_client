<script type="text/javascript">

window.onload = function() {
	$('#loading').hide();
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

            			projectsFileId.appendChild(tagA);
            			projectsFileId.appendChild(tagUl);
            		}
            	}
            },
            complete: function(xhr, textStatus) {
            	console.log("complete");

            	formSlideDown();

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

function formSlideDown() {
	$("#udtMdataFormId").slideDown("slow");
}

function updateFormCancel() {
	$("#udtMdataFormId").slideUp("slow");
	clearBackGroundColorDiv("userProjectsId");
}

</script>
