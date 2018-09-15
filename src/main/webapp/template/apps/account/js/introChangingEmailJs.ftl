<script type="text/javascript">

window.onload = function() {
	$('#loading').hide();
}

var email = document.getElementById("newUserEmailId");
function validateEmail() {
	// how to convert javascript object to jquery object
	var $inputs = $(email);

	if(!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email.value)){
		console.log(email.value);

        $inputs.css("border", "1px solid red");
        $inputs.popover('show');
		return false;
	}

    return true;
}

</script>
