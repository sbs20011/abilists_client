<script>
/* Show the complete message to save.*/
var ecompany = document.getElementById("completeId");
<#if save??>
	ecompany.style.display = "";
	<#if "completed" == "${save?if_exists}">
	function fadeOutCompleted() {
		fadeOut(ecompany);
	}
	addLoadEvent(fadeOutCompleted);
	</#if>
</#if>
</script>