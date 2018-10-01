
<script type="text/javascript">

$(document).ready(function(){
    $("#flip").click(function(){
        $("#newMdataFormId").slideUp("slow");
    });
});

function validateForm(tableName) {

	var blnPopover = true;
	var isError = true;

	var table = document.getElementById(tableName);
	var inputTag = table.getElementsByTagName("input");

    var x = inputTag[0].value;
    if (x==null || x=="" || x=="0") {
    	if(isError) {
    		inputTag[0].focus();
    		inputTag[0].scrollIntoView();
    	}
    	inputTag[0].style.border = "1px solid red";
        isError = false;
    } else {
    	inputTag[0].style.border = "";
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
		$('#submitFormNoti').modal('show')
	});

	if(tableName == "newFormId") {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitNewForm();" );		  
	} else {
		document.getElementById("submitForm").setAttribute( "onClick", "javascript: submitUpdateForm();" );
	}

}

/*
 * For select tag
 */
$(document).ready(function(){

	var selectTarget = $('.selectbox select');

	selectTarget.on('blur', function(){
		$(this).parent().removeClass('focus');
	});

	selectTarget.change(function(){
		var select_name = $(this).children('option:selected').text();

		$(this).siblings('label').text(select_name);
		});
	});


function removeNoti() {
	// Call the modal for deleting
	$(window).ready(function(){
		$('#submitFormDeleteNotiId').modal('show')
	});
}

var ajaxLastNum = 0;

var notiNoInput = document.getElementById("notiNoId");
var notiTitleInput = document.getElementById("notiTitleId");
var notiContentsInput = document.getElementById("notiContentsId");
var notiKindInput = document.getElementById("notiKindId");

function selectMTech(x, num) {

	clearBackGroundColorUl("notiId");
	$("#updateMdataFormId").insertAfter($(x));

	var paraJson = '{"notiNo" : "' + num + '"}';

	$(document).ready(function() {

		var availableKeys;
		var currentAjaxNum = ajaxLastNum;

        $.ajax({
            type: 'POST',
            url: '/admin/noti/sltNotiAjax',
            contentType: "application/json",
            dataType: "json",
            data: paraJson,
            cache: false,
            beforeSend: function(xhr, settings) {
            	console.log("before send");
            },
            success: function(data, textStatus, request) {

            	if(!isBlank(data)) {
            		notiNoInput.value = data.notiNo;
            		notiTitleInput.value = data.notiTitle;
            		notiContentsInput.value = data.notiContents;
            		notiKindInput.value = data.notiKind;
            	}
            },
            complete: function(xhr, textStatus) {
            	console.log("complete");
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
	notiNoInput.value = "";
	notiTitleInput.value = "";
	notiContentsInput.value = "";
	notiKindInput.value = "";

	clearBackGroundColorUl("notiId");
	updateFormCancel();
}

function formSlideDown() {
	$("#updateMdataFormId").slideDown("slow");
}

function newFormCancel() {
	$("#newMdataFormId").slideUp("slow");
	$("#newToggleId").addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
	clearBackGroundColorUl("notiId");
}

function updateFormCancel() {
	$("#updateMdataFormId").slideUp("slow");
	$("#newToggleId").addClass('add-symbol');
	clearBackGroundColorUl("notiId");
}


function submitNewForm() {
	document.newForm.submit();
}

function submitUpdateForm() {
	document.updateForm.submit();
}

//Delete noti
function submitFormDeleteNoti() {
	document.updateForm.action = "dltNoti";
	document.updateForm.submit();
}

</script>
