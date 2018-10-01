<script type="text/javascript">

/*
 * Sort
 */
$( function() {
  $( "#chartId" ).sortable({ 
	  cursor: "move", 
      start: function (event, ui) {
          ui.item.toggleClass("highlight");
	  },
	  stop: function (event, ui) {
	      ui.item.toggleClass("highlight");
	  }
  });

  $( "#chartId" ).disableSelection();
});

</script>
