<script type="text/javascript">

function validateConfirmePassword() {
	var currentPwdId = document.getElementById("currentPwdId");
	var passwordId = document.getElementById("passwordId");
	var password2Id = document.getElementById("password2Id");

	if(isEmpty(currentPwdId.value)){
		currentPwdId.style.border = "1px solid red";
        return false;
	} else {
		currentPwdId.style.border = "";
	}

	if(isEmpty(passwordId.value)){
		passwordId.style.border = "1px solid red";
        return false;
	} else {
		passwordId.style.border = "";
	}

	if(isEmpty(password2Id.value)){
		password2Id.style.border = "1px solid red";
        return false;
	} else {
		passwordId.style.border = "";
	}

	if(passwordId.value != password2Id.value){
		// how to convert javascript object to jquery object
		var $inputs = $(password2Id);

        $inputs.css("border", "1px solid red");
        $inputs.popover('show');
        return false;
	}
	return true;
}

</script>
