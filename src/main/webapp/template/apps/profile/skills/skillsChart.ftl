<script type="text/javascript">

var color = Chart.helpers.color;

var option = {
	responsive: true,
    title:{
        display:false,
        text:"Bar Chart"
    },
    scales: {
        yAxes: [{
	            type: "linear",
	            display: true,
	            position: "left",
				gridLines: {
					display: true,
					color: "rgba(239,239,239,0.7)"
				}
        	}, {
	            type: "linear",
	            display: false,
	            gridLines: {
	                drawOnChartArea: true
	            }
        }],
        xAxes: [{
			gridLines: {
				display: true,
			}
		}]
    }

};

var data = {
	title: {
		display: true,
		text: 'Bar Chart'
	},
	labels: [
		<#if model??>
		<#if model.userSkillsSumBeanList?has_content>
			<#list model.userSkillsSumBeanList[0].skillsMap?keys as key>
				"${key?if_exists}"<#if key?has_next>,</#if>
			</#list>
		</#if>
		</#if>
		],
	datasets: [
		<#if model??>
		<#if model.userSkillsSumBeanList?has_content>
			<#list model.userSkillsSumBeanList as userSkillsSumBean>
		{
			label: '${configBean.techSkillBean.skillTitleList[userSkillsSumBean_index]?if_exists}',
			borderWidth: 0,
			data: [
			<#list userSkillsSumBean.skillsMap?keys as key>
				${userSkillsSumBean.skillsMap[key]?if_exists?c} <#if key?has_next>,</#if>
			</#list>
				],
			backgroundColor: [
				'${configBean.techSkillBean.bgColorList[userSkillsSumBean_index]?if_exists}',
				'${configBean.techSkillBean.bgColorList[userSkillsSumBean_index]?if_exists}',
				'${configBean.techSkillBean.bgColorList[userSkillsSumBean_index]?if_exists}'
			]
		}<#if userSkillsSumBean?has_next>,</#if>
			</#list>
		</#if>
		</#if>
	]
};


var ctx = document.getElementById("myChart").getContext("2d");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: option
});
</script>