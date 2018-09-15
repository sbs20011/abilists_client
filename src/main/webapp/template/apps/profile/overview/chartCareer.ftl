<#import "/spring.ftl" as spring/>

var data = {
	title: {
		display: true,
		text: 'User career Bar Chart'
	},
	labels: [
		<#if model??>
		<#if model.userCareerChartBeanList?has_content>
			<#list model.userCareerChartBeanList as userCareerChartBean>
				"${userCareerChartBean.companyName?if_exists}"<#if userCareerChartBean?has_next>,</#if>
			</#list>
		</#if>
		</#if>
		],
	datasets: [{
			label: '<@spring.message "profile.graph.career"/>',
			data: [
			<#if model??>
			<#if model.userCareerChartBeanList?has_content>
				<#list model.userCareerChartBeanList as userCareerChartBean>
					"${userCareerChartBean.workPeriod?if_exists?c}"<#if userCareerChartBean?has_next>,</#if>
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
	            	stepSize: 5
                },
	            display: true,
	            position: "left",
				gridLines: {
					display: true,
					color: "rgba(239,239,239,0.7)"
				},
	            scaleLabel: {
	                display: true,
	                labelString: 'Months'
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

var ctx = document.getElementById("myCareerBar").getContext("2d");
var myCareerBar = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: option
});