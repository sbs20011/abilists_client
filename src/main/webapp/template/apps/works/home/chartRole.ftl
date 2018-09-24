<#import "/spring.ftl" as spring/>

var data = {
	labels: [
		<#if model??>
		<#if model.userProjectsJoinMroleList?has_content>
			<#list model.userProjectsJoinMroleList as userProjectsJoinMrole>
				"${userProjectsJoinMrole.mrName?if_exists}"<#if userProjectsJoinMrole?has_next>,</#if>
			</#list>
		</#if>
		</#if>
		],
	datasets: [{
			label: 'User Position',
			data: [
			<#if model??>
			<#if model.userProjectsJoinMroleList?has_content>
				<#list model.userProjectsJoinMroleList as userProjectsJoinMrole>
					"${userProjectsJoinMrole.cnt?if_exists?c}"<#if userProjectsJoinMrole?has_next>,</#if>
				</#list>
			</#if>
			</#if>
				],
			backgroundColor: [
	            window.chartColors.blue,
	            window.chartColors.green,
	            window.chartColors.yellow,
	            window.chartColors.orange,
	            window.chartColors.red,
	        ]
		}
	]

};

var option = {
	responsive: true
};

var ctx = document.getElementById("myRolePie").getContext("2d");
var myRolePie = new Chart(ctx, {
    type: 'pie',
    data: data,
    options: option
});