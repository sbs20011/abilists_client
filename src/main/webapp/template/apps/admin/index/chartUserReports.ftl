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
	<#if model.adminUserReportsSumMap?has_content>
	<#list model.adminUserReportsSumMap?keys as key>
	<#if model.adminUserReportsSumMap[key]?has_content>

var datas${key_index} = {
	labels: [
		<#if model.adminUserReportsSumMap[key]?has_content>
		<#list model.adminUserReportsSumMap[key] as adminUserReportsSum>
			"${adminUserReportsSum.yearMonth?if_exists}"<#if adminUserReportsSum?has_next>,</#if>
		</#list>
		</#if>
		],
	datasets: [{
		label: '${key?if_exists} Reports',
		backgroundColor: window.chartColors.red,
		data: [
			<#if model.adminUserReportsSumMap[key]?has_content>
			<#list model.adminUserReportsSumMap[key] as adminUserReportsSum>
				"${adminUserReportsSum.cntUserId?if_exists?c}"<#if adminUserReportsSum?has_next>,</#if>
			</#list>
			</#if>
		],
		borderColor: window.chartColors.red,
		fill: 'start'
	}]
}

var ctx${key_index} = document.getElementById("myReportsBoundaries${key_index}").getContext("2d");

var myReportsBoundaries${key_index} = new Chart(ctx${key_index}, {
    type: 'line',
    data: datas${key_index},
    options: option1
});

	</#if>
	</#list>
	</#if>
</#if>

