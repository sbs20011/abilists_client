<style>

.navbar-default {
	border-radius: 0px;
}

/*
 * Input for searching something.
 */
.input-results .input-searching {
    background: #f4f4f4;
    display: list-item;
}

.input-spinner input {
	background: url('${configBean.contextPath?if_exists}/static/apps/img/spinner.gif') no-repeat 100% 5px;
	background-color: white;
}

.input-search input {
 	background: url('${configBean.contextPath?if_exists}/static/apps/img/search.png') no-repeat 100% 5px;
	background-color: white;
}

/* Change background color when mouseover on result of item list.*/
.ui-menu-item {
	color: black;
    background-color: white;
}
.ui-menu-item:hover {
	color: white;
    background-color: #4286f4;
}
</style>