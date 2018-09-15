<#import "/spring.ftl" as spring/>

var data = {
	title: {
		display: false,
		text: 'User Projects Bar Chart'
	},
	labels: [
		<#if model??>
		<#if model.userProjectsSumTotalBeanList?has_content>
			<#list model.userProjectsSumTotalBeanList as userProjectsSumTotalBean>
				"${userProjectsSumTotalBean.name?if_exists}"<#if userProjectsSumTotalBean?has_next>,</#if>
			</#list>
		</#if>
		</#if>
		],
	datasets: [{
			label: '<@spring.message "navi.title.projects"/>',
			data: [
			<#if model??>
			<#if model.userProjectsSumTotalBeanList?has_content>
				<#list model.userProjectsSumTotalBeanList as userProjectsSumTotalBean>
					"${userProjectsSumTotalBean.value?if_exists?c}"<#if userProjectsSumTotalBean?has_next>,</#if>
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
	maintainAspectRatio: false,
	spanGaps: false,
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
	                labelString: 'Experience Count'
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

var ctx = document.getElementById("myProjectsBar").getContext("2d");
var myProjectsBar = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: option
});