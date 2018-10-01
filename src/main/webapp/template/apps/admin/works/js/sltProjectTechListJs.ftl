
<script type="text/javascript">

$(document).ready(function(){
    $("#flip").click(function(){
        $("#newMdataFormId").slideUp("slow");
    });
});

/* Load select data from the server.*/
var skillsList = {};
<#if commonBean??>
<#if commonBean.getMtechMap("tech")?has_content>
	<#list commonBean.getMtechMap("tech")?keys as key>
	<#if key != "">
	skillsList['${key?if_exists}'] = [       
	    <#list commonBean.getMtechMap("tech")[key] as tech>
	    	{mtNo : "${tech.mtNo?if_exists}",mtName: "${tech.mtName?if_exists}"}<#if tech?has_next>,</#if>
	    </#list>
	];
	</#if>
	</#list>
</#if>
</#if>

/*
 * Remove a tech information of a project.
 */
function removeProjectTech() {
	// Call the modal for deleting
	$(window).ready(function(){
		$('#sbtFormDeleteProjectTech').modal('show')
	});
}

/*
 * Check the validity of the data inputed.
 */
function validateForm(tableName) {

	var blnPopover = true;
	var isError = true;

	var table = document.getElementById(tableName);
	var inputTag = table.getElementsByTagName("select");

	if(!validateId(inputTag[0])) {
		return false;
	}
	if(!validateId(inputTag[1])) {
		return false;
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
		$('#sbtFormUserProjectTech').modal('show')
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

	if(tableName == "newFormId") {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitNewFormUserProjectTech();" );		  
	} else {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitUpdateFormUserProjectTech();" );
	}

}

var ajaxLastNum = 0;

var uptNoInput = document.getElementById("uptNoId");
var uptKindInput = document.getElementById("uptKindId");
var mtNoInput = document.getElementById("mtNoId");
var uptLevelInput = document.getElementById("uptLevelId");
var uptDetailInput = document.getElementById("uptDetailId");

function selectUserProjectTech(x, uptNo, mtNo, userId, mtechList) {

	clearBackGroundColorUl("uProjectTechId");

	$("#updateMdataFormId").insertAfter($(x));

	$(document).ready(function() {

		var userProjectTechKeys;
		var mTechDetailKeys;
		var currentAjaxNum = ajaxLastNum;

        $.ajax({
            type: 'POST',
            url: '${configBean.baseURL?if_exists}/admin/works/sltProjectTechAjax',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            dataType: "json",
            data: 'body={ "uptNo":"' + uptNo + '","mtNo" : "' + mtNo + '", "userId" : "' + userId + '"}',
            cache: false,
            async: false,
            beforeSend: function(xhr, settings) {
            	console.log("before send");
            },
            success: function(data, textStatus, request) {
            	if(!isBlank(data.result)) {
            		userProjectTechKeys = data.result.userProjectTech;

            		mTechDetailKeys = data.result.mTechDetailList;

            		uptNoInput.value = userProjectTechKeys.uptNo;
            		uptKindInput.value = userProjectTechKeys.uptKind;

                	// Create the second values 
                	changeUtKindSelect(mtechList, 1);

            		mtNoInput.value = userProjectTechKeys.mtNo;

            		// Create the third values
            		changeUtLevelSelect(1);

            		uptLevelInput.value = userProjectTechKeys.uptLevel;
            		uptDetailInput.value = userProjectTechKeys.uptDetail;
            	}

            },
            complete: function(xhr, textStatus) {
            	// Set a project title into Model
            	var dltProjectTechTile = document.getElementById("dltProjectTechTileId");
            	dltProjectTechTile.innerHTML = uptKindInput.value;

            	var udtProjectTechTileId = document.getElementById("udtProjectTechTileId");
            	udtProjectTechTileId.innerHTML = uptKindInput.value;

            	formSkillsSlideDown();
            	newFormSkillsCancel();

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
	var usKindList = document.getElementsByName("uptKind")[changedNum];
	// This is the second select.
	var mtNoList = document.getElementsByName("mtNo")[changedNum];
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



//
//-----     -------      -----------------
//|aaa|  -  | bbb |  ->  | result by Ajax|
//-----     -------      -----------------
//
//Set data from server when selecting the second select.
function changeUtLevelSelect(changedNum) {

	// This is the second select.
	var mtNoList = document.getElementsByName("mtNo")[changedNum];
	var mtNoListSelected = mtNoList.options[mtNoList.selectedIndex].value;

	var cdata = '{ "mtNo" : "' + mtNoListSelected + '"}';
	var curl = "${configBean.baseURL?if_exists}/admin/master/sltMTechDetailListAjax";
	var cresult = requestbyAjax(curl,cdata);

	var uptLevelList = document.getElementsByName("uptLevel")[changedNum];

	// Delete the select's options
	while (uptLevelList.options.length) {
		uptLevelList.remove(0);
	}

	var mTechDetail = new Option('<@spring.message "tech.select.default.detail"/>', '0');
	uptLevelList.options.add(mTechDetail);
	if(cresult) {
		for (i = 0; i < cresult.mTechDetailList.length; i++) {
			mTechDetail = new Option(cresult.mTechDetailList[i].mtdLevelExplain, cresult.mTechDetailList[i].mtdLevel);
			uptLevelList.options.add(mTechDetail);
		}
	}
}

//Open the new skills form
function newFormSkills() {
	$("#newMdataFormId").slideToggle("slow");
	$("#newToggleSkillsId").toggleClass('glyphicon-chevron-down glyphicon-chevron-up');

	var uptKindList = document.getElementsByName("uptKind")[0];
	// Delete the select's options
	while (uptKindList.options.length) {
		uptKindList.remove(0);
	}

	// Get a option of the first select.
	var skills = skillsList;
	if (skills) {
		var i;
		var skill = new Option('<@spring.message "select.default.item"/>', '0');
		uptKindList.options.add(skill);
		for (var key in skills) {
			console.log("key=>" + key + ", skills[" + key + "].mtName" + skills[key].mtName);
			skill = new Option(key, key);
			uptKindList.options.add(skill);
		    i++;
		}
	}
	
	updateFormCancel();
}

/*
 * Clear color on table, and cancel the update forms
 */
function newFormToggle() {

	$("#newMdataFormId").slideToggle("slow");
	$("#newToggleSkillsId").toggleClass('glyphicon-chevron-down glyphicon-chevron-up');

	uptNoInput.value = "";
	uptKindInput.value = "";
	mtNoInput.value = "";
	uptLevelInput.value = "";
	uptDetailInput.value = "";

	clearBackGroundColorUl("uProjectTechId");
	updateFormCancel();
}

function formSkillsSlideDown() {
	$("#newMdataFormId").slideUp("up");
	$("#updateMdataFormId").slideDown("slow");
	$("#newToggleSkillsId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
}

function newFormSkillsCancel() {
	$("#newMdataFormId").slideUp("slow");
	$("#newToggleSkillsId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	clearBackGroundColorUl("uProjectTechId");
}

function updateFormCancel() {
	$("#updateMdataFormId").slideUp("slow");
	$("#newToggleSkillsId").addClass('add-symbol');
	clearBackGroundColorUl("uProjectTechId");
}



function submitNewFormUserProjectTech() {
	document.newFormId.submit();
}

function submitUpdateFormUserProjectTech() {
	document.updateForm.action = "${configBean.baseURL?if_exists}/admin/works/udtProjectTech";
	document.updateForm.submit();
}

function submitDeleteFormProjectTech() {
	document.updateForm.action = "${configBean.baseURL?if_exists}/admin/works/dltProjectTech";
	document.updateForm.submit();
}

//Auto complete
function changeItemBg(obj, parentId) {

	// Clear bg color.
	var nodes = clearBgColumn(parentId);

	var selectedNum=1;
	console.log(obj.options[obj.selectedIndex].text);
	if(obj.options[obj.selectedIndex].text == "<@spring.message 'user.title.id'/>") {
		selectedNum=2;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'tech.title.kind'/>") {
		selectedNum=3;
	} else {
		selectedNum=2;
	}

	setBgColumn(nodes, selectedNum, '#eeeeee', 'DIV');
}

</script>
