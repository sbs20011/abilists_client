<script type="text/javascript">

var allCount = <#if model.paging??>${model.paging.allCount?c}<#else>0</#if>;

window.onload = function() {
	$('#loading').hide();
	if(allCount < 11) {
		pageMoreId.style.display = "none";
	}
}

function istUserMemo() {
	// Call the modal for deleting
	$(window).ready(function(){
		$('#istUserMemoModal').modal('show');
	});
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

var umNoInput = document.getElementById("umNoId");
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

	// umNo
	umNoInput.value = umNo;
	// BgColor
	udtUmBgColorId.value = bgColor;

	// memo
	var memoTa = document.getElementById("udtUmMemoId");
	var memo = self.innerHTML.replace(/<br\s*\/?>/mg, "\n");
	console.log(memo);
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

//Delete user Memo
function removeMemo() {
	document.udtUserMemoForm.action = "${configBean.baseURL?if_exists}/works/dltMemo";
	document.udtUserMemoForm.submit();
}
	
// Insert user Memo
function sbtIstUserMemoForm() {
	document.istUserMemoForm.submit();
}

// Update user Memo
function sbtUdtUserMemoForm() {
	document.udtUserMemoForm.submit();
}

var memoUiId = document.getElementById('memoUiId');
var pageMoreId = document.getElementById('pageMoreId');

var nowPage = 2;

function pageMore(userId) {

	var cdata = '{ "nowPage":"' + nowPage + '", "allCount":"' + allCount + '", "userId":"' + userId + '"}';
	var curl = "${configBean.baseURL?if_exists}/works/sltMemoListAjax";
	var cresult = requestbyAjax(curl,cdata);

	var liAHtml;
	var liInputNoHtml;
	var inputSort;
	var memoSize;

	if(cresult) {

		memoSize = cresult.userMemoList.length;

		for (i = 0; i < cresult.userMemoList.length; i++) {

		    var li = document.createElement("LI");
		    li.className="ui-sortable-handle";
			liAHtml = '<a href="#" style="background:' + cresult.userMemoList[i].umBgColor + ';" onclick="udtUserMemo(this, ' + 
				cresult.userMemoList[i].umNo + '); return false;">' + cresult.userMemoList[i].umMemo + '</a>'; 
			liInputNoHtml = '<input type="hidden" name="umNoOrder" value="' + cresult.userMemoList[i].umNo + '">'; 
		    li.innerHTML = liAHtml + liInputNoHtml;

		    inputSort = document.createElement("INPUT");
		    inputSort.type="hidden";
		    inputSort.name="umSortOrder";
		    inputSort.value=cresult.userMemoList[i].umSort;
		    inputSort.className="ui-sortable-handle";

		    // liInputSortHtml = '<input type="hidden" name="umSortOrder" value="' + cresult.userMemoList[i].umSort + '">'; 

			memoUiId.appendChild(li);
			memoUiId.appendChild(inputSort);
		}

		nowPage = nowPage + 1;

		// When select the end of list, the more button will not be displayed.
		if(memoSize < 10) {
			pageMoreId.style.display = "none";
		}

	}

}

// Sort memo

var umNoList = document.getElementsByName("umNoOrder");
var umSortList = document.getElementsByName("umSortOrder");
var newToken = document.getElementById("newTokenId");

$( function() {
  $( "#memoUiId" ).sortable({ 

	  cursor: "move", 
      start: function (event, ui) {
          ui.item.toggleClass("highlight");
	  },
	  stop: function (event, ui) {
	      ui.item.toggleClass("highlight");
	  },
	  activate: function( event, ui ) {
	  },
      update : function () {
          var order = $('#memoUiId').sortable('serialize',{key:'utSort'});
          var order1 = $("#memoUiId").sortable('toArray').toString();
          console.log("1. " + order1);

          var i = 0;
          var strJson = '{"memoSortBeanList" : [';
          for(i; i<umNoList.length; i++){
        	  strJson += '{"umNoOrder":"' + umNoList[i].value + '","umSortOrder":"' + umSortList[i].value + '"},';
          };
          var cdata = strJson.substring(0, strJson.length-1);
          cdata += ']}';

          var curl = "udtMemoSortAjax";
          var cresult = requestbyAjax(curl,cdata);
          if(cresult) {
        	  console.log("result >>> " + cresult.token);
          }

      }
  });

  $( "#memoUiId" ).disableSelection();
} );

</script>
