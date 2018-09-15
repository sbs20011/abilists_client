<#import "/spring.ftl" as spring/>

var data = {
	labels: [
		<#if model??>
		<#if model.userSkillsSumByKindBeanList?has_content>
			<#if model.userSkillsSumByKindBeanList[1]??>
			<#list model.userSkillsSumByKindBeanList[1].skillsMap?keys as key>
				"${key?if_exists}" <#if key?has_next>,</#if>
			</#list>
			</#if>
		</#if>
		</#if>
		],
	datasets: [{
			label: '<@spring.message "profile.graph.language"/> <@spring.message "profile.graph.level"/>',
			data: [
			<#if model??>
			<#if model.userSkillsSumByKindBeanList?has_content>
				<#if model.userSkillsSumByKindBeanList[1]??>
				<#list model.userSkillsSumByKindBeanList[1].skillsMap?keys as key>
					${model.userSkillsSumByKindBeanList[1].skillsMap[key]?if_exists?c} <#if key?has_next>,</#if>
				</#list>
				</#if>
			</#if>
			</#if>
			],
			backgroundColor: window.chartColors.blue,
			borderWidth: 0
		}
	]
};

var option = {
	responsive: true,
    title:{
        display:false,
        text:'<@spring.message "profile.graph.language"/> <@spring.message "profile.graph.level"/>'
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

var ctx = document.getElementById("myLangBar");
var myLangBar = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: option
});
