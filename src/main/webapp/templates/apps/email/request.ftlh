To Admin

<#if model??>
This is a request from ${model.reqName?if_exists}
Email address is ${model.reqEmailAddress?if_exists}

${model.reqCompanyName?if_exists}
${model.reqContents?if_exists}
</#if>
