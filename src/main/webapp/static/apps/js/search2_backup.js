function exceptionKeyByObj(e) {
    if(e.keyCode==37 || e.keyCode==38 || 
    		e.keyCode==39 || e.keyCode==40 ) {
        return false;
    }
    return true;
}

var timeout;
var ajaxLastNum = 0;

/*
// Multi search function
// 1, Event
// 2. row number in autocomplete
// 3. Url for the local object
// 4. Page(different title)
// 5. This
// 6. Column name
*/
function interverKeystroke(e, num, url, kind, ojb, optionId) {
	clearTimeout(timeout);
	timeout = setTimeout(function() {
		autoSrhItem(e, num, url, kind, ojb, optionId);
	}, 500);

}


/*
// Multi search function
// 1, Event
// 2. row number in autocomplete
// 3. Url for the local object
// 4. Page(different title)
// 5. This
// 6. Column name
*/
function autoSrhItem(e, num, url, kind, ojb, optionId) {

	if(!exceptionKeyByObj(e)) {
		return false;
	}

	$(document).ready(function() {

		// Option Item
		var optionItem = "";

		if (!isEmpty(optionId)) {
			optionItem = document.getElementById(optionId);
		}

		// Make a object
		var $inputSname = $('#searchForm').find('input[name=' + ojb.name + ']:eq(' + num + ')');
		// Validate value's length
		if($inputSname.val().length < 2) {
			return false;
		}
		$inputSname.popover('destroy');

		var availableTags = [];
		var currentAjaxNum = ajaxLastNum;

		var para = '{"' + optionItem.name + '" : "' + optionItem.value + '", "' + 
			$inputSname.attr("name") + '" : "' + $inputSname.val().replace(/"/g, '\\"') + '"}';

        $.ajax({
            type: 'POST',
            url: url,
            contentType: "application/json",
            dataType: "json",
            data: para,
            cache: false,
            beforeSend: function(xhr, settings) {
            	ajaxLastNum = ajaxLastNum + 1;
            	$('#search' + num).addClass('input-spinner');
            },
            success: function(data, textStatus, request) {
            	$('#search' + num).removeClass('input-spinner');
            	if(currentAjaxNum == ajaxLastNum - 1) {
                	if(!isBlank(data)) {
                		// console.log(data);
                		availableTags = data;
                		$('#statuses').html('<li>' + data + '</li>');
                	}
                	var availableNames = [];
                	for (var i in availableTags) {
                		availableNames[i] = availableTags[i].map1;
                	}
                	$inputSname.autocomplete();
                    // Close if already visible
                	if ($inputSname.autocomplete("widget").is(":visible")) {
                		$inputSname.autocomplete("close");
                		return false;
                	}
                	$inputSname.autocomplete({
                		source: availableTags,
                		autoFocus: false, 
                		minLength: 0,
                		close: function( event, ui ) {},
                		open: function( event, ui ) {return true;},
                		search: function( event, ui ) {return true;},
                		focus: function( event, ui ) {
                			if(kind == "users") {
                				$inputSname.val( ui.item.userId );        			
                    		} else if(kind == "tech") {
                    			if(optionItem.value == "mtSkill") {
                    				$inputSname.val( ui.item.mtSkill );
                    			}
                    			if(optionItem.value == "mtKind") {
                    				$inputSname.val( ui.item.mtKind );
                    			}
                    			if(optionItem.value == "mtName") {
                    				$inputSname.val( ui.item.mtName );
                    			}
                    			if(optionItem.value == "mtVersion") {
                    				$inputSname.val( ui.item.mtVersion );
                    			}
                    			if(optionItem.value == "mtExplain") {
                    				$inputSname.val( ui.item.mtExplain );
                    			}
                    		} else if(kind == "projects") {
                    			if(optionItem.value == "userId") {
                    				$inputSname.val( ui.item.userId );
                    			}
                    			if(optionItem.value == "upName") {
                    				$inputSname.val( ui.item.upName );
                    			}
                    			if(optionItem.value == "upMembers") {
                    				$inputSname.val( ui.item.upMembers );
                    			}
                    			if(optionItem.value == "upExplain") {
                    				var str = ui.item.upExplain;
                    				var res = str.substring(0, 20);
                    				$inputSname.val( res );
                    			}
                    			if(optionItem.value == "upCodeRole") {
                    				$inputSname.val( ui.item.upCodeRole );
                    			}
                    			if(optionItem.value == "upCodeIndustry") {
                    				$inputSname.val( ui.item.upCodeIndustry );
                    			}
                    		} else if(kind == "projectTech") {
                    			if(optionItem.value == "userId") {
                    				$inputSname.val( ui.item.userId );
                    			}
                    			if(optionItem.value == "uptKind") {
                    				$inputSname.val( ui.item.uptKind );
                    			}
                    			if(optionItem.value == "uptLevel") {
                    				$inputSname.val( ui.item.uptLevel );
                    			}
                    			if(optionItem.value == "uptDetail") {
                    				var str = ui.item.uptDetail;
                    				var res = str.substring(0, 20);
                    				$inputSname.val( res );
                    			}
                    			if(optionItem.value == "uptStatus") {
                    				$inputSname.val( ui.item.uptStatus );
                    			}
                    		} else if(kind == "tasks") {
                    			if(optionItem.value == "userId") {
                        			$inputSname.val( ui.item.userId );
                    			}
                    			if(optionItem.value == "utKind") {
                        			$inputSname.val( ui.item.utKind );
                    			}
                    			if(optionItem.value == "utProgress") {
                        			$inputSname.val( ui.item.utProgress );
                    			}
                    			if(optionItem.value == "utTitle") {
                    				$inputSname.val( ui.item.utTitle );
                    			}
                    		} else if(kind == "role") {
                    			if(optionItem.value == "mrName") {
                    				$inputSname.val( ui.item.mrName );
                    			}
                    			if(optionItem.value == "mrCode") {
                    				$inputSname.val( ui.item.mrCode );
                    			}
                    			if(optionItem.value == "mrSkills") {
                    				$inputSname.val( ui.item.mrSkills );
                    			}
                    			if(optionItem.value == "mrPrefers") {
                    				$inputSname.val( ui.item.mrPrefers );
                    			}
                    		} else if(kind == "industry") {
                    			if(optionItem.value == "miLargeCategory") {
                        			$inputSname.val( ui.item.miLargeCategory );
                    			}
                    			if(optionItem.value == "miMiddleCategory") {
                    				$inputSname.val( ui.item.miMiddleCategory );
                    			}
                    			if(optionItem.value == "miCode") {
                    				$inputSname.val( ui.item.miCode );
                    			}
                    		} else if(kind == "reports") {
                    			if(optionItem.value == "userId") {
                        			$inputSname.val( ui.item.userId );
                    			}
                    			if(optionItem.value == "urWorkDay") {
                        			$inputSname.val( ui.item.urWorkDay );
                    			}
                    			if(optionItem.value == "urWorkHour") {
                        			$inputSname.val( ui.item.urWorkHour );
                    			}
                    			if(optionItem.value == "urReports") {
                    				var str = ui.item.urReports;
                    				var res = str.substring(0, 20);
                    				$inputSname.val( res );
                    			}
                    		} else if(kind == "memo") {
                    			if(optionItem.value == "userId") {
                        			$inputSname.val( ui.item.userId );
                    			}
                    			if(optionItem.value == "umMemo") {
                    				var str = ui.item.umMemo;
                    				var res = str.substring(0, 20);
                    				$inputSname.val( res );
                    			}
                    		} else {
                    			console.log("Error search in focus");
                    		}
                			return false;
                		},
                		select: function( event, ui ) {
                			if(kind == "users") {
                    			if(optionItem.value == "userId") {
                    				$inputSname.val( ui.item.userId );
                    			}
                    			if(optionItem.value == "userName") {
                    				$inputSname.val( ui.item.userName );
                    			}
                    			if(optionItem.value == "userAuth") {
                    				$inputSname.val( ui.item.userAuth );
                    			}
                    			if(optionItem.value == "userSex") {
                    				$inputSname.val( ui.item.userSex );
                    			}
                    			if(optionItem.value == "userEmail") {
                    				$inputSname.val( ui.item.userEmail );
                    			}
                    			if(optionItem.value == "userStatus") {
                    				$inputSname.val( ui.item.userStatus );
                    			}
                    		} else if(kind == "projects") {
                    			if(optionItem.value == "userId") {
                    				$inputSname.val( ui.item.userId );
                    			}
                    			if(optionItem.value == "upName") {
                    				$inputSname.val( ui.item.upName );
                    			}
                    			if(optionItem.value == "upMembers") {
                    				$inputSname.val( ui.item.upMembers );
                    			}
                    			if(optionItem.value == "upExplain") {
                    				var str = ui.item.upExplain;
                    				var res = str.substring(0, 20);
                    				$inputSname.val( res );
                    			}
                    			if(optionItem.value == "upCodeRole") {
                    				$inputSname.val( ui.item.upCodeRole );
                    			}
                    			if(optionItem.value == "upCodeIndustry") {
                    				$inputSname.val( ui.item.upCodeIndustry );
                    			}
                    		} else if(kind == "projectTech") {
                    			if(optionItem.value == "userId") {
                    				$inputSname.val( ui.item.userId );
                    			}
                    			if(optionItem.value == "uptKind") {
                    				$inputSname.val( ui.item.uptKind );
                    			}
                    			if(optionItem.value == "uptLevel") {
                    				$inputSname.val( ui.item.uptLevel );
                    			}
                    			if(optionItem.value == "uptDetail") {
                    				var str = ui.item.uptDetail;
                    				var res = str.substring(0, 20);
                    				$inputSname.val( res );
                    			}
                    			if(optionItem.value == "uptStatus") {
                    				$inputSname.val( ui.item.uptStatus );
                    			}
                    		} else if(kind == "tech") {
                    			if(optionItem.value == "mtSkill") {
                    				$inputSname.val( ui.item.mtSkill );
                    			}
                    			if(optionItem.value == "mtKind") {
                    				$inputSname.val( ui.item.mtKind );
                    			}
                    			if(optionItem.value == "mtName") {
                    				$inputSname.val( ui.item.mtName );
                    			}
                    			if(optionItem.value == "mtVersion") {
                    				$inputSname.val( ui.item.mtVersion );
                    			}
                    			if(optionItem.value == "mtExplain") {
                    				$inputSname.val( ui.item.mtExplain );
                    			}
                    		} else if(kind == "role") {
                    			if(optionItem.value == "mrName") {
                    				$inputSname.val( ui.item.mrName );
                    			}
                    			if(optionItem.value == "mrCode") {
                    				$inputSname.val( ui.item.mrCode );
                    			}
                    			if(optionItem.value == "mrSkills") {
                    				$inputSname.val( ui.item.mrSkills );
                    			}
                    			if(optionItem.value == "mrPrefers") {
                    				$inputSname.val( ui.item.mrPrefers );
                    			}
                    		} else if(kind == "industry") {
                    			if(optionItem.value == "miLargeCategory") {
                        			$inputSname.val( ui.item.miLargeCategory );
                    			}
                    			if(optionItem.value == "miMiddleCategory") {
                    				$inputSname.val( ui.item.miMiddleCategory );
                    			}
                    			if(optionItem.value == "miCode") {
                    				$inputSname.val( ui.item.miCode );
                    			}
                    		} else if(kind == "reports") {
                    			if(optionItem.value == "userId") {
                        			$inputSname.val( ui.item.userId );
                    			}
                    			if(optionItem.value == "urWorkDay") {
                        			$inputSname.val( ui.item.urWorkDay );
                    			}
                    			if(optionItem.value == "urWorkHour") {
                        			$inputSname.val( ui.item.urWorkHour );
                    			}
                    			if(optionItem.value == "urReports") {
                    				var str = ui.item.urReports;
                    				var res = str.substring(0, 20);
                    				$inputSname.val( res );
                    			}
                    		} else if(kind == "memo") {
                    			if(optionItem.value == "userId") {
                        			$inputSname.val( ui.item.userId );
                    			}
                    			if(optionItem.value == "umMemo") {
                    				var str = ui.item.umMemo;
                    				var res = str.substring(0, 20);
                    				$inputSname.val( res );
                    			}
                    		} else {
                    			console.log("Error search in select");
                    		}
                			return false;
                		}
                	}).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
                		var dataValue;
                		if(kind == "users") {
                			var uiAuto = $( "<li>" ).attr( "data-value", item.userId );
                			uiAuto.append('<img src="' + item.userImgData + '" height="50">');
                			if(optionItem.value == "userId") {
                    			uiAuto.append('<span>' + item.userId + '</span>');
                			}
                			if(optionItem.value == "userName") {
                				uiAuto.append('<span>' + item.userName + '</span>');
                			}
                			if(optionItem.value == "userAuth") {
                				uiAuto.append('<span>' + item.userAuth + '</span>');
                			}
                			if(optionItem.value == "userSex") {
                				uiAuto.append('<span>' + item.userSex + '</span>');
                			}
                			if(optionItem.value == "userEmail") {
                				uiAuto.append('<span>' + item.userEmail + '</span>');
                			}
                			if(optionItem.value == "userStatus") {
                				uiAuto.append('<span>' + item.userStatus + '</span>');
                			}
                		} else if(kind == "projects") {
                			var uiAuto = $( "<li>" ).attr( "data-value", item.userId );
                			uiAuto.append('<img src="' + item.userImgData + '" height="50">');
                			if(optionItem.value == "userId") {
                				uiAuto.append('<span>' + item.userId + '</span>');
                			}
                			if(optionItem.value == "upName") {
                				uiAuto.append('<span>' + item.upName + '</span>');
                			}
                			if(optionItem.value == "upMembers") {
                				uiAuto.append('<span>' + item.upMembers + '</span>');
                			}
                			if(optionItem.value == "upExplain") {
                				var str = item.upExplain;
                				var res = str.substring(0, 20);
                				uiAuto.append('<span>' + res + '</span>');
                			}
                			if(optionItem.value == "upCodeRole") {
                				uiAuto.append('<span>' + item.upCodeRole + '</span>');
                			}
                			if(optionItem.value == "upCodeIndustry") {
                				uiAuto.append('<span>' + item.upCodeIndustry + '</span>');
                			}
                		} else if(kind == "projectTech") {
                			var uiAuto = $( "<li>" ).attr( "data-value", item.userId );
                			uiAuto.append('<img src="' + item.userImgData + '" height="50">');
                			if(optionItem.value == "userId") {
                				uiAuto.append('<span>' + item.userId + '</span>');
                			}
                			if(optionItem.value == "uptKind") {
                				uiAuto.append('<span>' + item.uptKind + '</span>');
                			}
                			if(optionItem.value == "uptLevel") {
                				uiAuto.append('<span>' + item.uptLevel + '</span>');
                			}
                			if(optionItem.value == "uptDetail") {
                				var str = item.uptDetail;
                				var res = str.substring(0, 20);
                				uiAuto.append('<span>' + res + '</span>');
                			}
                			if(optionItem.value == "uptStatus") {
                				uiAuto.append('<span>' + item.uptStatus + '</span>');
                			}
                		} else if(kind == "tech") {
                			var uiAuto = $( "<li>" ).attr( "data-value", item.mtSkill );
                			if(optionItem.value == "mtSkill") {
                				uiAuto.append('<span>' + item.mtSkill + '</span>');
                			}
                			if(optionItem.value == "mtKind") {
                				uiAuto.append('<span>' + item.mtKind + '</span>');
                			}
                			if(optionItem.value == "mtName") {
                				uiAuto.append('<span>' + item.mtName + '</span>');
                			}
                			if(optionItem.value == "mtVersion") {
                				uiAuto.append('<span>' + item.mtVersion + '</span>');
                			}
                			if(optionItem.value == "mtExplain") {
                				uiAuto.append('<span>' + item.mtExplain + '</span>');
                			}
                		} else if(kind == "role") {
                			var uiAuto = $( "<li>" ).attr( "data-value", item.mrName );
                			if(optionItem.value == "mrName") {
                				uiAuto.append('<span>' + item.mrName + '</span>');
                			}
                			if(optionItem.value == "mrCode") {
                				uiAuto.append('<span>' + item.mrCode + '</span>');
                			}
                			if(optionItem.value == "mrSkills") {
                				uiAuto.append('<span>' + item.mrSkills + '</span>');
                			}
                			if(optionItem.value == "mrPrefers") {
                				uiAuto.append('<span>' + item.mrPrefers + '</span>');
                			}
                		} else if(kind == "industry") {
                			var uiAuto = $( "<li>" ).attr( "data-value", item.miLargeCategory );
                			if(optionItem.value == "miLargeCategory") {
                				uiAuto.append('<span>' + item.miLargeCategory + '</span>');
                			}
                			if(optionItem.value == "miMiddleCategory") {
                				uiAuto.append('<span>' + item.miMiddleCategory + '</span>');
                			}
                			if(optionItem.value == "miCode") {
                				uiAuto.append('<span>' + item.miCode + '</span>');
                			}
                		} else if(kind == "reports") {
                			var uiAuto = $( "<li>" ).attr( "data-value", item.userId );
                			uiAuto.append('<img src="' + item.userImgData + '" height="50">');
                			if(optionItem.value == "userId") {
                				uiAuto.append('<span>' + item.userId + '</span>');
                			}
                			if(optionItem.value == "urWorkDay") {
                				uiAuto.append('<span>' + item.urWorkDay + '</span>');
                			}
                			if(optionItem.value == "urWorkHour") {
                				uiAuto.append('<span>' + item.urWorkHour + '</span>');
                			}
                			if(optionItem.value == "urReports") {
                				var str = item.urReports;
                				var res = str.substring(0, 20);
                				uiAuto.append('<span>' + res + '</span>');
                			}
                		} else if(kind == "memo") {
                			var uiAuto = $( "<li>" ).attr( "data-value", item.userId );
                			uiAuto.append('<img src="' + item.userImgData + '" height="50">');
                			if(optionItem.value == "userId") {
                				uiAuto.append('<span>' + item.userId + '</span>');
                			}
                			if(optionItem.value == "umMemo") {
                				var str = item.umMemo;
                				var res = str.substring(0, 20);
                				uiAuto.append('<span>' + res + '</span>');
                			}
                		} else {
                			console.log("Error search in data");
                		}
            			uiAuto.append('</li>');
            			dataValue = uiAuto.appendTo( ul );

                        return dataValue;
                    };
    	            // fire search event
                	$inputSname.autocomplete("search", "");
                	$inputSname.focus();
            	}
            },
            complete: function(xhr, textStatus) {
            	//$inputSname.attr('disabled', false);
            },
            error: function(xhr, status) {
                var contentType = xhr.getResponseHeader("Content-Type");
                if (xhr.status === 200 && contentType.toLowerCase().indexOf("text/html") >= 0) {
                    // Login has expired - reload our current page
                    window.location.reload();
                }
            }
        });
	});
}
