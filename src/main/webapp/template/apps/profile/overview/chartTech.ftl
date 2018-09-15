<#import "/spring.ftl" as spring/>

var data = {
	labels: [
		<#if model??>
		<#if model.userSkillsSumByKindBeanList?has_content>
			<#if model.userSkillsSumByKindBeanList[0].skillsMap??>
			<#list model.userSkillsSumByKindBeanList[0].skillsMap?keys as key>
				"${key?if_exists}" <#if key?has_next>,</#if>
			</#list>
			</#if>
		</#if>
		</#if>
		],
	datasets: [{
			label: '<@spring.message "profile.graph.tech"/> <@spring.message "profile.graph.level"/>',
			data: [
				<#if model??>
				<#if model.userSkillsSumByKindBeanList?has_content>
					<#if model.userSkillsSumByKindBeanList[0].skillsMap??>
					<#list model.userSkillsSumByKindBeanList[0].skillsMap?keys as key>
						${model.userSkillsSumByKindBeanList[0].skillsMap[key]?if_exists?c} <#if key?has_next>,</#if>
					</#list>
					</#if>
				</#if>
				</#if>
				],
			backgroundColor: window.chartColors.red,
			borderWidth: 0
		}
	]
};

var option = {
	responsive: true,
    title:{
        display:false,
        text:"User Tech Bar Chart"
    },
    tooltips: {
        mode: 'x'
    },
    scales: {
        yAxes: [{
	            type: "linear",
	            ticks: {
	            	beginAtZero: true,
	            	stepSize: 2
                },
	            display: true,
	            position: "left",
				gridLines: {
					display: true,
					color: "rgba(239,239,239,0.7)"
				},
	            scaleLabel: {
	                display: true,
	                labelString: 'Level'
	            },
        	}],
        xAxes: [{
        	barThickness: 50,
			gridLines: {
				display: true,
			},
			offset: true
		}]
    }
};

var ctx = document.getElementById("myTechBar");
var myTechBar = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: option
});
