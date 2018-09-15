<#import "/spring.ftl" as spring/>

var data = {
	title: {
		display: true,
		text: 'User Bar Chart'
	},
	labels: [
		<#if model??>
		<#if model.userProjectsSumByYearList?has_content>
			<#list model.userProjectsSumByYearList as userProjectsSumByYear>
				"${userProjectsSumByYear.year?if_exists}"<#if userProjectsSumByYear?has_next>,</#if>
			</#list>
		</#if>
		</#if>
		],
	datasets: [{
			label: 'User projects',
			data: [
			<#if model??>
			<#if model.userProjectsSumByYearList?has_content>
				<#list model.userProjectsSumByYearList as userProjectsSumByYear>
					"${userProjectsSumByYear.cnt?if_exists?c}"<#if userProjectsSumByYear?has_next>,</#if>
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

var ctx = document.getElementById("myProjectBar").getContext("2d");
var myProjectBar = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: option
});
