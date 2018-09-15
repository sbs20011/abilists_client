<#import "/spring.ftl" as spring/>

var data = {
	labels: [
		<#if model??>
		<#if model.userProjectsJoinMindustryList?has_content>
			<#list model.userProjectsJoinMindustryList as userProjectsJoinMindustry>
				"${userProjectsJoinMindustry.miLargeCategory?if_exists}"<#if userProjectsJoinMindustry?has_next>,</#if>
			</#list>
		</#if>
		</#if>
		],
	datasets: [{
			label: 'User Position',
			data: [
			<#if model??>
			<#if model.userProjectsJoinMindustryList?has_content>
				<#list model.userProjectsJoinMindustryList as userProjectsJoinMindustry>
					"${userProjectsJoinMindustry.cnt?if_exists?c}"<#if userProjectsJoinMindustry?has_next>,</#if>
				</#list>
			</#if>
			</#if>
				],
			backgroundColor: [
	            window.chartColors.red,
	            window.chartColors.orange,
	            window.chartColors.yellow,
	            window.chartColors.green,
	            window.chartColors.blue,
	        ]
		}
	]

};

var option = {
	responsive: true
};

var ctx = document.getElementById("myIndustryPie").getContext("2d");
var myIndustryPie = new Chart(ctx, {
    type: 'pie',
    data: data,
    options: option
});