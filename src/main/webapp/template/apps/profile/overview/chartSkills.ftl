<#import "/spring.ftl" as spring/>

var data = {
	labels: [
		<#if model??>
		<#if model.userSkillsSumBySkillList?has_content>
			<#list model.userSkillsSumBySkillList as userSkillsSumBySkill>
				"${userSkillsSumBySkill.usSkill?if_exists}"<#if userSkillsSumBySkill?has_next>,</#if>
			</#list>
		</#if>
		</#if>
		],
	datasets: [{
			label: '<@spring.message "profile.graph.skills"/> <@spring.message "profile.graph.count"/>',
			data: [
				<#if model??>
				<#if model.userSkillsSumBySkillList?has_content>
					<#list model.userSkillsSumBySkillList as userSkillsSumBySkill>
						"${userSkillsSumBySkill.cntUsSkill?if_exists?c}"<#if userSkillsSumBySkill?has_next>,</#if>
					</#list>
				</#if>
				</#if>
				],
			backgroundColor: [
                window.chartColors.grey,
                window.chartColors.grey,
                window.chartColors.grey,
            ],
			borderWidth: 0
		}, {
			label: '<@spring.message "profile.graph.skills"/> <@spring.message "profile.graph.level"/>',
			data: [
				<#if model??>
				<#if model.userSkillsSumBySkillList?has_content>
					<#list model.userSkillsSumBySkillList as userSkillsSumBySkill>
						"${userSkillsSumBySkill.sumUsLevel?if_exists?c}"<#if userSkillsSumBySkill?has_next>,</#if>
					</#list>
				</#if>
				</#if>
				],
			backgroundColor: [
                window.chartColors.yellow,
                window.chartColors.blue,
                window.chartColors.red,
            ],
			borderWidth: 0
		}
	]
};

var option = {
	responsive: true,
    title:{
        display:false,
        text:"User Skills Bar Chart"
    },
    tooltips: {
        mode: 'x'
    },
    scales: {
        yAxes: [{
	            type: "linear",
	            ticks: {
	            	beginAtZero: true,
	            	stepSize: 1
                },
	            display: true,
	            position: "left",
				gridLines: {
					display: true,
					color: "rgba(239,239,239,0.7)"
				},
	            scaleLabel: {
	                display: true,
	                labelString: 'Count'
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

var ctx = document.getElementById("mySkillsBar");
var mySkillsBar = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: option
});
