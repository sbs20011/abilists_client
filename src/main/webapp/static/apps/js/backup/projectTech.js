
// Set data from server when selecting the first select.//
function changeSelect(form) {

	// This is the first select.
	var kindList = form.uptKind;
	// This is the second select.
	var mtNoList = form.mtNo;
	var userSelected = kindList.options[kindList.selectedIndex].value;

	// Delete the select's options
	while (mtNoList.options.length) {
		mtNoList.remove(0);
	}

	// Get a option of the first select.
	var mtechs = mtechList[userSelected];
	if (mtechs) {
		var i;
		var mtech = new Option('<@spring.message "tech.select.default.tech"/>', '0');
		mtNoList.options.add(mtech);
		for (i = 0; i < mtechs.length; i++) {
			mtech = new Option(mtechs[i].mtName, mtechs[i].mtNo);
			mtNoList.options.add(mtech);
		}
	}
}

// Set data from server when selecting a row in table.
function changeSelectInAjax(mTechDetailKeys) {

	var userSelected = uptKindInput.options[uptKindInput.selectedIndex].value;

	// Delete the select's options in Tech2
	while (mtNoInput.options.length) {
		mtNoInput.remove(0);
	}

	// Get a option of the first select.
	var mtechs = mtechList[userSelected];
	if (mtechs) {
		var i;
		var mtech = new Option('<@spring.message "tech.select.default.tech"/>', '0');
		mtNoInput.options.add(mtech);
		for (i = 0; i < mtechs.length; i++) {
			mtech = new Option(mtechs[i].mtName, mtechs[i].mtNo);
			mtNoInput.options.add(mtech);
		}
		
		// TODO
		// Set data as the selected option.
	}

	// Delete the select's options
	while (uptLevelInput.options.length) {
		uptLevelInput.remove(0);
	}

	// Set the explain to the tech
	var mTechDetail = new Option('<@spring.message "tech.select.default.tech"/>', '0');
	uptLevelInput.options.add(mTechDetail);
	if (mTechDetailKeys) {
		for (i = 0; i < mTechDetailKeys.length; i++) {
			if(mTechDetailKeys[i].mlCode == "${lang?if_exists}") {
				mTechDetail = new Option(mTechDetailKeys[i].mtdLevelExplain, mTechDetailKeys[i].mtdLevel);
				uptLevelInput.options.add(mTechDetail);
			}
		}
		// TODO
		// Set data as the selected option.
	}

}
