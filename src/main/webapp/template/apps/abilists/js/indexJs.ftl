<script type="text/javascript">

var allCount = <#if model.paging??>${model.paging.allCount?c}<#else>0</#if>;

var postsDivId = document.getElementById('postsDivId');
var pageMoreId = document.getElementById('pageMoreId');

window.onload = function() {
	$('#loading').hide();
	if(allCount < 6) {
		pageMoreId.style.display = "none";
	}

}

var nowPage = 2;

function dltPosts(upsNo) {

	var cdata = '{ "upsNo":"' + upsNo + '"}';
	var curl = "${configBean.baseURL?if_exists}/abilists/dltPostAjax";
	var cresult = requestbyAjax(curl,cdata);

	if(cresult) {
		$("#p"+upsNo).fadeOut();
	}

}

function pageMore() {

	var cdata = '{ "nowPage":"' + nowPage + '", "allCount":"' + allCount + '"}';
	var curl = "${configBean.baseURL?if_exists}/abilists/sltPostsListAjax";
	var cresult = requestbyAjax(curl,cdata);

	var mainDiv, mediaDiv, postsLinkDiv, mediaTopDiv, mediaBody;
	var divAHtml, liAHtml1,liAHtml2,liAHtml3,liAHtml4;
	var ulShowMoreHtml1;
	var postsSize, showMoreDiv;

	if(cresult) {

		postsSize = cresult.length;

		for (i = 0; i < cresult.length; i++) {
			mainDiv = document.createElement("DIV");
			mainDiv.className="item-box posts main-posts";
			mainDiv.id='p' + cresult[i].upsNo;

			// 1. media
			mediaDiv = document.createElement("DIV");
			mediaDiv.className="media";
			mediaTopDiv = document.createElement("DIV");
			mediaTopDiv.className="media-left media-top";

			// Add user image tag
			divAHtml = '<a href="${configBean.baseURL?if_exists}/profile/' + cresult[i].userId + '">' + 
						'<img style="border-radius: 4px;" src="' + cresult[i].userImgData +'" id="showImg" width="64" alt="your picture">'  + 
						'</a>';
			mediaTopDiv.innerHTML = divAHtml;
			mediaDiv.appendChild(mediaTopDiv);

			// Add user body
			mediaBody = document.createElement("DIV");
			mediaBody.className="media-body";
			var bodyUl = document.createElement("UL");
			bodyUl.className="body-posts";
			// User name and ID
			var bodyLiName = document.createElement("LI");
			bodyLiName.className="body-posts-name";
			var liNameHtml = cresult[i].userName + '@' + cresult[i].userId + 
				'<h5 class="media-heading"><a href="${configBean.baseURL?if_exists}/' + cresult[i].urlPath + '">' + cresult[i].upsTitle + '</a></h5>'
			bodyLiName.innerHTML = liNameHtml;

			// User contents
			var bodyLiBody = document.createElement("LI");
			bodyLiBody.className="dropdown body-posts-contents";

			liAHtml1 = '<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">';
			if (cresult[i].userId == "${user.userId?if_exists}") {
				liAHtml2 = '<span class="glyphicon glyphicon-option-horizontal" style="color:#337ab7;float: right; font-size: 18px;" aria-hidden="true"></span>';
			} else {
				liAHtml2 = "";
			}
			liAHtml3 = '</a>';
			liAHtml4 = '<ul class="dropdown-menu body-posts-menu"><li><a href="#" onclick="dltPosts(' + cresult[i].upsNo + '); return false;">Delete</a></li></ul>';

			bodyLiBody.innerHTML = liAHtml1 + liAHtml2 + liAHtml3 + liAHtml4;
			// UL > LI
			bodyUl.appendChild(bodyLiName);
			bodyUl.appendChild(bodyLiBody);
			// DIV > UL
			mediaBody.appendChild(bodyUl);
			// Add contents
			// mediaBody.innerHTML = mediaBody.innerHTML + cresult[i].upsPost

			// Show-more DIV
			showMoreDiv = document.createElement("DIV");
			showMoreDiv.className="show-more";
			showMoreDiv.id='c' + cresult[i].upsNo;
			showMoreDiv.innerHTML = cresult[i].upsPost;
			// DIV > DIV
			mediaBody.appendChild(showMoreDiv);

			showMoreUl = document.createElement("UL");
			showMoreUl.className="body-posts";
			showMoreLi1 = document.createElement("LI");
			showMoreUl.appendChild(showMoreLi1);
			showMoreLi2 = document.createElement("LI");

			if(cresult[i].upsPost.length > 250) {
				// If there is long text, Showing this link.
				showMoreLi2.innerHTML = '<a href="#" onclick="showMore(this, \'c' + cresult[i].upsNo + '\'); return false;"><span class="show-more-button">Show more</span></a>';
			}
			showMoreUl.appendChild(showMoreLi2);

			// DIV > UL
			mediaBody.appendChild(showMoreUl);

			// Media > DIV
			mediaDiv.appendChild(mediaBody);

			// 2. posts-link
			postsLinkDiv = document.createElement("DIV");
			postsLinkDiv.className="posts-link";

			divSpanHtml = '<a href="${configBean.baseURL?if_exists}/' + cresult[i].urlPath + '">' +
						'<span class="glyphicon glyphicon-eye-open" style="top: 3px;" aria-hidden="true"></span> See More' +
						'</a>';

<#--					'<span class="glyphicon glyphicon-share" style="margin-left: 15px;font-size: 16px;" aria-hidden="true" onclick=""></span> Repost'; -->

			postsLinkDiv.innerHTML = divSpanHtml

			mainDiv.appendChild(mediaDiv);
			mainDiv.appendChild(postsLinkDiv);

			postsDivId.appendChild(mainDiv);

			
		}

		nowPage = nowPage + 1;

		// When select the end of list, the more button will not be displayed.
		if(postsSize < 5) {
			pageMoreId.style.display = "none";
		}

	}

}


function udtUserMemo(self, umNo, bgColor) {

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

function showMore(self, contentsId) {
	self.style.display = 'none';
	
	var showContentsId = document.getElementById(contentsId);
	showContentsId.style.height = 'auto';
	
	/*
	var lineHeight = showContentsId.offsetHeight;
	console.log("lineHeight >>> " + lineHeight);
	if (lineHeight > 100) {
		showContentsId.style.maxHeight = '100px';
	}
	*/

}

function countLines(contentsId) {
	var divHeight = document.getElementById(contentsId);

	d.style.overflow = 'visible';
	var lineHeight = document.getElementById(contentsId).style.lineHeight;
	var alineHeight = parseInt(lineHeight);
	var lines = divHeight / alineHeight;

}

window.onscroll = function() {fixSideDiv()};

var memoJsId = document.getElementById("memoDivId");
var usersJsId = document.getElementById("usersDivId");

function fixSideDiv() {
	var y = window.scrollY;

    if (y > 160) {
    	memoJsId.classList.add("fix-scroll");
    	usersJsId.classList.add("fix-scroll");
    } else {
    	memoJsId.classList.remove("fix-scroll");
    	usersJsId.classList.remove("fix-scroll");
    }
}

</script>