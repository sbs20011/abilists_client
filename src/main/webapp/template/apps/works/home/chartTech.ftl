<#import "/spring.ftl" as spring/>

var data = {
	title: {
		display: true,
		text: 'User career Bar Chart'
	},
	labels: [
		<#if model??>
		<#if model.userProjectsTechJoinTechList?has_content>
			<#list model.userProjectsTechJoinTechList as userProjectsTechJoinTech>
				"${userProjectsTechJoinTech.mtName?if_exists}"<#if userProjectsTechJoinTech?has_next>,</#if>
			</#list>
		</#if>
		</#if>
		],
	datasets: [{
			label: '<@spring.message "navi.title.project.tech"/>',
			data: [
			<#if model??>
			<#if model.userProjectsTechJoinTechList?has_content>
				<#list model.userProjectsTechJoinTechList as userProjectsTechJoinTech>
					"${userProjectsTechJoinTech.cntMtNo?if_exists?c}"<#if userProjectsTechJoinTech?has_next>,</#if>
				</#list>
			</#if>
			</#if>
				],
			backgroundColor: 'rgba(51,122,183,0.7)',
			borderWidth: 0
		}
	]
};

var option = {
	responsive: true,
    title:{
        display:false,
        text:"Bar Chart"
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
	                labelString: 'Used Cout'
	            },
        	}],
        xAxes: [{
        	barThickness: 50,
			gridLines: {
				display: true,
			}
		}]
    }
};

var ctx = document.getElementById("myTechBar").getContext("2d");
var myTechBar = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: option
});