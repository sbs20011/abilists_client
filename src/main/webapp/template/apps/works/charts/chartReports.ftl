<#import "/spring.ftl" as spring/>

var data = {
	title: {
		display: true,
		text: 'User working time Bar Chart'
	},
	labels: [
		<#if model??>
		<#if model.userReportsList?has_content>
			<#list model.userReportsList?reverse as userReport>
				"${userReport.updateTime?string('MM/dd')?if_exists}"<#if userReport?has_next>,</#if>
			</#list>
		</#if>
		</#if>
		],
	datasets: [{
			label: '<@spring.message "reports.title.workhour"/>',
			data: [
			<#if model??>
			<#if model.userReportsList?has_content>
				<#list model.userReportsList?reverse as userReport>
					"${userReport.urWorkHour?if_exists}"<#if userReport?has_next>,</#if>
				</#list>
			</#if>
			</#if>
				],
			borderColor: 'rgba(51,122,183,1.0)',
			backgroundColor: 'rgba(51,122,183,0.7)',
			borderWidth: 1
		}
	]
};

var option = {
	maintainAspectRatio: false,
    responsive: true,
    title: {
        display: false,
        text:"Line Chart"
    },
	elements: {
		line: {
			tension: 0.5
		}
	},
	plugins: {
		filler: {
			propagate: false
		}
	},
	tooltips: {
		mode: 'index',
	},
	hover: {
		mode: 'index'
	},
    scales: {
        xAxes: [{
			ticks: {
				autoSkip: false,
				maxRotation: 0
			},
            scaleLabel: {
            	display: false,
                labelString: 'Day'
            }
        }],
        yAxes: [{
            stacked: true,
            scaleLabel: {
                display: true,
                labelString: 'Hours'
            }
        }]
    }

};

var ctx = document.getElementById("myReportsBar").getContext("2d");
var myReportsBar = new Chart(ctx, {
    type: 'line',
    data: data,
    options: option
});