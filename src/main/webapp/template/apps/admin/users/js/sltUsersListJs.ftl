
<script type="text/javascript">

window.onload = function() {
	// $("#udtMdataFormId").hide();
	$('#loading').hide();
}

/*
 * Make the table on the Modal for confirming the data.
 */
function confirmData(tableName) {

	// Call the modal
	$(window).ready(function(){
		$('#submitFormUsers').modal('show')
	});

	var table1 = document.getElementById(tableName);
	// Create a table on Motal 
	var table3 = document.getElementById("t03");

	var row11, row12, row31, row32;

	row11 = table1.rows[2];
	row12 = table1.rows[3];
	row31 = table3.rows[0];
	row32 = table3.rows[1];

	var selectUserAuth;
	var selectUserStatus;

	selectUserAuth = row11.cells[3].getElementsByTagName("select")[0];
	var userAuthHtml = selectUserAuth.options[selectUserAuth.selectedIndex].text;
	row31.cells[1].innerHTML = userAuthHtml;

	selectUserStatus = row12.cells[5].getElementsByTagName("select")[0];
	var userStatusHtml = selectUserStatus.options[selectUserStatus.selectedIndex].text;
	row32.cells[1].innerHTML = userStatusHtml;

}

var ajaxLastNum = 0;

var inputUserIdInput = document.getElementById("inputUserId");
var userIdHtml = document.getElementById("userIdId");
var userAuthInput = document.getElementById("userAuthId");
var userNameHtml = document.getElementById("userNameId");
var userSexHtml = document.getElementById("userSexId");
var userEmailHtml = document.getElementById("userEmailId");
var userAgesHtml = document.getElementById("userAgesId");
var userProfileHtml = document.getElementById("userProfileId");
var userImgDataInput = document.getElementById("userImgDataId");
var userStatusInput = document.getElementById("userStatusId");
var insertTimeHtml = document.getElementById("insertTimeId");

function sltUsers(x, userId) {

	clearBackGroundColorUl("uUsersId");
	$("#udtMdataFormId").insertAfter($(x));
	
	var paraJson = '{"userId" : "' + userId + '"}';

	$(document).ready(function() {

		var availableKeys;
		var currentAjaxNum = ajaxLastNum;

        $.ajax({
            type: 'POST',
            url: '${configBean.baseURL?if_exists}/admin/users/sltUsersAjax',
            contentType: "application/json",
            dataType: "json",
            data: paraJson,
            cache: false,
            beforeSend: function(xhr, settings) {
            	console.log("before send");
            },
            success: function(data, textStatus, request) {
            	if(!isBlank(data)) {
            		inputUserIdInput.value = data.userId;
            		userIdHtml.innerHTML = data.userId;
            		userAuthInput.value = data.userAuth;
            		userNameHtml.innerHTML = data.userName;
            		if(data.userSex == "1") {
            			userSexHtml.innerHTML = "Man";	
            		} else {
            			userSexHtml.innerHTML = "Woman";
            		}
            		userEmailHtml.innerHTML = data.userEmail;
            		userAgesHtml.innerHTML = data.userAges;
            		userProfileHtml.innerHTML = data.userProfile;
            		userImgDataInput.src = data.userImgData;
            		userStatusInput.value = data.userStatus;
            		
            		var insertTime = new Date(data.insertTime);
            		var dd = insertTime.getDate();
            		// January is 0!
            		var mm = insertTime.getMonth()+1;
            		var yyyy = insertTime.getFullYear();
            		insertTimeHtml.innerHTML = yyyy + "-" + mm + "-" + dd;
            	}
            },
            complete: function(xhr, textStatus) {
            	console.log("complete");
            	formSlideDown();

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
	clearBackGroundColorUl("uUsersId");
}

function submitUpdateFormUser() {
	document.updateForm.submit();
}

//Auto complete
function changeItemBg(obj, parentId) {

	// Clear bg color.
	var nodes = clearBgColumn(parentId);

	var selectedNum=2;
	console.log(obj.options[obj.selectedIndex].text);
	if(obj.options[obj.selectedIndex].text == "<@spring.message "user.title.id"/>") {
		selectedNum=2;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message "user.title.name"/>") {
		selectedNum=3;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message "user.title.auth"/>") {
		selectedNum=4;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message "user.title.sex"/>") {
		selectedNum=5;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message "user.title.email"/>") {
		selectedNum=6;
	} else if(obj.options[obj.selectedIndex].text == "<@spring.message "user.title.status"/>") {
		selectedNum=7;
	} else {
		selectedNum=7;
	}

	setBgColumn(nodes, selectedNum, '#eeeeee', 'DIV');
}

</script>
