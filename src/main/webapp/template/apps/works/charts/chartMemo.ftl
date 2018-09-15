<#import "/spring.ftl" as spring/>

//List
var datas = {
labels: [
	<#if model??>
	<#if model.userMemoSumByMonthList?has_content>
		<#list model.userMemoSumByMonthList as userMemoSumByMonth>
			"${userMemoSumByMonth.month?if_exists}Mon"<#if userMemoSumByMonth?has_next>,</#if>
		</#list>
	</#if>
	</#if>
	],
datasets: [{
	label: 'Memo',
	steppedLine: false,
	data: [
		<#if model??>
		<#if model.userMemoSumByMonthList?has_content>
			<#list model.userMemoSumByMonthList as userMemoSumByMonth>
				"${userMemoSumByMonth.cnt?if_exists?c}"<#if userMemoSumByMonth?has_next>,</#if>
			</#list>
		</#if>
		</#if>
	],
	borderColor: 'rgba(51,122,183,1.0)',
	backgroundColor: 'rgba(51,122,183,0.7)',
	fill: true,
	}]
}

var option = {
	maintainAspectRatio: false,
	responsive: true,
	title:{
		display:false,
		text:"Bar Chart"
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
				labelString: 'Month'
			}
		}],
		yAxes: [{
			stacked: true,
			scaleLabel: {
				display: true,
				labelString: 'Memo Count'
			}
		}]
	}
};

var ctx = document.getElementById("myMemoLine").getContext("2d");
var myMemoLine = new Chart(ctx, {
	type: 'line',
	data: datas,
	options: option
});