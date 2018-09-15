<#import "/spring.ftl" as spring/>

var data = {
	title: {
		display: true,
		text: 'User Bar Chart'
	},
	labels: [
		<#if model??>
		<#if model.adminUsersSumByYearList?has_content>
			<#list model.adminUsersSumByYearList as adminUsersSumByYear>
				"${adminUsersSumByYear.year?if_exists}"<#if adminUsersSumByYear?has_next>,</#if>
			</#list>
		</#if>
		</#if>
		],
	datasets: [{
			label: 'User Engineer',
			data: [
			<#if model??>
			<#if model.adminUsersSumByYearList?has_content>
				<#list model.adminUsersSumByYearList as adminUsersSumByYear>
					"${adminUsersSumByYear.cnt?if_exists?c}"<#if adminUsersSumByYear?has_next>,</#if>
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

var ctx = document.getElementById("myUserBar").getContext("2d");
var myUserBar = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: option
});
