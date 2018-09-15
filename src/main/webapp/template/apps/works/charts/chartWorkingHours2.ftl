<#import "/spring.ftl" as spring/>

var data = {
	title: {
		display: true,
		text: 'User working time Bar Chart'
	},
	labels: [
		<#if model??>
		<#if model.userReportsList?has_content>
			<#list model.userReportsList as userReport>
				"${userReport.updateTime?string('MM/dd')?if_exists}"<#if userReport?has_next>,</#if>
			</#list>
		</#if>
		</#if>
		],
	datasets: [{
			label: '${user.userId?if_exists} <@spring.message "reports.title.workhour"/>',
			data: [
			<#if model??>
			<#if model.userReportsList?has_content>
				<#list model.userReportsList as userReport>
					"${userReport.urWorkHour?if_exists}"<#if userReport?has_next>,</#if>
				</#list>
			</#if>
			</#if>
				],
			backgroundColor: 'rgba(255, 255, 0,0.5)',
			borderColor: window.chartColors.yellow,
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
    scales: {
        xAxes: [{
            display: true,
            scaleLabel: {
            	display: false,
                labelString: 'Day'
            }
        }],
        yAxes: [{
            display: true,
            scaleLabel: {
                display: true,
                labelString: 'Hours'
            },
            ticks: {
            	beginAtZero: true,
            	stepSize: 1
            }
        }]
    }

};

var ctx = document.getElementById("myWorkingHourBar").getContext("2d");
var myWorkingHourBar = new Chart(ctx, {
    type: 'line',
    data: data,
    options: option
});