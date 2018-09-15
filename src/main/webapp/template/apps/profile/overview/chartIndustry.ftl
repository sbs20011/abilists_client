<#import "/spring.ftl" as spring/>

var randomScalingFactor = function() {
    return Math.round(Math.random() * 100);
};

var config = {
    type: 'doughnut',
    data: {
        datasets: [{
            data: [
    			<#if model.mIndustryJoinUserCareerList?has_content>
    			<#list model.mIndustryJoinUserCareerList as mIndustryJoinUserCareer>
    				${mIndustryJoinUserCareer.cnt?string?if_exists}<#if mIndustryJoinUserCareer?has_next>,</#if>
    			</#list>
    			<#else>
    				0
    			</#if>
            ],
            backgroundColor: [
                window.chartColors.red,
                window.chartColors.orange,
                window.chartColors.blue,
            ],
            label: 'Dataset 1'
        }],
        labels: [
			<#if model.mIndustryJoinUserCareerList?has_content>
			<#list model.mIndustryJoinUserCareerList as mIndustryJoinUserCareer>
        		"${mIndustryJoinUserCareer.miLargeCategory?if_exists}"<#if mIndustryJoinUserCareer?has_next>,</#if>
			</#list>
			</#if>
        ]
    },
    options: {
        responsive: true,
        legend: {
            position: 'top',
        },
        title: {
            display: false,
            text: 'Industry in profile'
        },
        animation: {
            animateScale: true,
            animateRotate: true
        }
    }
};

var ctx = document.getElementById("myIndustryDoughnut").getContext("2d");
window.myIndustryDoughnut = new Chart(ctx, config);
