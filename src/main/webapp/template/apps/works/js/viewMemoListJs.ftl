<script type="text/javascript">

var allCount = ${model.paging.allCount?c};

window.onload = function() {
	$('#loading').hide();
	if(allCount < 11) {
		pageMoreId.style.display = "none";
	}
}

var umMemoId = document.getElementById('umMemoId');
var modalContentId = document.getElementById('modalContentId');
var umBgColorId = document.getElementById('umBgColorId');

function changeBcColor(obj, tagId) {
	/* Clear border line*/
	clearStyle(tagId, 'li');

	umMemoId.style.backgroundColor = obj.style.backgroundColor;
	modalContentId.style.backgroundColor = obj.style.backgroundColor;
	obj.style.border = "1px solid #337ab7";
	umBgColorId.value = rgbToHex(obj.style.backgroundColor);
}

var udtUmMemoId = document.getElementById('udtUmMemoId');
var udtModalContentId = document.getElementById('udtModalContentId');
var udtUmBgColorId = document.getElementById('udtUmBgColorId');

function udtChangeBcColor(obj, tagId) {
	/* Clear border line*/
	clearStyle(tagId, 'li');

	udtUmMemoId.style.backgroundColor = obj.style.backgroundColor;
	udtModalContentId.style.backgroundColor = obj.style.backgroundColor;
	obj.style.border = "1px solid #337ab7";
	udtUmBgColorId.value = rgbToHex(obj.style.backgroundColor);
}


function udtUserMemo(self, umNo, bgColor) {

	/* Clear border line*/
	clearStyle('udtColorId', 'li');

	// no
	var umNoInput = document.getElementById("umNoId");

	umNoInput.value = umNo;
	// memo
	var memoTa = document.getElementById("udtUmMemoId");	
	var memo = self.innerHTML.replace(/<br\s*\/?>/mg, "\n");
	memoTa.value = memo;

	if(isEmpty(bgColor)) {
		// BgColor
		udtUmMemoId.style.backgroundColor = "#ffffcc";
		udtModalContentId.style.backgroundColor = "#ffffcc";	
	} else {
		// BgColor
		udtUmMemoId.style.backgroundColor = bgColor;
		udtModalContentId.style.backgroundColor = bgColor;	
	}

	// Call the modal for deleting
	$(window).ready(function(){
		$('#udtUserMemoModal').modal('show');
	});

}

var memoUiId = document.getElementById('memoUiId');
var pageMoreId = document.getElementById('pageMoreId');

var nowPage = 2;

function pageMore(userId) {

	var cdata = '{ "nowPage":"' + nowPage + '", "allCount":"' + allCount + '", "userId":"' + userId + '"}';
	var curl = "${configBean.baseURL?if_exists}/works/sltMemoListAjax";
	var cresult = requestbyAjax(curl,cdata);

	var liContentsHtml;
	var memoSize;

	if(cresult) {

		memoSize = cresult.userMemoList.length;

		for (i = 0; i < cresult.userMemoList.length; i++) {

		    var li = document.createElement("LI");
			liContentsHtml = '<a href="#" onclick="udtUserMemo(this, ' + 
				cresult.userMemoList[i].umNo + '); return false;">' + cresult.userMemoList[i].umMemo + '</a>';
		    li.innerHTML = liContentsHtml;

			memoUiId.appendChild(li);
		}

		nowPage = nowPage + 1;

		// When select the end of list, the more button will not be displayed.
		if(memoSize < 10) {
			pageMoreId.style.display = "none";
		}

	}

}

</script>
