<#import "/spring.ftl" as spring/>

var option1 = {
	maintainAspectRatio: false,
	spanGaps: false,
	elements: {
		line: {
			tension: 0
		}
	},
    legend: {
        display: false
    },
	scales: {
        yAxes: [{
            display: false
    	}],
	    xAxes: [{
	    	display: false
		}]
	}
};

<#if model??>
	<#if model.adminUserTaskSumMap?has_content>
	<#list model.adminUserTaskSumMap?keys as key>
	<#if model.adminUserTaskSumMap[key]?has_content>

var datas${key_index} = {
	labels: [
		<#if model.adminUserTaskSumMap[key]?has_content>
		<#list model.adminUserTaskSumMap[key] as adminUserTaskSum>
			"${adminUserTaskSum.yearMonth?if_exists}"<#if adminUserTaskSum?has_next>,</#if>
		</#list>
		</#if>
		],
	datasets: [{
		label: '${key?if_exists} Task',
		backgroundColor: window.chartColors.red,
		data: [
			<#if model.adminUserTaskSumMap[key]?has_content>
			<#list model.adminUserTaskSumMap[key] as adminUserTaskSum>
				"${adminUserTaskSum.cntUserId?if_exists?c}"<#if adminUserTaskSum?has_next>,</#if>
			</#list>
			</#if>
		],
		borderColor: window.chartColors.red,
		fill: 'start'
	}]
}

var ctx${key_index} = document.getElementById("myTaskBoundaries${key_index}").getContext("2d");

var myTaskBoundaries${key_index} = new Chart(ctx${key_index}, {
    type: 'line',
    data: datas${key_index},
    options: option1
});

	</#if>
	</#list>
	</#if>
</#if>

