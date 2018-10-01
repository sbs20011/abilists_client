<script type="text/javascript">

var upNoInput = document.getElementById("upNoId");
var fileId = document.getElementById("filesId");

/* This is error  onchange="uploadFile()"
function uploadFile() {

	var fileData = new FormData(); 
	fileData.append('file', file);
	fileData.append('upNo', upNoInput.value); 

	$.ajax({
		type: 'POST',
		url: '${configBean.baseURL?if_exists}/works/uploadProjectFileAjax',
        cache: false,
		data: fileData,
		dataType: 'json',
		processData: false, // Don't process the files
        contentType: false, // Set content type to false as jQuery
        beforeSend: function(xhr, settings) {
        	console.log("before send");
        },
        success: function(data, textStatus, request) {
        	// $('#myImg').attr('src', croppng);
        	// $('#mySmallImg').attr('src', croppng);
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
*/

function clearInputFile(f){
    if(f.value){
        try{
            f.value = ''; //for IE11, latest Chrome/Firefox/Opera...
        }catch(err){
        }
        if(f.value){ //for IE5 ~ IE10
            var form = document.createElement('form'), ref = f.nextSibling;
            form.appendChild(f);
            form.reset();
            ref.parentNode.insertBefore(f,ref);
        }
    }
}

/**/

fileId.addEventListener('change', function(e) {
	var upNoInput = document.getElementById("upNoId");
    var file = this.files[0];

    var xhr = new XMLHttpRequest();
    (xhr.upload || xhr).addEventListener('progress', function(e) {
        var done = e.position || e.loaded
        var total = e.totalSize || e.total;
        console.log('xhr progress: ' + Math.round(done/total*100) + '%');
    });
    xhr.addEventListener('load', function(e) {
    	var resJson = JSON.parse(this.responseText);
        console.log('ufNum(upNo) >>>> ' + upNoInput.value);

        // Clear
        file.value='';

		var tagA = document.createElement("a");
		tagA.href = "${configBean.baseURL?if_exists}/works/downloadProjectFile?ufNo=" + 
			resJson.ufNo + "&ufNum=" + upNoInput.value;
		var ext = file.name.substr(file.name.lastIndexOf('.') + 1);
		var tagImg = document.createElement("img");
		tagImg.setAttribute('src', '/static/apps/img/files/file_' + ext + '.svg');
		tagImg.setAttribute('alt', '');
		tagImg.setAttribute('height', '32');
		tagImg.setAttribute('width', '32');
		tagA.appendChild(tagImg);
		projectsFileId.appendChild(tagA);

    });
    xhr.open('post', '${configBean.baseURL?if_exists}/works/uploadProjectFileAjax', true);

    var data = new FormData();
    data.append('file', file);
    data.append('upNo', upNoInput.value); // 
    console.log(data);
    xhr.send(data);
});


</script>
