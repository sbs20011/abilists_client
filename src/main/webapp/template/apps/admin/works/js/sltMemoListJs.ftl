
<script type="text/javascript"> 

function removeMemo() {
	// Call the modal for deleting
	$(window).ready(function(){
		$('#submitFormDeleteMemo').modal('show')
	});
}

var ajaxLastNum = 0;

var umNoInput = document.getElementById("umNoId");
var umMemoInput = document.getElementById("umMemoId");

function sltUserMemo(x, umNo, userId) {

	clearBackGroundColorUl("userMemoId");
	$("#udtMdataFormId").insertAfter($(x));

	$(document).ready(function() {

		var availableKeys;
		var currentAjaxNum = ajaxLastNum;

		// Make a JSON
        var objPara = new Object();
        objPara.umNo = umNo;
        objPara.userId = userId;
        var jsonPara = JSON.stringify(objPara);

        $.ajax({
            type: 'POST',
            url: 'sltMemoAjax',
            contentType: "application/json",
            dataType: "json",
            data: jsonPara,
            cache: false,
            beforeSend: function(xhr, settings) {
            	console.log("before send");
            },
            success: function(userMemo, textStatus, request) {
            	if(!isBlank(userMemo)) {
            		// Sequence Number
            		umNoInput.value = userMemo.umNo;
            		// Memo for report
            		umMemoInput.innerHTML = userMemo.umMemo;
            	}
            },
            complete: function(xhr, textStatus) {
            	console.log("complete");

            	// Set a Memo title into Model
            	var dltMemoTileId = document.getElementById("dltMemoTileId");
            	dltMemoTileId.innerHTML = userId;

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

function newFormCancel() {
	clearBackGroundColorUl("userMemoId");
}

function udtFormCancel() {
	$("#udtMdataFormId").slideUp("slow");
	clearBackGroundColorUl("userMemoId");
}

function submitNewFormUserMemo() {
	document.newForm.submit();
}

function submitUpdateFormUserMemo() {
	document.updateForm.submit();
}

/*
 * Remove a Memo
 */
function sbtDeleteFormMemo() {
	document.updateForm.action = "dltMemo";
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
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message 'memo.title.memo'/>") {
		selectedNum=3;
	} else {
		selectedNum=2;
	}

	setBgColumn(nodes, selectedNum, '#eeeeee', 'DIV');
}

</script>
