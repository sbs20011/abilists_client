<#import "/spring.ftl" as spring/>

var data = {
	labels: [
		<#if model.userCareerRoleSumBeanList?has_content>
		<#list model.userCareerRoleSumBeanList as userCareerRoleSumBean>
    		"${userCareerRoleSumBean.mrName?if_exists}"<#if userCareerRoleSumBean?has_next>,</#if>
		</#list>
		</#if>
		],
	datasets: [{
			label: '<@spring.message "profile.graph.role"/> <@spring.message "profile.graph.level"/>',
			data: [
			<#if model.userCareerRoleSumBeanList?has_content>
			<#list model.userCareerRoleSumBeanList as userCareerRoleSumBean>
				${userCareerRoleSumBean.rolePeriod?if_exists?c}<#if userCareerRoleSumBean?has_next>,</#if>
			</#list>
			<#else>
				0
			</#if>
			],
			backgroundColor: "#337ab7",
			borderWidth: 0
		}
	]
};

var option = {
	responsive: true,
    title:{
        display:false,
        text:'<@spring.message "profile.graph.role"/> <@spring.message "profile.graph.level"/>'
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
			},
			offset: true
		}]
    }
};

var ctx = document.getElementById("myRoleBar");
var myRoleBar = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: option
});
