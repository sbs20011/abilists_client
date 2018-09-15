<script type="text/javascript">

function uploadImg() {
	var cropcanvas = $('#profileImg').cropper('getCroppedCanvas');
	var croppng = cropcanvas.toDataURL("image/jpeg");

	$.ajax({
		type: 'POST',
		url: '${configBean.baseURL?if_exists}/file/uploadUserFileAjax',
        cache: false,
		data: {
			pngimageData: croppng
		},
        beforeSend: function(xhr, settings) {
        	console.log("before send");
        },
        success: function(data, textStatus, request) {
        	$('#myImg').attr('src', croppng);
        	$('#mySmallImg').attr('src', croppng);
        },
        complete: function(xhr, textStatus) {
        	console.log("complete");
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

}
</script>
