	
	<script type="text/javascript">
	
	window.onload = function() {
		$('#loading').hide();
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

	var ajaxLastNum = 0;

	var uptNoInput = document.getElementById("uptNoId");
	var uptKindInput = document.getElementById("uptKindId");
	var mtNoInput = document.getElementById("mtNoId");
	var uptLevelInput = document.getElementById("uptLevelId");
	var uptDetailInput = document.getElementById("uptDetailId");
	var tokenInput = document.getElementById("tokenId");
	
	function sltUserProjectTech(x, uptNo, mtNo, mtechList) {
	
		clearBackGroundColorUl("uProjectTechId");
		$("#udtMdataFormId").insertAfter($(x));
	
		$(document).ready(function() {
	
			var userProjectTechKeys;
			var mTechDetailKeys;
			var currentAjaxNum = ajaxLastNum;
	
	        $.ajax({
	            type: 'POST',
	            url: '${configBean.baseURL?if_exists}/works/sltProjectTechAjax',
	            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	            dataType: "json",
	            data: 'body={ "uptNo":"' + uptNo + '", "mtNo":"' + mtNo + '"}',
	            cache: false,
	            beforeSend: function(xhr, settings) {
	            	console.log("before send");
	            },
	            success: function(data, textStatus, request) {
	            	if(!isBlank(data.result)) {
	            		availableKeys = data.result;
	
	            		uptNoInput.value = availableKeys.uptNo;
	            		uptKindInput.value = availableKeys.uptKind;
	            		
	                	// Create the second values 
	                	changeUtKindSelect(mtechList, 1);
	
	            		mtNoInput.value = availableKeys.mtNo;
	            		// Create the third values
	            		changeUtLevelSelect(1);
	
	            		uptLevelInput.value = availableKeys.uptLevel;
	            		uptDetailInput.value = availableKeys.uptDetail;
	            		
	            		tokenInput.value = availableKeys.token;
	            	}
	
	            },
	            complete: function(xhr, textStatus) {
	            	console.log("complete");
	
	            	// Set a project title into Model
	            	var dltProjectTechTile = document.getElementById("dltProjectTechTileId");
	            	dltProjectTechTile.innerHTML = uptKindInput.value;
	
	            	var udtProjectTechTileId = document.getElementById("udtProjectTechTileId");
	            	udtProjectTechTileId.innerHTML = uptKindInput.value;
	
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

	function formSlideDown() {
		$("#udtMdataFormId").slideDown("slow");
	}

	function updateFormCancel() {
		$("#udtMdataFormId").slideUp("slow");
		$("#newToggleSkillsId").addClass('add-symbol');
		clearBackGroundColorUl("uProjectTechId");
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
		var curl = "${configBean.baseURL?if_exists}/profile/sltMTechDetailListAjax";
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

	</script>
