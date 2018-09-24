	<style>
		.bg-image {
			max-width:100%;
			height: 430px;
			background-image: url("<#if view?? && view == 'true'>${model.users.userImgBg?if_exists}<#else>${myImgBg?if_exists}</#if>");
			background-color: #cccccc;
			background-position: center;
			background-repeat: no-repeat;
			background-size: cover;
			position: relative;
		}
	</style>